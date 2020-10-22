With libro_presados as (	
	Select 
		libro_id,
		sum(ejemplares) as total_prestados
	from prestamo_detalle
	group by libro_id
)
Select 
	libro.id,
	libro.titulo,
	libro_presados.total_prestados
from libro
left join libro_presados on libro.id = libro_presados.libro_id;