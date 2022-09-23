package com.gd.finalproject.vo;

import lombok.*;

//(회원가입)사진
@Builder
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberImg {


    private String memberId;
    private String fileName;
    private String originalFileName;
    private String fileType;
    private long fileSize;
}
