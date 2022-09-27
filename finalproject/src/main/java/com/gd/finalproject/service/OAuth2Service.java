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
        // 카카오 메일 가져오기
        String email = kakaoProfile.getKakao_account().getEmail();
        String name = kakaoProfile.getProperties().getNickname();
        String fileName = kakaoProfile.getProperties().getProfile_image();
        // 카카오를 통해서 가입했는지 확인
        MemberDto member = memberMapper.getMember(email);
        log.info("member = {}", member);
        // 없으면 가입시키기
        if (member == null) {
            // 비밀번호 아무렇게나 암호화 시키기
            String uuid = UUID.randomUUID().toString().substring(0, 6);
            String password = passwordEncoder.encode("secret" + uuid);
            // 권한 USER로 만들어주기
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
                    .attributes(attributes)
                    .build();
            if (!kakaoProfile.getKakao_account().isBirthday_needs_agreement()) {
                member.setMemberBirth(kakaoProfile.getKakao_account().getBirthday());
            }
            memberMapper.signMember(member);
            memberMapper.authInsert(member);
        }
        MemberImg memberImg = MemberImg.builder()
                .memberId(email)
                .fileName(fileName)
                .fileType("image/jpg")
                .build();
        member.setMemberImg(fileName);
        memberImgMapper.updateMemberImg(memberImg);
        return member;
    }
}