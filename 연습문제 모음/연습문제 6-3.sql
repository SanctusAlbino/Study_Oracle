[��������6-3]

1. �� �μ��� ���� �μ��ڵ�, �μ���, �μ��� ��ġ�� �����̸��� ��ȸ�ϴ� �������� ��Į�� ���������� �ۼ��Ѵ�.

select  department_id, department_name,
        (select city
         from locations l
         where l.location_id = d.location_id) as city_name
from    departments d;