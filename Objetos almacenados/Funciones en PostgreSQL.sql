create or replace function total_usuarios()
returns integer
language plpgsql
AS $$
DECLARE 
	total integer := 0;
begin
	select count(*) into total from usuario;
	return total;
end;
$$;

Select total_usuarios();

create or replace function informacion_usuario(id_usuario integer default 1)
returns table (nombre varchar, apellido varchar, email varchar, telefono varchar)
language plpgsql
AS $$ 
begin
	return query
	Select usuario.nombre, usuario.apellido, usuario.email, usuario.telefono
	from usuario
	where usuario.id = id_usuario;
end;
$$;

Select * from informacion_usuario(2);