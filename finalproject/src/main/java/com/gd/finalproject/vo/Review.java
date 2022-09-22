package com.gd.finalproject.vo;

import lombok.Data;
//수강후기
@Data
public class Review {
	private int courseNo; 			// 수강번호
	private String reviewTitle; 	// 리뷰제목
	private String reviewContent; 	// 리뷰내용
	private String createDate;		// 리뷰작성일
	private String updateDate;		// 리뷰수정일
}
