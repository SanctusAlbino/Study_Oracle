[��������6-2]

1. �μ���ġ�ڵ尡 1700�� �ش��ϴ� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� ��������
������ ���������� �ۼ��Ѵ�.
-- ����� ������ �� ==> IN, ANY(=SOME), ALL �̷���~~

--1.1 �������� ���� ��ȸ
select department_id, department_name
from departments
where location_id = 1700;
--1.2 ���������� ��ȸ
select  employee_id, first_name, department_id, job_id
from    employees
where   department_id in (select department_id
                         from departments
                         where location_id = 1700);

--���� �޿��� ���� �޴� : max(salary)==> ���� �� �Լ� ==> ���� �� �������� Ư¡!!
2. �μ����� ���� �޿��� ���� �޴� ����� ���, �̸�, �μ���ȣ, �޿�, �����ڵ带 ��ȸ�ϴ� ��������
���� �÷� ���������� ����Ͽ� �ۼ��Ѵ�.
-- �÷��� ����, �����Ͱ� ��ġ�ϴ� ���� �÷�/���� ��

select  employee_id, first_name, department_id, salary, job_id
from    employees
where   (department_id,salary) =any (select department_id, max(salary)
                                        from    employees
                                        group by department_id);
