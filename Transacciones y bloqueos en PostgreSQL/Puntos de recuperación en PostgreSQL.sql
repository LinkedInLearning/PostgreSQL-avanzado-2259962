begin;
delete from usuario where id = 20;
savepoint eliminar_usuario;
	delete from usuario where id = 21;
	select * from usuario order by id;
rollback to savepoint eliminar_usuario;

select * from usuario order by id;