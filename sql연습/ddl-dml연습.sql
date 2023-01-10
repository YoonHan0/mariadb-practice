
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

-- INSERT
INSERT INTO member 
	VALUES (null, 'dbsgksdud@gmail.com', PASSWORD('1234'), '윤한영', '개발팀', null);
SELECT * FROM member;

INSERT INTO member(no, email, name, dept, password) 	-- 순서를 명시할 수 있음, default, null값을 입력하지 않아도 됨
	VALUES (null, 'dbsgksdud@gmail.com', '윤한영', '개발팀', PASSWORD('1234'));
SELECT * FROM member;

-- UPDATE
UPDATE member
set email = 'dbsgksdud2@gmail.com', password = PASSWORD('5678')
WHERE no = 2;
SELECT * FROM member;

-- DELETE
DELETE
FROM member
WHERE no = 2;
SELECT * FROM member;

-- transection
SELECT @@autocommit;	-- 자동 커밋을 되어 있는지 확인
set autocommit = 0;		-- transection을 관리하기 위해서 autocoommit을 0으로(직접 커밋을 하게 설정)

INSERT INTO member 
	VALUES (null, 'dbsgksdud55@gmail.com', PASSWORD('1234'), '윤한영55', '개발팀', null);
SELECT * FROM member;

COMMIT;

SELECT * FROM member;