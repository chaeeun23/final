package com.gd.finalproject.vo;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Setter
@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto implements UserDetails, OAuth2User {


    private Map<String, Object> attributes; // 카카오용
    private int memberNo;
    private String memberId;
    private String memberPw;
    private String deleteYn;
    private List<String> memberAuth;
    private String memberName; //이름
    private String memberPhone; //전화번호
    private String memberEmail; //이메일
    private String memberAddr; //주소
    private String memberDetailAddr; //상세주소
    private String memberBirth; //생년월일
    private String memberGender; //성별
    private String createDate;
    private String updateDate;
    private String memberImg;


    public boolean getEmpYn() {
        if (!this.memberAuth.isEmpty() && this.memberAuth.contains("EMPLOYEE")) {
            return true;
        }
        return false;
    }


    /* 여기는 카카오로그인용 */
    @Override
    public String getName() {
        return this.attributes.get("id").toString();
    }

    @Override
    public Map<String, Object> getAttributes() {
        return this.attributes;
    }

    /* 아래부터는 기본 스프링 시큐리티 */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        this.memberAuth.forEach(s -> authorities.add(new SimpleGrantedAuthority(s)));
        return authorities;
    }

    @Override
    public String getUsername() {
        return this.memberId;
    }

    @Override
    public String getPassword() {
        return this.memberPw;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        if (this.deleteYn.equals("Y")) {
            return false;
        }
        return true;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof MemberDto) {
            return this.memberId.equals(((MemberDto) obj).memberId);
        }
        return false;
    }

    @Override
    public int hashCode() {
        return this.memberId.hashCode();
    }
}


