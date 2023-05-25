--[�������� 10-2]

--1. �̸��� ������ ���� �迪���� ��� ������ ��ȸ
select *
from characters
where email is null;

select *
from roles;

select *
from characters
where role_id = (select role_id
                    from roles
                    where role_name = '�ý�');
--3. ���Ǽҵ� 4�� �⿬�� ������ ���� �̸��� ��ȸ
-- star_wars : ��ȭ���� (���Ǽҵ� ���̵�, ���Ǽҵ��, ��������)
-- chararcters : �����ι����� (���̵�, �̸�, ������id, ����id,�̸���)
-- casting : �����ι��� ������� (���Ǽҵ� ���̵� ĳ���� ���̵� �����̸�)
INSERT INTO casting
VALUES (4, 1, '��ũ �ع�');
INSERT INTO casting
VALUES (4, 2, '�ظ��� ����');
INSERT INTO casting
VALUES (4, 3, 'ĳ�� �Ǽ�');

INSERT INTO casting
VALUES (5, 4, '�ٸ� ��Ͻ�');
INSERT INTO casting
VALUES (5, 5, '���̺�� ���ν�');
INSERT INTO casting
VALUES (5, 6, '���ӽ� �� ����');

INSERT INTO casting
VALUES (6, 7, '�ؼ��� ��Ͼ�');
INSERT INTO casting
VALUES (6, 8, '�ɴ� ����Ŀ');
INSERT INTO casting
VALUES (6, 9, '���� ������');

INSERT INTO casting
VALUES (1, 10, '���� �� ��������');
INSERT INTO casting
VALUES (1, 11, '����ũ ����');
INSERT INTO casting
VALUES (1, 12, '�̴� �ƴ��̵�');

INSERT INTO casting
VALUES (2, 13, '���̵� ũ�����ٽ�');
INSERT INTO casting
VALUES (2, 14, '���� �Ͻ�');
INSERT INTO casting
VALUES (2, 15, '��Ż�� ��Ʈ��');

INSERT INTO casting
VALUES (3, 16, '�丣�Ҷ� ���Ž�Ʈ');
INSERT INTO casting
VALUES (3, 17, '�Ƹ޵� ����Ʈ');
INSERT INTO casting
VALUES (3, 18, '���� ��ũ');

INSERT INTO casting
VALUES (3, 19, '�׹¶� �𸮽�');
INSERT INTO casting
VALUES (3, 20, '���¾� L. �轼');
INSERT INTO casting
VALUES (3, 21, 'ũ�������� ��');

select real_name
from casting
where episode_id = 4;

--4. ���Ǽҵ�5�� �⿬�� ������ �迪�̸��� �����̸�
-- �迪 �̸�: character_name
--���� �̸� : real_name
-- join ���� : �ٸ� ���̺��� �÷��� ������ ��ġ �ϳ��� ���̺��ΰ�ó�� �����͸� ��ȸ(����)
--set���� : �÷�����, ������ Ÿ�Ը� ������ ��ġ �ϳ��� ���̺��� ������ ��ȸ�� ��� (����)

select  ch.character_name, 
        c.real_name
from    characters ch, casting c
where   ch.character_id = c.character_id and c.episode_id = 5;

--5.����ǥ�� ���ι�
--ANSI join : INNER JOIN, OUTER JOIN
--on�� where ������ ���
--USING : �÷��� ��Ī/��� ��� x
--(+) : ����Ŭ �ƿ��� ���� <--> left right full outer join
select c.character_name, p.real_name, r.role_name
from    characters c inner JOIN casting p
on c.character_id = p.character_id
left outer join roles r
on c.role_id = r.role_id
and p.episode_id=2;

--���Ǽҵ� 2�� �⿬�� 3���� �迪�� : �������� : �����̸� �� ���;��Ѵ�.
--characters �����Ϳ� casting �����Ͱ� ����ġ: ���� ���� vs ���� ������ ����/����

--6. ���� �Լ��� �̿��� characters ���̺��� �迪�̸�, �̸���, �̸��� ���̵� ��ȸ�Ͻÿ�
select character_name, email,substr(email, 1, instr(email, '@') -1) 
from characters;

--7. 
-- �������� :SELECT ���� ��ȣ => ��Į�� �������� : �÷�ó�� ���
-- NULL ó�� �Լ� : NVL(), NVL2()
-- COALESCE(): �ּ� �ϳ��� NULL �� �ƴϾ�� �ϴ� ���� NULL�ƴ� �� ��ȯ �Լ�
select c.character_name, NVL(m.character_name, '������ ���� ������') as masters
from characters c, roles r, characters m
where c.role_id = r.role_id
and r.role_name='������'
and c.master_id = m.character_id(+)
order by 1;

-- 7. ������ �����̿� �ش��ϴ� �迪���� �迪�̸�, ���� ������
-- �������� : SELECT ���� ��ȣ ==> ��Į�� �������� : �÷�ó�� ��� ==> ���� ��
-- NULL ó�� �Լ� : NVL(exp1, exp2), NVL2(exp1,exp2,exp3)
-- COALESCE() : �ּ� �ϳ��� NULL �ƴϾ�� �ϴ� .. ���� NULL�ƴ� �� ��ȯ �Լ�
SELECT  m.character_name AS master_name
FROM    characters c, characters m
WHERE   c.master_id = m.character_id; -- �������� : ĳ����/������ ���̺� ����

-- ��Į�� �������� : ���� �� ��ȯ (�÷�ó��) : x
-- NULL ó�� �Լ� :   O   
SELECT  c.character_name, NVL(m.character_name, '������ ���� ������') AS master_name
FROM    characters c, roles r, characters m
WHERE   c.role_id = r.role_id
AND     r.role_name = '������'
AND     NVL(c.master_id, 0) = m.character_id(+)   -- master_id�� NULL�� ������ �ִµ�, ���������� ȥ����..;
ORDER BY 1;

SELECT *
FROM    characters;


-- 8.������ ������ ==> ����� �̸����� ������ �������� �̸����� ������ �������� �̸����� ��ȸ (EMAILS)
SELECT  c.character_name, 
        NVL(c.email, NULL) AS JEDAI_EMAIL,
        NVL(m.email, NULL) AS MASTER_EMAIL
FROM    characters c, roles r, characters m
WHERE   c.role_id = r.role_id
AND     r.role_name = '������'
AND     NVL(c.master_id, 0) = m.character_id(+)   -- master_id�� NULL�� ������ �ִµ�, ���������� ȥ����..;
ORDER BY 1;
        
        
-- 9. ��Ÿ���� �ø�� �⿬�� ����� ��
-- ���Ǽҵ� �̸�, �⿬��� ���� �������� ��
SELECT  s.episode_name, COUNT(*) AS cnt
FROM    star_wars s, casting c
WHERE   s.episode_id = c.episode_id
GROUP BY    episode_name, open_year
ORDER BY    open_year;


-- 10. ��Ÿ���� ��ü �ø���� �� ��캰 �迪�̸�, �����̸�, �⿬Ƚ���� ��ȸ
-- �⿬Ƚ���� ���� �迪�̸�, �����̸� ������ ��ȸ

SELECT  ch.character_name, ca.real_name, COUNT(*) AS times
FROM    characters ch, casting ca
WHERE   ch.character_id = ca.character_id
GROUP BY  ch.character_name, ca.real_name;

-- ������ CASTING �����Ͱ� ��� �� �ø�� 3�� ==> 21���� �⿬ (���� �����Ϳ� ���̹߻� ����)
-- �����δ� ���� ��찡 �ø��� 1~3�� �̸������ �⿬�ϰų� ��Ҹ��� �⿬�� ��ʰ� ����


-- 11. �� �������� ������ ���� 3���� �迪��, �Ǹ�, �⿬Ƚ��
-- �ζ��� �� �������� Ȱ�� �ϰų� : WHERE ROWNUM <= 5;
-- ������������ ORDER BY ���� ���� Ư���� ��찡 �ƴ϶��  ������� �ʴ´�.
SELECT e.*
FROM    (   SELECT  ch.character_name, ca.real_name, COUNT(*) AS times
            FROM    characters ch, casting ca
            WHERE   ch.character_id = ca.character_id
            GROUP BY  ch.character_name, ca.real_name ) e    --  ORDER BY 1
WHERE ROWNUM <= 3;

-- ������ CASTING �����Ͱ� ��� �� �ø�� 3�� ==> 21���� �⿬ (���� �����Ϳ� ���̹߻� ����)
-- ���� ��ŷ�� �ޱ�� �Լ� : AVERAGE_RANK()�� 21c������ ���x
SELECT  ch.character_name, ca.real_name, COUNT(*) AS times,
        RANK() OVER (ORDER BY COUNT(*) ASC) AS RANK,
        DENSE_RANK() OVER (ORDER BY COUNT(*) ASC) AS DENSE_RANK
FROM    characters ch, casting ca
WHERE   ch.character_id = ca.character_id
GROUP BY  ch.character_name, ca.real_name; 



-- 12. ��Ÿ���� �ø�� � �ø�� ����� ��찡 �⿬�ߴ��� ��ȸ
-- ���Ǽҵ� ��ȣ, �̸�, �⿬��� �� ��ȸ, �⿬������ ���� ������ ��ȸ

SELECT  s.episode_id, s.episode_name, COUNT(*) AS cnt
FROM    star_wars s, casting c
WHERE   s.episode_id = c.episode_id
GROUP BY    s.episode_id, s.episode_name
ORDER BY 3 DESC;

-- ���� ��Ÿ���� ��ȭ������ ��ġ�ϴ����� �������� �˼� �ְ�, ������ CASTING ���̺� �����Ϳ� ����
-- �ٸ� �� ����.

COMMIT;