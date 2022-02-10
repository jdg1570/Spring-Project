create table replyControl (
	idx		int not null auto_increment primary key,	/* 총 댓글 고유번호 */
	eventIdx 	int not null,				/* 이벤트 댓글 */
	reveiwIdx	int not null,				/* 도서리뷰 댓글 */
	part 	varchar(10) not null,			/* 분류 */
	foreign key(eventIdx) references eventReply(idx) on update cascade on delete restrict,
	foreign key(reveiwIdx) references bookReview(idx) on update cascade on delete restrict
);

drop table replyControl;
select * from replyControl;
select * from bookReview;
select * from eventReply;
select b.nickName,b.wDate,b.Content,c.nickName,c.wDate,c.Content from replyControl a, bookReview b, eventReply c;