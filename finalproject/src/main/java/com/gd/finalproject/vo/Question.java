package com.gd.finalproject.vo;

import lombok.Data;

@Data
public class Question {
	private int questionNO;
	private String userId;
	private String questionTitle;
	private String questionContent;
	private String createDate;
	private String updateDate;
}
