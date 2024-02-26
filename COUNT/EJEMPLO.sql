-- Elimina las tablas si existen
DROP TABLE IF EXISTS personas;
DROP TABLE IF EXISTS estado_civil;

-- Crea la tabla estado_civil
CREATE TABLE estado_civil (
	codigo CHAR(1) NOT NULL,
	descripcion VARCHAR(20) NOT NULL,
	CONSTRAINT estado_civil_pk PRIMARY KEY(codigo)
);

-- Inserta datos en la tabla estado_civil
INSERT INTO estado_civil(codigo, descripcion) VALUES('U', 'UNION LIBRE');
INSERT INTO estado_civil(codigo, descripcion) VALUES('C', 'CASADO');
INSERT INTO estado_civil(codigo, descripcion) VALUES('S', 'SOLTERO');

-- Crea la tabla personas
CREATE TABLE personas (
	cedula CHAR(10) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	estatura DECIMAL,
	fecha_nacimiento DATE,
	hora_nacimiento TIME, 
	cantidad_ahorrada DECIMAL,
	numero_hijos INT,
	estado_civil_codigo CHAR(1) NOT NULL,
	CONSTRAINT personas_pk PRIMARY KEY (cedula),
	CONSTRAINT personas_estado_civil_fk FOREIGN KEY(estado_civil_codigo) REFERENCES estado_civil(codigo)
);

-- Inserta datos en la tabla personas
INSERT INTO personas(cedula, nombre, apellido, estado_civil_codigo) VALUES('1718688284', 'Wilson', 'Guayanay', 'U');
INSERT INTO personas(cedula, nombre, apellido, estatura, estado_civil_codigo) VALUES('123456789', 'Giss', 'Muzo', 1.55, 'C');
INSERT INTO personas(cedula, nombre, apellido, estatura, numero_hijos, estado_civil_codigo) VALUES('9876543213','Maria', 'Jose', 1.60, 2 ,'S');
INSERT INTO personas(cedula, nombre, apellido, estatura, numero_hijos, fecha_nacimiento, hora_nacimiento,  cantidad_ahorrada, estado_civil_codigo) VALUES('1212121212','Ismael', 'Boada', 1.65, 1, '2000-05-22', '22:54', 200.34, 'C');

-- Consulta para verificar los datos
SELECT * FROM personas;


-- Mostrar la información de las personas con su estado civil
SELECT p.*, ec.descripcion AS estado_civil
FROM personas p
JOIN estado_civil ec ON p.estado_civil_codigo = ec.codigo;


SELECT COUNT(ec.codigo)
FROM personas per, estado_civil ec
WHERE per.estado_civil_codigo = ec.codigo
AND estado_civil_codigo = 'C';

-- AVG - PROMEDIO
SELECT * FROM PERSONAS

SELECT AVG(estatura) FROM PERSONAS
SELECT AVG(cantidad_ahorrada as numeric) 
FROM PERSONAS


SELECT AVG(cast(cantidad_ahorrada as numeric))
from personas per, estado_civil ec
where per.estado_civil_codigo = ec.codigo
and estado_civil_codigo = 'C'

-- MAX 
SELECT MAX(cast(cantidad_ahorrada as numeric)) 
FROM PERSONAS

-- MIN
SELECT MIN(cast(cantidad_ahorrada as numeric)) 
FROM PERSONAS

-- SUM
SELECT SUM(cast(cantidad_ahorrada as numeric)) 
FROM PERSONAS

-- GROUP BY
SELECT estado_civil_codigo, COUNT(*) FROM PERSONAS
GROUP BY estado_civil_codigo


SELECT estado_civil_codigo, SUM(numero_hijos) FROM PERSONAS
GROUP BY estado_civil_codigo


select * from personas












