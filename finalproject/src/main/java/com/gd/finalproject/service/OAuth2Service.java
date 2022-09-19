package com.gd.finalproject.service;


import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.MemberDto;
import lombok.RequiredArgsConstructor;
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
public class OAuth2Service implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    private final PasswordEncoder passwordEncoder;
    private final MemberMapper memberMapper;

    @Override
    @Transactional
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = new DefaultOAuth2UserService().loadUser(userRequest);

        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails()
                .getUserInfoEndpoint().getUserNameAttributeName();

        Map<String, Object> attributes = oAuth2User.getAttributes();
        System.out.println("------------------" + attributes);
        // 카카오 메일 가져오기
        Map<String, Object> profile = (Map<String, Object>) attributes.get("kakao_account");
        Map<String, Object> properties = (Map<String, Object>) attributes.get("properties");
        String email = (String) profile.get("email");
        String name = (String) properties.get("nickname");
        // 카카오를 통해서 가입했는지 확인
        MemberDto member = memberMapper.getMember(email);
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
                    .build();
            memberMapper.signMember(member);
            memberMapper.authInsert(member);
        }
        return new DefaultOAuth2User(
                member.getAuthorities()
                , oAuth2User.getAttributes()
                , userNameAttributeName);
    }
}
