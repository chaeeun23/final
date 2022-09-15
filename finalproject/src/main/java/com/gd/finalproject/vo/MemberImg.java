package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class MemberImg {
	private String memberId;
	private String fileName;
	private String originalFileName;
	private String fileType;
	private int fileSize;
}
