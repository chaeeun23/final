package com.gd.finalproject.controller;


import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.MemberMapper;
import com.gd.finalproject.service.MailService;
import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.vo.MemberForm;
import com.gd.finalproject.vo.user;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gd.finalproject.vo.MemberDto;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;
    private final MailService mailService;


    //로그인폼
    @GetMapping("/member/login-form")
    @PreAuthorize("isAnonymous()")
    public String loginForm(@RequestParam(required = false, value = "error") String error, Model model) {
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "/member/login-form";
    }

    //회원가입폼
    @GetMapping("/sign/sign-form")
    public String signForm() {
        return "/member/sign-form";
    }


    //중복아이디체크
    @ResponseBody
    @GetMapping("/sign/id-check")
    public String idCheck(@RequestParam("id") String id) {
        String check = memberService.idCheck(id);
        if (check == null) {
            return "ok";
        }
        return "fail";
    }

    //이메일체크
    @ResponseBody
    @GetMapping("/sign/email-check")
    public String emailCheck(@RequestParam("email") String email, HttpSession httpSession) throws Exception {
        String code = mailService.mailCheck(email);
        return code;
    }

    //회원가입 로직
    @PostMapping("/sign/sign-member")
    public String signMember(MemberDto memberDto) {
        // 로그 확인
        log.debug(TeamColor.JM, "memberDto = {}", memberDto);

        memberService.signMember(memberDto);
        return "redirect:/";
    }

    //회원정보 조회
    @GetMapping("/member/detail")
    public String memberDetail() {
        return "/member/member-detail";
    }


    //수정
    @PostMapping("/member/update")
    public String memberUpdate(MemberForm memberForm, Authentication authentication) {
        log.info("memberForm = {}", memberForm);
        memberService.updateMember(memberForm, authentication);
        return "/member/member-detail";
    }

    // 아이디찾기 폼
    @GetMapping("/member/find-id")
    @PreAuthorize("isAnonymous()")
    public String findIdForm() {
        return "/member/find-form";
    }


    // 아이디찾기 로직
    @PostMapping("/member/find-id")
    @PreAuthorize("isAnonymous()")
    public String findId(@RequestParam("email") String email, Model model) throws Exception {
        String check = mailService.idFind(email);

        if (check.equals("fail")) {
            model.addAttribute("error", "메일 형태가 아니거나 해당하는 아이디가 없습니다. 다시 시도해주세요");
            return "/member/find-form";
        }

        model.addAttribute("suc", "전송 성공");
        return "/member/login-form";
    }

    // 비밀번호찾기 폼
    @GetMapping("/member/find-pw")
    @PreAuthorize("isAnonymous()")
    public String findPwForm() {
        return "/member/find-pw";
    }

    // 비밀번호찾기 로직
    @PostMapping("/member/find-pw")
    @PreAuthorize("isAnonymous()")
    public String findPw(@RequestParam("email") String email,
                         @RequestParam("id") String id, Model model) throws Exception {
        String check = mailService.pwFind(id, email);
        if (check.equals("fail")) {
            model.addAttribute("error", "메일 형태가 아니거나 해당하는 아이디가 없습니다. 다시 시도해주세요");
            return "/member/find-pw";
        }
        model.addAttribute("suc", "전송 성공");
        return "/member/login-form";
    }

    //강사신청 폼
    @GetMapping("/member/instructor-application")
    public String instructorForm() {
        return "/member/instructor-application";
    }

    @PostMapping("/member/instructor-application")
    public String instructorApplication() {
        return "/main_page/index";
    }
}





