-- REGISTROS_ENTRADAS

-- TODAS LAS CEDULAS Y FECHA DE REGISTRO DE ENTRADA
select cedula_empleado, codigo_registro from registros_entrada

-- REGISTRO DE ENTRADA HORAS SUPERIORES A 7 Y 14
select * from registros_entrada
where hora 
between '7:00' and '14:00'


-- HORAS SUPERIORES A 8
select * from registros_entrada
where hora > '8:40'




select * from registros_entrada