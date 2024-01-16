create database jsp;
use jsp;

create table tbl_member(
	member_number int unsigned auto_increment primary key,
	member_id varchar(255),
	member_pw varchar(255),
	member_name varchar(255),
	member_age tinyint unsigned,
	member_gender varchar(255),
	member_email varchar(255),
	member_zipcode char(5),
	member_address varchar(255),
	member_address_detail varchar(255)
);

select * from tbl_member;