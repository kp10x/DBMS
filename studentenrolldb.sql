--  Lab 8
create table student(regno varchar(30),name varchar(30),major varchar(30),bdate date,primary key (regno));
create table course(courseno int,cname varchar(30),dept varchar(30),primary key (courseno));
create table enroll(regno varchar(30),courseno int,sem int,marks int,primary key (regno,courseno),foreign key (regno) references student(regno) on delete cascade,foreign key (courseno) references course(courseno) on delete cascade);
create table text(book_isbn int,title varchar(30),publisher varchar(30),author varchar(30),primary key (book_isbn));
create table adoption(courseno int,sem int,book_isbn int,primary key(courseno,book_isbn),foreign key (courseno) references course(courseno) on delete cascade,foreign key (book_isbn) references text(book_isbn) on delete cascade);

insert into student values('1pe11cs002','b','sr','19930924'),
('1pe11cs003','c','sr','19931127'),
('1pe11cs004','d','sr','19930413'),
('1pe11cs005','e','jr','19940824');

insert into course values(111,'OS','CSE'),
(112,'EC','CSE'),
(113,'SS','ISE'),
(114,'DBMS','CSE'),
(115,'SIGNALS','ECE');

insert into text values(10,'database systems','pearson','schield'),
(900,'operating sys','pearson','leland'),
(901,'circuits','hall india','bob'),
(902,'system software','peterson','jacob'),
(903,'scheduling','pearson','patil'),
(904,'database systems','pearson','jacob'),
(905,'database manager','pearson','bob'),
(906,'signals','hall india','sumit');

insert into enroll values('1pe11cs002',115,3,100),
('1pe11cs002',114,5,100),
('1pe11cs003',113,5,100),
('1pe11cs004',111,5,100),
('1pe11cs005',112,3,100);

insert into adoption values(111,5,900),
(111,5,903),(111,5,904),(112,3,901),(113,3,10),(114,5,905),(113,5,902),(115,3,906);

select * from adoption;
select * from enroll;
select * from student;
select * from text;
select * from course;

-- 1
select C.courseno, T.book_isbn, T.title
from course C, adoption BA, text T
where C.courseno = BA.courseno AND BA.book_isbn = T.book_isbn AND C.dept = 'CSE' AND 2< (
select count(book_isbn) from adoption B
where C.courseno = B.courseno order by T.title);
-- 2
select distinct c.dept 
from course c
where c.dept in (
select c.dept from course c, adoption b, text t
where c.courseno = b.courseno AND t.book_isbn = b.book_isbn AND t.publisher = 'pearson' )
AND c.dept not in (
select c.dept from course c , adoption b, text t
where c.courseno = b.courseno AND t.book_isbn = b.book_isbn 
AND t.publisher <> 'pearson');