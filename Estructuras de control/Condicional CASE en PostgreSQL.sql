CREATE OR REPLACE PROCEDURE public.pago_morosidad(id_prestamo integer default 1, INOUT monto numeric DEFAULT 0)
LANGUAGE plpgsql
AS $$
BEGIN
   	Select
	DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) as dias_morosidad
	from prestamo
	left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
	where prestamo_detalle.devuelto = false and prestamo.id = id_prestamo
	group by prestamo.id
	into monto;
	
	case 
	when monto <= 50 then monto := monto * 2;
	when monto <= 100 then monto := monto * 2.5;
	when monto <= 200 then monto := monto * 3;
	when monto > 200 then monto := monto * 4;
	else monto := 0;
	end case;
END;
$$;