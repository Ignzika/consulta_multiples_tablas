-- ejercicio 1

SELECT estudiantes.Nombre, cursos.nombre_curso
FROM estudiantes
INNER JOIN inscripciones ON estudiantes.estudiante_id = inscripciones.estudiante_id
INNER JOIN cursos ON inscripciones.curso_id = cursos.curso_id;


-- ejercicio 2

SELECT estudiantes.Nombre, cursos.nombre_curso
FROM estudiantes
LEFT JOIN inscripciones ON estudiantes.estudiante_id = inscripciones.estudiante_id
LEFT JOIN cursos ON inscripciones.curso_id = cursos.curso_id;


-- ejercicio 3

SELECT estudiantes.Nombre, cursos.nombre_curso
FROM estudiantes
FULL JOIN inscripciones ON estudiantes.estudiante_id = inscripciones.estudiante_id
FULL JOIN cursos ON inscripciones.curso_id = cursos.curso_id;

-- ejercicio 4

SELECT estudiantes.Nombre, cursos.nombre_curso
FROM estudiantes
CROSS JOIN cursos;



