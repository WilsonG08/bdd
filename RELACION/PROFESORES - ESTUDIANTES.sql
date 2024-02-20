-- PROFESORES - ESTUDIANTES

DROP TABLE ESTUDIANTES
DROP TABLE PROFESORES

-- Creación de la tabla profesores
CREATE TABLE Profesores (
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

-- Creación de la tabla estudiantes
CREATE TABLE Estudiantes (
    cedula CHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    codigo_profesor INT,
    PRIMARY KEY (cedula)
);

-- Establecimiento de la relación entre estudiantes y profesores
ALTER TABLE Estudiantes
ADD CONSTRAINT fk_estudiantes_profesores
FOREIGN KEY (codigo_profesor) REFERENCES Profesores(codigo);




-- Insertar datos en la tabla Profesores
INSERT INTO Profesores (codigo, nombre) VALUES
(1, 'Profesor García'),
(2, 'Profesora Martínez'),
(3, 'Profesor Rodríguez'),
(4, 'Profesora Pérez'),
(5, 'Profesor González');

-- Insertar datos en la tabla Estudiantes
INSERT INTO Estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor) VALUES
('1234567890', 'Juan', 'López', 'juan.lopez@email.com', '2000-01-01', 1),
('2345678901', 'María', 'Gómez', 'maria.gomez@email.com', '2000-02-02', 2),
('3456789012', 'Carlos', 'Morales', 'carlos.morales@email.com', '2000-03-03', 3),
('4567890123', 'Ana', 'Guerrero', 'ana.guerrero@email.com', '2000-04-04', 4),
('5678901234', 'Pedro', 'Castillo', 'pedro.castillo@email.com', '2000-05-05', 5);
