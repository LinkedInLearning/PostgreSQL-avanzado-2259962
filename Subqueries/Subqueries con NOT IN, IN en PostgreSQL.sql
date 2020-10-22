Select *
from libro 
where 
	id IN (
		Select prestamo_detalle.libro_id as id
		from prestamo 
		left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
		where fecha_salida > '2020-03-01'
	)
order by id;