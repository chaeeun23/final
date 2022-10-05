package com.gd.finalproject.vo;

import com.gd.finalproject.valid.ValidationGroups;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
    @NotBlank(groups = {ValidationGroups.SignCheck.class, ValidationGroups.UpdateCheck.class})
    @Length(min = 8, groups = {ValidationGroups.SignCheck.class})
    private String memberId;
    @NotBlank(groups = ValidationGroups.SignCheck.class)
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[.!@#$%^~*+=-])(?=.*[0-9]).{10,19}$", groups = ValidationGroups.SignCheck.class)
    private String memberPw;
    private String deleteYn;
    private List<String> memberAuth;
    @NotBlank(groups = {ValidationGroups.SignCheck.class, ValidationGroups.UpdateCheck.class})
    private String memberName; //이름
    @NotBlank(groups = ValidationGroups.SignCheck.class)
    private String memberPhone; //전화번호
    @NotBlank(groups = ValidationGroups.SignCheck.class)
    private String memberEmail; //이메일
    @NotBlank(groups = ValidationGroups.SignCheck.class)
    private String memberAddr; //주소
    private String memberDetailAddr; //상세주소
    private String memberBirth; //생년월일
    private String memberGender; //성별
    private String createDate;
    private String updateDate;
    private String memberImg;
    private LocalDateTime lastLogin;
    private String memberSleepYn;
    private LocalDateTime pwChangeDate;


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
        if (this.memberSleepYn.equals("Y")) {
            return false;
        }
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


