package com.gd.finalproject.vo;

import java.util.List;

import lombok.Data;

//강좌
@Data
public class Lecture {
	private String lectureNo; //강좌번호
	private String instructorId; //강사아이디	
	private int locationNo; //장소번호
	private String lectureName; //강좌명
	private int lectureLimited; //수강정원
	private String lectureTime; //수업시간
	private int lecturePrice; //강과금액
	private List<String> lectureDay; // private String[] lectureDay;  => 배열 
	private String lectureStartDate; //개강일
	private String lectureEndDate; //종강일
	
	
}
