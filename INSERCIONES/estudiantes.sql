-- tabla estudiantes

create table estudiantes(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key (cedula)
);


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('1234567890', 'Juan', 'Perez', 'juan.perez@example.com', '2000-01-01');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('2345678901', 'Maria', 'Gomez', 'maria.gomez@example.com', '2001-02-02');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('3456789012', 'Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', '2002-03-03');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('4567890123', 'Ana', 'Martinez', 'ana.martinez@example.com', '2003-04-04');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('5678901234', 'Pedro', 'Gonzalez', 'pedro.gonzalez@example.com', '2004-05-05');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('6789012345', 'Carmen', 'Lopez', 'carmen.lopez@example.com', '2005-06-06');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('7890123456', 'Jose', 'Hernandez', 'jose.hernandez@example.com', '2006-07-07');


INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento)
VALUES ('8901234567', 'Teresa', 'Torres', 'teresa.torres@example.com', '2007-08-08');

select *  from estudiantes
