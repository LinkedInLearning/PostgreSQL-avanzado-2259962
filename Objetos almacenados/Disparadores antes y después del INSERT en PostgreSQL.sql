create or replace function before_insertar_autor()
	returns trigger
	language plpgsql 
as $$
begin
	new.nombre := concat(upper(substring(new.nombre, 1, 1)), substring(new.nombre,2));
	new.apellido := concat(upper(substring(new.apellido, 1, 1)), substring(new.apellido,2));
	return new;
end;
$$;

create trigger insertar_autor_trigger before insert on autor
for each row execute procedure before_insertar_autor();

insert into autor(nombre, apellido) values ('juan', 'rojas');

create or replace function insertar_libro_clasico()
returns trigger
language plpgsql
as
$$
begin
	if new.fecha_publicacion < '1970-01-01' then
		insert into libro_clasico(libro_id, titulo, fecha_publicacion)
		values (new.id, new.titulo, new.fecha_publicacion);
	end if;
	return new;
end;
$$;

create trigger insertar_libro_clasico_trigger after insert on libro
for each row execute procedure insertar_libro_clasico();

insert into libro(titulo, fecha_publicacion, isbn) values ('Comienza un nuevo libro', '1960-03-20', 34213);





