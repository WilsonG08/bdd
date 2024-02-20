-- PRODUCTOS - VENTAS
drop table productos

SELECT * FROM productos

-- Creación de la tabla productos
CREATE TABLE productos (
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    precio MONEY NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (codigo)
);

-- Creación de la tabla ventas
CREATE TABLE ventas (
    id_venta INT NOT NULL,
    codigo_producto INT NOT NULL,
    fecha_venta DATE NOT NULL,
    cantidad INT,
    PRIMARY KEY (id_venta)
);

-- Establecimiento de la relación entre productos y ventas
ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_productos
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo);


-- Inserción de datos en la tabla productos
INSERT INTO productos (codigo, nombre, descripcion, precio, stock) VALUES
(1, 'Manzana', 'Manzanas rojas deliciosas', 0.50, 100),
(2, 'Banana', 'Bananas frescas', 0.30, 200),
(3, 'Naranja', 'Naranjas jugosas', 0.60, 150),
(4, 'Piña', 'Piñas dulces', 1.00, 50),
(5, 'Mango', 'Mangos tropicales', 1.20, 75);

-- Inserción de datos en la tabla ventas
INSERT INTO ventas (id_venta, codigo_producto, fecha_venta, cantidad) VALUES
(1, 1, '2024-02-20', 10),
(2, 2, '2024-02-21', 15),
(3, 3, '2024-02-22', 20),
(4, 4, '2024-02-23', 5),
(5, 5, '2024-02-24', 8);




