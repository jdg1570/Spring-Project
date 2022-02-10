create table board (
	idx 	int not null auto_increment,	/* 게시글 고유번호 */
	nickName 	varchar(20) not null,		/* 올린 게시글의 닉네임 */
	title		 varchar(100) not null,		/* 게시글 글 제목 */
	content 	text not null,				/* 글내용 */
	wDate		datetime default now(),		/* 글쓴 날짜(기본값:현재날짜/시간) */
	readNum 	int default 0,				/* 글 조회수 */
	likeNum 	int default 0,				/* 좋아요 수 */
	part		varchar(20) not null,		/* 분류(공지사항/게시판/~~ */
	primary 	key(idx)					
);
alter table board add column top int default 0;

create table boardReply (
  idx		int not null auto_increment primary key,	/* 댓글의 고유번호 */
  boardIdx	int not null,						/* 원본글의 고유번호(외래키지정) */
  nickName	varchar(20) not null,				/* 올린이의 닉네임 */
  wDate		datetime	default now(),			/* 댓글 기록 날짜 */
  content	text	not null,					/* 댓글 내용 */
  level		int  not null default 0,			/* 댓글레벨 - 부모댓글의 레벨은 '0' */
  levelOrder int not null default 0,			/* 댓글의 순서 - 부모댓글의 levelOrder은 '0' */
  foreign key(boardIdx) references board(idx) on update cascade on delete cascade
);


create table boardLike (
	nickName varchar(20) not null,		/* 좋아요 한 회원 */
	boardIdx int not null,				/* 게시물 번호 */
	likeIdx int not null default 1,		/* 좋아요 유무*/
	likecnt int not null default 0,		/* 좋아요 수 */
	foreign key(boardIdx) references board(idx) on update cascade on delete cascade
);

desc boardReply;