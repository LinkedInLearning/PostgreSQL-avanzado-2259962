CREATE TABLE public.comentario
(
    id serial NOT NULL,
    detalle xml NOT NULL,
    PRIMARY KEY (id)
);

insert into comentario(detalle) values ('<?xml version="1.0"?>
<comentario>
	<libro>Creacion de aviones modernos</libro>
	<comentario>Excelente libro</comentario>
	<usuario>
		<nombre>Tanmay</nombre>
		<apellido>Patil</apellido>
		<email>tanmaypatil@test.com</email>
	</usuario>
</comentario>');