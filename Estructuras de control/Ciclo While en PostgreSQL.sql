CREATE OR REPLACE PROCEDURE public.sumatoria(numero integer default 1, INOUT suma numeric DEFAULT 0)
LANGUAGE plpgsql
AS $$
DECLARE
	contador integer := 1;
BEGIN
	while contador <= numero 
	loop
		suma := suma + contador;
		contador := contador + 1;
	end loop;
END;
$$;


Call sumatoria(4);