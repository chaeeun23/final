package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Rent {
	private int rentNo;
	private String rentPlace;
	private String userId;
	private String reservationDate;
	private String createDate;
	private String refund;
}
