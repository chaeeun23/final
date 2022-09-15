package com.gd.finalproject.vo;

import lombok.Data;
//수강후기
@Data
public class Review {
	private int courseNo; //수강번호
	private String reviewTitle; //후기제목
	private String reviewContent; //후기내용
	private String createDate;
	private String updateDate;
}
