-- CLIENTES - COMPRAS

drop table clientes;

select * from clientes;
select * from compras;


-- Creación de la tabla clientes
CREATE TABLE clientes (
    cedula CHAR(10),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    PRIMARY KEY (cedula)
);

-- Creación de la tabla compras
CREATE TABLE compras (
    id_compra INT,
    cedula CHAR(10) NOT NULL,
    fecha_compra DATE NOT NULL,
    monto DECIMAL(10,2),
    PRIMARY KEY (id_compra)
);

-- Establecimiento de la relación entre clientes y compras
ALTER TABLE compras
ADD CONSTRAINT fk_compras_clientes
FOREIGN KEY (cedula) REFERENCES clientes(cedula);



-- Inserción de datos en la tabla clientes
INSERT INTO clientes (cedula, nombre, apellido) VALUES
('1234567890', 'Juan', 'Perez'),
('2345678901', 'Maria', 'Gonzalez'),
('3456789012', 'Carlos', 'Rodriguez'),
('4567890123', 'Ana', 'Martinez'),
('5678901234', 'Jose', 'Hernandez'),
('6789012345', 'Patricia', 'Lopez'),
('7890123456', 'Francisco', 'Garcia'),
('8901234567', 'Laura', 'Torres'),
('9012345678', 'Gabriel', 'Ramirez'),
('0123456789', 'Carmen', 'Sanchez');

-- Inserción de datos en la tabla compras
INSERT INTO compras (id_compra, cedula, fecha_compra, monto) VALUES
(1, '1234567890', '2024-02-20', 100.00),
(2, '2345678901', '2024-02-21', 200.00),
(3, '3456789012', '2024-02-22', 300.00),
(4, '4567890123', '2024-02-23', 400.00),
(5, '5678901234', '2024-02-24', 500.00),
(6, '6789012345', '2024-02-25', 600.00),
(7, '7890123456', '2024-02-26', 700.00),
(8, '8901234567', '2024-02-27', 800.00),
(9, '9012345678', '2024-02-28', 900.00),
(10, '0123456789', '2024-02-29', 1000.00);


select * from clientes;
select * from compras;