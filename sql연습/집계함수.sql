-- 집계쿼리: SELECT 절에 통계함수(avg, max, min, count, sum, stddev, varance, ...)

SELECT avg(salary), sum(salary)		-- row 하나만 출력된다. -> 결과가 하나이다.
FROM salaries;

-- SELECT 절에 그룹함수(통계함수)가 있는 경우, 어떤 컬럼도 SELECT절에 올 수 없다!
-- emp_no는 아무 의미가 없다. -> 오류!
SELECT avg(salary), emp_no
FROM salaries;

-- query 순서
-- 1) FROM: 접근 테이블 확인
-- 2) WHERE: 조건에 맞는 row를 선택 -> 임시테이블 만듬
-- 3) 집계 (결과테이블 - ORDER BY는 여기서)
-- 4) projection

-- 예제: 사번이 10060인 사원이 받은 월급의 평균은?
SELECT avg(salary)
FROM salaries
WHERE emp_no = '10060';

-- 5) GROUP BY에 참여하고 있는 칼럼은 projection이 가능하다. -> SELECT절에 올 수 있다.
-- 예제: 모든 사원이 받은 각각의 평균 월급은? or 모든 사원별 평균 월급은?
SELECT emp_no, avg(salary)
FROM salaries
GROUP BY emp_no;

-- 6) HAVING :	결과테이블에서 조건을 걸어서 출력하려면 -> "having"을 사용
-- 				집계 결과(결과 테이블)에서 ROW를 선택해야 하는 경우
-- 				이미 WHERE절은 실행이 되었기 때문에 HAVING절에서 조건을 주어야 함!
-- 예제: 평균 월급이 60,000 달러 이상인 사원의 사번과 평균 월급을 출력하시오.
SELECT emp_no, avg(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary > 60000;

-- 7) 	ORDER BY
-- 		ORDER BY는 항상 맨 마지막에 출력한다.
SELECT emp_no, avg(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING avg_salary > 60000
ORDER BY avg_salary ASC;

-- 주의)
-- 예제: 사번이 10060인 사원의 사번, 급여 평균, 급여 총액을 출력하시오.

--  의미적으로는 맞지만 문법적으로 X
SELECT emp_no, avg(salary), sum(salary)
FROM salaries
WHERE emp_no = '10060';

-- 의미적, 문법적으로 이게 맞음!
SELECT emp_no, avg(salary), sum(salary)
FROM salaries
GROUP BY emp_no
HAVING emp_no = '10060';