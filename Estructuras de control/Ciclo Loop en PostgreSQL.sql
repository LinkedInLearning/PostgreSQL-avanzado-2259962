CREATE OR REPLACE PROCEDURE public.potencia(num1 integer default 1, num2 integer default 1, INOUT resultado numeric DEFAULT 1)
LANGUAGE plpgsql
AS $$
DECLARE 
	contador integer := 0;
BEGIN
	loop 
		if contador = num2 then
			exit;
		end if;
		contador := contador + 1;
		resultado := resultado * num1;
	end loop;
END;
$$;

call potencia (1,1);