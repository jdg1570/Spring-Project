package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int idx;
	private String nickName;
	private String title;
	private String content;
	private String wDate;
	private int readNum;
	private int likeNum;
	private String part;
	
	private int diffTime;  /* 게시 시간 */
	private String oriContent;
	private int ReplyCnt;   /* 댓글 개수 */	
	private int top;
	
	private int level;	/* 게시물 상세에 작성자 레벨 가져오기*/
	
	private int likeIdx;	/* 좋아요 유무 */
	private int likeCnt;	/* 좋아요 수 */
	private int likeSum;	/* 좋아요 합 */
	
}
