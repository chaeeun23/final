package com.gd.finalproject.vo;

import lombok.Data;
//수강후기
@Data
public class Review {
	private int reviewNo;			// 리뷰번호
	private int courseNo; 			// 수강번호
	private String lectureNo; 		// 강좌번호
	private String reviewWriter;	// 리뷰작성자
	private String reviewContent; 	// 리뷰내용
	private String createDate;		// 리뷰작성일
}
