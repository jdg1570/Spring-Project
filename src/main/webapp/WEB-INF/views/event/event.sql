create table events (
  eventIdx 	int  not null auto_increment,	/* 이벤트 고유번호 */
  eventTitle 	varchar(100) not null,		/* 이벤트 제목 */
  eventImage 	varchar(100) not null,		/* 이벤트 이미지 */
  fDate    	 	datetime default now(),		/* 이벤트 업로드한 날짜 */
  endDate	 	varchar(20) not null,		/* 이벤트 종료 날짜 */
  eventNum	 	int default 0,				/* 이벤트 참여자 */
  good			int default 0,
  eventContent    text,						/* 이벤트 상세설명 */
  primary key (eventIdx)
);

desc events;

create table eventReply (
	idx 		int not null auto_increment primary key,	/* 댓글 고유번호 */
	eventIdx int not null,						/* 이벤트 고유번호 */
	nickName varchar(20) not null, 				/* 올린이의 닉네임 */
	wDate		datetime	default now(), 		/* 댓글 기록 날짜 */
	content		text 	not null,				/* 댓글내용 */
	level 	int not null default 0,				/* 댓글레벨 - 부모댓글의 레벨은 '0'*/
	levelOrder int not null default 0,			/* 댓글순서 - 부모댓글의 순서는 '0' */ 
	foreign key(eventIdx) references events(eventIdx)on update cascade on delete restrict  /* 외래키 설정*/
);
alter table eventReply add column 

alter table eventReply add column part int not null default 2;