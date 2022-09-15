package com.gd.finalproject.vo;

import lombok.Data;
//수강후기댓글
@Data
public class Comment {
	private int commentNo; //후기댓글번호
	private String employeeId; //직원아이디
	private String commentContent; //댓글내용
	private String createDate; 
	
}
