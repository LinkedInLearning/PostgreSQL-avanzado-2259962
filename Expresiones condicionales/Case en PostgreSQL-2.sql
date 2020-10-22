Select 
prestamo.id,
prestamo.usuario_id,
prestamo_detalle.libro_id,
DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) as dias_morosidad,
case 
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) <= 50 THEN 'Morosidad Baja'
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) <= 120 THEN 'Morosidad Media'
	when DATE_PART('day', now()::timestamp - prestamo.fecha_devolucion::timestamp) > 120 THEN 'Morosidad Alta'
end nivel_morosidad
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
where prestamo_detalle.devuelto = false;