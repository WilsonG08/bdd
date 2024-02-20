-- EMPLEADO - REGISTRO_ENTRADA

DROP TABLE EMPLEADO
DROP TABLE REGISTROS_ENTRADA

-- Creación de la tabla empleado
CREATE TABLE empleado (
    codigo_empleado INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    PRIMARY KEY (codigo_empleado)
);

-- Creación de la tabla registros_entrada
CREATE TABLE registros_entrada (
    codigo_registro INT NOT NULL,
    cedula_empleado CHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    codigo_empleado INT NOT NULL,
    PRIMARY KEY (codigo_registro)
);

-- Establecimiento de la relación entre registros_entrada y empleado
ALTER TABLE registros_entrada
ADD CONSTRAINT fk_registros_entrada_empleado
FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado);


-- Inserción de datos en la tabla empleado
INSERT INTO empleado (codigo_empleado, nombre) VALUES
(1, 'Juan Perez'),
(2, 'Maria Gonzalez'),
(3, 'Carlos Rodriguez'),
(4, 'Ana Martinez'),
(5, 'Jose Hernandez');

-- Inserción de datos en la tabla registros_entrada
INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora, codigo_empleado) VALUES
(1, '1234567890', '2024-02-20', '08:00:00', 1),
(2, '2345678901', '2024-02-21', '09:00:00', 2),
(3, '3456789012', '2024-02-22', '10:00:00', 3),
(4, '4567890123', '2024-02-23', '11:00:00', 4),
(5, '5678901234', '2024-02-24', '12:00:00', 5);
