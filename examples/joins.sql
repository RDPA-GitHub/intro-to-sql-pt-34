
-- JOIN table_name ON table_a.field_name = table_b.field_name
-- JOIN (solo trae los registro que cumplen la condicion)
SELECT a.*, b.* FROM contactos AS a 
JOIN telefonos AS b ON a.id = b.contactos_id;

SELECT a.*, b.* FROM contactos AS a 
JOIN telefonos AS b ON a.id = b.contactos_id WHERE a.nombre like 'Jane%';

-- LEFT JOIN (Da prioridad a los registros de la tabla de la izquierda de la union)
SELECT * FROM contactos AS a
LEFT JOIN telefonos AS b ON a.id = b.contactos_id LIMIT 2 OFFSET 8; 

-- RIGHT JOIN (Da prioridad a los registros de la tabla de la derecha de la union)
SELECT * FROM contactos AS a
RIGHT JOIN telefonos AS b ON a.id = b.contactos_id
ORDER BY b.numero_telefonico DESC; 

SELECT * FROM contactos LIMIT 2 OFFSET 4;