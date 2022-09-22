package com.gd.finalproject.vo;

import lombok.Data;
//(회원가입)사진
@Data
public class MemberImg {
	private String memberId;
	private String fileName;
	private String originalFileName;
	private String fileType;
	private long fileSize;
}
