package com.gd.finalproject.vo;

import lombok.Data;
//Q&A답변
@Data
public class Answer {
	private int answerNo; //답변번호
	private int questionNo; //질문번호
	private String employeeId; //직원아이디
	private String answerContent; //답변내용
	private String createDate; 
	private String updateDate;
}
