-- Завдання №7 - вивести вартість кожного проєкту
-- print_project_prices.sql
-- Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.

select 'Project ' || T.id [name], Month_count * summa [price]
from (
	select p.id, p.start_date, p.finish_date
		, cast((strftime('%m',  finish_date) + 12 * strftime('%Y', finish_date)) -
			   (strftime('%m',  start_date)  + 12 * strftime('%Y', start_date)) as integer) [Month_count]
		, IFNULL(pws.summa,0) [summa]
	from project p
		left join (
			select pw.project_id, sum(w.salary)[summa]
			from project_worker pw
				left join worker w on w.id=pw.worker_id
			group by pw.project_id
		) pws on pws.project_id = p.id
	)T
order by 2 desc;
