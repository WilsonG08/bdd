--TRANSACCIONES
SELECT * FROM transacciones
WHERE tipo = 'C' AND (numero_cuenta BETWEEN '222001' AND '22004');

SELECT * FROM transacciones
WHERE tipo = 'D' AND (fecha BETWEEN '25/05/2000' AND '25/05/2023') AND (numero_cuenta BETWEEN '222007' AND '22010');

SELECT * FROM transacciones
WHERE (codigo BETWEEN 1 AND 10) 
AND (numero_cuenta = '22002' OR numero_cuenta = '22004') 
AND (fecha BETWEEN '26/05/2000' AND '19/05/2023');
