package com.gd.finalproject.controller;


import com.gd.finalproject.dto.MemberDto;
import com.gd.finalproject.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/login-from")
    public String loginForm(@ModelAttribute("error") String error,
                            Authentication authentication) {
        log.info("authentication = {}", authentication);
        if (authentication != null) {
            for (GrantedAuthority authority : authentication.getAuthorities()) {
                if (authority.getAuthority().equals("ADMIN")) {
                    return "/admin/home";
                }
            }
            return "redirect:/suc/home";
        }
        return "/member/login-form";
    }

    @GetMapping("/sign/sign-form")
    public String signForm() {
        return "/member/sign-form";
    }

    @GetMapping("/home")
    public String loginSuc(@AuthenticationPrincipal DefaultOAuth2User defaultOAuth2User,
                           Model model,
                           Authentication authentication) {
        log.info("defaultOAuth2User = {}", defaultOAuth2User);
        if (defaultOAuth2User != null) {
            Map<String, String> properties = (Map<String, String>) defaultOAuth2User.getAttributes().get("properties");
            model.addAttribute("img", properties.get("profile_image"));
        }
        return "/main_page/home";
    }

    @ResponseBody
    @GetMapping("/sign/id-check")
    public String idCheck(@RequestParam("id") String id) {
        String check = memberService.idCheck(id);
        if (check == null) {
            return "ok";
        }
        return "fail";
    }

    @PostMapping("/sign/sign-member")
    public String signMember(MemberDto memberDto) {
        memberService.signMember(memberDto);
        return "redirect:/";
    }

}
