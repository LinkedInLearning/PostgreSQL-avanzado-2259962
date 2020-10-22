CREATE TABLE usuario
(
   id serial NOT NULL,
   nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
   apellido character varying(50) COLLATE pg_catalog."default" NOT NULL,
   telefono character varying(20) COLLATE pg_catalog."default" NOT NULL,
   email character varying(50) COLLATE pg_catalog."default" NOT NULL,
   direccion text COLLATE pg_catalog."default",
   CONSTRAINT usuario_pkey PRIMARY KEY (id)
);

CREATE TABLE prestamo
(
   id serial  NOT NULL,
   usuario_id integer NOT NULL,
   fecha_salida date NOT NULL,
   fecha_devolucion date NOT NULL,
   CONSTRAINT prestamo_pkey PRIMARY KEY (id),
   CONSTRAINT "FK_PRESTAMO_USUARIO" FOREIGN KEY (usuario_id)
       REFERENCES usuario (id) MATCH SIMPLE
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

CREATE TABLE autor (
  id serial NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellido VARCHAR(40) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE public.libro
(
    id serial NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    fecha_publicacion date,
    isbn integer,
    CONSTRAINT libro_pkey PRIMARY KEY (id)
);



CREATE TABLE public.libro_autor
(
    autor_id integer NOT NULL,
    libro_id integer NOT NULL,
    CONSTRAINT libro_autor_pkey PRIMARY KEY (autor_id, libro_id),
    CONSTRAINT "FK_AUTOR" FOREIGN KEY (autor_id)
        REFERENCES public.autor (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_LIBRO" FOREIGN KEY (libro_id)
        REFERENCES public.libro (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE public.prestamo_detalle
(
    prestamo_id integer NOT NULL,
    libro_id integer NOT NULL,
    ejemplares integer NOT NULL,
    devuelto boolean DEFAULT true,
    fecha_devuelto date,
    mora numeric(8,2),
    CONSTRAINT prestamo_detalle_pkey PRIMARY KEY (prestamo_id, libro_id),
    CONSTRAINT "FK_PD_LIBRO" FOREIGN KEY (libro_id)
        REFERENCES public.libro (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "FK_PD_PRESTAMO" FOREIGN KEY (prestamo_id)
        REFERENCES public.prestamo (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


INSERT INTO autor(nombre, apellido) VALUES ('Katlynn', 'Katlynn');
INSERT INTO autor(nombre, apellido) VALUES ('Juanita', 'Lind');
INSERT INTO autor(nombre, apellido) VALUES ('Estrella', 'Reichel');
INSERT INTO autor(nombre, apellido) VALUES ('Marc', 'Emard');
INSERT INTO autor(nombre, apellido) VALUES ('Isidora', 'Valls');
INSERT INTO autor(nombre, apellido) VALUES ('Hugo', 'Cazorla');
INSERT INTO autor(nombre, apellido) VALUES ('Dionisio', 'Valencia');
INSERT INTO autor(nombre, apellido) VALUES ('Didac', 'Mejias');
INSERT INTO autor(nombre, apellido) VALUES ('Sandra', 'Zurita');
INSERT INTO autor(nombre, apellido) VALUES ('Anselmo', 'Gonzalez');
INSERT INTO autor(nombre, apellido) VALUES ('Ronny', 'Delgado');
INSERT INTO autor(nombre, apellido) VALUES ('Nancy', 'Monge');
INSERT INTO autor(nombre, apellido) VALUES ('Hortensia', 'Prieto');
INSERT INTO autor(nombre, apellido) VALUES ('Soraya', 'Calvo');
INSERT INTO autor(nombre, apellido) VALUES ('Heider', 'Chavarria');

INSERT INTO libro(titulo, "fecha_publicacion", isbn) VALUES ('Dragón Europeo', '2004-06-03', 20214);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Contemplador Matemático', '1981-09-26', 42843);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Descubre el maravilloso mundo de las flores', '1967-06-15', 81986);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Las diferentes fases de la luna', '1999-09-06', 73997);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Remedios caseros', '1965-08-23', 5824);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Recetas de cocina variada', '1975-12-16', 45670);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Técnicas de costura tradicional', '2015-03-26', 22115);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Todo lo que debes saber sobre carros', '1988-04-16', 77309);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Trucos para armar tus rompecabezas', '2001-05-14', 65445);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Aprende un nuevo deporte en 21 días', '1973-11-28', 14975);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Las maravillas del mundo', '1963-10-10', 40279);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Programa tus tareas diarias', '1954-05-08', 9708);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('¿Cómo trabajar desde casa?', '2003-05-09', 32084);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Aprenda sobre PostgreSQL', '1963-06-03', 81083);
INSERT INTO libro( titulo, "fecha_publicacion", isbn) VALUES ('Fundamentos de programación', '1984-06-17', 38557);


INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (13,1);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (9,1);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (12,2);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (1,2);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (6,3);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (2,4);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (8,4);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (15,5);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (3,5);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (7,6);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (4,7);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (5,7);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (13,8);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (7,8);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (9,9);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (11,9);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (11,10);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (5,11);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (10,12);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (14,12);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (13,12);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (12,13);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (7,13);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (15,14);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (14,14);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (1,15);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (13,2);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (1,3);
INSERT INTO public.libro_autor(autor_id, libro_id) VALUES (10,4);


INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion) VALUES ('Katlynn', 'Hyatt', '(123) 6567-9242', 'katlynnhyatt@test.com', 'Montreal, Canadá');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Juanita', 'Lind', '(123) 8592-2238', 'juanitalind@test.com', 'Hannover, Alemania');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Estrella', 'Reichel', '(123) 4696-4386', 'estrellareichel@test.com', 'Melbourne, Australia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Marc', 'Emard', '(123) 4322-4462', 'marcemard@test.com', 'San José, Costa Rica');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Camren', 'Marks', '(123) 9291-7517', 'camrenmarks@test.com', 'Río de Janeiro, Brasil');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Brandi', 'Dibbert', '(123) 6851-6846', 'brandidibbert@test.com', 'Guadalajara, México');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Wallace', 'Lubowitz', '(123) 6432-2244', 'wallacelubowitz@test.com', 'San Miguelito, Panamá');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Corene', 'Ullrich', '(123) 9749-6374', 'coreneullrich@test.com', 'San Francisco, Estados Unidos');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Alexa', 'Lynch', '(123) 2314-9754', 'alexalynch@test.com', 'Cali, Colombia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Cleta', 'Gutmann', '(123) 6622-3153', 'cletagutmann@test.com', 'Cali, Colombia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Manuel', 'Walsh', '(123) 8263-6379', 'manuelwalsh@test.com', 'Guadalajara, México');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Trudie', 'Pouros', '(123) 2162-2162', 'trudiepouros@test.com', 'Bogotá, Colombia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Gladyce', 'Trantow', '(123) 8744-9396', 'gladycetrantow@test.com', 'Toronto, Canadá');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Mariam', 'Baumbach', '(123) 2383-7126', 'mariambaumbach@test.com', 'Venecia, Italia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Marilie', 'Metz', '(123) 7565-7264', 'mariliemetz@test.com', 'Sevilla, España');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Angelina', 'Sawayn', '(123) 1287-8174', 'angelinasawayn@test.com', 'Sidney, Australia');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Aiyana', 'Goldner', '(123) 8222-7892', 'aiyanagoldner@test.com', 'Kioto, Japón');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Assunta', 'Raynor', '(123) 9238-2589', 'assuntaraynor@test.com', 'Lucerna, Suiza');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Kennith', 'Blanda', '(123) 9825-2935', 'kennithblanda@test.com', 'Nueva York, Estados Unidos');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('George', 'Weissnat', '(123) 6599-8313', 'georgeweissnat@test.com', 'Berlin, Alemania');
INSERT INTO public.usuario(nombre, apellido, telefono, email, direccion)VALUES ('Terry', 'Russel', '(123) 4977-5266', 'terryrussel@test.com', 'Graz, Austria');


INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (11, '2020-02-03', '2020-07-12');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (10, '2020-02-15', '2020-06-01');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (15, '2020-02-24', '2020-04-13');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (20, '2020-02-06', '2020-04-26');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (14, '2020-02-07', '2020-06-17');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (5, '2020-03-04', '2020-08-27');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (16, '2020-02-14', '2020-04-10');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (7, '2020-03-10', '2020-07-15');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (19, '2020-02-20', '2020-06-29');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (20, '2020-01-13', '2020-09-28');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (16, '2020-02-19', '2020-06-17');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (16, '2020-01-10', '2020-10-06');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (21, '2020-02-23', '2020-09-30');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (19, '2020-02-21', '2020-08-19');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (9, '2020-01-08', '2020-07-16');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (17, '2020-01-31', '2020-06-12');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (20, '2020-02-18', '2020-04-14');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (3, '2020-02-09', '2020-10-07');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (8, '2020-02-27', '2020-05-30');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (16, '2020-01-12', '2020-05-19');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (11, '2020-03-09', '2020-06-27');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (10, '2020-01-31', '2020-08-19');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (17, '2020-02-28', '2020-09-20');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (19, '2020-02-08', '2020-07-13');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (14, '2020-02-09', '2020-05-23');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (11, '2020-02-10', '2020-09-25');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (12, '2020-02-15', '2020-08-21');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (1, '2020-02-21', '2020-06-09');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (4, '2020-02-02', '2020-08-11');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (18, '2020-01-11', '2020-09-03');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (13, '2020-01-30', '2020-09-20');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (19, '2020-01-15', '2020-04-28');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (7, '2020-02-08', '2020-05-13');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (2, '2020-03-10', '2020-04-07');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (21, '2020-01-15', '2020-04-20');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (13, '2020-01-22', '2020-09-11');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (9, '2020-02-15', '2020-04-01');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (8, '2020-01-08', '2020-09-11');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (8, '2020-02-07', '2020-09-01');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (15, '2020-02-09', '2020-07-10');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (1, '2020-02-15', '2020-06-12');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (3, '2020-01-08', '2020-10-09');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (6, '2020-02-02', '2020-04-25');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (15, '2020-03-07', '2020-10-04');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (15, '2020-02-14', '2020-09-13');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (9, '2020-01-24', '2020-04-20');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (16, '2020-03-04', '2020-08-16');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (3, '2020-02-02', '2020-07-25');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (1, '2020-01-20', '2020-04-21');
INSERT INTO public.prestamo (usuario_id, fecha_salida, fecha_devolucion) VALUES (1, '2020-02-19', '2020-07-10');



INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (1,3,1,True,'2020-07-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (1,5,2,True,'2020-07-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (1,7,3,True,'2020-07-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (1,9,3,True,'2020-07-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (1,15,2,True,'2020-07-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (2,5,3,True,'2020-06-01');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (2,9,1,True,'2020-06-01');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (3,2,1,False,368);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (3,8,1,False,368);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (3,10,3,False,368);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (3,11,2,False,368);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (3,12,3,False,368);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (4,3,1,True,'2020-04-26');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (4,6,3,True,'2020-04-26');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (4,10,3,True,'2020-04-26');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (5,13,1,True,'2020-06-17');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (6,1,2,True,'2020-08-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (6,7,2,True,'2020-08-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (6,8,3,True,'2020-08-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (6,12,2,True,'2020-08-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (6,13,3,True,'2020-08-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (7,3,2,False,374);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (7,15,2,False,374);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (8,6,3,True,'2020-07-15');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (8,7,2,True,'2020-07-15');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (9,4,1,True,'2020-06-29');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (9,12,2,True,'2020-06-29');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (10,1,2,True,'2020-09-28');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (11,6,2,True,'2020-06-17');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (11,8,2,True,'2020-06-17');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (11,13,3,True,'2020-06-17');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (12,1,3,True,'2020-10-06');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (12,2,3,True,'2020-10-06');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (13,4,1,False,28);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (13,9,2,False,28);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (14,4,3,False,112);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (14,6,3,False,112);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (14,15,3,False,112);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (15,5,3,True,'2020-07-16');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (15,6,2,True,'2020-07-16');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (16,8,3,True,'2020-06-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (16,10,3,True,'2020-06-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (16,12,3,True,'2020-06-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (17,2,2,False,366);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (17,9,2,False,366);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (17,14,2,False,366);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (17,15,2,False,366);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (18,4,3,True,'2020-10-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (19,4,3,True,'2020-05-30');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (19,5,1,True,'2020-05-30');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (19,6,3,True,'2020-05-30');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (19,10,3,True,'2020-05-30');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (20,1,1,True,'2020-05-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (20,6,3,True,'2020-05-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (21,6,3,True,'2020-06-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (21,8,3,True,'2020-06-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (21,9,2,True,'2020-06-27');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (22,8,1,True,'2020-08-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (22,10,3,True,'2020-08-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (22,14,2,True,'2020-08-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (22,15,1,True,'2020-08-19');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (23,2,1,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (24,1,2,True,'2020-07-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (25,1,2,True,'2020-05-23');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (25,6,3,True,'2020-05-23');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (25,9,3,True,'2020-05-23');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (25,14,2,True,'2020-05-23');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (25,15,1,True,'2020-05-23');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (26,6,2,False,38);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (27,5,1,False,108);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (27,8,2,True,'2020-08-21');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (28,3,3,True,'2020-06-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (28,4,3,True,'2020-06-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (28,6,2,True,'2020-06-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (28,14,2,True,'2020-06-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (29,15,3,True,'2020-08-11');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (30,1,3,True,'2020-09-03');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (30,2,1,True,'2020-09-03');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (30,14,2,True,'2020-09-03');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (31,2,2,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (31,4,2,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (31,7,3,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (31,11,2,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (31,12,2,True,'2020-09-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (32,4,2,True,'2020-04-28');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (32,14,1,True,'2020-04-28');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (33,3,3,True,'2020-05-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (33,4,2,True,'2020-05-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (33,8,3,True,'2020-05-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (33,10,1,True,'2020-05-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (34,3,2,True,'2020-04-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (34,4,2,True,'2020-04-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (34,6,2,True,'2020-04-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (34,7,1,True,'2020-04-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (34,10,2,True,'2020-04-07');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (35,13,1,False,354);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (36,14,3,True,'2020-09-11');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (37,6,2,True,'2020-04-01');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (38,5,1,True,'2020-09-11');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (38,11,1,True,'2020-09-11');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (39,4,2,True,'2020-09-01');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (40,5,2,True,'2020-07-10');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (41,3,1,True,'2020-06-12');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (42,2,2,True,'2020-10-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (42,7,2,True,'2020-10-09');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (43,7,2,True,'2020-04-25');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (44,4,3,True,'2020-10-04');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (45,3,1,True,'2020-09-13');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (46,13,3,True,'2020-04-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (46,14,3,True,'2020-04-20');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (47,6,2,True,'2020-08-16');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (48,3,2,True,'2020-07-25');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (49,8,3,True,'2020-04-21');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, mora)VALUES (49,10,1,False,352);
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (49,15,1,True,'2020-04-21');
INSERT INTO public.prestamo_detalle(prestamo_id, libro_id, ejemplares, devuelto, fecha_devuelto)VALUES (50,13,1,True,'2020-07-10');