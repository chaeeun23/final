package com.gd.finalproject.controller;

import com.gd.finalproject.dto.MemberDto;
import com.gd.finalproject.service.AdminService;
import com.gd.finalproject.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final AdminService adminService;

    @GetMapping("/admin/login-form")
    public String adminLoginForm(@ModelAttribute("error") String error,
                                 Authentication authentication) {
        if (authentication != null) {
            for (GrantedAuthority authority : authentication.getAuthorities()) {
                if (authority.getAuthority().equals("ADMIN")) {
                    return "/admin/home";
                }
            }
            return "redirect:/board/list";
        }
        return "/admin/login-form";
    }

    @GetMapping("/admin/home")
    public String adminHome() {
        return "/admin/home";
    }


    @GetMapping("/sign/admin-form")
    public String signForm() {
        return "/admin/sign-form";
    }

    @PostMapping("/sign/sign-admin")
    public String signAdmin(MemberDto memberDto) {
        adminService.signAdmin(memberDto);
        return "redirect:/";
    }

}
