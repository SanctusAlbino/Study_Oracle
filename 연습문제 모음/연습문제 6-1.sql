[연습문제6-1]

1. 급여가 가장 적은

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND SALARY =(SELECT MIN(SALARY)FROM EMPLOYEES);

2. 부서명 MARKETING인 부서에 속한 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회하는 쿼리를 작성한다.
SELECT  DEPARTMENT_ID
FROM    DEPARTMENTS
WHERE   DEPARTMENT_NAME LIKE 'Marketing';



SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, JOB_ID
from employees 
where department_id =(SELECT department_id FROM departments WHERE department_name = 'Marketing');

3.회사의 사장보다 더 먼저 입사한 사원들의 사번, 이름, 입사일을 조회하는 쿼리문을 작성

select  hire_date
from    employees
where   manager_id is null;

select  employee_id, first_name, hire_date
from    employees
where   hire_date < (select hire_date from employees where manager_id is null)
order by 3;