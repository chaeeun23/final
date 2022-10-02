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
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    //회원정보 조회
    @GetMapping("/detail")
    public String memberDetail() {
        return "/member/member-detail";
    }


    //수정
    @PostMapping("/update")
    public String memberUpdate(@Validated(ValidationGroups.UpdateCheck.class) MemberForm memberForm, Authentication authentication, Model model) {
        log.info("memberForm = {}", memberForm);
        memberService.updateMember(memberForm);
        createNewAuthentication(authentication, memberForm.getMemberDto().getMemberId());
        model.addAttribute("suc", "수정되었습니다");
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


    //강사신청 폼
    @GetMapping("/instructor-application")
    public String instructorForm() {
        return "/member/instructor-application";
    }

    @PostMapping("/instructor-application")
    public String instructorApplication(@Valid Instructor instructor, Authentication authentication, Model model) {
        log.info("instructor = {}", instructor);
        memberService.instructorApplication(instructor);
        createNewAuthentication(authentication, instructor.getMemberId());
        model.addAttribute("suc", "강사신청성공");
        return "/member/member-detail";
    }


    //비밀번호 변경폼
    @GetMapping("/update-pw")
    public String updatePwForm() {
        return "/member/update-pw";
    }

    // 비밀번호변경 로직
    @PostMapping("/update-pw")
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

    @GetMapping("/pw-change-update")
    public String pwChangeUpdate(@AuthenticationPrincipal MemberDto memberDto) {
        memberService.pwChangeUpdate(memberDto.getMemberId());
        return "/main_page/index";
    }

    @GetMapping("/pw-change-form")
    public String pwChangeForm() {
        return "/member/pw-change-form";
    }

}





