package com.gd.finalproject.secrity.handler;

import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.vo.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginSucHandler implements AuthenticationSuccessHandler {
    private final MemberService memberService;
    private final MemberMapper memberMapper;
    private final ServletContext servletContext;

    @Override
    @Transactional
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String contextPath = servletContext.getContextPath();
        MemberDto memberDto = (MemberDto) authentication.getPrincipal();
        memberMapper.lastLoginUpdate(memberDto.getMemberId());
        log.info("memberDto = {}", memberDto);
        if (memberService.pwChangeDateCheck(memberDto.getPwChangeDate())) {
            response.sendRedirect(contextPath + "/member/pw-change-form");
            return;
        }
        // 마지막 로그인 날짜 업데이트
        response.sendRedirect(contextPath + "/");
    }
}
