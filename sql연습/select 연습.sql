-- select 기본
-- 예제 : 전체 출력
select * from departments;

-- 프로젝션(projection)
-- 예제 : departments 테이블에서 직원의 이름, id를 출력
select dept_no, dept_name from departments;	

-- as(alias, 생량 가능)
-- 예제 3번 employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select first_name as '이름',
		gender as '성별',
        hire_date as '입사 일'
from employees;

select concat(first_name, ' ', last_name) as '이름',
		gender as '성별',
        hire_date as '입사 일'
from employees;

-- distinct
-- 예제1 : titles 테이블에서 모든 직급의 이름 출력
select title from titles;

-- 예제 2 : titles 테이블에서 직급은 어떤 것들이 있는지 직급 이름을 한 번씩만 출력
select distinct(title) from titles;

--
-- where 절
-- 

-- 예제1 : 비교연산자 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
SELECT first_name, gender, hire_date
FROM employees
WHERE hire_date < '1991-01-01'
order by hire_date asc;

-- 예제2 : 논리연산자 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
SELECT first_name, gender, hire_date
FROM employees
WHERE hire_date < '1989-01-01' AND gender = 'f'
ORDER BY hire_date ASC;

-- 예제3 : in연산자 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
SELECT *
FROM employees;

SELECT emp_no, dept_no
FROM dept_emp
WHERE dept_no = 'd005' 
	OR dept_no = 'd009';
        
SELECT emp_no, dept_no
FROM dept_emp
WHERE dept_no in ('d005', 'd009');

-- 예제 4: LIKE 검색 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
SELECT first_name, hire_date
FROM employees
WHERE hire_date >= '1989-01-01' AND hire_date <= '1989-12-31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1989-01-01' AND '1989-12-31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '1989%';

--
-- ORDER BY
--

-- 예제1: employees 테이블에서 직원의 전체이름,  성별, 입사일을  입사일 순으로 출력
SELECT concat(first_name, ' ', last_name) AS 'name', gender, hire_date
FROM employees
ORDER BY hire_date ASC;

-- 예제2: salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
SELECT *
FROM salaries;

SELECT emp_no, salary
FROM salaries
WHERE from_date LIKE '2001%'
	OR to_date LIKE '2001%'
ORDER BY salary DESC;

-- 예제3: 남자 직원의 이름, 성별, 입사일(선임순)을 입사일순으로 출력
SELECT first_name AS '이름', 
		gender AS '성별', 
        hire_date AS '입사일'
FROM employees
WHERE gender = 'm'
ORDER BY '입사일' ASC;

-- 예제4: 직원들의 사번, 월급을 사번(asc), 월급은(desc)
SELECT *
FROM salaries;

SELECT emp_no, salary, from_date, to_date
FROM salaries
ORDER BY emp_no ASC, salary DESC;
		