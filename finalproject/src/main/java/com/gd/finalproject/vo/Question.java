package com.gd.finalproject.vo;

import lombok.Data;
//Q&A질문
@Data
public class Question {
	private int questionNo; //질문번호
	private String userId; //회원아이디
	private String questionTitle; //질문제목
	private String questionContent; //질문내용
	private String createDate; 
	private String updateDate;
}
