-- CUENTAS

DROP TABLE cuentas;
DROP TABLE usuario;


-- CREACION DE LA TABLA USUARIO
CREATE TABLE usuario(
	cedula_usuario char(10) PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25) NOT NULL,
	tipo_cuenta VARCHAR(20),
	limite_credito decimal(10,2)
);

-- CREACION DE LA TABLA CUENTAS
CREATE TABLE cuentas(
	numero_cuenta char(5) NOT NULL,
	cedula_propietario char(10) NOT NULL,
	fecha_creacion date NOT NULL,
	saldo money NOT NULL,
	CONSTRAINT cuentas_pk PRIMARY KEY (numero_cuenta)
);

-- Agregamos una clave foránea a la tabla 'cuentas' que hace referencia a usuario
ALTER TABLE cuentas
ADD CONSTRAINT cedula_usuario_fk
FOREIGN KEY (cedula_propietario)
REFERENCES usuario (cedula_usuario);

-- Insertando valores a la tabla usuario
INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES('1234567890', 'Wilson','Guayanay');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES('1718688284', 'Leonel','Messi');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('2345678901', 'Cristiano','Ronaldo');


INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES  ('4567890123', 'Neymar','Junior');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('5678901234', 'Kylian','Mbappe');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('6789012345', 'Mohamed','Salah');


INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('7890123456', 'Sadio','Mane');


INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('8901234567', 'Kevin','De Bruyne');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES  ('9012345678', 'Virgil','Van Dijk');

INSERT INTO usuario (cedula_usuario, nombre, apellido)
VALUES ('8765438291', 'Kendry','Paez');




-- Insertando valores a la tabla cuentas
INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES ('00001', '1234567890', '2021-01-01', 10500.00),
 	   ('00002', '1718688284', '2021-02-02', 11000.00),
       ('00003', '2345678901', '2021-03-03', 11500.00),
       ('00004', '8765438291', '2021-04-04', 12000.00),
       ('00005', '4567890123', '2021-05-05', 12500.00),
       ('00006', '5678901234', '2021-06-06', 13000.00),
       ('00007', '6789012345', '2021-07-07', 13500.00),
       ('00008', '7890123456', '2021-08-08', 14000.00),
       ('00009', '8901234567', '2021-09-09', 14500.00),
       ('00010', '9012345678', '2021-10-10', 15000.00);


SELECT * FROM cuentas;
SELECT * FROM usuario;

