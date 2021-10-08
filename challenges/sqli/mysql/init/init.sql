create database test;

use test;

create table test_user(user_id varchar(10) not null, password varchar(30) binary not null);

grant select on test.test_user to sqli@"%";

insert into test_user(user_id, password)values("admin","fone@nnetjfm");
