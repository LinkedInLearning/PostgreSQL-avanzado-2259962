begin;
lock table autor in access exclusive mode;
insert into autor (nombre, apellido) values ('Oscar', 'Mora');
select * from autor order by id;
commit;