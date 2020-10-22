Select 
prestamo.id,
prestamo.usuario_id,
prestamo_detalle.libro_id, 
prestamo.fecha_devolucion,
prestamo_detalle.fecha_devuelto,
nullif (prestamo.fecha_devolucion, prestamo_detalle.fecha_devuelto),
coalesce (mora, 0) as mora
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id
where prestamo_detalle.devuelto = true;