Select * 
from usuario 
where Exists (
	Select 1
	from prestamo
	left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
	where prestamo_detalle.devuelto = false
	and usuario.id = prestamo.usuario_id
);