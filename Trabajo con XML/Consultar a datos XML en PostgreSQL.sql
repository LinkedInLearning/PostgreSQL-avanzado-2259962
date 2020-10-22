insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Descubre el maravilloso mundo de las flores</libro>
    <comentario>Muy interesante</comentario>
    <usuario>
        <nombre>Manuel</nombre>
        <apellido>Walsh</apellido>
        <email>manuelwalsh@test.com</email>
    </usuario>
</comentario>');


insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>georgeweissnat@test.com</email>
    </usuario>
</comentario>');

Select detalle from comentario;
Select unnest(xpath('//usuario', detalle)) AS usuario from comentario where id = 3;

Select unnest(xpath('//usuario/nombre', detalle)) AS nombre from comentario where id = 3;

Select unnest(xpath('//libro', detalle)) AS libro from comentario where id = 3;