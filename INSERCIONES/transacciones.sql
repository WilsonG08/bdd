-- tabla transacciones

create table transacciones(
	codigo int not null,
	numero_cuenta char(5) not null,
	monto money not null,
	tipo char(1) not null,
	fecha date not null,
	hora time not null,
	constraint transacciones_pk primary key (codigo)
)


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (1, '12345', 100.00, 'C', '2024-02-01', '08:34');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (2, '23456', 200.00, 'D', '2024-02-02', '09:23');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (3, '34567', 300.00, 'C', '2024-02-03', '10:13');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (4, '45678', 400.00, 'D', '2024-02-04', '11:34');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (5, '56789', 500.00, 'C', '2024-02-05', '12:23');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (6, '67890', 600.00, 'D', '2024-02-06', '13:54');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (7, '78901', 700.00, 'C', '2024-02-07', '14:21');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (8, '89012', 800.00, 'D', '2024-02-08', '15:12');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (9, '90123', 900.00, 'C', '2024-02-09', '16:12');


INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) 
VALUES (10, '01234', 1000.00, 'D', '2024-02-10', '17:11');


select * from transacciones
