CREATE OR REPLACE FUNCTION eliminar_libro_clasico()
  RETURNS TRIGGER 
  LANGUAGE plpgsql  
  AS
$$
BEGIN
 delete from libro_clasico where libro_id = old.id;
 return old;
END;
$$;


create trigger eliminar_libro_clasico_trigger before delete on libro
for each row execute procedure eliminar_libro_clasico();