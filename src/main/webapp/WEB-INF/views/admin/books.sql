create table books (
	bookIdx 	int not null auto_increment primary key,	/* 책 고유번호 */
	bookName 	varchar(30) not null,			/* 책 이름 */
	fDate		datetime default now(),			/* 등록날짜 */
	updateDate 	datetime default now(),			/* 수정날짜 */
	readNum		int default 0,					/* 베스트샐러(읽은 수) */
	bookAuthor 	varchar(20) not null,			/* 작가 */
	publisher 	varchar(20) not null,			/* 출판사 */
	publiDate	varchar(20) not null,			/* 출판일 */
	bookType	varchar(20) not null,			/* 카테고리 */
	bookContent 	text not null,				/* 책 이미지 */
	bookContent2 	text not null,				/* 책 내용 */
	bookText		text not null,				/* 책 텍스트 */
);

alter table books add column bookContent2 text not null;
desc books;
select * from books order by publiDate;



// 도서 한 줄 리뷰
create table bookReview (
	idx 		int not null auto_increment primary key,	/* 댓글 고유번호 */
	bookIdx int not null,						/* 책 고유번호 */
	nickName varchar(20) not null, 				/* 올린이의 닉네임 */
	wDate		datetime	default now(), 		/* 댓글 기록 날짜 */
	content		text 	not null,				/* 댓글내용 */
	likeNum	int not null default 0,				/* 좋아요 */
	foreign key(nickName) references member(nickName) on delete cascade on update cascade,
	foreign key(bookIdx) references books(bookIdx)on update cascade on delete cascade
);

desc bookReview;
show tables;
drop table bookReview;

// 리뷰 좋아요
create table reviewLike (
	reviewIdx int not null,				/* 리뷰 번호 */
	nickName varchar(20) not null,		/* 좋아요 누른 회원 */
	likeSw int not null default 1,		/* 좋아요 상태 유무 */
	likeCnt int not null default 0,		/* 좋아요 수 */
	foreign key(reviewIdx) references bookReview(idx)on update cascade on delete cascade
);