package com.gd.finalproject.vo;

import lombok.Data;
//대관장소
@Data
public class RentPlace {
	private String rentPlace; //대관장소
	private int rentPrice; //대관가격
	private int rentLimited; //수용인원
}
