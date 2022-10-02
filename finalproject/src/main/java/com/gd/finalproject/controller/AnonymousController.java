package com.gd.finalproject.controller;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.MailService;
import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.valid.ValidationGroups;
import com.gd.finalproject.vo.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

@Controller
@RequiredArgsConstructor
@Slf4j
@Validated
@RequestMapping("/anonymous")
public class AnonymousController {

    private final MemberService memberService;
    private final MailService mailService;

    //회원가입폼
    @GetMapping("/sign-form")
    public String signForm() {
        return "/member/sign-form";
    }


    //중복아이디체크
    @ResponseBody
    @GetMapping("/id-check")
    public String idCheck(@RequestParam("memberId") @NotBlank @Length(min = 8) String id) throws Exception {
        String check = memberService.idCheck(id);
        if (check == null) {
            return "ok";
        }
        return "fail";
    }

    //이메일체크
    @ResponseBody
    @GetMapping("/email-check")
    public String emailCheck(@RequestParam("memberEmail") @NotBlank String email) throws Exception {
        String code = mailService.mailCheck(email);
        return code;
    }

    //회원가입 로직
    @PostMapping("/sign-member")
    public String signMember(@Validated(ValidationGroups.SignCheck.class) MemberDto memberDto) {
        // 로그 확인
        log.debug(TeamColor.JM, "memberDto = {}", memberDto);

        memberService.signMember(memberDto);
        return "redirect:/";
    }


    // 아이디찾기 폼
    @GetMapping("/find-id")
    public String findIdForm() {
        return "/member/find-form";
    }


    // 아이디찾기 로직
    @PostMapping("/find-id")
    public String findId(@RequestParam("memberEmail") @NotBlank String email, Model model) throws Exception {
        String check = mailService.idFind(email);

        if (check.equals("fail")) {
            model.addAttribute("error", "메일 형태가 아니거나 해당하는 아이디가 없습니다. 다시 시도해주세요");
            return "/member/find-form";
        }

        model.addAttribute("suc", "전송 성공");
        return "/member/login-form";
    }

    // 비밀번호찾기 폼
    @GetMapping("/find-pw")
    public String findPwForm() {
        return "/member/find-pw";
    }

    // 비밀번호찾기 로직
    @PostMapping("/find-pw")
    public String findPw(@RequestParam("memberEmail") @NotBlank String email,
                         @RequestParam("memberId") @NotBlank String id,
                         Model model) throws Exception {
        String check = mailService.pwFind(id, email);
        if (check.equals("fail")) {
            model.addAttribute("error", "메일 형태가 아니거나 해당하는 아이디가 없습니다. 다시 시도해주세요");
            return "/member/find-pw";
        }
        model.addAttribute("suc", "전송 성공");
        return "/member/login-form";
    }

    //로그인폼
    @GetMapping("/login-form")
    public String loginForm(@RequestParam(required = false, value = "error") String error, Model model) {
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "/member/login-form";
    }

    // 휴면 계정 해제
    @PostMapping("/sleep-member")
    public String updatePw(@RequestParam("memberId") String id,
                           @CookieValue(value = "username", defaultValue = "error") String username,
                           Model model) {
        String check = memberService.sleepUpdate(id, username);
        if (check.equals("fail")) {
            model.addAttribute("error", "본인의 아이디를 정확하게 입력해주세요.");
            return "/member/sleep-member";
        }
        model.addAttribute("suc", "휴면해제 성공 다시 로그인해주세요");
        return "/member/login-form";
    }

    @GetMapping("/sleep-member-form")
    public String sleepMemberForm(@CookieValue(value = "username", defaultValue = "error") String username) {
        if (username.equals("error")) {
            return "redirect:/";
        }
        return "/member/sleep-member";
    }

}
