package com.spring.cjs2108_jdg.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private String address;
	private String email;
	private String interest;
	private String userInfor;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	
	private int diffTime;	/* 시간 차이 */
	private int rcnt; 		/* 총 댓글 수 */
	
}
