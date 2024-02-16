-- VIDEOJUEGOS
select * from videojuegos

-- ACTUALIZAR DESCRIPCIONES DE LOS VIDEOJUEGOS CUYA VALORAXION SEA MAYOR A 90 POR 'Mejor Puntuado'
update videojuegos set  descripcion = 'Mejor puntuado'
where  valor >= 90