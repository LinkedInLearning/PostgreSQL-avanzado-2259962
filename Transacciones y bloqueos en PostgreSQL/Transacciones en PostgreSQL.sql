begin;
update libro set fecha_publicacion = '1967-06-05' where id = 3;
update libro_clasico set fecha_publicacion = '1967-06-05' where libro_id = 3;
commit;

select * from libro where id = 3;