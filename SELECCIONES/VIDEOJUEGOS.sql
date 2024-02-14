-- VIDEOJUEGOS

-- TODOS LOS QUE COMIENCEN CON C
select * from videojuegos 
where nombre like 'C%'

-- VALORACION ENTRE 9 Y 10
select * from videojuegos 
where valor 
between 40 and 60


-- DESCRIPCION NULL
select * from videojuegos 
where descripcion is null

