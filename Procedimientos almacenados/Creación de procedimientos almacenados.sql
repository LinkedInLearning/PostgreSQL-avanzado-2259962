CREATE PROCEDURE public.actualizar_email_usuario(usuario_id integer, nuevo_email character varying)
    LANGUAGE sql
    AS $$ 
	update usuario set email = nuevo_email where id = usuario_id;
$$;