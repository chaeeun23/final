package com.gd.finalproject.vo;

import lombok.Data;
//(회원가입)
@Data
public class Member {
	private String memberId; //아이디
	private String memberPw; //비밀번호
	private String memberName; //이름
	private String memberPhone; //전화번호
	private String memberEmail; //이메일
	private String memberAddr; //주소
	private String memberDetailAddr; //상세주소
	private String memberBirth; //생년월일
	private String memberGender; //성별
	private String creatDate; 
	private String updateDate;
}
