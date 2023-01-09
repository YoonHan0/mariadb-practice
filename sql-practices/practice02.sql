-- 집계(통계) SQL 문제입니다.

-- 문제 1. 
-- 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요? 함께 “최고임금 – 최저임금”이란 타이틀로 출력해 보세요.
SELECT max(salary) AS '최고임금', min(salary) AS '최저임금', max(salary) - min(salary) AS '최고임금 - 최저임금'
FROM salaries;

-- 문제2.
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT date_format(max(hire_date), '%Y년%m월%d일') AS '마지막 입사일'
FROM employees;

-- 문제3.
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT max(period_diff(date_format(curdate(), '%Y년%m월%d일'), date_format(hire_date, '%Y년%m월%d일'))) AS Month, date_format(hire_date, '%Y년%m월%d일')
FROM employees;

-- 이거인가..?
SELECT date_format(min(hire_date), '%Y년%m월%d일') AS 입사일
FROM employees;

-- 문제4.
-- 현재 이 회사의 평균 연봉은 얼마입니까?
SELECT avg(salary) AS '평균 연봉'
FROM salaries;

-- 문제5.
-- 현재 이 회사의 최고/최저 연봉은 얼마입니까?
SELECT max(salary) AS '현재 최고 연봉', min(salary) AS '현재 최저 연봉'
FROM salaries
WHERE to_date = '9999-01-01';

-- 문제6.
-- 최고 어린 사원의 나이와 최 연장자의 나이는?
SELECT ROUND((TO_DAYS(NOW()) - TO_DAYS(min(birth_date)))/ 365)  AS '최연장자', ROUND((TO_DAYS(NOW()) - TO_DAYS(max(birth_date)))/ 365)  AS '최고 어린 사원'
FROM employees;

-- 확인
SELECT birth_date
FROM employees
ORDER BY birth_date DESC;

-- 나이 구하는 방법
SELECT ROUND((TO_DAYS(NOW()) - TO_DAYS("1998-06-23"))/ 365)  AS '나이'
FROM DUAL;

