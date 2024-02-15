-- REGISTROS ENTRADA
select * from registros_entrada

INSERT INTO registros_entrada (codigo_registro, cedula_empleado, fecha, hora)
VALUES (11, '1224567890', '2024-08-01', '08:00:00');


-- ACTUALIZAR TODAS LA CEDULAS POR '082345679' PARA EL MES DE AGOSTO
UPDATE registros_entrada SET cedula_empleado = '082345679'
WHERE EXTRACT(MONTH FROM fecha) = 8 AND EXTRACT(YEAR FROM fecha) = 2024;
