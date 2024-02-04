-- Завдання №5 - знайти проєкт з найбільшою тривалістю
-- find_longest_project.sql
select 'Project ' || ROW_NUMBER() OVER (ORDER BY Month_count desc)||' '|| name [name]
	, p.Month_count[month_count]
from (
	select c.name, p.id, p.client_id, --DATEDIFF(month,finish_date,start_date)[Month_count]
		cast((strftime('%m',  finish_date) + 12*strftime('%Y', finish_date)) -
		(strftime('%m',  start_date) + 12*strftime('%Y', start_date)) as integer) [Month_count]
	from project p
		left join client c on c.id=p.client_id
	)p
where Month_count in (
	select	max(cast((strftime('%m',  finish_date) + 12*strftime('%Y', finish_date)) -
		(strftime('%m',  start_date) + 12*strftime('%Y', start_date)) as integer)) [Month_count]
	from project
	);
