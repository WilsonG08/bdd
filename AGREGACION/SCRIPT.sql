-- Relación cuentas con usuario
-- Obtener el saldo promedio de todas las cuentas de un usuario específico.
-- 
SELECT AVG(CAST(saldo AS numeric)) AS SaldoPromedio
FROM cuentas
WHERE cedula_propietario = '12345';



-- Obtener el número total de cuentas de cada tipo de cuenta.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de cuentas.
-- Utilizar la cláusula GROUP BY para agrupar las cuentas por tipo de cuenta.
SELECT tipo_cuenta, COUNT(*) AS NumeroDeCuentas
FROM usuario
GROUP BY tipo_cuenta;



-- Obtener el monto total de compras realizadas por cada cliente.
-- Escribir la sentencia SQL utilizando la función de agregación SUM para sumar los montos de las compras.
-- Utilizar la cláusula GROUP BY para agrupar las compras por cliente.
SELECT c.cedula, c.nombre, c.apellido, SUM(co.monto) AS MontoTotal
FROM clientes c
JOIN compras co ON c.cedula = co.cedula
GROUP BY c.cedula, c.nombre, c.apellido;

select * from compras
-- Obtener la cantidad total de compras realizadas en una fecha específica.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de compras.
-- Utilizar la cláusula WHERE para filtrar las compras por la fecha específica.
SELECT COUNT(*) AS CantidadCompras
FROM compras
WHERE fecha_compra = '2024-07-20';



-- Relación entre estudiantes y profesores
-- Obtener la cantidad total de estudiantes asignados a cada profesor.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de estudiantes.
-- Utilizar la cláusula GROUP BY para agrupar los estudiantes por profesor.
SELECT p.codigo, COUNT(e.cedula) AS NumeroDeEstudiantes
FROM profesores p
JOIN estudiantes e ON p.codigo = e.codigo_profesor
GROUP BY p.codigo;


-- Obtener la edad promedio de los estudiantes.
-- Escribir la sentencia SQL utilizando la función ROUND para mostrar la edad_promedio como entero, 
-- dentro de ROUND la función de agregación AVG (EXTRACT(YEAR FROM CURRENT_DATE) Extract para obtener
-- la diferencia en años entre la fecha actual y la fecha de nacimiento de cada estudiante seguido de
-- un guion hacer otro EXTRACT que lleva dentro EL AÑO (YEAR) de la fecha de nacimiento de los estudiantes,
-- con ello obtendremos el promedio de las edades de los estudiantes.
SELECT ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento))) AS EdadPromedio
FROM estudiantes;




-- Relación entre persona y préstamo
-- Obtener la suma total de los montos de préstamos para cada persona.
-- Escribir la sentencia SQL utilizando la función de agregación SUM para sumar los montos de los préstamos.
-- Utilizar la cláusula GROUP BY para agrupar los préstamos por persona.
SELECT p.cedula, p.nombre, p.apellido, SUM(pr.monto) AS MontoTotalPrestamos
FROM personas p
JOIN prestamo pr ON p.cedula = pr.cedula
GROUP BY p.cedula, p.nombre, p.apellido;



-- Obtener la cantidad total de personas que tienen más de un hijo.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de personas.
-- Utilizar la cláusula WHERE para filtrar las personas que tienen más de un hijo.
SELECT COUNT(*) AS NumeroDePersonas
FROM personas
WHERE numero_hijos > 1;


-- Relación entre Productos y Ventas
-- Obtener el máximo precio de todos los productos.
-- Escribir la sentencia SQL utilizando la función de agregación MAX para obtener el máximo precio de los productos.
SELECT MAX(precio) AS PrecioMaximo
FROM productos;



-- Obtener la suma total de la cantidad de productos vendidos.
-- Escribir la sentencia SQL utilizando la función de agregación SUM para sumar la cantidad de productos vendidos.
SELECT SUM(cantidad) AS TotalProductosVendidos
FROM ventas;


-- Relación entre Transacciones y Banco
-- Obtener la cantidad total de transacciones de tipo 'C' (crédito).
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de transacciones.
-- Utilizar la cláusula WHERE para filtrar las transacciones de tipo 'C' (crédito).
SELECT COUNT(*) AS total_transacciones_credito
FROM transacciones
WHERE tipo = 'C';




-- Obtener el promedio de montos de transacciones para cada número de cuenta.
-- Escribir la sentencia SQL selecciona el número de cuenta seguido de una coma utilizar la función
-- ROUND dentro utiliza la función de agregación AVG para calcular el promedio de los montos de las 
-- transacciones dentro de la función AVG usa la función CAST para el monto castéalo como decimal y 
-- fuera del paréntesis especificar el numero 2 para que nos resulten dos decimales y con ello 
-- obtendremos el monto_promedio a través de las transacciones.
-- SELECT ****** ROUND(AVG(CAST(******AS decimal)),2) AS ****** FROM ****** GROUP BY *******;
-- Utilizar la cláusula GROUP BY para agrupar las transacciones por número de cuenta.
SELECT numero_cuenta, ROUND(AVG(CAST(monto AS DECIMAL)), 2) AS MontoPromedio
FROM transacciones
GROUP BY numero_cuenta;



-- Relación entre Videojuegos y Plataformas
-- Obtener la cantidad total de plataformas disponibles para cada videojuego.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de plataformas.
-- Utilizar la cláusula GROUP BY para agrupar las plataformas por videojuego usando el código del videojuego.
SELECT v.nombre, COUNT(p.id_plataforma) AS NumeroDePlataformas
FROM videojuegos v
JOIN plataformas p ON v.codigo = p.codigo_videojuego
GROUP BY v.nombre;




-- Obtener la valoración promedio de todos los videojuegos.
-- Escribir la sentencia SQL utilizando la función de agregación AVG para calcular el
-- promedio de las valoraciones de los videojuegos, Utiliza la función ROUND antes de
-- AVG para redondear a 2 decimales el resultado .
-- Ejemplo: SELECT ROUND(AVG(*******),2) AS ******** FROM ******;
SELECT ROUND(AVG(valoracion), 2) AS ValoracionPromedio
FROM videojuegos;



-- Relación entre registros_entrada y empleado
-- Obtener la cantidad total de registros de entrada realizados por cada empleado.
-- Escribir la sentencia SQL utilizando la función de agregación COUNT para contar el número de registros de entrada.
-- Utilizar la cláusula GROUP BY para agrupar los registros de entrada por empleado.
SELECT e.nombre, COUNT(r.codigo_registro) AS NumeroRegistrosEntrada
FROM empleado e
JOIN registros_entrada r ON e.codigo_empleado = r.codigo_empleado
GROUP BY e.nombre;



-- Obtener la fecha mínima y máxima de los registros de entrada.
-- Escribir la sentencia SQL utilizando la función de agregación MIN
-- para obtener la fecha mínima y la función de agregación MAX para obtener
-- la fecha máxima de los registros de entrada.
SELECT MIN(fecha) AS FechaMinima, MAX(fecha) AS FechaMaxima
FROM registros_entrada;


