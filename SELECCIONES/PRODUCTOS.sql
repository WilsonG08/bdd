-- PRODUCTOS

-- TRAER TODOS LOS PRODUCTOS EMPIEZAN CON M
select * from productos 
where nombre like 'M%'

-- TRAER CON DESCRIPCION DE NULL
select * from productos 
where descripcion is null

-- PRECIO ENTRE 30 Y 70
select * from productos
where precio
between '30' and '70'

