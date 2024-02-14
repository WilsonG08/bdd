-- tabla cuentas

create table cuentas(
	numero_cuenta char(5) not null,
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key (numero_cuenta)
)


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00001', '12345', '2021-01-01', 10500.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo) 
VALUES ('00002', '23456', '2023-02-15', 15000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00003', '34567', '2020-03-30', 12000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo) 
VALUES ('00004', '45678', '2022-04-20', 8000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00005', '56789', '2023-05-25', 9500.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo) 
VALUES ('00006', '67890', '2022-06-10', 7000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00007', '78901', '2021-07-15', 11000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo) 
VALUES ('00008', '89012', '2021-08-30', 13000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00009', '90123', '2023-09-20', 10000.00);


INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00010', '01234', '2021-10-05', 9000.00);

select * from cuentas
