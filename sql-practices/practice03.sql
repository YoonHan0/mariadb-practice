-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
SELECT a.emp_no, a.first_name, b.salary
FROM employees a 
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01'
ORDER BY b.salary DESC;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT a.emp_no, a.first_name, b.title
FROM employees a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01'
GROUP BY a.first_name
ORDER BY a.first_name ASC;

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
SELECT a.emp_no, concat(a.first_name, ' ', a.last_name), c.dept_name
FROM employees a 
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
WHERE b.to_date = '9999-01-01'
ORDER BY a.first_name ASC;

SELECT *
FROM departments;
-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
SELECT a.emp_no, a.first_name, d.salary, e.title, c.dept_name
FROM employees a 
JOIN dept_manager b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN salaries d ON a.emp_no = d.emp_no
JOIN titles e ON a.emp_no = e.emp_no
WHERE b.to_date = '9999-01-01'
	AND d.to_date = '9999-01-01'
    AND e.to_date = '9999-01-01'
ORDER BY a.first_name ASC;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT a.emp_no, concat(a.first_name, ' ', last_name) AS 'name', b.to_date
FROM employees a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE b.title = 'Technique Leader'
	AND b.to_date NOT IN ('9999-01-01');

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT DISTINCT a.emp_no, a.last_name, c.dept_name, d.title		-- emp_no는 이름이 같은지 구분하려고 사용
FROM employees a 
JOIN dept_manager b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN titles d ON a.emp_no = d.emp_no
WHERE a.last_name LIKE 'S%'
	AND d.to_date = '9999-01-01';

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
SELECT concat(a.first_name, ' ', a.last_name), b.title ,c.salary
FROM employees a 
JOIN titles b ON a.emp_no = b.emp_no
JOIN salaries c ON a.emp_no = c.emp_no
WHERE b.title = 'Engineer'
	AND c.salary >= 40000
ORDER BY c.salary DESC;

-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오
SELECT b.title, avg(a.salary)
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
GROUP BY b.title
HAVING avg(a.salary) >= 50000
ORDER BY avg(a.salary) DESC;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT d.dept_name, avg(b.salary)
FROM employees a 
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON a.emp_no = c.emp_no
JOIN departments d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01'
	AND c.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY avg(b.salary) DESC;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT b.title, avg(a.salary)
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY avg(a.salary) DESC;