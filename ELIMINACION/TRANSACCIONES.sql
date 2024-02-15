-- TRANSACCIONES

select * from transacciones

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES (12, '12345', 200.00, 'C', '2024-08-01', '15:00');



-- ELIMINAR LAS TRANSFERENCIAS QUE HAYA HECHO ENTRE LAS 14:00 Y 18:00 DEL MES DE AGOSTO DEL AÑO ACTUAL
DELETE FROM transacciones
WHERE EXTRACT(MONTH FROM fecha) = 8 AND 
      EXTRACT(HOUR FROM hora) BETWEEN 14 AND 17;
