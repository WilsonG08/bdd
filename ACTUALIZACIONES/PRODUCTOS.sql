-- PRODUCTOS
select * from productos

-- ACTIALIZAR EL STOKC A 0 EN TODOS LOS PRODUCTOS DONDE LA DESCRIPCION SEA NULL
update productos set stock = 0
where descripcion is null