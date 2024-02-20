-- REGISTRO_ENTRADAS

select * from registros_entrada

-- SELECCIONE LOS REGISTROS DEL MES DE SEPTIEMBRE, O REALIZADOS POR LAS CEDULAS DE PICHINCHA (QUE INICIE CON 17)
SELECT * FROM registros_entrada
WHERE (EXTRACT(MONTH FROM fecha) = 9) OR (cedula_empleado LIKE '17%')


-- SELECCIONE LOS REGISTROS DEL MES DE AGOSTO REALIZADOS POR LAS CEDULAS DE PICHINCHA 
-- (QUE INICIE CON 17) Y RELIZADAS ENTRER LAS 08:00 A 12:00 
SELECT * FROM registros_entrada
WHERE (fecha BETWEEN '01/08/2000' AND '30/09/2023') 
AND (cedula_empleado LIKE '17%') AND (hora BETWEEN '08:00' AND '12:00');


-- seleccione LOS REGISTROS DEL MES DE AGOSTO POR CEDULA PICHINCHA EN LA HORA 8 A 12 ...
SELECT * FROM registros_entrada
WHERE (fecha BETWEEN '01/08/2000' AND '30/09/2023') 
AND (cedula_empleado LIKE '17%') AND (hora BETWEEN '08:00' AND '12:00')
OR (fecha BETWEEN '01/09/2000' AND '30/09/2023') AND (cedula_empleado LIKE '08%') AND (hora BETWEEN '09:00' AND '13:00')