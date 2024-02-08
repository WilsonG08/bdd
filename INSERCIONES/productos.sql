-- tabla productos

DROP TABLE productos;


create table productos(
	codigo int not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

-- TODOS LOS CAMPOS
INSERT INTO productos(codigo, nombre, descripcion, precio, stock)
VALUES (001, 'Laptop Gamer', 'Laptop con tarjeta gráfica de alta gama', 1500.00, 10);


INSERT INTO productos(codigo, nombre, descripcion, precio, stock)
VALUES (002, 'Smartphone Pro', 'Smartphone con pantalla OLED de 6.5 pulgadas', 800.00, 25);


INSERT INTO productos(codigo, nombre, descripcion, precio, stock)
VALUES (003, 'Cafetera Express', 'Cafetera de acero inoxidable con jarra de vidrio', 120.00, 30);


INSERT INTO productos(codigo, nombre, descripcion, precio, stock) 
VALUES (004, 'Silla Ergonómica', 'Silla de oficina ergonómica con soporte lumbar', 210.00, 15);


INSERT INTO productos(codigo, nombre, descripcion, precio, stock)
VALUES (005, 'Audífonos Bluetooth', 'Audífonos inalámbricos con cancelación de ruido', 130.00, 35);


-- CAMPOS OBLIGATORIOS
INSERT INTO productos(codigo, nombre, precio, stock)
VALUES (006, 'Teclado Mecánico', 70.00, 20);


INSERT INTO productos(codigo, nombre, precio, stock)
VALUES (007, 'Mouse Inalámbrico', 30.00, 40);


INSERT INTO productos(codigo, nombre, precio, stock) 
VALUES (008, 'Monitor 4K', 300.00, 15);

select * from productos
