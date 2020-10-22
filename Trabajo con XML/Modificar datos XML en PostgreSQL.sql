Update comentario
set detalle = xml ('<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>newemail@test.com</email>
    </usuario>
</comentario>')
where id = 3;

update comentario
set detalle = xml (replace(detalle::text, 'Tanmay', 'Tammy'))
where id = 1;

