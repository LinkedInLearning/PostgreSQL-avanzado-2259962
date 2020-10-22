-- FUNCTION: public.informacion_personal_usuario(integer)

-- DROP FUNCTION public.informacion_personal_usuario(integer);

CREATE OR REPLACE FUNCTION public.informacion_personal_usuario(
	id_usuario integer DEFAULT 1)
    RETURNS TABLE(nombre character varying, apellido character varying, email character varying, telefono character varying, direccion text) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
    
AS $BODY$
begin
	return query
	Select usuario.nombre, usuario.apellido, usuario.email, usuario.telefono, usuario.direccion
	from usuario
	where usuario.id = id_usuario;
end;
$BODY$;

ALTER FUNCTION public.informacion_personal_usuario(integer)
    OWNER TO postgres;
