[��������6-1]

1. �޿��� ���� ����

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND SALARY =(SELECT MIN(SALARY)FROM EMPLOYEES);

2. �μ��� MARKETING�� �μ��� ���� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� ������ �ۼ��Ѵ�.
SELECT  DEPARTMENT_ID
FROM    DEPARTMENTS
WHERE   DEPARTMENT_NAME LIKE 'Marketing';



SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, JOB_ID
from employees 
where department_id =(SELECT department_id FROM departments WHERE department_name = 'Marketing');

3.ȸ���� ���庸�� �� ���� �Ի��� ������� ���, �̸�, �Ի����� ��ȸ�ϴ� �������� �ۼ�

select  hire_date
from    employees
where   manager_id is null;

select  employee_id, first_name, hire_date
from    employees
where   hire_date < (select hire_date from employees where manager_id is null)
order by 3;