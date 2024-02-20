-- VIEDEOJUEGOS - PLATAFORMAS


DROP TABLE videojuegos


-- Creación de la tabla videojuegos
CREATE TABLE videojuegos (
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT NOT NULL,
    PRIMARY KEY (codigo)
);

-- Creación de la tabla plataformas
CREATE TABLE plataformas (
    id_plataforma INT NOT NULL,
    nombre_plataforma VARCHAR(50) NOT NULL,
    codigo_videojuego INT,
    PRIMARY KEY (id_plataforma)
);

-- Establecimiento de la relación entre videojuegos y plataformas
ALTER TABLE plataformas
ADD CONSTRAINT fk_plataformas_videojuegos
FOREIGN KEY (codigo_videojuego) REFERENCES videojuegos(codigo);


-- Insertar datos en la tabla videojuegos
INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion) VALUES
(1, 'Super Mario Bros', 'Un juego de plataformas desarrollado por Nintendo', 5),
(2, 'The Legend of Zelda', 'Una serie de videojuegos de acción-aventura de Nintendo', 5),
(3, 'Minecraft', 'Un videojuego de construcción y supervivencia', 4),
(4, 'Fortnite', 'Un videojuego de batalla real desarrollado por Epic Games', 4),
(5, 'Among Us', 'Un juego de fiesta multijugador en línea desarrollado por InnerSloth', 4);

-- Insertar datos en la tabla plataformas
INSERT INTO plataformas (id_plataforma, nombre_plataforma, codigo_videojuego) VALUES
(1, 'Nintendo Switch', 1),
(2, 'Nintendo Switch', 2),
(3, 'PC', 3),
(4, 'PlayStation 4', 4),
(5, 'Android', 5);
