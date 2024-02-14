-- tabla registros_entrada

create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint registros_entrada_pk primary key (codigo_registro)
)


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (1, '1234567890', '2024-02-01', '08:00:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (2, '2345678901', '2024-02-02', '08:30:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (3, '3456789012', '2024-02-03', '08:15:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (4, '4567890123', '2024-02-04', '08:45:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (5, '5678901234', '2024-02-05', '08:10:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (6, '6789012345', '2024-02-06', '08:20:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (7, '7890123456', '2024-02-07', '08:35:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (8, '8901234567', '2024-02-08', '08:40:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (9, '9012345678', '2024-02-09', '08:05:00');


INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (10, '0123456789', '2024-02-10', '08:50:00');
