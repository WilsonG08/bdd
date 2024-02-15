-- PRODUCTOS

select * from productos

-- ELIMINAR TODOS LOS PRPDUCTOS DONDE LA DESCRIPCION SEA NULL
delete from productos
where descripcion is null
