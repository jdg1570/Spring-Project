package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class BooksVO {
	private int bookIdx;
	private String bookName;
	private String fDate;
	private String updateDate;
	private String readNum;
	private String bookAuthor;
	private String publisher;
	private String publiDate;
	private String bookType;
	private String bookContent;
	private String bookContent2;
	private String bookText;
	
	private String oriContent;
	
	private int bcnt;  /* 분야별 도서수 */
}
