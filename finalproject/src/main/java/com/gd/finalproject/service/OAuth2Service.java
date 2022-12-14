package com.gd.finalproject.service;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.finalproject.mapper.MemberImgMapper;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.KakaoProfile;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.MemberImg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class OAuth2Service implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    private final PasswordEncoder passwordEncoder;
    private final MemberMapper memberMapper;
    private final MemberImgMapper memberImgMapper;
    private final ObjectMapper objectMapper;

    @Override
    @Transactional
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = new DefaultOAuth2UserService().loadUser(userRequest);

        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails()
                .getUserInfoEndpoint().getUserNameAttributeName();

        Map<String, Object> attributes = oAuth2User.getAttributes();
        System.out.println("attributes = " + attributes);
        KakaoProfile kakaoProfile = objectMapper.convertValue(attributes, KakaoProfile.class);
        // ????????? ?????? ????????????
        String email = kakaoProfile.getKakao_account().getEmail();
        String name = kakaoProfile.getProperties().getNickname();
        String fileName = kakaoProfile.getProperties().getProfile_image();
        // ???????????? ????????? ??????????????? ??????
        MemberDto member = memberMapper.getMember(email);
        log.info("member = {}", member);
        // ????????? ???????????????
        if (member == null) {
            // ???????????? ??????????????? ????????? ?????????
            String uuid = UUID.randomUUID().toString().substring(0, 6);
            String password = passwordEncoder.encode("secret" + uuid);
            // ?????? USER??? ???????????????
            List<String> auth = new ArrayList<>();
            auth.add("USER");
            member = MemberDto.builder()
                    .memberId(email)
                    .memberEmail(email)
                    .memberPw(password)
                    .memberName(name)
                    .memberAddr("")
                    .memberAuth(auth)
                    .memberGender("F")
                    .memberSleepYn("N")
                    .attributes(attributes)
                    .build();
            if (!kakaoProfile.getKakao_account().isBirthday_needs_agreement()) {
                member.setMemberBirth(kakaoProfile.getKakao_account().getBirthday());
            }
            memberMapper.signMember(member);
            memberMapper.authInsert(member);
            memberMapper.userInsert(member);
        }
        MemberImg memberImg = MemberImg.builder()
                .memberId(email)
                .fileName(fileName)
                .fileType("image/jpg")
                .build();
        member.setMemberImg(fileName);
        memberImgMapper.updateMemberImg(memberImg);
        member.setMemberPw(null);
        return member;
    }
}