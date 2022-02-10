package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class InquiryReplyVO {
	private int idx;
	private int inquiryIdx;
	private String nickName;
	private String wDate;
	private String content;
	private int level;
	private int levelOrder;
}
