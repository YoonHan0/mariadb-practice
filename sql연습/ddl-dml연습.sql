
-- DDL
DROP table member;

CREATE table member(
	no int not null auto_increment,
	email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100), 
    
    primary key(no)
);
DESC member;

ALTER table member ADD column juminbunho CHAR(13) NOT NULL;
DESC member;

ALTER table member ADD column juminbunho CHAR(13) NOT NULL AFTER email; -- column 추가하면서 위치 정해주기
DESC member;

ALTER table member CHANGE column department dept VARCHAR(200) NOT NULL;	-- change(이름, 제약조건)
DESC member;

ALTER table member ADD self_intro text;
DESC member;

ALTER table member DROP juminbunho;
DESC member;