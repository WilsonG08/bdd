-- tabla videojuegos

DROP TABLE videojuegos;


create table videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valor int not null,
	constraint videojuegos_pk primary key (codigo)
)


-- INSERTAR 5 REGISTROS
INSERT INTO videojuegos (codigo, nombre, descripcion, valor)
VALUES (01, 'Super Mario Bros', 'Un clásico juego de plataformas de Nintendo', 60);


INSERT INTO videojuegos (codigo, nombre, descripcion, valor)
VALUES (02, 'The Legend of Zelda', 'Una popular serie de aventuras de Nintendo', 70);


INSERT INTO videojuegos (codigo, nombre, descripcion, valor) 
VALUES (03, 'Minecraft', 'Un juego de construcción y supervivencia', 30);


INSERT INTO videojuegos (codigo, nombre, descripcion, valor) 
VALUES (04, 'Fortnite', 'Un juego de batalla real en línea', 10);


INSERT INTO videojuegos (codigo, nombre, descripcion, valor) 
VALUES (05, 'Among Us', 'Un juego de fiesta multijugador en línea', 5);

SELECT * FROM videojuegos



-- SOLO CAMPOS OBLIGATARIOS

INSERT INTO videojuegos (codigo, nombre, valor)
VALUES (06, 'Call of Duty', 60);


INSERT INTO videojuegos (codigo, nombre, valor)
VALUES (07, 'World of Warcraft', 40);


INSERT INTO videojuegos (codigo, nombre, valor) 
VALUES (08, 'FIFA 2024', 50);


SELECT * FROM videojuegos
