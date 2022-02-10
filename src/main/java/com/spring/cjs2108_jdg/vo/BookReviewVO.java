package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class BookReviewVO {
	private int idx;
	private int bookIdx;
	private String nickName;
	private String wDate;
	private String content;
	private int likeNum;
	
	private int likeSw;		/* 좋아요 유무 */
	private int likeCnt;	/* 좋아요 수 */
	private int likeSum;	/* 좋아요 합 */
}
