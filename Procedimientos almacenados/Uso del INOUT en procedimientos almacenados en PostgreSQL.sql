create or replace procedure buscar_libro_titulo(INOUT _valor text default null)
language plpgsql as
$$ 
 begin
 	select titulo from libro where titulo like _valor into _valor;
 end
$$;

call buscar_libro_titulo('%el%');