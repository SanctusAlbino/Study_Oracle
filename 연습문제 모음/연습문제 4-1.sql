[연습문제 4-1]
1. 사원테이블에서 이 회사의 매니저들을 조회하기!

select distinct manager_id 
from employees
where manager_id is not null; --18명 대표자 1명