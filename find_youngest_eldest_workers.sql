-- Завдання №6 - знайти найстаршого та наймолодшого працівника
-- find_youngest_eldest_workers.sql

select t.type, w.name, w.birthday
from worker w
	inner join (
				select 'YOUNGEST'[type], max(birthday)[birthday] from worker
				union
				select 'ELDEST'[type], min(birthday)[birthday] from worker
				)t on t.birthday = w.birthday
