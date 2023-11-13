-- Crear la base de datos
CREATE DATABASE escuela;

-- Conectar a la base de datos
\c escuela

-- Crear la tabla Estudiantes
CREATE TABLE estudiantes (
    estudiante_id SERIAL,
    nombre VARCHAR(50),
    edad INT
);

-- Insertar datos en la tabla Estudiantes
INSERT INTO estudiantes (nombre, edad)
VALUES
    ('Juan', 20),
    ('María', 22),
    ('Carlos', 19);

-- Crear la tabla Cursos
CREATE TABLE cursos (
    curso_id SERIAL,
    nombre_curso VARCHAR(50)
);

-- Insertar datos en la tabla Cursos
INSERT INTO cursos (nombre_curso)
VALUES
    ('Matemáticas'),
    ('Historia'),
    ('Inglés');

-- Crear la tabla Inscripciones
CREATE TABLE inscripciones (
    estudiante_id INT,
    curso_id INT
);

-- Insertar datos en la tabla Inscripciones
INSERT INTO inscripciones (estudiante_id, curso_id)
VALUES
    (1, 1),  -- Juan está inscrito en Matemáticas
    (2, 2),  -- María está inscrita en Historia
    (3, 1);  -- Carlos está inscrito en Matemáticas


-- ejercicio 1  INNER JOIN

-- Obtén una lista de estudiantes junto con los nombres de los cursos en los que están inscritos.

--ejercicio 2  LEFT JOIN

-- Muestra todos los estudiantes y los cursos en los que están inscritos. Incluso si algunos estudiantes no están inscritos en ningún curso, deben aparecer en la lista.

-- ejercicio 3  FULL JOIN

-- Obtén una lista que incluya todos los estudiantes y todos los cursos, mostrando los nombres de los cursos en los que están inscritos los estudiantes. Incluso si algunos 
-- estudiantes no están inscritos en ningún curso o hay cursos sin estudiantes inscritos, deben aparecer en la lista.

-- ejercicio 4 CROSS JOIN

-- Queremos obtener todas las posibles combinaciones de estudiantes y cursos, mostrando el nombre del estudiante y el nombre del curso.