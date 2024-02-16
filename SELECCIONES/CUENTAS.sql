-- CUENTAS

--  SOLO NUMERO DE CUENTAS Y SALDO DE LAS MISMAS
select numero_cuenta, saldo from cuentas

-- TRAIGA LOS REGISTROS ENTRE EL DIA DE HOY Y 2 MESE ANTES 
select * from cuentas
where fecha_creacion
between '2024-02-14' and '2023-09-20'

-- NUMERO DE CUENTA, SALDO DE LA CUENTA DESDE EL DIA DE HOY HASTA 2 MESES ATRAS
select numero_cuenta, saldo from cuentas 
where fecha_creacion 
between '2024-02-14' and '2023-09-20'


