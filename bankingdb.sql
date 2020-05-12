-- Lab 2
create table Branch(branch_name varchar(30),branch_city varchar(10),assets real,PRIMARY KEY (branch_name));
create table Bank_account(acc_no int,branch_name varchar(30),balance real,PRIMARY KEY (acc_no),FOREIGN KEY (branch_name) REFERENCES branch(branch_name));
create table Bank_Customer(customername varchar(30),customerstreet varchar(30),customercity varchar(30),primary key (customername));
create table Depositor(customername varchar(30),acc_no int,PRIMARY KEY (customername,acc_no),FOREIGN KEY (customername) REFERENCES Bank_Customer (customername),FOREIGN KEY (acc_no) REFERENCES Bank_account(acc_no));
create table Loan(loan_num int,branch_name varchar(30),amount real,PRIMARY KEY (loan_num),FOREIGN KEY (branch_name) REFERENCES Branch(branch_name));

insert into Branch values(
'SBI_Chamrajpet','Bangalore',50000),
("SBI_ResidencyRoad","Bangalore",10000),
("SBI_ShivajiRoad","Bonbay",20000),
("SBI_ParliamentRoad","Delhi",10000),
("SBI_Jantarmantar","Delhi",20000);
insert into Bank_account values(
1,"SBI_Chamrajpet",2000),(2,"SBI_ResidencyRoad",5000),(3,"SBI_ShivajiRoad",6000),(4,"SBI_ParliamentRoad",9000),(5,"SBI_Jantarmantar",8000),(6,"SBI_ShivajiRoad",4000),(8,"SBI_ResidencyRoad",4000),(9,"SBI_ParliamentRoad",3000),(10,"SBI_ResidencyRoad",5000),(11,"SBI_Jantarmantar",2000);
insert into Bank_Customer values("Avinash","Bull Temple Road","Bangalore"),
("Dinesh","Bannergatta Road","Bangalore"),
("Mohan","National College Road","Bangalore"),
("Nikil","Akbar Road","Delhi"),
("Ravi","Prithviraj Road","Delhi");
insert into Depositor values(
"Avinash",1),("Dinesh",2),("Nikil",4),("Ravi",5),("Avinash",8),("Nikil",9),("Dinesh",10),("Nikil",11);
insert into Loan values(
1,"SBI_Chamrajpet",1000),(2,"SBI_ResidencyRoad",2000),(3,"SBI_ShivajiRoad",3000),(4,"SBI_ParliamentRoad",4000),(5,"SBI_Jantarmantar",5000);

select * from Branch;
select * from Bank_account;
select * from Bank_Customer;
select * from Depositor;
select * from Loan;

-- 1
select C.customername 
from Bank_Customer C
where exists (
select D.customername, count(D.customername)
from Depositor D,Bank_account BA
where
D.acc_no = BA.acc_no AND C.customername = D.customername AND BA.branch_name='SBI_ResidencyRoad' 
group by D.customername
having count(D.customername) >=2);
-- 2
select BC.customername from Bank_Customer BC where not exists( 
select branch_name from Branch where branch_city = 'Delhi' not in (
select BA.branch_name from Depositor D , Bank_account BA where D.acc_no = BA.acc_no AND BC.customername = D.customername));

-- 3
delete from Bank_account 
where branch_name in (select branch_name 
from Branch
where branch_city='Bonbay');
select * from Bank_account;
