-- Inner JOIN

-- 예제1) 현재 근무하고 있는 직원의 이름과 직책을 모두 출력하시오.
SELECT a.first_name, b.title
FROM employees a, titles b
WHERE a.emp_no = b.emp_no			-- JOIN 조건(n-1)
	AND b.to_date = '9999-01-01';	-- row 선택 조건
    
SELECT a.first_name, b.title
FROM employees a 
JOIN titles b on a.emp_no = b.emp_no	-- JOIN 조건(n-1)
WHERE b.to_date = '9999-01-01';	-- row 선택 조건

-- 예제2) 현재 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어(Engineer)만 출력하시오.
SELECT a.first_name, a.gender, b.title
FROM employees a, titles b
WHERE a.emp_no = b.emp_no			-- JOIN 조건(n-1)
	AND b.to_date = '9999-01-01'	-- row 선택 조건1
    AND a.gender = 'f'				-- row 선택 조건2
    AND b.title = 'Engineer';		-- row 선택 조건3
		
--
-- ANSI/ISO SQL1999 JOIN 표준 문법
-- 

-- 1) Natural Join
-- 	  조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 (PK = FK)
-- 	  명시하지 않고 암묵적으로 조인이 된다. 
SELECT a.first_name, b.title
FROM employees a JOIN titles b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01';

SELECT a.first_name, b.title
FROM employees a NATURAL JOIN titles b
WHERE b.to_date = '9999-01-01';

-- 2) join ~ using
-- Natural Join의 문제점
SELECT count(*)
FROM salaries a NATURAL JOIN titles b
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01';
    
SELECT count(*)
FROM salaries a JOIN titles b USING(emp_no)
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01';

-- 3) join ~ on ***
-- 예제) 현재 직책별 평균 연봉을 큰 순서대로 출력하시오.
SELECT b.title, avg(a.salary) AS avg_salary
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY avg_salary DESC;

-- 실습문제1
-- 현재 직원별 근무 부서를 사번, 지원 이름, 근무 부서명을 출력하시오. / 부서명이 Customer Service밖에 안 나옴..
SELECT a.emp_no, a.first_name, c.dept_name
FROM employees a 
JOIN dept_manager b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
WHERE b.to_date = '9999-01-01'
GROUP BY a.emp_no;

-- 실습문제2
-- 현재 지급되고 있는 급여를 출력하시오. (사번, 이름, 급여순으로 출력)
SELECT a.emp_no, a.first_name, b.salary
FROM employees a 
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01';

-- 실습문제3
-- 현재 직책별 평균 연봉, 직원 수를 출력하시오 (직책별 직원수가 100명 이상인 직책만)
-- 직책, 평균 연봉, 직원수 순으로 출력
SELECT b.title, avg(a.salary), count(a.emp_no) -- === count(*)
FROM salaries a 
	JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
HAVING count(a.emp_no) >= 100;

-- 실습문제4
-- 현재 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하시오.
-- 부서 이름, 평균 급여 순으로 출력
SELECT a.dept_name, avg(d.salary)		-- 이건 왜 안될까.. (시간초과) -> 문법 오류였다~
FROM departments a JOIN dept_emp b ON a.dept_no = b.dept_no
	JOIN titles c ON b.emp_no = c.emp_no
    JOIN salaries d ON c.emp_no = d.emp_no
WHERE c.title = 'Engineer'
	AND b.to_date = '9999-01-01'
    AND c.to_date = '9999-01-01'
    AND d.to_date = '9999-01-01'
GROUP BY a.dept_name;

SELECT a.dept_name, avg(d.salary)
FROM departments a, dept_emp b, titles c, salaries d
WHERE a.dept_no = b.dept_no
	AND b.emp_no = c.emp_no
    AND b.emp_no = d.emp_no
	AND c.title = 'Engineer'
	AND b.to_date = '9999-01-01'
    AND c.to_date = '9999-01-01'
    AND d.to_date = '9999-01-01'
GROUP BY a.dept_name;