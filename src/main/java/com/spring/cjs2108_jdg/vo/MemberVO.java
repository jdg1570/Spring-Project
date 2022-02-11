package com.spring.cjs2108_jdg.vo;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@SuppressWarnings("deprecation")
@Data
public class MemberVO {
	
	// 데이터 Validation 처리
	private int idx;
	@NotEmpty
	@Size(min=4, max=20)
	private String mid;
	
	@NotEmpty
	@Pattern(regexp ="/[!@#$%^&*()]/gm")
	private String pwd;
	
	@NotEmpty
	@Pattern(regexp ="/\\s/gm")
	private String nickName;
	
	@NotEmpty
	@Pattern(regexp ="/[^가-힣a-zA-Z]/gm")
	private String name;
	
	private String gender;
	private String birthday;
	
	@Pattern(regexp = "/[^0-9]/gm")
	private String tel;
	
	private String address;
	
	@Pattern(regexp = "/^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i")
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
	private int rcnt; 	/* 총 댓글 수 */
	
}
