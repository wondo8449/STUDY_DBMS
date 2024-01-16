create database test;

use test;

create table tbl_guest(
	guest_number int unsigned auto_increment primary key,
	guest_id varchar(1000),
	guest_password varchar(1000),
	guest_age tinyint unsigned
);

alter table tbl_guest add column(guest_birth date);

select * from tbl_guest;

insert into tbl_guest
(guest_id, guest_password, guest_age, guest_birth)
values('hgd', '5555', 15, '2008-01-04');

select `auto_increment` from information_schema.TABLES
where table_schema = 'test' and table_name = 'tbl_guest';

select concat(guest_id, '의 나이는 ', guest_age, '살') 자기소개 from tbl_guest;

select now() from dual;

select date_format(now(), '%Y년 %m월 %d일 %H:%i:%s') 현재시간 from dual;

select * from tbl_guest;

update tbl_guest
set guest_birth = null
where guest_number = 2;

select ifnull(guest_birth, '미정') from tbl_guest;

alter table tbl_guest change guest_birth guest_birth datetime;

select * from tbl_guest; 

/*
 * 회원 테이블
 * 
 * 회원번호
 * 아이디
 * 비밀번호
 * 이름
 * 나이
 * 핸드폰 번호
 * 상태
 * */
create database customer;
use customer;


create table tbl_customer (
	customer_number int unsigned auto_increment primary key,
	customer_id varchar(255),
	customer_password varchar(255),
	customer_name varchar(255),
	customer_age tinyint unsigned,
	customer_phone_number varchar(255),
	customer_status char(1) default 0
);

select * from tbl_customer;

alter table tbl_customer change customer_status customer_status char(2);

insert into tbl_customer
(customer_id, customer_password, customer_name, customer_age, customer_phone_number)
values('hds', '1234', '한동석', 20, '01012341234');