drop table member1;
create table member1(
	mno number primary key,
	id varchar2(100) not null,
	password varchar2(100) not null,
	name varchar2(100) not null,
	nick_name varchar2(100) not null,
	phone varchar2(100) not null,
	gender char(2) default 'm' not null,
	birth date not null,
    email VARCHAR2(100) NOT NULL,
    reg_date DATE NOT NULL,
    del   CHAR(1) default 'n' NOT NULL,
    blacklist char(4) default 'n' not null,
    identity varchar2(30) not null 
)
select * from member1;
drop table board
create table board(
	bno number primary key,
	subject varchar2(200) not null,
	content varchar2(4000) not null,
	reg_date date not null,
	read_cnt number not null,
	likes number not null,
	del char(1) default 'n' not null,
	mno number references member1 not null
)

create table fee(
	feeno number primary key,
	w1000 number,
	w3000 number,
	w5000 number,
	w10000 number,
	w50000 number,
	w100000 number
)
--가맹 문의 
create table pc(
	pcno number primary key,
	pcbusinessnum varchar2(20) not null,
	pcpno varchar2(20) not null,
	pcname varchar2(100) not null,
	pcaddr varchar2(500) not null,
	pclikes number,
	pcinfo varchar2(4000) not null,
	mno number references member1,
	feeno number references fee,
	imagename varchar2(50)
)

create table pcimage(
	imageno number(10) primary key,
	pcno number references pc(pcno),
	imagename varchar2(50)
)
select * from pcimage;
create sequence pcimage_seq;
CREATE or replace FUNCTION get_seq
	RETURN NUMBER
IS
BEGIN
	RETURN pcimage_seq.nextval;
END;
/
--여기까지 -----

-----------------------------------------------------(21.12.31)
select * from member1
select * from pc;
drop table pc;
drop table board;
drop table member1;
create table member1(
	mno number primary key,
	id varchar2(100) not null,
	password varchar2(100) not null,
	name varchar2(100) not null,
	nick_name varchar2(100) not null,
	phone varchar2(100) not null,
	gender char(2) default 'm' not null,
	birth VARCHAR2(100) not null,
    email VARCHAR2(100) NOT NULL,
    reg_date DATE NOT NULL,
    del   CHAR(1) default 'n' NOT NULL,
    blacklist char(4) default 'n' not null,
    identity varchar2(30) not null,
    profile varchar2(300)
)
------------------------------------------------------21.01.05



create table board_likes(
	mno number references member1 not null,
	bno number references board not null
)

create table board_reply(
	mno number references member1 not null,
	bno number references board not null,
	rno number primary key,
	content varchar2(4000) not null,
	reg_date date not null,
	likes number not null,
	del char(1) default 'n' not null
)

create table reply_likes(
	mno number references member1 not null,
	bno number references board not null
)


create table bookmark1(
	mno number references member1 not null,
	pcno number references pc not null
)

create table seat (
	seatno number primary key,
	seatrow number not null,
	seatcol number not null,
	pcno number references pc not null
)

create table reserve(
	reserveno number primary key,
	mno number references member1 not null,
	pcno number references pc not null,
	reservetime number not null,
	starttime date not null,
	seatno number references seat not null
)

create table reserve_seat(
	seatno number references seat not null,
	reserveno number references reserve not null
)

