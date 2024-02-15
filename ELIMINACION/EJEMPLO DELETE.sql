-- FUNCIONS DE DELETE
delete from personas
where cedula = '1718688284'

-- BORRAR CON ESTATURA NULL
delete from personas
where estatura is null

select * from personas