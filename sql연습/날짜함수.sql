-- 날짜함수

-- curdate(), current_date
SELECT curdate(), current_date() FROM DUAL;

-- curtime(), current_time
SELECT curtime(), current_time() FROM DUAL;

-- now(). sysdate()
SELECT now(), sysdate() FROM DUAL;

SELECT now(), sleep(2), now() FROM DUAL;	-- Query가 시작할 때 시간을 측정
SELECT now(), sleep(2), sysdate() FROM DUAL;	-- sysdate()함수가 실행될 때 시간을 측정

-- date_format()
-- 2023-01-09 15:19:20
SELECT date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %s초') FROM DUAL; -- 대소문자를 구분하여 출력됨

-- peroid_diff
-- 포맷팅: YYMM, YYYYMM
-- 예) 근무개월
SELECT first_name, hire_date, period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) AS Month
FROM employees
ORDER BY Month DESC;

-- date_add(=adddate), date_sub(=subdate)
-- 날짜를 date 타입의 컬럼이나 값에 type(year, month, day)의 표현식으로 더하거나 뺄 수 있다.
-- 예) 각 사원들의 근속년 수가 5년이 되는 날에 휴가를 보내준다면 각 사원의 5년 근속 휴가 날짜는?
SELECT first_name, hire_date, date_add(hire_date, interval 5 year)
FROM employees;

-- cast
SELECT '12345' + 10, CAST('12345' AS int) + 10 FROM DUAL;
SELECT date_format(cast('2023-01-09' as date), '%Y년 %m월 %d일') FROM DUAL;
SELECT cast(cast(1-2 as unsigned) as signed) FROM DUAL;
SELECT cast(cast(1-2 as unsigned) as integer) FROM DUAL;


-- type
-- 문자: varchar, char, text, CLOB(Character Large OBject)
-- 정수: medium int, int(signed, integer), unsigned, big int
-- 실수: float, double
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large OBject)