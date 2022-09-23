package com.gd.finalproject.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString
public class MemberForm {
    private MemberDto memberDto;
    private MultipartFile file;
}
