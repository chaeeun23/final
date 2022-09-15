package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Answer {
	private int answerNo;
	private int questionNo;
	private String employeeId;
	private String answerContent;
	private String createDate;
	private String updateDate;
}
