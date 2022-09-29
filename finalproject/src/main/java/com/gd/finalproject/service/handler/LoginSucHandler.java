package com.gd.finalproject.service.handler;

import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.vo.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginSucHandler implements AuthenticationSuccessHandler {
    private final MemberMapper memberMapper;
    private final ServletContext servletContext;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        MemberDto memberDto = (MemberDto) authentication.getPrincipal();
        memberMapper.lastLoginUpdate(memberDto.getMemberId());
        String contextPath = servletContext.getContextPath();
        response.sendRedirect(contextPath + "/");
    }
}
