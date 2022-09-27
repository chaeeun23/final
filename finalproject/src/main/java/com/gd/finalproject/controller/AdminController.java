package com.gd.finalproject.controller;

import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.service.AdminService;
import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.vo.MemberImg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
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


    //회원 리스트 전부 다 가져오기
    @GetMapping("/admin/member-list")
    public String MemberList(@RequestParam(required = false, value = "current") String current,
                             @ModelAttribute("check") String check,
                             Model model) {
        Map<String, Object> map = adminService.getMemberList(current);
        // request.setAttribute();
        map.forEach((key, value) -> model.addAttribute(key, value));
        // 파일명
        return "/admin/member-list";

    }

    @ResponseBody
    @PostMapping("/admin/auth-update")
    public String authUpdate(@RequestBody Map<String, String> map) {
        log.info("map = {}", map);
        String memberId = map.get("memberId");
        String empYn = map.get("empYn");
        adminService.authUpdate(memberId, empYn);
        return "ok";
    }
}
