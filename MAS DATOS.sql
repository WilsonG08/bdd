DROP TABLE productos;
DROP TABLE cuentas;
DROP TABLE estudiantes;
DROP TABLE registros_entrada;
DROP TABLE videojuegos;
DROP TABLE transacciones;
DROP TABLE usuario;
DROP TABLE clientes;
DROP TABLE compras;
DROP TABLE personas;
DROP TABLE prestamo;
DROP TABLE banco;
DROP TABLE ventas;
DROP TABLE plataformas;
DROP TABLE empleado;




CREATE TABLE usuario (
    cedula_usuario CHAR(10),
    nombre VARCHAR(25),
    apellido VARCHAR(25),
    tipo_cuenta VARCHAR(20),
    limite_credito DECIMAL(10,2),
    CONSTRAINT usuario_pk PRIMARY KEY(cedula_usuario)
);

CREATE TABLE cuentas (
    numero_cuenta VARCHAR(5) NOT NULL,
    cedula_propietario VARCHAR(5) NOT NULL,
    fecha_creacion DATE NOT NULL,
    saldo MONEY NOT NULL,
    CONSTRAINT cuentas_pk PRIMARY KEY(numero_cuenta)
);

CREATE TABLE clientes (
    cedula CHAR(10),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    CONSTRAINT clientes_pk PRIMARY KEY(cedula)
);

CREATE TABLE compras (
    id_compra INT,
    cedula CHAR(10),
    fecha_compra DATE,
    monto DECIMAL(10,2),
    CONSTRAINT compras_pk PRIMARY KEY(id_compra)
);

CREATE TABLE estudiantes (
    cedula VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    codigo_profesor INT,
    CONSTRAINT estudiantes_pk PRIMARY KEY(cedula)
);

drop table profesores

CREATE TABLE profesores (
    codigo INT,
    nombre VARCHAR(50),
    CONSTRAINT profesores_pk PRIMARY KEY(codigo)
);

CREATE TABLE personas (
    cedula CHAR(10),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    estatura DECIMAL(10,2),
    fecha_nacimiento DATE,
    hora_nacimiento TIME,
    cantidad_ahorrada MONEY,
    numero_hijos INT,
    CONSTRAINT personas_pk PRIMARY KEY(cedula)
);

CREATE TABLE prestamo (
    cedula CHAR(10),
    monto MONEY,
    fecha_prestamo DATE,
    hora_prestamo TIME,
    garante VARCHAR(40),
    CONSTRAINT prestamo_pk PRIMARY KEY(cedula),
    CONSTRAINT prestamo_fk FOREIGN KEY(cedula) REFERENCES personas(cedula)
);

CREATE TABLE productos (
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY(codigo)
);

CREATE TABLE ventas (
    id_venta INT,
    codigo_producto INT,
    fecha_venta DATE,
    cantidad INT,
    CONSTRAINT ventas_pk PRIMARY KEY(id_venta)
);

CREATE TABLE transacciones (
    codigo INT NOT NULL,
    numero_cuenta VARCHAR(5) NOT NULL,
    monto MONEY NOT NULL,
    tipo VARCHAR(1) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT transacciones_pk PRIMARY KEY(codigo)
);

CREATE TABLE banco (
    codigo_banco INT,
    codigo_transaccion INT,
    detalle VARCHAR(100),
    CONSTRAINT banco_pk PRIMARY KEY(codigo_banco),
    CONSTRAINT banco_fk FOREIGN KEY(codigo_transaccion) REFERENCES transacciones(codigo)
);

CREATE TABLE videojuegos (
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT NOT NULL,
    CONSTRAINT videojuegos_pk PRIMARY KEY(codigo)
);

CREATE TABLE plataformas (
    id_plataforma INT,
    nombre_plataforma VARCHAR(50),
    codigo_videojuego INT,
    CONSTRAINT plataformas_pk PRIMARY KEY(id_plataforma),
    CONSTRAINT plataformas_fk FOREIGN KEY(codigo_videojuego) REFERENCES videojuegos(codigo)
);

CREATE TABLE registros_entrada (
    codigo_registro INT NOT NULL,
    cedula_empleado VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    codigo_empleado INT,
    CONSTRAINT registro_entrada_pk PRIMARY KEY(codigo_registro),
    CONSTRAINT registros_fk FOREIGN KEY(codigo_empleado) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE empleado (
    codigo_empleado INT,
    nombre VARCHAR(25),
    fecha DATE,
    hora TIME,
    CONSTRAINT empleado_pk PRIMARY KEY(codigo_empleado)
);

-- INSERT INTO todas_las_tablas (campos, valores);

-- Usuario
INSERT INTO usuario (cedula_usuario, nombre, apellido, tipo_cuenta, limite_credito)
VALUES
('12345', 'Juan', 'Perez', 'Corriente', 1000.00),
('98765', 'Maria', 'Gonzalez', 'Ahorros', 2000.00),
('55555', 'Pedro', 'Lopez', 'Corriente', 1500.00),
('11111', 'Ana', 'Martinez', 'Ahorros', 3000.00),
('99999', 'Luis', 'Rodriguez', 'Corriente', 500.00);

-- Cuentas
INSERT INTO cuentas (numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES
('22111', '12345', '2024-05-20', 250.00),
('22678', '98765', '2024-02-20', 255.00);

-- Clientes
INSERT INTO clientes (cedula, nombre, apellido, edad)
VALUES
('1755014238', 'Juan', 'Lopez', 20),
('1755012222', 'Diego', 'Ramirez', 21),
('1755014211', 'Rodolfo', 'Asprilla', 21);

-- Compras
INSERT INTO compras (id_compra, cedula, fecha_compra, monto)
VALUES
(1, '1755014238', '2024-07-20', 3450.00);

-- Estudiantes
INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
VALUES
('1755014238', 'Juan', 'Lopez', 'juan@gmail.com', '2002-05-02', 1),
('1755014239', 'Maria', 'Garcia', 'maria@gmail.com', '2001-06-15', 2),
('1755014240', 'Pedro', 'Martinez', 'pedro@gmail.com', '2003-09-20', 3),
('1755014241', 'Ana', 'Rodriguez', 'ana@gmail.com', '2000-11-25', 4),
('1755014242', 'Luis', 'Gomez', 'luis@gmail.com', '2004-02-12', 5);

-- Profesores
INSERT INTO profesores (codigo, nombre)
VALUES
(1, 'Francisco'),
(2, 'Esteban'),
(3, 'Luis'),
(4, 'María'),
(5, 'Ana');

-- Personas
INSERT INTO personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
VALUES
('1755014238', 'Juan', 'Rodriguez', 1.70, '1990-05-15', '08:30', 5000.00, 2),
('1755014239', 'Maria', 'Gonzalez', 1.65, '1985-10-20', '10:45', 7000.00, 1),
('1755014240', 'Pedro', 'Lopez', 1.75, '1978-02-28', '12:15', 10000.00, 3);

-- Prestamo
INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_prestamo, garante)
VALUES
('1755014238', 1000.00, '2023-07-10', '08:00', 'María');

-- Productos
INSERT INTO productos (codigo, nombre, descripcion, valoracion)
VALUES
(1, 'Producto A', 'Descripción del Producto A', 8),
(2, 'Producto B', 'Descripción del Producto B', 7),
(3, 'Producto C', 'Descripción del Producto C', 9),
(4, 'Producto D', 'Descripción del Producto D', 6),
(5, 'Producto E', 'Descripción del Producto E', 8);

-- Ventas
INSERT INTO ventas (id_venta, codigo_producto, fecha_venta, cantidad)
VALUES
(1, 1, '2024-05-20', 5),
(2, 2, '2024-06-15', 3),
(3, 3, '2024-07-10', 2),
(4, 4, '2024-08-25', 1),
(5, 5, '2024-09-30', 4);

-- Transacciones
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES
(1, '22111', 50.00, 'D', '2024-05-20', '10:30'),
(2, '22678', 100.00, 'D', '2024-05-21', '11:45'),
(3, '22111', 30.00, 'D', '2024-05-25', '09:15'),
(4, '22678', 70.00, 'D', '2024-05-28', '08:00'),
(5, '22111', 25.00, 'D', '2024-06-01', '12:30');

-- Banco
INSERT INTO banco (codigo_banco, codigo_transaccion, detalle)
VALUES
(1, 1, 'Transferencia'),
(2, 2, 'Retiro'),
(3, 3, 'Compra'),
(4, 4, 'Pago'),
(5, 5, 'Transferencia');

-- Videojuegos
INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion)
VALUES
(1, 'Juego A', 'Descripción del Juego A', 9),
(2, 'Juego B', 'Descripción del Juego B', 8),
(3, 'Juego C', 'Descripción del Juego C', 7),
(4, 'Juego D', 'Descripción del Juego D', 8),
(5, 'Juego E', 'Descripción del Juego E', 9);

-- Plataformas
INSERT INTO plataformas (id_plataforma, nombre_plataforma, codigo_videojuego)
VALUES
(1, 'Plataforma A', 1),
(2, 'Plataforma B', 2),
(3, 'Plataforma C', 3),
(4, 'Plataforma D', 4),
(5, 'Plataforma E', 5);

-- Registros de Entrada
INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora, codigo_empleado)
VALUES
(1, '1755014238', '2023-08-01', '08:30', 1),
(2, '1755014239', '2023-08-15', '09:00', 2),
(3, '1755014240', '2023-08-20', '10:00', 3),
(4, '1755014241', '2023-09-05', '11:30', 4),
(5, '1755014242', '2023-09-10', '12:00', 5);

-- Empleado
INSERT INTO empleado (codigo_empleado, nombre, fecha, hora)
VALUES
(1, 'Empleado A', '2023-08-01', '08:30'),
(2, 'Empleado B', '2023-08-15', '09:00'),
(3, 'Empleado C', '2023-08-20', '10:00'),
(4, 'Empleado D', '2023-09-05', '11:30'),
(5, 'Empleado E', '2023-09-10', '12:00');

-- Consultas

-- Usuario y Cuentas
SELECT cu.numero_cuenta, us.nombre
FROM usuario us
JOIN cuentas cu ON us.cedula_usuario = cu.cedula_propietario
WHERE cu.saldo BETWEEN 100 AND 1000;

SELECT *
FROM usuario us
JOIN cuentas cu ON us.cedula_usuario = cu.cedula_propietario
WHERE cu.fecha_creacion BETWEEN '2022-09-21' AND '2023-09-21';

-- Clientes y Compras
SELECT nombre, apellido
FROM clientes
WHERE cedula LIKE '%7%';

SELECT *
FROM clientes
WHERE cedula = '1755012222'; -- No existe en los datos de ejemplo, se usó la cédula de Diego Ramírez

-- Estudiantes y Profesores
SELECT pro.codigo, est.nombre, est.apellido
FROM estudiantes est
JOIN profesores pro ON est.codigo_profesor = pro.codigo
WHERE est.apellido LIKE '%n%';

SELECT *
FROM estudiantes
WHERE codigo_profesor = (SELECT codigo FROM profesores WHERE nombre = 'Francisco');

-- Persona y Préstamo
SELECT cantidad_ahorrada, monto, garante
FROM personas
JOIN prestamo ON personas.cedula = prestamo.cedula
WHERE monto BETWEEN 100 AND 1000;

SELECT *
FROM personas
WHERE cedula = '1755014238';

-- Productos y Ventas
SELECT nombre, stock, cantidad
FROM productos
JOIN ventas ON productos.codigo = ventas.codigo_producto
WHERE (nombre LIKE '%m%' OR descripcion = '0');

SELECT nombre, stock
FROM productos
WHERE codigo IN (SELECT codigo_producto FROM ventas WHERE cantidad = 5);

-- Transacciones y Banco
SELECT *
FROM transacciones
WHERE tipo = 'C' AND numero_cuenta BETWEEN '22001' AND '22004';

SELECT *
FROM transacciones
WHERE codigo = (SELECT codigo_transaccion FROM banco WHERE codigo_banco = 1);

-- Videojuegos y Plataformas
SELECT v.nombre, v.descripcion, v.valoracion, p.nombre_plataforma
FROM videojuegos v
JOIN plataformas p ON v.codigo = p.codigo_videojuego
WHERE (v.descripcion LIKE '%Guerra%' AND v.valoracion > 7)
OR (v.nombre LIKE 'C%' AND v.valoracion > 8);

SELECT *
FROM plataformas
WHERE codigo_videojuego = (SELECT codigo FROM videojuegos WHERE nombre = 'God of War');

-- Registros de Entrada y Empleado
SELECT re.cedula_empleado, re.fecha, em.nombre
FROM registros_entrada re
JOIN empleado em ON re.codigo_empleado = em.codigo_empleado
WHERE (re.fecha BETWEEN '2023-08-01' AND '2023-08-31')
OR (re.cedula_empleado LIKE '17%' AND re.hora BETWEEN '08:00' AND '12:00')
OR (re.fecha BETWEEN '2023-10-06' AND '2023-10-20' AND re.cedula_empleado LIKE '08%' AND re.hora BETWEEN '09:00' AND '13:00');

SELECT *
FROM empleado
WHERE codigo_empleado = (SELECT codigo_empleado FROM registros_entrada WHERE codigo_registro = 2201);

