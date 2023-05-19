-- drop table users;
-- drop table emails_sent;
-- drop table emails_clicks;
-- drop table countries;
-- drop table users_sessions;

create table users (id integer, email varchar(100), id_country integer, date_reg datetime);
insert into users (id, email, id_country, date_reg) values (1, 'albert@gmail.com', 1, '2017-02-27 10:58:05');
insert into users (id, email, id_country, date_reg) values (2, 'albert@gmail.com', 2, '2017-03-03 10:58:05');
insert into users (id, email, id_country, date_reg) values (3, 'albert@gmail.com', 1, '2017-03-03 10:58:05');
insert into users (id, email, id_country, date_reg) values (4, 'albert@gmail.com', 2, '2017-03-03 10:58:05');
insert into users (id, email, id_country, date_reg) values (5, 'albert@gmail.com', 3, '2017-03-07 10:58:05');

create table emails_sent (id integer, id_user integer, id_type varchar(100), date_sent datetime);
insert into emails_sent (id, id_user, id_type, date_sent) values (1, 1, 'promo', '2022-10-29 10:58:05');
insert into emails_sent (id, id_user, id_type, date_sent) values (2, 2, 'promo', '2022-10-30 10:58:05');
insert into emails_sent (id, id_user, id_type, date_sent) values (3, 3, 'security', '2022-10-31 10:58:05');
insert into emails_sent (id, id_user, id_type, date_sent) values (4, 4, 'security', '2022-10-31 10:58:05');
insert into emails_sent (id, id_user, id_type, date_sent) values (5, 5, 'digest', '2022-10-01 10:58:05');

create table emails_clicks (id integer, id_email integer, date_click datetime);
insert into emails_clicks (id, id_email, date_click) values (1, 1, '2022-10-29 11:22:05');
insert into emails_clicks (id, id_email, date_click) values (2, 2, '2022-10-30 10:59:05');
insert into emails_clicks (id, id_email, date_click) values (3, 3, '2022-10-31 10:59:05');
insert into emails_clicks (id, id_email, date_click) values (4, 4, '2022-10-31 11:01:05');
insert into emails_clicks (id, id_email, date_click) values (5, 5, '2022-10-02 10:58:05');

create table countries (id integer, name varchar(100), country_group varchar(100));
insert into countries (id, name, country_group) values (1, 'Ukraine', 'EMEA');
insert into countries (id, name, country_group) values (2, 'Poland', 'EU');
insert into countries (id, name, country_group) values (3, 'US', 'North America');

create table users_sessions (id integer, id_user integer, action varchar(100), date_action datetime);
insert into users_sessions (id, id_user, action, date_action) values (1, 1, 'open', '2023-05-15 10:58:05');
insert into users_sessions (id, id_user, action, date_action) values (2, 1, 'open', '2023-05-17 13:27:05');
insert into users_sessions (id, id_user, action, date_action) values (3, 1, 'close', '2023-05-15 12:22:05');
insert into users_sessions (id, id_user, action, date_action) values (4, 1, 'close', '2023-05-17 13:29:05');
insert into users_sessions (id, id_user, action, date_action) values (5, 2, 'open', '2023-05-15 09:15:05');
insert into users_sessions (id, id_user, action, date_action) values (6, 2, 'close', '2023-05-15 09:25:05');
insert into users_sessions (id, id_user, action, date_action) values (7, 2, 'open', '2023-05-18 11:25:05');
insert into users_sessions (id, id_user, action, date_action) values (8, 2, 'close', '2023-05-18 12:55:05');
