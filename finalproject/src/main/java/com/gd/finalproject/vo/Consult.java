package com.gd.finalproject.vo;

import lombok.Data;
//상담내역
@Data
public class Consult {
	private int consultNo; //상담번호
	private int consultReservationNo; //상담예약번호
	private String employeeId; //직원아이디
	private String consultContent; //상담내용
	private String createDate; 
	
	
}
