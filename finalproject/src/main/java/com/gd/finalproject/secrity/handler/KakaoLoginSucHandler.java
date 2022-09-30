package com.gd.finalproject.secrity.handler;

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
        // 휴면계정이 아니라면 정상적으로 로그인 처리
        if (memberDto.getMemberSleepYn().equals("N")) {
            response.sendRedirect(contextPath);
            return;
        }
        // 휴면 계정이라면
        // 1. 로그인한 세션 비우기
        SecurityContextHolder.clearContext();
        // 2. 쿠키 생성하기 3분 이내에만 해당 쿠키 있으면 휴면계정 폼으로 가지도록 나머지는 못가게
        Cookie cookie = new Cookie("username", memberDto.getMemberId());
        cookie.setMaxAge(180);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect(contextPath + "/sleep-member-form");
    }
}
