package com.gd.finalproject.service;


import com.gd.finalproject.mapper.AuthMapper;
import com.gd.finalproject.mapper.EmployeeMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.PageNationDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminService implements UserDetailsService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    private final ServletContext servletContext;

    private final AuthMapper authMapper;
    private final EmployeeMapper employeeMapper;


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

    public Map<String, Object> getMemberList(String current) {
        // 보드 총갯수
        int total = memberMapper.getMemberTotal();
        String contextPath = servletContext.getContextPath();
        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, contextPath + "/admin/member-list", 10);
        // 보드리스트 가져오기
        List<MemberDto> memberList = memberMapper.getMemberList(pageNation.getBeginRow(), pageNation.getRowPerPage());
        // 담을통
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("memberList", memberList);
        log.info("member: ---------------------------", memberList);
        return map;
    }

    public int authUpdate(Map<String, String> map) {
        int row = 0;
        row += authMapper.authInsert(map);
        row += employeeMapper.employeeInsert(map);
        return row;


    }
}
