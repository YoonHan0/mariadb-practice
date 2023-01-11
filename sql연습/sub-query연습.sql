-- subquery
-- 1) SELECT절, INSERT VALUES(...)
--

--
-- 2) FROM절의 서브쿼리
--
SELECT now() AS n, sysdate() AS s, 3 + 1 AS r 
FROM DUAL;

SELECT a.n, a.s, a.r
FROM (SELECT now() AS n, sysdate() AS s, 3 + 1 AS r FROM DUAL) a;

--
-- 3) WHERE절의 서브쿼리
-- 

-- 예제) 현재 Fai Bale이 근무하는 부서에서 근무하는 다른 직원의 사번, 전체 이름을 출력해보세요. 
SELECT b.dept_no
FROM employees a, dept_emp b
WHERE a.emp_no = b.emp_no
	AND b.to_date = '9999-01-01'
    AND concat(a.first_name, ' ', a.last_name) = 'Fai Bale';
    
SELECT a.emp_no, a.first_name
FROM employees a, dept_emp b
WHERE a.emp_no = b.emp_no
	AND b.to_date = '9999-01-01'
    AND b.dept_no = 'd004';

-- 서브쿼리로 변환 --
SELECT a.emp_no, a.first_name
FROM employees a, dept_emp b
WHERE a.emp_no = b.emp_no
	AND b.to_date = '9999-01-01'
    AND b.dept_no = (SELECT b.dept_no
					FROM employees a, dept_emp b
					WHERE a.emp_no = b.emp_no
						AND b.to_date = '9999-01-01'
						AND concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
                        
-- 3-1) 단일행 연산자 : =, >, <, >=, <=, !=
-- 실습문제1
-- 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력하시오.
SELECT avg(salary)
FROM salaries
WHERE to_date = '9999-01-01';

SELECT a.first_name, b.salary
FROM employees a 
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01'
	AND b.salary < (SELECT avg(salary)
					FROM salaries
					WHERE to_date = '9999-01-01')
ORDER BY b.salary DESC;

-- 실습문제2
-- 현재 가장 적은 평균 급여의 직책과 그 평균 급여를 출력하시오.

-- 직책별 평균 급여 테이블을 만듬 - 1
SELECT b.title, avg(a.salary) AS avg_salary
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title;

-- 테이블에서 최솟값을 구함 - 2
SELECT min(a.avg_salary) AS '평균 급여'
FROM (SELECT b.title, avg(a.salary) AS avg_salary
		FROM salaries a 
		JOIN titles b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01'
			AND b.to_date = '9999-01-01'
		GROUP BY b.title) a;
        
-- 3) solution1 : HAVING절에서 처리
SELECT b.title, avg(a.salary) AS avg_salary
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
HAVING avg_salary = (SELECT min(a.avg_salary) AS '평균 급여'
					FROM (SELECT b.title, avg(a.salary) AS avg_salary
							FROM salaries a 
							JOIN titles b ON a.emp_no = b.emp_no
							WHERE a.to_date = '9999-01-01'
								AND b.to_date = '9999-01-01'
							GROUP BY b.title) a);

-- solution2 : top-k
SELECT b.title, avg(a.salary)
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY avg(a.salary) ASC
	LIMIT 0, 1;

-- 3-2) 복수행 연산자 : 
