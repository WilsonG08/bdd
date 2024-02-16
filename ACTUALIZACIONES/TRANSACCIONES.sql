-- TRANSACCIONES
select * from transacciones

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (11, '12345', 150::money, 'C', '2024-09-15', '14:30:00');


-- CAMBIAR DATOS Tansacción mayor a 100 y menor que 500, que se hayan llevado a cabo el mes de septiembre con horas entre 14:00 y 20:00, por "Transferencia"


UPDATE transacciones
SET tipo = 'T'
WHERE monto BETWEEN CAST(100 AS money) AND CAST(500 AS money)
AND EXTRACT(MONTH FROM fecha) = 9
AND EXTRACT(HOUR FROM hora) BETWEEN 14 AND 20;
