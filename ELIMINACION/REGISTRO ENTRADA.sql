-- REGISTRO ENTRADA
 select * from registros_entrada
 
 -- ELIMINAR TODOS LOS REGISTRSO DEL MES DE JUNIO
DELETE FROM registros_entrada
WHERE EXTRACT(MONTH FROM fecha) = 8;
