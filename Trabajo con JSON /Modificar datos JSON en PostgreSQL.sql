Update orden
set informacion = jsonb_set (informacion, '{nombre}', '"Nancy Monge Rojas"')
where id = 1;

update orden
set informacion = jsonb_set (informacion, '{direccion}', '"Alajuela, Costa Rica"')
where id = 3;

Update orden
set informacion = jsonb_set (informacion, '{libros, 0, titulo}', '"Creación de aviones modernos"')
where id = 2;