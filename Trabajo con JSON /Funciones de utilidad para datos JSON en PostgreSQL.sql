Select * from json_each((Select to_json(informacion) from orden where id = 1));
Select * from jsonb_each((Select informacion from orden where id = 1));
Select * from jsonb_each_text((Select informacion from orden where id = 1));

Select jsonb_extract_path(informacion, 'libros') from orden;
Select jsonb_extract_path_text(informacion, 'libros') from orden;

select jsonb_array_length(informacion->'libros') from orden;