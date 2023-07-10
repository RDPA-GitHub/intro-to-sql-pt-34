-- JOIN table_name ON table_a.field_name = table_b.field_name
-- JOIN (Solo trae los registros que cumplen con la condicion)

SELECT a.*, b.* FROM contactos AS a
JOIN telefonos AS b ON a.id = b.contactos_id;

SELECT a.*, b.* FROM contactos AS a
JOIN telefonos AS b ON a.id = b.contactos_id WHERE a.nombre like 'Jane%';

SELECT * FROM telefonos;
SELECT * FROM contactos;

-- LEFT JOIN (Da prioridad a los registros de la izquierda)
SELECT * FROM contactos AS a
LEFT JOIN telefonos AS b ON a.id = b.contactos_id;

-- RIGHT JOIN (Da prioridad a los registros de la derecha)
SELECT * FROM contactos AS a
RIGHT JOIN telefonos AS b ON a.id = b.contactos_id;