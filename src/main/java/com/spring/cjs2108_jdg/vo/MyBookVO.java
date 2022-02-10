package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class MyBookVO {
	private int idx;
	private int bookIdx;
	private String bookName;
	private String bookAuthor;
	private String bookContent;
	private String nickName;
	private String bookDate;
	private String readDate;
	private String bookType;
	private int sort;
	private String bookText;
	private String read;
	
	private int cnt;
	
	private int ptime;	/* 시간 */
	private int pcnt;	/* 빈도 */
	
	private int bday;	/* 요일 */
	private int bcnt;	/* 빈도 */
	
	private int ocnt;	/* 인기 분야 */
	private int rcnt;	/* Top5 완독도서 */
}
