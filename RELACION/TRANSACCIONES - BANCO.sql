-- TRANSACCIONES - BANCO


DROP TABLE TRANSACCIONES


-- Creación de la tabla transacciones
CREATE TABLE transacciones (
    codigo INT NOT NULL,
    numero_cuenta CHAR(5) NOT NULL,
    monto MONEY NOT NULL,
    tipo CHAR(1) NOT NULL,
    fecha DATE,
    hora TIME,
    PRIMARY KEY (codigo)
);

-- Creación de la tabla banco
CREATE TABLE banco (
    codigo_banco INT NOT NULL,
    codigo_transaccion INT,
    detalle VARCHAR(100),
    PRIMARY KEY (codigo_banco)
);

-- Establecimiento de la relación entre transacciones y banco
ALTER TABLE banco
ADD CONSTRAINT fk_banco_transacciones
FOREIGN KEY (codigo_transaccion) REFERENCES transacciones(codigo);



-- Insertar datos en la tabla transacciones
INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora) VALUES
(1, '12345', 1000.00, 'D', '2024-01-01', '13:00:00'),
(2, '23456', 2000.00, 'R', '2024-02-02', '14:00:00'),
(3, '34567', 3000.00, 'D', '2024-03-03', '15:00:00'),
(4, '45678', 4000.00, 'R', '2024-04-04', '16:00:00'),
(5, '56789', 5000.00, 'D', '2024-05-05', '17:00:00');

-- Insertar datos en la tabla banco
INSERT INTO banco (codigo_banco, codigo_transaccion, detalle) VALUES
(1, 1, 'Préstamo para vivienda'),
(2, 2, 'Préstamo para automóvil'),
(3, 3, 'Préstamo para educación'),
(4, 4, 'Préstamo personal'),
(5, 5, 'Préstamo para negocio');


