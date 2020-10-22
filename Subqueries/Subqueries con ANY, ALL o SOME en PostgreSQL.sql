Select *
from libro
where id = SOME (
	Select libro_id as id 
	from prestamo_detalle
	group by libro_id
	having sum(ejemplares) > 20
);

select
	prestamo.id,
	prestamo.usuario_id,
	usuario.nombre,
	usuario.apellido,
	avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp)) as promedio_dias_morosidad
from prestamo
left join usuario on usuario.id = prestamo.usuario_id
group by prestamo.id,usuario.nombre,usuario.apellido
having avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp)) > all (
	select avg(date_part('day', now()::timestamp - prestamo.fecha_devolucion::timestamp))
	from prestamo
	left join prestamo_detalle on prestamo_detalle.prestamo_id = prestamo.id
	where prestamo_detalle.devuelto = false
	group by usuario_id
);