package com.gd.finalproject.vo;

import lombok.Data;
//(공지사항)사진
@Data
public class NoticeFile {
	private int noticeFileNo;
	private int noticeNo;
	private String fileName;
	private String originalFileName;
	private String fileType;
	private long fileSize;
}
