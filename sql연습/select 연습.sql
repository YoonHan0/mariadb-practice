-- select 기본
-- 예제 : 전체 출력
select * from departments;

-- 프로젝션(projection)
-- 예제 : departments 테이블에서 직원의 이름, id를 출력
select dept_no, dept_name from departments;	

-- as(alias, 생량 가능)
--  employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select first_name as '이름',
		gender as '성별',
        hire_date as '입사 일'
from employees;

select concat(first_name, ' ', last_name) as '이름',
		gender as '성별',
        hire_date as '입사 일'
from employees;
