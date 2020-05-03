--  Lab 6
create table salesman(salesman_id int,name varchar(20),city varchar(20),commission varchar(20),PRIMARY KEY (salesman_id));
create table customer(customer_id int,cust_name varchar(20),city varchar(20),grade int,salesman_id int,PRIMARY KEY (customer_id),FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL);
create table orders(order_no int,purchase int,date date,customer_id int,salesman_id int,primary key (order_no),foreign key (customer_id) references customer(customer_id) ON DELETE CASCADE,foreign key (salesman_id) references salesman(salesman_id) ON DELETE CASCADE);

insert into salesman values(1000,'john','bangalore','25%'),
(2000,'ravi','bangalore','20%'),
(3000,'kumar','mysore','15%'),
(4000,'smith','delhi','30%'),
(5000,'harsha','hyderabad','15%');

insert into customer values(10,'preethi','bangalore',100,1000),
(11,'vivek','mangalore',300,1000),
(12,'bhaskar','chennai',400,2000),
(13,'chethan','bangalore',200,2000),
(14,'mamtha','bangalore',400,3000);

insert into orders values(50,5000,'04-05-17',10,1000),
(51,450,'20-01-17',10,2000),
(52,1000,'24-02-17',13,2000),
(53,3500,'13-04-17',14,3000),
(54,550,'09-03-17',12,2000);

select * from salesman;
select * from customer;
select * from orders;

-- 1
select grade,count(distinct customer_id) 
from customer group by grade
having grade >(
select avg(grade) from customer where city='bangalore');
-- 2
select salesman_id,name 
from salesman A 
where 1< (select count(*) from customer where salesman_id = A.salesman_id);
-- 3
select salesman.salesman_id,name,cusT_name,commission
from salesman,customer
where salesman.city = customer.city
union
select salesman_id,name,'no match',commission
from salesman 
where NOT city = ANY(select city from customer) order by 2 desc;
-- 4
create view elitesalesman as
select B.date,A.salesman_id,A.name
from salesman A,orders B
where A.salesman_id = B.salesman_id AND
B.purchase = ( select max(purchase) from orders C where C.date=B.date);
-- 5
delete from salesman where salesman_id = '1000';
select * from salesman;