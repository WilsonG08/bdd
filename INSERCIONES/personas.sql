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
values('1718688284', 'Wilson', 'Guayanay')


insert into personas(cedula, nombre, apellido, estatura)
values('123456789', 'Giss', 'Muzo', 1.55)

insert into personas(cedula, nombre, apellido, estatura, numero_hijos)
values('9876543213','Maria', 'Jose', 1.60, 2)



insert into personas(cedula, nombre, apellido, estatura, numero_hijos, fecha_nacimiento, hora_nacimiento,  cantidad_ahorrada)
values('1212121212','Ismael', 'Boada', 1.65, 1, '22/05/2000', '22:54', 200.34)

select * from personas