-- ESTUDIANTES
select * from estudiantes


-- ACTUALIZAR EL APELLIDO POR HERMANDES A TODOS LOS ESTUDIANTES QUE TENGAN UNA CEDULA QUE EMPIEZA POR 17
update estudiantes set apellido = 'Hernandez'
where cedula like '12%'
