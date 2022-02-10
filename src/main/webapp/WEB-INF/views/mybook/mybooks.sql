create table mybooks (
	idx		int not null auto_increment,	/* 서재 책 고유번호 */
	bookIdx 	int not null,				/* 책 고유번호 */
	bookName 	varchar(30) not null,		/* 책 이름 */
	bookAuthor 	varchar(20) not null,		/* 작가 */
	bookContent text not null,				/* 책 이미지 */
	nickName 	varchar(20) not null,		/* 회원 닉네임 */
	bookDate datetime default now(),		/* 서재에 담긴 날짜 */
	readDate datetime default now(),		/* 최근 읽은 날짜 */
	bookType varchar(20) not null,			/* 책 카테고리 */
	sort int not null default 0,			/* 정렬 */
	bookText text not null,					/* 책 텍스트 */
	read	char(3) default 'NO',			/* 완독 */
	primary key(idx),
	foreign key(bookIdx) references books(bookIdx) on update cascade on delete restrict
/*	foreign key(mid) references member(mid) on update cascade on delete cascade */
);

drop table mybooks;
