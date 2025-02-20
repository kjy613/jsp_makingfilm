
create table member(
	Memid varchar(20) not null primary key,
    Mempw varchar(20) not null,
    Memname varchar(20) not null,
    Memphnno int not null,
    Mememail varchar(20) not null
);
create table board(
	title varchar(20) not null,
    writer varchar(20) not null,
    keyword varchar(20) not null,
    script varchar(20) not null
);