-- Active: 1678489512358@@127.0.0.1@3306@parttime_34

-- DDL = Data Definition Lenguage

-- CREATE DATABASE

DROP DATABASE IF EXISTS parttime_34;
CREATE DATABASE IF NOT EXISTS parttime_34;

USE parttime_34;

DROP TABLE IF EXISTS contactos;

CREATE TABLE IF NOT EXISTS contactos (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL,
    email VARCHAR(120) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS telefonos;
CREATE TABLE IF NOT EXISTS telefonos (
    id INTEGER NOT NULL AUTO_INCREMENT,
    numero_telefonico VARCHAR(100) NOT NULL,
    contactos_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (contactos_id) REFERENCES contactos (id) -- CONSTRAINT 
);
DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
    follower_id INTEGER NOT NULL,
    followed_id INTEGER NOT NULL,
    PRIMARY KEY (follower_id, followed_id),
    FOREIGN KEY (follower_id) REFERENCES contactos (id), -- CONSTRAINT 
    FOREIGN KEY (followed_id) REFERENCES contactos (id) -- CONSTRAINT 
);

-- DML = Data Manipulation Language

-- SELECT, INSERT, UPDATE, DELETE  = (CRUD) = C => CREATE, R => READ, U => UPDATE, D => DELETE 
-- SELECT => READ, INSERT => CREATE, UPDATE => UPDATE, DELETE => DELETE 

-- SELECT * FROM table_name;
-- SELECT col1, col2, ...coln FROM table_name;

SELECT * FROM contactos; -- * => todos los campos

SELECT nombre, email FROM contactos;

SELECT id, nombre, email FROM contactos WHERE email='lrodriguez@4geeks.co';
SELECT * FROM contactos WHERE id > 100;

SELECT * FROM contactos WHERE email LIKE '%@gmail.com';

SELECT * FROM contactos WHERE nombre LIKE '%Juan%';

SELECT * FROM contactos WHERE id BETWEEN 100 AND 1000;

SELECT * FROM telefonos;
SELECT * FROM telefonos WHERE contactos_id = 1;


-- INSERT INTO table_name (field1, field2, ...fieldn) VALUES (value1, value2, ...valuen);

INSERT INTO contactos (nombre, email) VALUES ('John Doe', 'john.doe@gmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Jane Doe', 'jane.doe@hotmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Tommy Doe', 'jane.doe@hotmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Sara Smith', 'sara.smith@hotmail.com');

INSERT INTO contactos (nombre, email) VALUES ('Tom Holland', 'tom.holland@hotmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Will Smith', 'will.smith@hotmail.com');



INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-55', 1); -- Fine
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-10', 2); -- Fine
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-42', 1); -- Fine
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-80', 3); -- Error


-- UPDATE table_name SET field1=value1, field2=value2, ...fieldn=valuen WHERE condition;

UPDATE contactos SET email='john.doe@gmail.com' WHERE id = 1;

UPDATE telefonos SET numero_telefonico='555-55-13' WHERE contactos_id = 1; -- Error Actualiza mas de un registro


-- DELETE FROM table_name WHERE condition;

DELETE FROM telefonos WHERE id = 4;


SELECT * FROM contactos WHERE id in (1, 2, 3, 10, 11);

INSERT INTO followers (follower_id, followed_id) VALUES (1, 2);
INSERT INTO followers (follower_id, followed_id) VALUES (2, 1);
INSERT INTO followers (follower_id, followed_id) VALUES (3, 1);
INSERT INTO followers (follower_id, followed_id) VALUES (2, 3);


SELECT * FROM contactos AS a 
JOIN followers AS b ON a.id = b.follower_id
JOIN contactos AS c ON b.followed_id = c.id;


SELECT a.*, count(b.followed_id) AS followeds FROM contactos AS a
JOIN followers AS b ON a.id = b.followed_id GROUP BY b.followed_id;


SELECT 
c.nombre,
(SELECT count(f.follower_id) FROM followers AS f WHERE f.follower_id = c.id) AS followers
FROM contactos AS c WHERE c.nombre LIKE '%mi%';

