package com.gd.finalproject.service.handler;

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
            response.sendRedirect(contextPath + "/member/login-form?error=f");
        } else if (exception instanceof AccountExpiredException) {
            String username = request.getParameter("username");
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(180);
            cookie.setPath("/");
            response.addCookie(cookie);
            response.sendRedirect(contextPath + "/sleep-member-form");
        }
    }
}
