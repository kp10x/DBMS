create database studentfac;
use studentfac;
create table student(snum int, sname varchar(20), major varchar(20),lvl varchar(10), age int);
create table class(cname varchar(20), meets_at time, room varchar(10), fid int);
alter table student add constraint primary key(snum);
alter table class add constraint primary key(cname);
create table enrolled(snum int, cname varchar(20), foreign key(snum) references student(snum), foreign key(cname) references class(cname));
create table faculty(fid int primary key, fname varchar(20), deptid int);
alter table class add constraint foreign key(fid) references faculty(fid) on delete cascade;
drop table enrolled;
create table enrolled(snum int, cname varchar(20),primary key(snum,cname), foreign key(snum) references student(snum) on delete cascade, foreign key(cname) references class(cname) on delete cascade);
insert into student values(1,"Aravindh","Major1","FR",19);
insert into student values(2,"Khrithik","Major2","SE",22);
insert into student values(3,"Kenish","Major1","JR",21);
insert into student values(4,"Karthik","Major3","SO",20);
insert into student values(5,"Harshit","Major2","SE",23);
insert into student values(6,"Harsh","Major2","JR",21);
insert into student values(7,"Harshavardhana","Major3","JR",22);
insert into faculty values(1,"KVN",1);
insert into faculty values(2,"PS",2);
insert into faculty values(3,"NM",1);
insert into faculty values(4,"GS",1);
insert into faculty values(5,"CS",2);
insert into class values("ADA","10:30:00","C407",3);
insert into class values("DBMS","11:30:00","C408",1);
insert into class values("OS","15:30:00","C407",2);
insert into class values("LA","13:00:00","C407",5);
insert into class values("TFCS","8:30:00","C408",4);
insert into enrolled values(1,"DBMS");
insert into enrolled values(2,"DBMS");
insert into enrolled values(3,"LA");
insert into enrolled values(4,"OS");
insert into enrolled values(5,"TFCS");
insert into enrolled values(6,"ADA");
insert into enrolled values(7,"LA");















