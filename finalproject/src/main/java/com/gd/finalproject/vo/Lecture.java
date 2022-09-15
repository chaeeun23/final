package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Lecture {
	private int lectureNo;
	private String instructorId;
	private int locationNo;
	private String lectureName;
	private int lectureLimited;
	private String lectureStartTime;
	private String lectureEndTime;
	private int lecturePrice;
	private String lectureStartDate;
	private String lectureEndDate;
	private String refund;
	
}
