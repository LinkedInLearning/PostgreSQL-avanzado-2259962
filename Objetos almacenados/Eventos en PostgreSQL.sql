CREATE TABLE autoria_logs(
  fecha TIMESTAMP,
  evento TEXT
);

CREATE OR REPLACE FUNCTION logs_eventos()
RETURNS event_trigger
LANGUAGE plpgsql
AS 
$$
begin
    INSERT INTO autoria_logs(fecha,evento) VALUES(NOW(),TG_TAG);
end;
$$;

create event trigger event_trigger_logs on DDL_COMMAND_START
execute procedure logs_eventos();


Create table editorial(
	id serial not null,
	nombre character varying (40) not null,
	primary key (id)
);