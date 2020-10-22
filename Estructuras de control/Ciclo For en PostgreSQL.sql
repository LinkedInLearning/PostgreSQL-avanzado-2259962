CREATE OR REPLACE PROCEDURE public.factorial(numero integer default 1, INOUT factorial numeric DEFAULT 1)
LANGUAGE plpgsql
AS $$
BEGIN
	for contador IN 1..numero
		loop
			factorial := factorial * contador;
		end loop;

END;
$$;

CALL factorial(4);
