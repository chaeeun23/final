package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Payment {
	private int courseNo;
	private int lectureNo;
	private String userId;
	private String payMethod;
	private String payDate;
	
}
