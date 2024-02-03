-- Завдання №4 - знайти клієнта з найбільшою кількістю проєктів
-- find_max_projects_client.sql

select c.name, max(project_count)[max_project_count]
from (
	select client_id, count(1)[project_count] from project group by client_id order by 2 desc
	) cp
	inner join client c on c.id=cp.client_id