-- TRANSACCIONES

-- TODAS CON TIPO D
select * from transacciones
where tipo = 'D'

-- TRANSACCIONES CON MONTO ENTRE 200 Y 2000
select monto from transacciones
where monto
between '200' and '2000'



-- SELECCIONAR: CODIGO, MONTO, TIPO Y FECHA QUE LA FECHA SEA DIFERENTE DE NULL
SELECT codigo, monto, tipo, fecha
FROM transacciones
WHERE fecha IS NOT null;


