-- PRODUCTOS
select * from productos

-- SELECCIONAR PRODUCTOS CON STOCK = 10 Y PRECIO > 10
select * from productos
where stock = 10 and precio < money(15)

-- SELECIONAR NOMBRES Y STOCK DE PRODUCTOS  QUE TENGAN UNA m EN SU NOMBRE O TENGAN UN ESPACIO EN BLANCO EN LA DESCRIPCCION
select * from productos
where nombre like '%m%' or descripcion like ' %'


-- SELECCIONAR EL NOMBRE DE TODOS LOS PRODUCTOS QUE TENGAN NULL EN EL CAMPO DESCRIPCCION O TENGAN UN STOCK O

select nombre from productos
where descripcion is null or stock = 0
