-- -- ESTUDIANTES
select * from estudiantes

-- SELECCIONAR EL NOMBRE DE LOS ESTUDIANTES CUYOS NOMBRES EMPIECEN CON M OSI SU APELLIDO TERMINA EN Z
select nombre, apellido from estudiantes
where nombre like 'M%' or apellido like '%z'

-- SELECCIONAR LOS NOMBRES DE LOS ESTUDIANTES QUE TENGAN UN 32 Y EMPIENCEN CON 18 EN ALGUNA PARTE DE LA CEDULA
select nombre from  estudiantes
where cedula like '%32%'and cedula like '18%'

-- CREAR UN SELET QUE TRAIGA LOS NOMBRES COMPLETO DE TODOS LOS ESTUDIANTES CUYA DECULLA TERMINE EN 06 O EMPIENCE CON 17
SELECT nombre, apellido FROM estudiantes
WHERE cedula LIKE '17%' OR cedula LIKE '%06'
