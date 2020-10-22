Select 
	prestamo_id,
	libro_id,
	ejemplares,
	mora
from prestamo_detalle
where mora > (
	Select avg(mora)
	from prestamo_detalle
);