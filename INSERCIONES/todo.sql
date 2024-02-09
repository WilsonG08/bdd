-- TABLA PERSONAS

DROP TABLE personas;

create table personas (
	cedula char (10) not null,
	nombre varchar(50) not null,
	apellido varchar (50) not null,
	estatura decimal,
	fecha_nacimiento date,
	hora_nacimiento time, 
	cantidad_ahorrada money,
	numero_hijos int,
	constraint personas_pk primary key (cedula)
)

insert into personas(cedula, nombre, apellido)
values('1718688284', 'Wilson', 'Guayanay');


insert into personas(cedula, nombre, apellido, estatura)
values('123456789', 'Giss', 'Muzo', 1.55);


insert into personas(cedula, nombre, apellido, estatura, numero_hijos)
values('9876543213','Maria', 'Jose', 1.60, 2);




insert into personas(cedula, nombre, apellido, estatura, numero_hijos, fecha_nacimiento, hora_nacimiento,  cantidad_ahorrada)
values('1212121212','Ismael', 'Boada', 1.65, 1, '22/05/2000', '22:54', 200.34);

select * from personas



--- FECHAS
select * from personas
where fecha_nacimiento > '10/06/1995'

-- INGRESO DE MAS FECHAS
insert into personas(cedula, nombre, apellido, fecha_nacimiento)
values('1313131313', 'Jefferson', 'Farfan', '10/06/1995');


insert into personas(cedula, nombre, apellido, fecha_nacimiento)
values('1414141414', 'Jefferso', 'Farfa', '11/06/1995');



--- FECHAS CON BETWEEN
select * from personas
where fecha_nacimiento
between '12/06/1995' and '22/05/2000'


-- HORA
select * from personas
where hora_nacimiento = '22:54'

insert into personas(cedula, nombre, apellido, hora_nacimiento)
values('1515151515', 'Jeffers', 'Farf', '22:54:10');



insert into personas(cedula, nombre, apellido, hora_nacimiento)
values('1616161616', 'Karla', 'Mera', '10:05:10');


select * from personas
where hora_nacimiento
between '10:00' and '22:54'




---------------
-- ES PARA CUALQUIER LADO
select * from personas
where nombre like '%a'


-- PRIMERO LETRA A
select * from personas
where apellido like 'M%'


--- CEDULAS
select * from personas
where cedula like '17%'


select * from personas
where cedula like '12%'


-----------
-- PARA VER LO NULL 
select  * from personas where hora_nacimiento is null
