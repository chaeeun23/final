package com.gd.finalproject.vo;

import lombok.Data;
//수강(결제)
@Data
public class Payment {
	private int courseNo; //수강번호
	private String lectureNo; //강좌번호
	private int lockerNo; //사물함번호
	private String userId; //회원아이디
	private String payMethod; //결제수단
	private String payDate; //결제날짜
	private String refund; //환불여부
	private int payPrice; // 결제금액
}
