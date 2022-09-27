package com.gd.finalproject.controller;

import com.gd.finalproject.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin")
public class AdminController {
    private final AdminService adminService;

    @GetMapping("/login-form")
    public String adminLoginForm(@ModelAttribute("error") String error) {
        return "/admin/login-form";
    }

    @GetMapping("/home")
    public String adminHome() {
        return "/admin/home";
    }


    //회원 리스트 전부 다 가져오기
    @GetMapping("/member-list")
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
    @PostMapping("/auth-update")
    public String authUpdate(@RequestBody Map<String, String> map) {
        log.info("map = {}", map);
        String memberId = map.get("memberId");
        String empYn = map.get("empYn");
        adminService.authUpdate(memberId, empYn);
        return "ok";
    }
}
