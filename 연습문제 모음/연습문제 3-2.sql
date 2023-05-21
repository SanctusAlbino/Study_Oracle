-- 연습문제3-2


1. 사원 테이블에서 이름(first_name)이 A로 시작하는 모든 사원의 이름과 이름의 길이를 조회한다
select first_name, length(first_name) AS name_length
from    employees
where   first_name like A%;
-- LENGTH (char) : 이름길이
-- like 연산자
-- % : 여러문자
-- _: 하나의 문자
-- _ 자체를 인식, \_  ESCAPE '\'


2. 80번 부서원의 이름과 급여를 조회하는 쿼리문을 작성한다.
--(단, 급여는 15자 길이, 왼쪽에 $ 기호가 채워진 형태로 표시한다)
-- 

SELECT  first_name, lpad(salary, 15, '$') as salary, '$' || salary as salary2
from    employees
where   department_id = 80;



3. 60번 부서, 80번 부서, 100번 부서에 소속된 사원의 사번, 이름, 전화번호, 전화번호의 지역번호를 조회한다
(단, 지역번호는 Local Number라고 표시하고, 지역번호 515.124.4169에서 515가 지역번호이다)
-- SUBSTR (char, position [, length])
-- INSTR (char, from_string, to_string [,_th])

select employee_id, first_name, phone_number,substr(phone_number,1, 3) as "local number", department_id
from    employees
--where   department_id = 60
--or      department_id = 80
--or      department_id = 100
where   department_id in (60,80,100)
order by department_id asc;
