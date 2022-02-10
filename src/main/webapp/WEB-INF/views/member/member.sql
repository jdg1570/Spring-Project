create table member (
	idx int not null auto_increment,	/* 회원번호 */
	mid varchar(20) not null,			/* 아이디 */
	pwd varchar(100) not null,			/* 비밀번호 */
	nickName varchar(20) not null,		/* 닉네임 */
	name varchar(20) not null,			/* 이름 */
	gender varchar(10) default '남자',	/* 성별 */
	birthday datetime default now(),	/* 생일 */
	tel varchar(15),					/* 연락처 */
	address varchar(100) not null,		/* 주소 */
	email varchar(50) not null,			/* 이메일 */
	interest varchar(60),				/* 관심사 */
	userInfor char(6) default '공개',	/* 회원 정보 공개여부(공개/비공개) */
	userDel char(2) default 'NO',		/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
	point  int default 0,				/* 포인트 */
	level int default 1,				/*  1:정회원, 2:우수회원 0:관리자 */
	startDate datetime default now(),	/* 최초 가입일 */
	lastDate  datetime default now(),	/* 마지막 접속일 */
	primary key(idx, nickName)				/* 기본키 : 고유번호, 닉네임 */
);

desc member;
delete from member;
drop table member;

insert into member values(default,'admin','!234','관리자','조두기',default,default,'010-4613-5512','청주시 상당구 방서동',
'jodoge777@naver.com','IT',default,default,default,0,default,default);

update member set pwd = '!234' where nickName='관리자';

update member set level = 0 where mid="admin";
select * from member;


