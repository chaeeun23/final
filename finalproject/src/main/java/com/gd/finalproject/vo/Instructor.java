package com.gd.finalproject.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;


//강사
@Data
public class Instructor {

    @NotBlank
    private String memberId; //강사아이디
    private String createDate;
    private String introduce;
    private String inspectYn;

}
