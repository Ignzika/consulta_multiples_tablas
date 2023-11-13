-- Crear la base de datos
CREATE DATABASE ejercicio_joins;
\c ejercicio_joins;

-- Crear la tabla de empleados
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT NOT NULL
);

-- Insertar algunos datos en la tabla de empleados
INSERT INTO empleados (nombre, salario, departamento_id) VALUES
    ('Juan Perez', 50000.00, 1),
    ('Ana Rodriguez', 60000.00, 2),
    ('Carlos García', 75000.00, 1),
    ('María López', 80000.00, 3),
    ('Pedro Martínez', 55000.00, 2),
    ('Paz Arancibia', 60000.00);

-- Crear la tabla de departamentos
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- Insertar algunos datos en la tabla de departamentos
INSERT INTO departamentos (nombre_departamento) VALUES
    ('Ventas'),
    ('Recursos Humanos'),
    ('Desarrollo');

-- Verificar los datos en las tablas
SELECT * FROM empleados;
SELECT * FROM departamentos;

-- INNER JOIN

-- Consulta con INNER JOIN
SELECT
    empleados.id,
    empleados.nombre AS nombre_empleado,
    empleados.salario,
    departamentos.nombre_departamento
FROM
    empleados
INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id;

-- Consulta con LEFT JOIN para obtener información sobre todos los empleados y sus departamentos (incluso si no tienen un departamento asociado)
SELECT
    empleados.id,
    empleados.nombre AS nombre_empleado,
    empleados.salario,
    departamentos.nombre_departamento
FROM
    empleados
LEFT JOIN
    departamentos ON empleados.departamento_id = departamentos.id;


-- Consulta con FULL JOIN para obtener información sobre todos los empleados y sus departamentos (incluso si no tienen un departamento asociado)
SELECT
    empleados.id AS empleado_id,
    empleados.nombre AS nombre_empleado,
    empleados.salario,
    departamentos.id AS departamento_id,
    departamentos.nombre_departamento
FROM
    empleados
FULL OUTER JOIN
    departamentos ON empleados.departamento_id = departamentos.id;


-- Consulta con CROSS JOIN para obtener todas las combinaciones posibles de empleados y departamentos
SELECT
    empleados.id AS empleado_id,
    empleados.nombre AS nombre_empleado,
    empleados.salario,
    departamentos.id AS departamento_id,
    departamentos.nombre_departamento
FROM
    empleados
CROSS JOIN
    departamentos;



-- cargar datos de ejemplo desde un archivo csv

-- si hay problemas de carga por encoding tratar de cargar el archivo con el siguiente comando
-- \copy countries from '/Users/fabianpino/Desktop/consulta_en_multiples_tablas/countries.csv' delimiter ',' csv header encoding 'UTF8';

-- y setear el encoding de la base de datos con el siguiente comando
-- SET CLIENT_ENCODING TO 'UTF8'; 


CREATE DATABASE paises;

\c paises

CREATE TABLE countries(
    id INTEGER,
    name VARCHAR,
    iso3 CHAR(3),
    capital VARCHAR,
    currency CHAR(3),
    currency_name VARCHAR,
    tid CHAR(3),
    region VARCHAR,
    subregion VARCHAR,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8)
);

\copy countries from '/Users/fabianpino/Desktop/consulta_en_multiples_tablas/countries.csv' delimiter ',' csv header;

CREATE TABLE states(
    id INTEGER,
    name VARCHAR,
    country_id INTEGER,
    state_code CHAR(5),
    state_type VARCHAR,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8)
);

\copy states from '/Users/fabianpino/Desktop/consulta_en_multiples_tablas/states.csv' delimiter ',' csv header;

CREATE TABLE cities(
    id INTEGER,
    name VARCHAR,
    state_id INTEGER,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8)
);

\copy cities from '/Users/fabianpino/Desktop/consulta_en_multiples_tablas/cities.csv' delimiter ',' csv header;

--corroboramos el ingreso de datos 

SELECT * FROM countries;
SELECT * FROM states;
SELECT * FROM cities;

-- ejemplo inner join

SELECT * FROM countries INNER JOIN states ON countries.id = states.country_id;

--limitando la consulta

SELECT * FROM countries INNER JOIN states on countries.id = states.country_id ORDER BY countries.latitude LIMIT(10);

--juntando 3 tablas

SELECT * FROM countries INNER JOIN states ON countries.id = states.country_id INNER JOIN cities ON countries.id = cities.state_id WHERE countries.name = 'Colombia' ORDER BY countries.latitude ASC LIMIT (10);

--ejemplo left join

SELECT * FROM countries LEFT JOIN states ON countries.id = states.country_id;

--ejemplo right join

SELECT * FROM countries RIGHT JOIN states ON countries.id = states.country_id;