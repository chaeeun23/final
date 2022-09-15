package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String employeeId;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String updateDate;
}
