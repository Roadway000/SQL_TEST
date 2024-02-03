-- Завдання №1 - спроєктувати БД
-- init_db.sql
create table worker(id bigint auto_increment not null primary key
	, name varchar not null check(length(name)>2 and length(name)<1000)
	, birthday DATETIME check(birthday>1900)
	, level varchar not null check(level IN ('Trainee','Junior','Middle','Senior'))
	, salary int not null default 100 check(salary>99 and salary<100000)
)
--create sequence seq_worker start 1

create table client(id bigint auto_increment not null primary key
	, name varchar not null check(length(name)>2 and length(name)<1000)
)
--create sequence seq_client start 1

create table project(id bigint auto_increment not null primary key
	, client_id bigint
	, start_date datetime
	, finish_date datetime
)
--create sequence seq_project start 1

create table project_worker(project_id bigint not null
	, worker_id bigint not null
	, foreign key (project_id) references project(id)
	, foreign key (worker_id) references worker(id)
	, primary key(project_id, worker_id)
)