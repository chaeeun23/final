package com.gd.finalproject.service.handler;

import com.gd.finalproject.vo.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class KakaoLoginSucHandler implements AuthenticationSuccessHandler {

    private final ServletContext servletContext;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String contextPath = servletContext.getContextPath();
        MemberDto memberDto = (MemberDto) authentication.getPrincipal();
        if (memberDto.getMemberSleepYn().equals("N")) {
            response.sendRedirect(contextPath);
            return;
        }
        SecurityContextHolder.clearContext();
        Cookie cookie = new Cookie("username", memberDto.getMemberId());
        cookie.setMaxAge(180);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect(contextPath + "/sleep-member-form");
    }
}
