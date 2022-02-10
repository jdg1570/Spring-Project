package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class InquiryVO {
	private int idx;
	private String nickName;
	private String content;
	private String wDate;
	private String part;
	private String reply;
	
	private String oriContent;
	
	private int inquiryIdx;
}
