package com.gd.finalproject.vo;

import lombok.Data;
//대관예약
@Data
public class Rent {
	private String rentPlace; //대관장소
	private String userId; //회원아이디
	private String reservationDate; //대관하는 날짜
	private String createDate; //신청날짜
	private String refund; //환불여부
}
