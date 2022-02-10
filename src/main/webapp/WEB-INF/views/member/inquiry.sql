create table inquiry (
	idx 	int not null auto_increment,	/* 문의글 고유번호 */
	nickName 	varchar(20) not null,		/* 올린 문의글의 닉네임 */
	content 	text not null,				/* 문의글내용 */
	wDate		datetime default now(),		/* 글쓴 날짜(기본값:현재날짜/시간) */
	part		varchar(20) not null,		/* 분류*/
	reply		char(3) default "NO",	/* 관리자 답변 상태 */
	primary 	key(idx)
);
drop table inquiry;


create table inquiryReply (
	idx		int not null auto_increment primary key,	/* 문의 답글 고유번호 */
	inquiryIdx	int not null,							/* 문의글의 고유번호 */
	nickName	varchar(20) not null,				/* 올린이의 닉네임 */
	wDate		datetime default now(),			/* 댓글 기록 날짜 */
	content		text	not null,					/* 답글 내용 */
	level		int  not null default 0,		/* 답글레벨 - 부모댓글의 레벨은 '0' */
	levelOrder int not null default 0,			/* 답글의 순서 - 부모댓글의 levelOrder은 '0' */
	foreign key(inquiryIdx) references inquiry(idx) on update cascade on delete cascade
);

