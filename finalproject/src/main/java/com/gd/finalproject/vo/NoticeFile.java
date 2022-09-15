package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class NoticeFile {
	private int noticeFileNo;
	private int noticeNo;
	private String fileName;
	private String originalFileName;
	private String fileType;
	private int fileSize;
}
