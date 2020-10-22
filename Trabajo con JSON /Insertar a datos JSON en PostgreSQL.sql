CREATE TABLE public.orden
(
    id serial NOT NULL,
    informacion jsonb NOT NULL,
    PRIMARY KEY (id)
);

insert into orden (informacion) values ('{"nombre":"Nancy Monge","telefono":"(123) 4254-2345","email":"nancymonge@test.com","libros":[{"titulo":"Cocina oriental","autor":"Luis Ruiz"},{"titulo":"Datos orientales más recientes","autor":"Juan Herrera"}]}');