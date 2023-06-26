-- Active: 1687754316799@@127.0.0.1@3306@Bsd_1

-- DDL = Data Definition Language

-- CREATE DATABASE

DROP DATABASE IF EXISTS Bsd_1;
CREATE DATABASE IF NOT EXISTS Bsd_1;

USE Bsd_1;

DROP TABLE IF EXISTS contactos;

CREATE TABLE IF NOT EXISTS contactos (

    id INTEGER NOT NULL AUTO_INCREMENT, -- Este Dato es Obligatorio
    nombre VARCHAR(120) NOT NULL,
    email VARCHAR(120) NULL,
    PRIMARY KEY (id),
    

);


DROP TABLE IF EXISTS telefonos;
CREATE TABLE IF NOT EXISTS telefonos (

   id INTEGER NOT NULL AUTO_INCREMENT,
   numero_telefonico VARCHAR(100) NOT NULL,
   contactos_id INTEGER NOT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (contactos_id) REFERENCES contactos (id) -- CONSTRAINT 

);

-- DML = Data Manipulation Language
-- SELECT, INSERT, UPDATE, DELETE = (CRUD) C = Cread, R = Read, U = Update, D = Delete.
-- SELECT => READ, INSERT => CREATE, UPDATE => UPDATE, DELETE => DELETE.

-- SELECT * FROM table_name;
-- SELECT col1, col2, ... colN FROM table_name;

SELECT * FROM contactos;
SELECT nombre, email FROM contactos;
SELECT id, nombre, email FROM contactos WHERE email = 'ronald.micros@gmail.com';
SELECT * FROM contactos WHERE id > 100;
SELECT * FROM contactos WHERE email LIKE '%@gmail.com';
SELECT * FROM contactos WHERE email LIKE '%@hotmail.com';
SELECT * FROM contactos WHERE nombre LIKE '%Juan%';
SELECT * FROM contactos WHERE id BETWEEN 100 AND 1000;

SELECT * FROM telefonos WHERE contactos_id = 1;
SELECT * FROM telefonos WHERE contactos_id = 2;
SELECT * FROM telefonos WHERE contactos_id = 3;

-- INSERT INTO table_name (field1, field2, fieldN) VALUES (value1, value2, ...valueN);

INSERT INTO contactos (nombre, email) VALUES ('John Doe', 'john.doe@gmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Jane Doe', 'jane.doe@hotmail.com');
INSERT INTO contactos (nombre, email) VALUES ('Ronald Pena', 'ronald.micros@gmail.com');

INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-551', 1);
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-552', 2);
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('555-55-553', 1);
INSERT INTO telefonos (numero_telefonico, contactos_id) VALUES ('964-216-817', 3);

-- UPDATE table_name SET field1 = value1, field2 = value2, ...fieldN = valueN WHERE condition;

UPDATE contactos SET email = 'jane.doe@gmail.com' WHERE id = 2;