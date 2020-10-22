Select 
prestamo.id,
prestamo.usuario_id, 
prestamo_detalle.libro_id, 
greatest(prestamo.fecha_devolucion, prestamo_detalle.fecha_devuelto)
from prestamo
left join prestamo_detalle on prestamo.id = prestamo_detalle.prestamo_id;

Select nombre, apellido, LEAST(nombre, apellido) as order_nombre
from usuario
order by order_nombre;