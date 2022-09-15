package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Review {
	private int courseNo;
	private String reviewTitle;
	private String reviewContent;
	private String createDate;
	private String updateDate;
}
