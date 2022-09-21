package com.gd.finalproject.vo;

import lombok.Data;
//상담예약관리
@Data
public class ConsultReservation {
	private int consultReservationNo; //상담예약번호
	private String userId; //회원아이디
	private String consultPhone; //전화번호
	private String consultDate; //상담할 날짜
	private String createDate; //상담을 예약한 날짜
	private int consultDateDay; //21
}
