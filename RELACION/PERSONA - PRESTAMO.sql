-- PERSONA - PRESTAMO

DROP TABLE PERSONA
DROP TABLE PRESTAMO

-- Creación de la tabla persona
CREATE TABLE persona (
    cedula CHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    estatura DECIMAL(10,2),
    fecha_nacimiento DATE NOT NULL,
    hora_nacimiento TIME,
    cantidad_ahorrada MONEY,
    numero_hijos INT,
    PRIMARY KEY (cedula)
);

-- Creación de la tabla prestamo
CREATE TABLE prestamo (
    cedula CHAR(10) NOT NULL,
    monto MONEY,
    fecha_prestamo DATE,
    hora_prestamo TIME,
    garante VARCHAR(40),
    PRIMARY KEY (cedula)
);

-- Establecimiento de la relación entre persona y prestamo
ALTER TABLE prestamo
ADD CONSTRAINT fk_prestamo_persona
FOREIGN KEY (cedula) REFERENCES persona(cedula);



-- Insertar datos en la tabla 'persona'
INSERT INTO persona (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos) VALUES
('1234567890', 'Juan', 'López', 1.75, '1980-01-01', '08:00:00', 1000.00, 2),
('2345678901', 'María', 'Gómez', 1.65, '1985-02-02', '09:00:00', 2000.00, 3),
('3456789012', 'Carlos', 'Morales', 1.80, '1990-03-03', '10:00:00', 3000.00, 1),
('4567890123', 'Ana', 'Guerrero', 1.70, '1995-04-04', '11:00:00', 4000.00, 0),
('5678901234', 'Pedro', 'Castillo', 1.85, '2000-05-05', '12:00:00', 5000.00, 2);

-- Insertar datos en la tabla 'prestamo'
INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_prestamo, garante) VALUES
('1234567890', 500.00, '2024-01-01', '13:00:00', 'Garante 1'),
('2345678901', 1000.00, '2024-02-02', '14:00:00', 'Garante 2'),
('3456789012', 1500.00, '2024-03-03', '15:00:00', 'Garante 3'),
('4567890123', 2000.00, '2024-04-04', '16:00:00', 'Garante 4'),
('5678901234', 2500.00, '2024-05-05', '17:00:00', 'Garante 5');
