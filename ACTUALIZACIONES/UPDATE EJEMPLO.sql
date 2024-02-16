-- ACTUALIZAR DATOS DE UNA PERSONA 
select * from personas

update personas set estatura = 1.70
where cedula = '1718688284'

-- ACTUALIZAR CANTIDAD AHORRADA
update personas set cantidad_ahorrada = 0.0
where cantidad_ahorrada is null


--- ACTUALIZAR HIJOS EN CERO LOS NNULL
update personas set numero_hijos = 0
where  numero_hijos is null

-- ACTUALIZAR DOS COLUMNAS
update personas set estatura = 1.80, fecha_nacimiento= '10/10/2000'
where cedula = '1616161616'