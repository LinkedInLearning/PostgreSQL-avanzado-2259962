Create or replace procedure maximo_valor(inout _valor integer default null, variadic arr numeric[] default null)
language plpgsql as
$$
	begin
		select max($2[i]) from generate_subscripts($2,1) g(i) into _valor;
	end
$$;

call maximo_valor(0, variadic array[10,-2,5,8,9]);