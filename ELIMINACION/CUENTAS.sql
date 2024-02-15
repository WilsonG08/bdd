-- CUENTAS
select * from cuentas

-- ELIMINAR TODOS LOS ESTUDIANTES QUE TENGAN UNA CEDULA QUE TERMINA POR 05
delete from cuentas
where cedula_propietario like '%01'