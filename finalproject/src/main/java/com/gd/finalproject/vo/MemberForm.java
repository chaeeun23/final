package com.gd.finalproject.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;

@Getter
@Setter
@ToString
public class MemberForm {

    @Valid
    private MemberDto memberDto;
    private MultipartFile file;
}
