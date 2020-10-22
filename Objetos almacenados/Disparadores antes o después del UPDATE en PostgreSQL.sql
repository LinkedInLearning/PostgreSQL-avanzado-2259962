CREATE OR REPLACE FUNCTION actualizar_email_usuario()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
  AS
$$
DECLARE
	valido varchar;
BEGIN
	select new.email like '%_@_%.__%' into valido;
	
	if valido = 'true' then
		return new;
	end if;
	return old;

END;
$$;

create trigger actualizar_email_usuario_trigger before update on usuario
for each row execute procedure actualizar_email_usuario();

update usuario set email = 'test@test.com' where id = 1;

CREATE OR REPLACE FUNCTION actualizar_libro_clasico()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
  AS
$$
BEGIN
	update libro_clasico
	set titulo = new.titulo,
	fecha_publicacion = new.fecha_publicacion
	where libro_id = old.id;
	return new;
END;
$$;

create trigger actualizar_libro_clasico_trigger after update on libro
for each row execute procedure actualizar_libro_clasico();

update libro set titulo = 'Comienza un nuevo libro hoy' where id = 18;

