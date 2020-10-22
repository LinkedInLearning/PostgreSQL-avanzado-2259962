CREATE OR REPLACE PROCEDURE public.suma_array(elementos numeric[], INOUT suma numeric DEFAULT 0) 
LANGUAGE plpgsql
AS $$
DECLARE
	elemento integer := 0;
BEGIN
	foreach elemento in ARRAY $1
	loop 
		suma := suma + elemento;
	end loop;
END;
$$;

call suma_array(ARRAY[1,2,3,4]);