package com.gd.finalproject.controller;

import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.service.AdminService;
import com.gd.finalproject.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final AdminService adminService;


    @GetMapping("/admin/login-form")
    public String adminLoginForm(@ModelAttribute("error") String error,
                                 Authentication authentication) {

        return "/admin/login-form";
    }

    @GetMapping("/admin/home")
    public String adminHome() {
        return "/admin/home";
    }


    @GetMapping("/admin/member-list")
    public String employeeList(@RequestParam(required = false, value = "current") String current,
                               @ModelAttribute("check") String check,
                               Model model) {
        Map<String, Object> map = adminService.getMemberList(current);
        // request.setAttribute();
        map.forEach((key, value) -> model.addAttribute(key, value));
        // 파일명
        return "/admin/member-list";


    }
}