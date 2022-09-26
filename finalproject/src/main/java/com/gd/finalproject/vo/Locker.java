package com.gd.finalproject.vo;

import lombok.Data;
//사물함
@Data
public class Locker {
	private int lockerNo; //사물함번호
	private int courseNo; //수강번호
	private String lockerUse; //사물함 사용유무
}
