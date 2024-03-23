/*
1.-Relación muchos a muchos entre usuarios y grupo: 
Crear una tabla usuarios(No confundir con la tabla realizada anteriormente llamada “usuario” )

*/

create table usuarios(
	id int, 
	nombre varchar (25) NOT NULL,
	apellido varchar (25) NOT NULL,
	fecha_nacimiento DATE,
	constraint usuarios_pk primary key(id)
);

/*
Crear la tabla grupo con los atributos: 
	id int llave primaria,
	nombre varchar (25) NOT NULL,
	descripcion varchar (75),
	fecha_creacion DATE. 
*/

create table grupo(
	id int ,
	nombre varchar (25) NOT NULL,
	descripcion varchar (75),
	fecha_creacion DATE,
	constraint grupo_pk primary key (id)
);

/*
Cree la tabla de unión usuario_grupo donde se almacene la información del usuario y 
la información del grupo: us_id int not null(llave foránea referencia de usuarios)int,
gr_id int not null (llave foránea referencia de grupo). Crear la llave compuesta usando 
el id de usarios y de grupo
*/

create table usuario_grupo(
	us_id int not null,
	gr_id int not null,
		constraint usuario_fk foreign key(us_id) references usuarios(id),
		constraint grupo_fk foreign key(gr_id) references grupo(id)
);

/*
2.-Relacion muchos a muchos entre habitaciones y huéspedes 
Crear la tabla habitaciones con los siguientes atributos: 
*/

create table habitaciones (
	habitacion_numero int ,
	precio_por_noche decimal(10,2) NOT NULL,
	piso int NOT NULL ,
	max_personas int,
	constraint habitaciones_pk primary key(habitacion_numero)
);

/*
Cree la tabla huéspedes con los siguientes atributos : 
id int llave primaria,
nombres varchar (45)NOT NULL,
apellidos varchar (45) NOT NULL,
telefono char (10),
correo varchar (45),
direccon varchar (45),
ciudad varchar (45),
pais varchar (45) 
*/

create table huespedes (
	id int ,
	nombres varchar (45)NOT NULL,
	apellidos varchar (45) NOT NULL,
	telefono char (10),
	correo varchar (45),
	direccon varchar (45),
	ciudad varchar (45),
	pais varchar (45),
	constraint huespedes_pk primary key(id)
);

/*
Cree la tabla de unión reservas con los atributos: 
inicio_fecha,
fin_fecha y 
la información de las habitaciones y 
los huéspedes :
habitacion int not null llave foránea ,
huesped_id int not null llave foránea. 
Crear la llave compuesta usando la habitación y el id de huésped.

*/

create table reservas (
	inicio_fecha date not null,
	fin_fecha date not null,
	habitacion int not null,
	huesped_id int not null,
		constraint habitacion_fk foreign key(habitacion) references habitaciones(habitacion_numero),
		constraint huesped_fk foreign key(huesped_id) references huespedes(id)
);


/*
3.-Relación muchos a muchos entre municipio y proyecto
Cree la tabla ciudad con los siguientes atributos: 
id int llave primaria,
nombre varchar (45) NOT NULL 
Cree la tabla municpio 
id int llave primaria,
nombre varchar (45) ,
ciudad_id int llave foranea. 
*/

create table ciudad (
	id int ,
	nombre varchar (45) NOT NULL ,
		constraint ciudad_pf primary key(id)
);

/*
Cree la tabla municpio 
*/

create table municipio (
	id int ,
	nombre varchar (45) ,
	ciudad_id int,
	constraint municipio_pf primary key(id),
	constraint ciudad_fk foreign key(ciudad_id) references ciudad(id)
);


/*
Cree la tabla proyecto 
id int llave primaria,
proyecto varchar (50)NOT NULL,
monto money NOT NULL, 
fecha_inicio date,
fecha_entrega date 
*/

create table proyecto (
	id int ,
	proyecto varchar (50)NOT NULL,
	monto money NOT NULL, 
	fecha_inicio date,
	fecha_entrega date,
	constraint proyecto_pk primary key(id)
);

/*
Cree la tabla de unión proyecto_municpio que almacene la información del proyecto y 
del municipio 
municipio_id int not null llave foránea , 
(proyecto_id int not null )llave foránea 
Crear la llave compuesta usando el id del proyecto y el id del municpio
*/

create table proyecto_municipio(
	proyecto_id int not null,
	municipio_id int not null, 
	constraint municipio_fk foreign key(municipio_id) references municipio(id),
	constraint proyecto_fk foreign key(proyecto_id) references proyecto(id)
);



/*
Instrucciones para las consultas SQL: 
Relación muchos a muchos entre usuarios y grupo:
Consulta: - Debes seleccionar los nombres de los usuarios y los nombres de los grupos. 
- Utiliza las tablas "usuarios", "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "usuarios" y "usuario_grupo" utilizando la condición 
"usuarios.id = usuario_grupo.us_id". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" 
utilizando la condición "grupo.id = usuario_grupo.gr_id". 
*/

select u.nombre,g.nombre from usuarios u, grupo g ,usuario_grupo ug
where ug.gr_id=g.id and ug.us_id=u.id;

/*
Subconsulta: 
- Debes seleccionar el nombre de los usuarios. 
- Utiliza la tabla "usuarios". 
- Utiliza una subconsulta para obtener los "us_id" de la tabla "usuario_grupo" donde "gr_id" sea igual a 1.
- Utiliza la condición "id IN (SELECT ***** FROM ****** WHERE ******* = 1)". 
*/

select u.nombre from usuarios u where u.id IN (select us_id from usuario_grupo where gr_id=1);
/*
Función de agregación:
- Debes seleccionar el nombre del grupo y contar la cantidad de "us_id" en la tabla "usuario_grupo". 
- Utiliza las tablas "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" utilizando la condición "grupo.id = usuario_grupo.gr_id". 
- Utiliza la función de agregación "COUNT(usuario_grupo.us_id)" para contar la cantidad de usuarios en cada grupo. 
- Utiliza la cláusula "GROUP BY grupo.nombre" para agrupar los resultados por el nombre del grupo.
*/

select g.nombre as grupo, count(ug.us_id) as cantidad_usuarios from grupo g , usuario_grupo ug where  ug.gr_id=g.id group by (g.nombre);

/*
Consulta 2 :
- Debes seleccionar los nombres de los usuarios y los nombres de los grupos. 
- Utiliza las tablas "usuarios", "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "usuarios" y "usuario_grupo" utilizando la condición "usuarios.id = usuario_grupo.us_id". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" utilizando la condición "grupo.id = usuario_grupo.gr_id". 
- Utiliza la condición "grupo.nombre LIKE '%intensivo%'" para filtrar los grupos que contengan la palabra "intensivo" en su nombre. 
*/
select u.nombre as nombre_usuario,g.nombre as nombre_grupo from usuarios u, grupo g ,usuario_grupo ug
where ug.gr_id=g.id and ug.us_id=u.id and g.nombre LIKE '%intensivo%';

/*
Subconsulta 2 : 
- Debes seleccionar el nombre de los usuarios. 
- Utiliza la tabla "usuarios". 
- Utiliza una subconsulta para obtener los "us_id" de la tabla "usuario_grupo" donde "gr_id" sea igual a 2.
- Utiliza la condición "id IN (SELECT **** FROM ********* WHERE ****** = 2)".
*/

select u.nombre from usuarios u where u.id IN (select us_id from usuario_grupo where gr_id=2);

/*
Función de agregación 2 : 
- Debes seleccionar el nombre del grupo y obtener el máximo valor de "us_id" en la tabla "usuario_grupo". 
- Utiliza las tablas "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" utilizando la condición "grupo.id = usuario_grupo.gr_id". 
- Utiliza la función de agregación "MAX(usuario_grupo.us_id)" para obtener el máximo valor de usuarios en cada grupo y también realizalo con la función de agregación MIN. 
- Utiliza la cláusula "GROUP BY grupo.nombre" para agrupar los resultados por el nombre del grupo.

*/

select g.nombre as grupo, max(ug.us_id) as máximo_valor, min(ug.us_id) as minimo_valor from grupo g , usuario_grupo ug where  ug.gr_id=g.id group by (g.nombre);



/*
Consulta 3 : 
- Debes seleccionar los nombres de los usuarios y las fechas de creación de los grupos. 
- Utiliza las tablas "usuarios", "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "usuarios" y "usuario_grupo" utilizando la condición "usuarios.id = usuario_grupo.us_id". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" utilizando la condición "grupo.id = usuario_grupo.gr_id". 
- Utiliza la condición "grupo.fecha_creacion entre '2020-03-08' y '2022-03-08'" para filtrar los grupos creados entre esas fechas. 
*/

select u.nombre,g.fecha_creacion from usuarios u, grupo g ,usuario_grupo ug
where ug.gr_id=g.id and ug.us_id=u.id and g.fecha_creacion between '2020-03-08'::date and '2022-03-08'::date;
/*
Subconsultas 3 : 
- Debes seleccionar el nombre de los usuarios. 
- Utiliza la tabla "usuarios". 
- Utiliza una subconsulta para obtener los "us_id" de la tabla "usuario_grupo" donde "gr_id" sea igual a 3.
- Utiliza la condición "id IN (SELECT ****** FROM ******** WHERE ******** = 3)". 
*/
select u.nombre from usuarios u where u.id IN (select us_id from usuario_grupo where gr_id=3);
/*
Función de agregación 3: 
- Debes seleccionar la descripción del grupo y contar la cantidad de "us_id" en la tabla "usuario_grupo". 
- Utiliza las tablas "grupo" y "usuario_grupo". 
- Realiza una unión entre las tablas "grupo" y "usuario_grupo" utilizando la condición "grupo.id = usuario_grupo.gr_id". 
- Utiliza la función de agregación "COUNT(usuario_grupo.us_id)" para contar la cantidad de usuarios en cada grupo. 
- Utiliza la condición "grupo.descripcion LIKE '%matutino%'" para filtrar los grupos que contengan la palabra "matutino" en su descripción. 
- Utiliza la cláusula "GROUP BY grupo.descripcion" para agrupar los resultados por la descripción del grupo.
*/

select g.descripcion as descripcion_grupo, count(ug.us_id) as cantidad_usuarios 
from grupo g , usuario_grupo ug 
where  ug.gr_id=g.id and g.descripcion LIKE '%matutino%' group by (g.descripcion);



/*
Relación muchos a muchos entre habitaciones y huéspedes: 
Consulta: 
- Debes seleccionar el número de habitación, los nombres y apellidos de los huéspedes. 
- Utiliza las tablas "habitaciones", "huespedes" y "reservas". 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Realiza una unión entre las tablas "huespedes" y "reservas" utilizando la condición "huespedes.id = reservas.huesped_id". 
*/
select ha.habitacion_numero, hu.nombres, hu.apellidos from habitaciones ha, huespedes hu, reservas r where ha.habitacion_numero = r.habitacion and hu.id = r.huesped_id;

/*
Subconsulta: 
- Debes seleccionar los nombres y apellidos de los huéspedes.
- Utiliza la tabla "huespedes". 
- Utiliza una subconsulta para obtener los "huesped_id" de la tabla "reservas" donde "habitacion" sea igual a 2.
- Utiliza la condición "id IN (SELECT huesped_id FROM reservas WHERE habitacion = 2)".
*/
select h.nombres,h.apellidos from huespedes h where h.id IN (SELECT huesped_id FROM reservas WHERE habitacion = 2);
/*
Función de agregación: 
- Debes seleccionar el número de habitación y contar la cantidad de "huesped_id" en la tabla "reservas". 
- Utiliza las tablas "habitaciones" y "reservas". 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Utiliza la función de agregación "COUNT(reservas.huesped_id)" para contar la cantidad de huéspedes en cada habitación. 
- Utiliza la cláusula "GROUP BY habitaciones.habitacion_numero" para agrupar los resultados por el número de habitación.
*/

select h.habitacion_numero,count(r.huesped_id) as cantidad_huespedes from habitaciones h, reservas r where h.habitacion_numero = r.habitacion GROUP BY (h.habitacion_numero);

/*
Consulta 2: 
- Debes seleccionar el número de habitación, el piso, los nombres y apellidos de los huéspedes. 
- Utiliza las tablas "habitaciones", "huespedes" y "reservas". 
- Utiliza la condición "habitaciones.piso = 4" para filtrar las habitaciones que estén en el piso 4. 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Realiza una unión entre las tablas "huespedes" y "reservas" utilizando la condición "huespedes.id = reservas.huesped_id". 
*/
select ha.habitacion_numero,ha.piso, hu.nombres, hu.apellidos
from habitaciones ha, huespedes hu, reservas r 
where ha.habitacion_numero = r.habitacion and hu.id = r.huesped_id
and ha.piso = 4;

/*
Subconsulta 2: 
- Debes seleccionar los nombres y apellidos de los huéspedes. 
- Utiliza la tabla "huespedes". 
- Utiliza una subconsulta para obtener los "huesped_id" de la tabla "reservas" donde "habitacion" sea igual a 3. 
- Utiliza la condición "id IN (SELECT huesped_id FROM reservas WHERE habitacion = 3)". 
*/

select h.nombres,h.apellidos from huespedes h where h.id IN (SELECT huesped_id FROM reservas WHERE habitacion = 3);
/*
Función de agregación 2: 
- Debes seleccionar el número de habitación y obtener el promedio de "huesped_id" en la tabla "reservas". 
- Utiliza las tablas "habitaciones" y "reservas". 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Utiliza la función de agregación "AVG(reservas.huesped_id)" para obtener el promedio de huéspedes en cada habitación. 
- Utiliza la cláusula "GROUP BY habitaciones.habitacion_numero" para agrupar los resultados por el número de habitación.
*/
select h.habitacion_numero,round(avg(r.huesped_id),2) as promedio_huespedes from habitaciones h, reservas r where h.habitacion_numero = r.habitacion GROUP BY h.habitacion_numero;


/*
Consulta 3:
- Debes seleccionar el número de habitación, los nombres y apellidos de los huéspedes. 
- Utiliza las tablas "habitaciones", "huespedes" y "reservas". 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Realiza una unión entre las tablas "huespedes" y "reservas" utilizando la condición "huespedes.id = reservas.huesped_id". 
*/
select ha.habitacion_numero, hu.nombres, hu.apellidos
from habitaciones ha, huespedes hu, reservas r 
where ha.habitacion_numero = r.habitacion and hu.id = r.huesped_id;

/*
Subconsulta 3: 
- Debes seleccionar los nombres y apellidos de los huéspedes. 
- Utiliza la tabla "huespedes". 
- Utiliza una subconsulta para obtener los "huesped_id" de la tabla "reservas" donde "habitacion" sea igual a 4. 
- Utiliza la condición "id IN (SELECT huesped_id FROM reservas WHERE habitacion = 4)". 
*/
select nombres,apellidos from huespedes where id IN (SELECT huesped_id FROM reservas WHERE habitacion = 4);
/*
Función de agregación 3: 
- Debes seleccionar el número de habitación y obtener la suma de "precio_por_noche" en la tabla "habitaciones". 
- Utiliza las tablas "habitaciones" y "reservas". 
- Realiza una unión entre las tablas "habitaciones" y "reservas" utilizando la condición "habitaciones.habitacion_numero = reservas.habitacion". 
- Utiliza la función de agregación "SUM(habitaciones.precio_por_noche)" para obtener el total recaudado por habitación. 
- Utiliza la cláusula "GROUP BY habitaciones.habitacion_numero" para agrupar los resultados por el número de habitación.
*/

select h.habitacion_numero, sum(h.precio_por_noche) from habitaciones h,reservas r where h.habitacion_numero = r.habitacion  GROUP BY h.habitacion_numero;

/*
Relación muchos a muchos entre municipio y proyectos: 
Consulta: 
- Debes seleccionar el nombre del municipio y el nombre del proyecto. 
- Utiliza las tablas "municipio", "proyecto" y "proyecto_municipio". 
- Realiza una unión entre las tablas "municipio" y "proyecto_municipio" utilizando la condición "municipio.id = proyecto_municipio.municipio_id". 
- Realiza una unión entre las tablas "proyecto" y "proyecto_municipio" utilizando la condición "proyecto.id = proyecto_municipio.proyecto_id". 
*/
select m.nombre as nombre_municipio, pr.proyecto as nombre_proyecto from municipio m, proyecto pr,proyecto_municipio pm where m.id = pm.municipio_id and pr.id = pm.proyecto_id;
/*
Subconsulta: 
- Debes seleccionar el nombre del proyecto. 
- Utiliza la tabla "proyecto". 
- Utiliza una subconsulta para obtener los "proyecto_id" de la tabla "proyecto_municipio" donde "municipio_id" sea igual a 1. 
- Utiliza la condición "id IN (SELECT ******* FROM ****** WHERE ***** = 1)". 
*/
select pr.proyecto as nombre_proyecto from proyecto pr where pr.id IN (SELECT proyecto_id FROM proyecto_municipio  WHERE municipio_id = 1);
/*
Función de agregación: 
- Debes seleccionar el nombre del municipio y contar la cantidad de "proyecto_id" en la tabla "proyecto_municipio". 
- Utiliza las tablas "municipio" y "proyecto_municipio".
- Realiza una unión entre las tablas "municipio" y "proyecto_municipio" utilizando la condición "municipio.id = proyecto_municipio.municipio_id". 
- Utiliza la función de agregación "COUNT(proyecto_municipio.proyecto_id)" para contar la cantidad de proyectos en cada municipio. 
- Utiliza la cláusula "GROUP BY municipio.nombre" para agrupar los resultados por el nombre del municipio.
*/

select m.nombre,COUNT(pm.proyecto_id) as cantidad_proyecto from municipio m,proyecto_municipio pm where m.id = pm.municipio_id GROUP BY m.nombre ;


/*
Consulta 2: 
- Debes seleccionar el nombre del municipio y el nombre del proyecto. 
- Utiliza las tablas "municipio", "proyecto" y "proyecto_municipio". 
- Realiza una unión entre las tablas "municipio" y "proyecto_municipio" utilizando la condición "municipio.id = proyecto_municipio.municipio_id".
-Realiza una unión entre las tablas "proyecto" y "proyecto_municipio" utilizando la condición "proyecto.id = proyecto_municipio.proyecto_id". 
-Utiliza la condición "municipio.nombre LIKE '%GAD%'" para filtrar los municipios que contengan la palabra "GAD" en su nombre. 
*/
select m.nombre as nombre_municipio, p.proyecto as nombre_proyecto 
from municipio m, proyecto p,proyecto_municipio pm
where m.id=pm.municipio_id and p.id=pm.proyecto_id and m.nombre LIKE '%GAD%';
/*
Función de agregación 2: 
-Debes seleccionar el nombre del municipio y obtener el mínimo valor de "proyecto_id" en la tabla "proyecto_municipio". 
-Utiliza las tablas "municipio" y "proyecto_municipio". 
-Realiza una unión entre las tablas "municipio" y "proyecto_municipio" utilizando la condición "municipio.id = proyecto_municipio.municipio_id". 
-Utiliza la función de agregación "MIN(proyecto_municipio.proyecto_id)" para obtener el valor mínimo de proyectos en cada municipio.
-Utiliza la cláusula "GROUP BY municipio.nombre" para agrupar los resultados por el nombre del municipio.
*/

select m.nombre as nombre_municipio,min(pm.proyecto_id) as minimo_valor from municipio m, proyecto_municipio pm where m.id = pm.municipio_id GROUP BY m.nombre;


/*
Consulta 3 : 
Selecciona el nombre del municipio y el nombre de la ciudad. 
Se realiza una unión entre las tablas "municipio" y "ciudad" utilizando la condición adecuada. 
*/
select m.nombre as nombre_municipio, c.nombre as nombre_ciudad from municipio m,ciudad c where m.ciudad_id=c.id;
/*
Subconsulta 3: 
Selecciona el proyecto de la tabla "proyecto" donde el id está presente en la subconsulta que obtiene los proyecto_id de la tabla "proyecto_municipio" donde el municipio_id es igual a 3. 
*/
select *from proyecto where id IN (select proyecto_id from proyecto_municipio where municipio_id=3);
/*
Función de agregación 3: 
Selecciona el nombre del municipio y se obtiene el valor máximo de proyecto_id en la tabla "proyecto_municipio".
Se realiza una unión entre las tablas "municipio" y "proyecto_municipio" y se agrupa por el nombre del municipio.
*/

select m.nombre, max(pm.proyecto_id) from municipio m, proyecto_municipio pm where m.id=pm.municipio_id group by (m.nombre);