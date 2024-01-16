create database mybatis;

use mybatis;

create table tbl_info(
	info_number bigint unsigned auto_increment primary key,
	info_name varchar(255),
	info_age tinyint unsigned,
	info_gender varchar(255)
);

select * from tbl_info;

truncate table tbl_info;

