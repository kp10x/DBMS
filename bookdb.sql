-- Lab 7
create table publisher(name varchar(20),phone real,address varchar(20),primary key (name));
create table book(book_id int,title varchar(20),year varchar(20),publisher_name varchar(20),primary key (book_id),foreign key (publisher_name) references publisher(name) on delete cascade);
create table authors(author_name varchar(20),book_id int,primary key(book_id,author_name),foreign key (book_id) references book(book_id) on delete cascade);
create table library_branch(branch_id int,branch_name varchar(20),address varchar(20),primary key (branch_id));
create table book_copies(book_id int,branch_id int,no_copies int,primary key (book_id,branch_id),foreign key (book_id) references book(book_id) on delete cascade,foreign key (branch_id) references library_branch(branch_id) on delete cascade);
create table card( card_no int, primary key (card_no));
create table book_lending(date_out date,due_date date,book_id int,branch_id int,card_no int,primary key (book_id,branch_id,card_no),foreign key (book_id) references book(book_id) on delete cascade,foreign key (branch_id) references library_branch(branch_id) on delete cascade,foreign key (card_no) references card(card_no) on delete cascade);

insert into publisher values('mcgraw-hill',99890076587,'bangalore'),
('pearson',9889076565,'newdelhi'),
('random house',7455679345,'hyderabad'),
('hachette livre',8970862340,'chennai'),
('grupo planeta',7756120238,'bangalore');

insert into book values(1,'dbms','jan-2017','mcgraw-hill'),
(2,'adbms','jun-2016','mcgraw-hill'),
(3,'CN','sep-2016','pearson'),
(4,'CG','sep-2015','grupo planeta'),
(5,'OS','may-2016','pearson');

insert into authors values('navathe',1),
('navathe',2),
('tanenbaum',3),
('edward angel',4),
('galvin',5);

insert into library_branch values(10,'RR nagar','bangalore'),
(11,'RNSIT','bangalore'),
(12,'Rajaji nagar','bangalore'),
(13,'NITTE','mangalore'),
(14,'Manipal','udupi');

insert into book_copies values(1,10,10),
(1,11,5),(2,12,2),(2,13,5),(3,14,7),(5,10,1),(4,11,3);

insert into card values (100),(101),(102),(103),(104);

insert into book_lending values('01-01-17','01-06-17',1,10,101),
('11-01-17','11-03-17',3,14,101),
('21-02-17','21-04-17',2,13,101),
('15-03-17','15-07-17',4,11,101),
('12-04-17','12-05-17',1,11,104);

select * from publisher;
select * from book;
select * from authors;
select * from card;
select * from library_branch;
select * from book_copies;
select * from book_lending;

-- 1
select B.book_id, B.title, B.publisher_name, A.author_name, C.no_copies, L.branch_id 
from book B, authors A, book_copies C, library_branch L 
where B.book_id = A.book_id AND B.book_id = C.book_id AND L.branch_id = C.branch_id;
-- 2
select card_no 
from book_lending
where date_out between 01-01-17 AND 01-07-17
group by card_no having count(*) >3;
-- 3
delete from book where book_id = 3;
-- 4
select * from book;
-- 5
create view V_publication as
select year from book;
-- 6
create view V_books as select B.book_id, B.title, C.no_copies
from book B, book_copies C, library_branch L 
where B.book_id = C.book_id AND C.branch_id = L.branch_id;
