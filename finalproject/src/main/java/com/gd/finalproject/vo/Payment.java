package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Payment {
	private int courseNo;
	private String lectureNo;
	private int lockerNo;
	private String userId;
	private String payMethod;
	private String payDate;
	private String refund;
}
