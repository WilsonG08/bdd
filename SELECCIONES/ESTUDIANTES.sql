-- ESTUDIANTES

-- NOMBRE Y CEDULA
select nombre, cedula from estudiantes

-- NOMBRE Y CEDULA EMPIECE CON 12
select nombre, cedula from estudiantes
where cedula like '12%'


-- NOMBRES COMPLETOS QUE EMPIENCEN CON A
select nombre, apellido from estudiantes
where nombre like 'J%'



