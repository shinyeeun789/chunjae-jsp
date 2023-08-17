create table exam1(
	no INTEGER,
	name varchar(50)
);

-- point 컬럼 추가
alter table exam1 ADD COLUMN point INTEGER;
-- id 컬럼 추가
alter table exam1 ADD COLUMN id varchar(100);
-- id의 컬럼명을 sid로 변경
alter table exam1 RENAME COLUMN id TO sid;
-- name의 타입을 100글자 타입으로 변경 
alter table exam1 ALTER COLUMN name TYPE varchar(100);

create table notice(
	no serial PRIMARY key,
	title varchar(200) NOT NULL,
	content varchar(1000),
	resdate timestamp default current_timestamp,
	visited INTEGER default 0
);

insert into notice(title, content)
values('공지사항1', '공지사항1의 내용입니다.');
insert into notice(title, content)
values('공지사항2', '공지사항2의 내용입니다.');
insert into notice(title, content)
values('공지사항3', '공지사항3의 내용입니다.');
insert into notice(title, content)
values('공지사항4', '공지사항4의 내용입니다.');
insert into notice(title, content)
values('공지사항5', '공지사항5의 내용입니다.');
insert into notice(title, content)
values('공지사항6', '공지사항6의 내용입니다.');
insert into notice(title, content)
values('공지사항7', '공지사항7의 내용입니다.');
insert into notice(title, content)
values('공지사항8', '공지사항8의 내용입니다.');
insert into notice(title, content)
values('공지사항9', '공지사항9의 내용입니다.');
insert into notice(title, content)
values('공지사항10', '공지사항10의 내용입니다.');
insert into notice(title, content)
values('공지사항11', '공지사항11의 내용입니다.');
insert into notice(title, content)
values('공지사항12', '공지사항12의 내용입니다.');

select * from notice;


create table custom(
	id varchar(20) primary key,
	pw varchar(300) not null,
	name varchar(100) not null,
	point integer default 0,
	grade varchar(4) default 'F',
	tel varchar(11) not null,
	email varchar(100) not null,
	birth timestamp not null,
	regdate timestamp default current_timestamp
);

-- custom 테이블에 더미 데이터 넣기
insert into custom(id, pw, name, tel, email, birth)
values('kim', '1234', '김이름', '01012345678', 'kim@shop.com', '2000-01-01');
insert into custom(id, pw, name, tel, email, birth)
values('lee', '1234', '이이름', '01098765432', 'lee@shop.com', '20000101');
insert into custom(id, pw, name, tel, email, birth)
values('park', '1234', '박이름', '01011112222', 'park@shop.com', '1999-10-01');
insert into custom(id, pw, name, tel, email, birth)
values('choi', '1234', '최이름', '01098742354', 'choi@shop.com', '2004-12-31');
insert into custom(id, pw, name, tel, email, birth)
values('shin', '1234', '신이름', '01023489657', 'shin@shop.com', '2004-02-10');
insert into custom(id, pw, name, tel, email, birth)
values('new', '1234', '새이름', '01013548654', 'new@shop.com', '1995-05-05');
insert into custom(id, pw, name, tel, email, birth)
values('han', '1234', '한이름', '01012345678', 'han@shop.com', '2001-09-05');

select * from custom;
