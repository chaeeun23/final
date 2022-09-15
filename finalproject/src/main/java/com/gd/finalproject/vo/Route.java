package com.gd.finalproject.vo;

import lombok.Data;
//노선
@Data
public class Route {
	private int routeNo; //노선번호
	private String routeStart; //운행시작시간
	private String routeEnd; //운행종료시간
	private String routeInterval; //운행간격
}
