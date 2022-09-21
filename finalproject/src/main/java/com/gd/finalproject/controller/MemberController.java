package com.gd.finalproject.controller;


import com.gd.finalproject.service.MailService;
import com.gd.finalproject.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gd.finalproject.vo.MemberDto;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;
    private final MailService mailService;

    @GetMapping("/login-form")
    public String loginForm(@ModelAttribute("error") String error,
                            Authentication authentication) {
        log.info("authentication = {}", authentication);
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

    @ResponseBody
    @GetMapping("/sign/email-check")
    public String emailCheck(@RequestParam("email") String email, HttpSession httpSession) throws Exception {
        String code = mailService.mailCheck(email);
        return code;
    }

    @PostMapping("/sign/sign-member")
    public String signMember(MemberDto memberDto) {
        // 로그 확인
        log.info("memberDto = {}", memberDto);
        memberService.signMember(memberDto);
        return "redirect:/";
    }

    //회원정보 조회
    @GetMapping("/detail")
    public String memberDetail(@RequestParam("memberNo") int memberNo, Model model) {
        log.info("memberNo = {}", memberNo);
        MemberDto member = memberService.memberDetail(memberNo);
        model.addAttribute("member", member);
        return "/member/member-detail";
    }

}
