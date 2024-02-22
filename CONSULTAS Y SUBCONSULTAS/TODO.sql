-- TRAE INFORMACION DONDE COINCIDAN PF Y FK
select pe.cedula, pe.nombre, pe.apellido, ec.descripcion from 
personas pe, estado_civil ec
where
pe.estado_civil_codigo = ec.codigo
and nombre like 'W%';


-- USUARIO Y CUENTAS
select * from usuario
select * from cuentas
------USUARIO Y CUENTAS------
--Consulta : Obtener los números de cuenta y nombres de usuarios 
--cuyos saldos están entre $100 y $1000.
SELECT usu.nombre, cu.numero_cuenta
FROM usuario usu
JOIN cuentas cu ON usu.cedula_usuario = cu.cedula_propietario
WHERE cu.saldo BETWEEN 10000::money AND 12000::money;


--Subconsulta : Obtener todos los datos de cuentas y usuarios 
--donde la fecha de creación de la cuenta esté entre '2022-09-21' y '2023-09-21
SELECT  cu.numero_cuenta, cu, fecha_creacion, cu.saldo, usu.cedula_usuario
FROM usuario usu
JOIN cuentas cu ON usu.cedula_usuario = cu.cedula_propietario
WHERE cu.fecha_creacion IN (
    SELECT fecha_creacion 
    FROM cuentas 
    WHERE fecha_creacion BETWEEN '2021-02-21' AND '2021-09-21'
)




-----CLIENTE COMPRAS-----
--Consulta : Obtener el nombre y apellido
--de los clientes cédula contenga el número 7 en su número de cédula.
select cli.nombre,cli.apellido from clientes cli,compras com
where com.cedula like '%7%'


select * from clientes
SELECT * FROM COMPRA


--Subconsulta : Obtener todos los clientes cuya cédula sea igual a la cédula de nombre "Rodolfo".
SELECT * FROM  clientes cli   
WHERE cli.cedula = (SELECT cli.cedula FROM clientes cli WHERE cli.nombre = 'Rodolfo');



-----ESTUDIANTES Y PROFESORES-----
--Consulta : Obtener el código de colegio con todos los nombres y apellidos de los estudiantes 
--cuyo apellido contiene la letra 'n'.
select est.nombre, apellido, pro.codigo from estudiantes est, profesores pro 
where est.codigo_profesor = pro.codigo and apellido like '%n%'



--Subconsulta : Obtener todos los estudiantes 
--cuyo código de colegio corresponde al nombre de "MARIA AUXILIADOR". Ejemplo del resultado :
select * from estudiantes est, profesores prof 
where est.codigo_profesor = prof.codigo and prof.nombre = 'María'

select * from profesores


---- PERSONA Y PRESTAMO----
--Consulta : Obtener la cantidad ahorrada, el monto del préstamo 
--y el garante de las personas cuyo préstamo está entre $100 y $1000.
select * from prestamo
select * from persona

select monto, cantidad_ahorrada, garante from personas perso, prestamo pres where perso.cedula = pres.cedula
and monto between money(100) and money(1000)

SELECT *
FROM personas
WHERE cedula = '1755014238';

--Subconsulta : Obtener todos los datos de la persona 
--cuya cédula sea igual a la cédula de nombre “Sean"
select * from personas where cedula = 
any(select cedula from personas where nombre='Jonathan')


----PRODUCTOS Y VENTA-----
--Consulta : Obtener el nombre, stock y cantidad de productos y ventas 
--cuyo nombre contiene la letra 'm' o la descripción sea igual a 0
-- Productos y Ventas
SELECT nombre, stock, cantidad
FROM productos
JOIN ventas ON productos.codigo = ventas.codigo_producto
WHERE (nombre LIKE '%m%' OR descripcion = '0');


--Subconsulta : Obtener el nombre y stock de los productos 
--donde el código de producto de las ventas corresponde a una cantidad de 5.
SELECT nombre, stock
FROM productos
WHERE codigo IN (SELECT codigo_producto FROM ventas WHERE cantidad = 5);



--TRANSACCION Y BANCO
--Consulta : Obtener todas las transacciones de tipo 'C' 
--cuyo número de cuenta esté entre '22001' y '22004'
SELECT *
FROM transacciones
WHERE tipo = 'C' AND numero_cuenta BETWEEN '22001' AND '22004';


--Subconsulta : Obtener todos los datos de transacciones 
--cuyo código corresponde al código de transacción del banco con código 1
SELECT *
FROM transacciones
WHERE codigo = (SELECT codigo_transaccion FROM banco WHERE codigo_banco = 1);

--VIDEOJUEGOS PLATAFORMA
--Consulta : Obtener el nombre,descripción,valoración y nombre de plataforma de videojuegos y plataformas 
--cuya descripción contiene 'Guerra' y tienen una valoración mayor a 7 
--o cuyo nombre comienza con'C' y tienen una valoración mayor a 8 
SELECT v.nombre, v.descripcion, v.valoracion, p.nombre_plataforma
FROM videojuegos v
JOIN plataformas p ON v.codigo = p.codigo_videojuego
WHERE (v.descripcion LIKE '%Guerra%' AND v.valoracion > 7)
OR (v.nombre LIKE 'C%' AND v.valoracion > 8);


--Subconsulta : Obtener todos los datos de plataformas 
--donde el código del videojuego corresponde al código de "God of war".
SELECT *
FROM plataformas
WHERE codigo_videojuego = (SELECT codigo FROM videojuegos WHERE nombre = 'God of War');


--REGISTRO DE ENTRADA EMPLEADO
--Consulta : Obtener la cédula del empleado, fecha y el nombre de los empleados 
--cuyos registros de entrada tienen fecha entre '2023-08-01' y '2023-08-31'
--o cuya cédula del empleado contiene '17%' y la hora de entrada está entre '08:00' y '12:00' 
--o cuya fecha está entre '2023-10-06' y '2023-10-20', 
--la cédula del empleado contiene '08%' y la hora de entrada está entre '09:00' y '13:00'.
SELECT re.cedula_empleado, re.fecha, em.nombre
FROM registros_entrada re
JOIN empleado em ON re.codigo_empleado = em.codigo_empleado
WHERE (re.fecha BETWEEN '2023-08-01' AND '2023-08-31')
OR (re.cedula_empleado LIKE '17%' AND re.hora BETWEEN '08:00' AND '12:00')
OR (re.fecha BETWEEN '2023-10-06' AND '2023-10-20' AND re.cedula_empleado LIKE '08%' AND re.hora BETWEEN '09:00' AND '13:00');



---Subconsulta : Obtener todos los datos de empleado donde el código de registro del empleado
--corresponde al código de registro de entrada de cédula '2201'.
SELECT *
FROM empleado
WHERE codigo_empleado = (SELECT codigo_empleado FROM registros_entrada WHERE codigo_registro = 2201);
