-- JOIN table_name ON table_a.field_name = table_b.field_name
-- JOIN (Solo trae los registros que cumplen con la condicion)

SELECT a.*, b.* FROM contactos AS a
JOIN telefonos AS b ON a.id = b.contactos_id;
