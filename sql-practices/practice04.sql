-- 문제1.
-- 현재 평균 급여보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
SELECT avg(salary)
FROM salaries;

-- 정답
SELECT count(*)
FROM salaries
WHERE to_date = '9999-01-01'
	AND salary > (SELECT avg(salary)
					FROM salaries);

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 급여를 조회하세요. 
-- 단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT c.emp_no, c.first_name, (b.salary) AS max_salary
FROM dept_emp a 
JOIN salaries b ON a.emp_no = b.emp_no
JOIN employees c ON a.emp_no = c.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY a.dept_no
ORDER BY max_salary DESC;


-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 급여(salary)가 많은 사원의 사번, 이름과 급여를 조회하세요 

-- 부서별 평균 급여
SELECT b.dept_no, avg(c.salary)
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN salaries c ON a.emp_no = c.emp_no
WHERE b.to_date = '9999-01-01'
	AND c.to_date = '9999-01-01'
GROUP BY b.dept_no;

-- 정답 (확인을 위해서 부서 번호, 부서별 평균 급여도 출력했습니다)
SELECT c.dept_no, a.emp_no, a.first_name, b.salary, d.avg_salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON a.emp_no = c.emp_no, (SELECT b.dept_no AS dept_no, avg(c.salary) AS avg_salary
										FROM employees a
										JOIN dept_emp b ON a.emp_no = b.emp_no
										JOIN salaries c ON a.emp_no = c.emp_no
										WHERE b.to_date = '9999-01-01'
											AND c.to_date = '9999-01-01'
										GROUP BY b.dept_no) d
WHERE b.to_date = '9999-01-01'
	AND c.to_date = '9999-01-01'
    AND b.salary > d.avg_salary
    AND c.dept_no = d.dept_no;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- 현재 매니저 이름, 부서 테이블
SELECT a.first_name, c.dept_name, d.title
FROM employees a
JOIN dept_manager b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN titles d ON a.emp_no = d.emp_no
WHERE b.to_date = '9999-01-01'
	AND d.to_date = '9999-01-01'
	AND a.emp_no = b.emp_no;

-- 정답
SELECT a.emp_no, a.first_name, d.manager_name, c.dept_name
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no,
		(SELECT a.first_name AS manager_name, c.dept_name AS dept_name, d.title
		FROM employees a
		JOIN dept_manager b ON a.emp_no = b.emp_no
		JOIN departments c ON b.dept_no = c.dept_no
		JOIN titles d ON a.emp_no = d.emp_no
		WHERE b.to_date = '9999-01-01'
			AND d.to_date = '9999-01-01'
			AND a.emp_no = b.emp_no) d
WHERE c.dept_name = d.dept_name
	AND b.to_date = '9999-01-01';

-- 문제5.
-- 현재, 평균급여이 가장 높은 부서의 사원들의 사번, 이름, 직책, 급여를 조회하고 급여 순으로 출력하세요.

-- 부서별 평균 급여 테이블
SELECT c.dept_name, avg(b.salary) AS avg_salary
FROM dept_emp a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN departments c ON a.dept_no = c.dept_no
WHERE b.to_date = '9999-01-01'
	AND a.to_date = '9999-01-01'
GROUP BY c.dept_name
ORDER BY avg_salary DESC;

-- 최대값을 구함
SELECT max(sub.avg_salary)
FROM (SELECT c.dept_name AS sub_dept_name, avg(b.salary) AS avg_salary
		FROM dept_emp a
		JOIN salaries b ON a.emp_no = b.emp_no
		JOIN departments c ON a.dept_no = c.dept_no
        WHERE b.to_date = '9999-01-01'
			AND a.to_date = '9999-01-01'
		GROUP BY c.dept_name) sub;

-- 평균 급여가 가장 높은 부서
SELECT c.dept_name
FROM dept_emp a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN departments c ON a.dept_no = c.dept_no
WHERE a.to_date = '9999-01-01'
		AND b.to_date = '9999-01-01'
GROUP BY c.dept_name
HAVING avg(b.salary) = (SELECT max(sub.avg_salary)
					FROM (SELECT c.dept_name AS sub_dept_name, avg(b.salary) AS avg_salary
							FROM dept_emp a
							JOIN salaries b ON a.emp_no = b.emp_no
							JOIN departments c ON a.dept_no = c.dept_no
                            WHERE a.to_date = '9999-01-01'
								AND b.to_date = '9999-01-01'
							GROUP BY c.dept_name) sub);
-- 정답
SELECT a.emp_no, a.first_name, c.title, b.salary, e.dept_name
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN titles c ON a.emp_no = c.emp_no
JOIN dept_emp d ON a.emp_no = d.emp_no
JOIN departments e ON e.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01'
		AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
		AND e.dept_name = (SELECT c.dept_name
					FROM dept_emp a
					JOIN salaries b ON a.emp_no = b.emp_no
					JOIN departments c ON a.dept_no = c.dept_no
                    WHERE a.to_date = '9999-01-01'
						AND b.to_date = '9999-01-01'
					GROUP BY c.dept_name
					HAVING avg(b.salary) = (SELECT max(sub.avg_salary)
										FROM (SELECT c.dept_name AS sub_dept_name, avg(b.salary) AS avg_salary
												FROM dept_emp a
												JOIN salaries b ON a.emp_no = b.emp_no
												JOIN departments c ON a.dept_no = c.dept_no
                                                WHERE a.to_date = '9999-01-01'
													AND b.to_date = '9999-01-01'
												GROUP BY c.dept_name) sub));



-- 문제6.
-- 평균 급여가 가장 높은 부서는? 
-- 부서이름, 평균급여

-- 부서별 평균 급여 테이블
SELECT c.dept_name AS sub_dept_name, avg(b.salary) AS avg_salary
FROM dept_emp a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN departments c ON a.dept_no = c.dept_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY c.dept_name
ORDER BY avg_salary DESC;

-- 정답
SELECT c.dept_name, avg(b.salary) AS avg_salary
FROM dept_emp a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN departments c ON a.dept_no = c.dept_no
WHERE a.to_date = '9999-01-01'
		AND b.to_date = '9999-01-01'
GROUP BY c.dept_name
HAVING avg(b.salary) = (SELECT max(sub.avg_salary)
					FROM (SELECT c.dept_name AS sub_dept_name, avg(b.salary) AS avg_salary
							FROM dept_emp a
							JOIN salaries b ON a.emp_no = b.emp_no
							JOIN departments c ON a.dept_no = c.dept_no
                            WHERE a.to_date = '9999-01-01'
								AND b.to_date = '9999-01-01'
							GROUP BY c.dept_name) sub);


-- 문제7.
-- 평균 급여가 가장 높은 직책?
-- 직책, 평균급여

-- 직책별 평균 급여 테이블
SELECT b.title, avg(a.salary) AS avg_salary
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
ORDER BY avg_salary DESC;

-- 정답
SELECT b.title, avg(a.salary) AS avg_salary
FROM salaries a 
JOIN titles b ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
	AND b.to_date = '9999-01-01'
GROUP BY b.title
HAVING avg_salary = (SELECT max(a.avg_salary) AS '평균 급여'
					FROM (SELECT b.title, avg(a.salary) AS avg_salary
							FROM salaries a 
							JOIN titles b ON a.emp_no = b.emp_no
							WHERE a.to_date = '9999-01-01'
								AND b.to_date = '9999-01-01'
							GROUP BY b.title) a);

-- 문제8.
-- 현재 자신의 매니저보다 높은 급여를 받고 있는 직원은?
-- 부서이름, 사원이름, 급여, 매니저 이름, 메니저 급여 순으로 출력합니다.

-- 현재 사원의 급여 테이블
SELECT a.first_name, b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01';

-- 전체 인원
SELECT count(*)
FROM employees;

-- 매니저의 부서이름, 급여 테이블
SELECT a.first_name AS manage_name, c.dept_name AS dept_name, e.salary AS salary, d.title
FROM employees a
JOIN dept_manager b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN titles d ON a.emp_no = d.emp_no
JOIN salaries e ON a.emp_no = e.emp_no
WHERE b.to_date = '9999-01-01'
	AND d.to_date = '9999-01-01'
    AND e.to_date = '9999-01-01'
	AND a.emp_no = b.emp_no;

-- 부서이름, 사원이름, 급여, 매니저 이름, 메니저 급여 순으로 출력합니다.
-- 정답이 아닌 거 같지만...
SELECT c.dept_name, a.first_name, d.salary, manager.manage_name, manager.salary
FROM (SELECT a.first_name AS manage_name, c.dept_name AS dept_name, e.salary AS salary, d.title
		FROM employees a
		JOIN dept_manager b ON a.emp_no = b.emp_no
		JOIN departments c ON b.dept_no = c.dept_no
		JOIN titles d ON a.emp_no = d.emp_no
		JOIN salaries e ON a.emp_no = e.emp_no
		WHERE b.to_date = '9999-01-01'
			AND d.to_date = '9999-01-01'
			AND e.to_date = '9999-01-01'
			AND a.emp_no = b.emp_no) manager,
	employees a
    JOIN dept_emp b ON a.emp_no = b.emp_no
    JOIN departments c ON b.dept_no = c.dept_no
    JOIN salaries d ON a.emp_no = d.emp_no
    WHERE b.to_date = '9999-01-01'
		AND d.to_date = '9999-01-01'
        AND d.salary > manager.salary;
    
