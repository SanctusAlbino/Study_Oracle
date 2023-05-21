-- ��������3-2


1. ��� ���̺��� �̸�(first_name)�� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̸� ��ȸ�Ѵ�
select first_name, length(first_name) AS name_length
from    employees
where   first_name like A%;
-- LENGTH (char) : �̸�����
-- like ������
-- % : ��������
-- _: �ϳ��� ����
-- _ ��ü�� �ν�, \_  ESCAPE '\'


2. 80�� �μ����� �̸��� �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, �޿��� 15�� ����, ���ʿ� $ ��ȣ�� ä���� ���·� ǥ���Ѵ�)
-- 

SELECT  first_name, lpad(salary, 15, '$') as salary, '$' || salary as salary2
from    employees
where   department_id = 80;



3. 60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ�� ��ȸ�Ѵ�
(��, ������ȣ�� Local Number��� ǥ���ϰ�, ������ȣ 515.124.4169���� 515�� ������ȣ�̴�)
-- SUBSTR (char, position [, length])
-- INSTR (char, from_string, to_string [,_th])

select employee_id, first_name, phone_number,substr(phone_number,1, 3) as "local number", department_id
from    employees
--where   department_id = 60
--or      department_id = 80
--or      department_id = 100
where   department_id in (60,80,100)
order by department_id asc;
