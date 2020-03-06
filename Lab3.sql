CREATE DATABASE CS145;
USE CS145;

create table supplier(
	sid int,
    sname varchar(100) not null,
    city varchar(100) not null, 
	primary key (sid)
);

create table parts(
	pid int,
    pname varchar(100) not null,
    color varchar(100) not null,
	primary key (pid)
);

create table catalog(
	sid int,
	pid int,
    coat varchar(100) not null,
	primary key (sid, pid),
    foreign key (sid) references supplier(sid),
	foreign key (pid) references parts(pid)   
);

insert into supplier
values(10001, "Acme Widget", "Bangalore"), 
	(10002, "Johns", "Kolkata"), 
	(10003, "Vimal", "Mumbai"),
	(10004, "Reliance", "Delhi");
    
insert into parts
values(20001, "Book", "Red"), 
	(20002, "Pen", "Red"), 
	(20003, "Pencil", "Green"),
	(20004, "Mobile", "Green"),
    (20005, "Charger", "Black");
    
insert into catalog
values(10001, 20001, 10),
	(10001, 20002, 10),
	(10001, 20003, 30),
	(10001, 20004, 10),
	(10001, 20005, 10),
	(10002, 20001, 10),
    (10002, 20002, 20),
    (10003, 20003, 30),
    (10002, 20003, 40);
    



    
    
    
    







