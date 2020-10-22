
CREATE OR REPLACE PROCEDURE public.actualizar_usuario(
	usuario_id integer,
	nuevo_email character varying,
	nuevo_telefono character varying)
LANGUAGE 'sql'
AS $BODY$
update usuario 
	set email = nuevo_email,
	telefono = nuevo_telefono
	where id = usuario_id;
$BODY$;

call actualizar_usuario(1, 'nuevoemail@test.com', '(123) 1234-1234');