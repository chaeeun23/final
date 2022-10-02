package com.gd.finalproject.controller;


import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.MailService;
import com.gd.finalproject.service.MemberService;
import com.gd.finalproject.valid.ValidationGroups;
import com.gd.finalproject.vo.Instructor;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.MemberForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@Controller
@RequiredArgsConstructor
@Slf4j
@Validated
public class MemberController {

    private final MemberService memberService;
    private final MailService mailService;


    //로그인폼
    @GetMapping("/user/login-form")
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
    public String idCheck(@RequestParam("memberId") @NotBlank @Length(min = 8) String id) throws Exception {
        String check = memberService.idCheck(id);
        if (check == null) {
            return "ok";
        }
        return "fail";
    }

    //이메일체크
    @ResponseBody
    @GetMapping("/sign/email-check")
    public String emailCheck(@RequestParam("memberEmail") @NotBlank String email) throws Exception {
        String code = mailService.mailCheck(email);
        return code;
    }

    //회원가입 로직
    @PostMapping("/sign/sign-member")
    public String signMember(@Validated(ValidationGroups.SignCheck.class) MemberDto memberDto) {
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
    public String memberUpdate(@Validated(ValidationGroups.UpdateCheck.class) MemberForm memberForm, Authentication authentication) {
        log.info("memberForm = {}", memberForm);
        memberService.updateMember(memberForm);
        createNewAuthentication(authentication, memberForm.getMemberDto().getMemberId());
        return "/member/member-detail";
    }


    // 정보 수정시 세션 객체 변경
    protected void createNewAuthentication(Authentication currentAuth, String username) {
        UserDetails newPrincipal = memberService.loadUserByUsername(username);
        System.out.println("newPrincipal = " + newPrincipal);
        UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(
                newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
        newAuth.setDetails(currentAuth.getDetails());
        // 2-2. 현재 Authentication로 사용자 인증 후 새 Authentication 정보를 SecurityContextHolder에 세팅
        SecurityContextHolder.getContext().setAuthentication(newAuth);
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
    @GetMapping("/member/find-pw")
    @PreAuthorize("isAnonymous()")
    public String findPwForm() {
        return "/member/find-pw";
    }

    // 비밀번호찾기 로직
    @PostMapping("/member/find-pw")
    @PreAuthorize("isAnonymous()")
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

    //강사신청 폼
    @GetMapping("/member/instructor-application")
    public String instructorForm() {
        return "/member/instructor-application";
    }

    @PostMapping("/member/instructor-application")
    public String instructorApplication(@Valid Instructor instructor, Authentication authentication, Model model) {
        log.info("instructor = {}", instructor);
        memberService.instructorApplication(instructor);
        createNewAuthentication(authentication, instructor.getMemberId());
        model.addAttribute("suc", "강사신청성공");
        return "/member/member-detail";
    }


    //비밀번호 변경폼
    @GetMapping("/member/update-pw")
    public String updatePwForm() {
        return "/member/update-pw";
    }

    // 비밀번호변경 로직
    @PostMapping("/member/update-pw")
    public String updatePw(@RequestParam("pw") @NotBlank String pw,
                           @RequestParam("changePw") @NotBlank String changePw,
                           @AuthenticationPrincipal MemberDto memberDto,
                           Model model) {
        String check = memberService.pwUpdate(memberDto.getMemberId(), pw, changePw);
        if (check.equals("fail")) {
            model.addAttribute("error", "해당하는 비밀번호가 없습니다. 다시 시도해주세요");
            return "/member/update-pw";
        }
        model.addAttribute("suc", "변경 성공");
        return "/member/member-detail";
    }

    @GetMapping("/member/pw-change-update")
    public String pwChangeUpdate(@AuthenticationPrincipal MemberDto memberDto) {
        memberService.pwChangeUpdate(memberDto.getMemberId());
        return "/main_page/index";
    }

    @GetMapping("/sleep-member-form")
    @PreAuthorize("isAnonymous()")
    public String sleepMemberForm(@CookieValue(value = "username", defaultValue = "error") String username) {
        if (username.equals("error")) {
            return "redirect:/";
        }
        return "/member/sleep-member";
    }

    // 휴면 계정 해제
    @PostMapping("/sleep-member")
    @PreAuthorize("isAnonymous()")
    public String updatePw(@RequestParam("memberId") String id,
                           @CookieValue(value = "username", defaultValue = "error") String username,
                           Model model) {
        String check = memberService.sleepUpdate(id,username);
        if (check.equals("fail")) {
            model.addAttribute("error", "본인의 아이디를 정확하게 입력해주세요.");
            return "/member/sleep-member";
        }
        model.addAttribute("suc", "휴면해제 성공 다시 로그인해주세요");
        return "/member/login-form";
    }

    @GetMapping("/member/pw-change-form")
    public String pwChangeForm() {
        return "/member/pw-change-form";
    }


}





