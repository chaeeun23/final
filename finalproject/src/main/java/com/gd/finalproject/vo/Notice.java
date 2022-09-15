package com.gd.finalproject.vo;

import lombok.Data;
//공지사항
@Data
public class Notice {
	private int noticeNo; //공지사항번호
	private String employeeId; //직원아이디
	private String noticeTitle; //공지사항제목
	private String noticeContent; //공지사항내용
	private String createDate; 
	private String updateDate;
}
