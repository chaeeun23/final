package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberAddr;
	private String memberDetailAddr;
	private String memberBirth;
	private String memberGender;
	private String creatDate;
	private String updateDate;
}
