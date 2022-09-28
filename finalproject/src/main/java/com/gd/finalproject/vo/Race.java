package com.gd.finalproject.vo;

import lombok.Data;
//운행 / 검색
@Data
public class Race {
	private int raceNo; 	//운행번호
	private int busNo; 		//버스번호
	private int routeNo; 	//노선번호
	
	private String keyword;	// 검색
}
