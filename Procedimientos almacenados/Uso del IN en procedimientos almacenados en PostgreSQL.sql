create or replace procedure ingresar_libro(IN titulo_libro Character varying, in fecha_publicacion_libro date, isbn_libro integer)
language SQL
as $$
	insert into libro(titulo, fecha_publicacion, isbn) values (titulo_libro,fecha_publicacion_libro,isbn_libro);
$$;

call ingresar_libro('Cocina Italina', '2019-03-05', 45678);