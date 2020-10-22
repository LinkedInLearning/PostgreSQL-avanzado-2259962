insert into orden (informacion) values ('{"nombre":"Juan Rojas","telefono":"(123) 3444-5667","email":"juanrojas@test.com","libros":[{"titulo":"Creación de aviones","autor":"Alina Castaño"}]}');
insert into orden (informacion) values ('{"nombre":"Luis Vargas","telefono":"(123) 2345-7540","email":"luisvargas@test.com","libros":[{"titulo":"Cocina oriental","autor":"Jose Carlos Castello"}]}');


Select informacion from orden;
Select informacion->>'nombre' from orden;
select informacion->'libros' from orden;
select informacion->'libros'->0 from orden;
select informacion->'libros'->0->>'titulo' from orden;

