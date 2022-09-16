package com.gd.finalproject.vo;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Setter
@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto implements UserDetails {
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
    private String creatDate;
    private String updateDate;

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
