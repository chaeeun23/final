package com.gd.finalproject.secrity.handler;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
@RequiredArgsConstructor
public class LoginFailHandler extends SimpleUrlAuthenticationFailureHandler {

    private final ServletContext servletContext;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String contextPath = servletContext.getContextPath();
        if (exception instanceof UsernameNotFoundException || exception instanceof BadCredentialsException) {
            // 기본적인 아이디가 없거나, 비밀번호가 틀릴경우 경로
            response.sendRedirect(contextPath + "/member/login-form?error=f");
        } else if (exception instanceof AccountExpiredException) {
            // 휴면 계정이라면
            String username = request.getParameter("username");
            // 1. 쿠키 생성하기 3분 이내에만 해당 쿠키 있으면 휴면계정 폼으로 가지도록 나머지는 못가게
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(180);
            cookie.setPath("/");
            response.addCookie(cookie);
            response.sendRedirect(contextPath + "/sleep-member-form");
        }
    }
}
