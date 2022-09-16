package com.gd.finalproject.service;


import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminService implements UserDetailsService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public int signAdmin(MemberDto memberDto) {
        int result = 0;
        String encodePw = passwordEncoder.encode(memberDto.getMemberPw());
        memberDto.setMemberPw(encodePw);
        // 가입하기
        result += memberMapper.signMember(memberDto);
        // 권한넣기
        result += memberMapper.adminInsert(memberDto);
        return result;
    }

    @Override
    public UserDetails loadUserByUsername(String memberId) throws AuthenticationException {
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증
        MemberDto memberDto = memberMapper.getMember(memberId);
        if (memberDto == null) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        // 권한 ADMIN 아니면 쳐버리기
        if (!memberDto.getMemberAuth().contains("ADMIN")) {
            throw new UsernameNotFoundException("User not authorized.");
        }
        log.info("memberDto = {}", memberDto);
        return memberDto;
    }
}
