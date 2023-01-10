-- Outter join
SHOW tables;
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');
SELECT * FROM dept;
-- INSERT into emp values(null, '둘리', 1);
-- INSERT into emp values(null, '마이콜', 2);
-- INSERT into emp values(null, '또치', 3);
-- INSERT into emp values(null, '길동', null);

SELECT * FROM emp;

-- Inner Join
SELECT a.name, b.name
FROM emp a
JOIN dept b ON a.dept_no = b.no;

-- Outer Join(Left Join)
SELECT a.name AS '사원', IFNULL(b.name, '없음') AS '부서'
FROM emp a
LEFT JOIN dept b ON a.dept_no = b.no;

-- Outer Join(Right Join)
SELECT IFNULL(a.name, '없음') AS '사원', b.name AS '부서'
FROM emp a
RIGHT JOIN dept b ON a.dept_no = b.no;