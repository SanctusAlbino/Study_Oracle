[연습문제6-2]

1. 부서위치코드가 1700에 해당하는 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회하는 쿼리문을
다중행 서브쿼리로 작성한다.
-- 결과가 여러개 비교 ==> IN, ANY(=SOME), ALL 이런가~~

--1.1 서브쿼리 없이 조회
select department_id, department_name
from departments
where location_id = 1700;
--1.2 서브쿼리로 조회
select  employee_id, first_name, department_id, job_id
from    employees
where   department_id in (select department_id
                         from departments
                         where location_id = 1700);

--가장 급여를 많이 받는 : max(salary)==> 단일 행 함수 ==> 단일 행 서브쿼리 특징!!
2. 부서별로 가장 급여를 많이 받는 사원의 사번, 이름, 부서번호, 급여, 업무코드를 조회하는 쿼리문을
다중 컬럼 서브쿼리를 사용하여 작성한다.
-- 컬럼의 갯수, 데이터가 일치하는 여러 컬럼/행을 비교

select  employee_id, first_name, department_id, salary, job_id
from    employees
where   (department_id,salary) =any (select department_id, max(salary)
                                        from    employees
                                        group by department_id);
