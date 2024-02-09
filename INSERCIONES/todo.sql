-- BETWEEN LO INCLUYE

select * from personas 
where fecha_nacimiento 
between '12/06/1995' and '22/05/2000'


-- HORA DE NACIMIENTO
select * from personas 
where hora_nacimiento > '10:05:10'




-- INSERT DE FECHA

insert into personas(cedula, nombre, apellido, fecha_nacimiento)
values('1313131313', 'Jfferson', 'Farfan', '10/06/1995')

insert into personas(cedula, nombre, apellido, fecha_nacimiento)
values('1414141414', 'Jefferson', 'Farfan', '11/06/1995')



-- INSERT DE HORA
insert into personas(cedula, nombre, apellido, hora_nacimiento)
values('1515151515', 'Kevin', 'Veliz', '22:54:10')


insert into personas(cedula, nombre, apellido, hora_nacimiento)
values('1616161616', 'Edwin', 'Calva', '10:05:10')



