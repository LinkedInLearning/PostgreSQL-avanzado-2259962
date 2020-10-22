Select xmlconcat (detalle, '<biblioteca>Central</biblioteca>') from comentario where id =1;

Select xmlparse(CONTENT detalle::text) from comentario;
Select xmlparse(DOCUMENT detalle::text) from comentario;

SELECT xmlroot(xmlparse(document detalle::text), version '1.0', standalone yes) from comentario;

select xmlagg (detalle order by id desc) from comentario;

Select detalle is document from comentario;

Select xml_is_well_formed(detalle::text) from comentario;

select xpath('//usuario/email', detalle) from comentario;

select xpath_exists('//usuario/email', detalle) from comentario;