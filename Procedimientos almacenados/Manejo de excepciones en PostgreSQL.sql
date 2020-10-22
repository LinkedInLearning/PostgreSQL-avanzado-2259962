CREATE OR REPLACE PROCEDURE public.ingresar_libro_id(
	id_libro integer,
	titulo_libro character varying,
	fecha_publicacion_libro date,
	isbn_libro integer)
LANGUAGE plpgsql
AS $$
BEGIN
    insert into libro(id, titulo, fecha_publicacion, isbn) 
	VALUES (id_libro, titulo_libro, fecha_publicacion_libro, isbn_libro);
	EXCEPTION
		when sqlstate '23505' then
			raise exception 'Libro con el ID: % existe', id_libro;
END;
$$;

call ingresar_libro_id(1, 'Desarrollo Profesional', '2017-04-20', 98765);
