--find_max_salary_worker.sql
--Завдання №3 - знайти працівника з найбільшою заробітною платою
select name, salary
from worker
where salary in (select max(salary) from worker)
order by salary desc;
