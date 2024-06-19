use tp_final_siu_guarani;

-- 1. Seleccionar todos los alumnos junto con sus carreras
SELECT a.matricula, p.nombre, p.apellido, c.nombre AS carrera
FROM alumnos a
JOIN personas p ON a.personas_dni = p.dni
JOIN legajos l ON a.matricula = l.alumnos_matricula
JOIN carreras c ON l.carreras_id = c.id;

-- 2. Encontrar todos los alumnos cuyo apellido empieza con 'G'
SELECT a.matricula, p.nombre, p.apellido
FROM alumnos a
JOIN personas p ON a.personas_dni = p.dni
WHERE p.apellido LIKE 'G%';

-- 3. Calcular el promedio de las notas finales de un alumno específico
SELECT p.nombre, p.apellido, a.matricula, AVG(aef.nota) AS promedio_notas_finales
FROM alumnos a
JOIN alumnos_examenes_finales aef ON a.matricula = aef.alumnos_matricula
JOIN examenes_finales ef ON aef.Examenes_finales_id = ef.id
JOIN personas p ON a.personas_dni = p.dni
WHERE p.nombre = 'Juan'
GROUP BY a.matricula;

-- 4. Encontrar la nota de cursada más alta y más baja de una materia específica
SELECT m.nombre, MAX(ac.nota) AS nota_maxima, MIN(ac.nota) AS nota_minima
FROM alumnos_cursadas ac
JOIN cursadas c ON ac.cursadas_id = c.id
JOIN comisiones co ON co.id = c.comisiones_id
JOIN materias m ON m.id = co.materias_id
WHERE m.nombre = 'Matematica I';

-- 5. Listar todas las inscripciones realizadas en un rango de fechas
SELECT *
FROM inscripciones
WHERE fecha >= '2023-01-01' AND fecha <= '2023-12-31';

-- 6. Seleccionar los estudiantes que están en una carrera específica
-- y ordenarlos por apellido
SELECT a.matricula, p.apellido, p.nombre
FROM alumnos a
JOIN personas p ON a.personas_dni = p.dni
JOIN legajos l ON a.matricula = l.alumnos_matricula
JOIN carreras c ON c.id = l.carreras_id
WHERE c.nombre = 'Ingenieria en Sistemas de Informacion'
ORDER BY p.apellido ASC;

-- 7. Contar el número de docentes en cada departamento
SELECT d.nombre, COUNT(doc.cuil) AS cantidad_docentes
FROM docentes doc
JOIN comisiones co ON co.docentes_cuil = doc.cuil
JOIN materias m ON m.id = co.materias_id
JOIN planes_de_estudios pde ON pde.materias_id = m.id
JOIN carreras c ON c.id = pde.carreras_id
JOIN departamentos d ON d.id = c.departamentos_id
GROUP BY d.nombre;

-- 8. Obtener los datos de contacto de un alumno específico
SELECT a.matricula, c.email, c.telefono
FROM alumnos a
JOIN contactos c ON a.personas_dni = c.personas_dni
WHERE a.matricula = 'A-F67890';

-- 9. Listar las materias que tienen correlatividades
SELECT m.nombre AS materia, mc.nombre AS correlativa
FROM materias m
JOIN correlatividades c ON m.id = c.materias_id
JOIN materias mc ON mc.id = c.materias_id1;

-- 10. Mostrar el nombre del alumno y su aula para una determinada comisión
SELECT p.nombre, p.apellido, a.numero AS aula
FROM personas p
JOIN alumnos al ON al.personas_dni = p.dni
JOIN alumnos_cursadas ac ON ac.alumnos_matricula = al.matricula
JOIN cursadas cu ON ac.cursadas_id = cu.id
JOIN aulas a ON cu.aulas_id = a.id
WHERE cu.comisiones_id = 7;

-- 11. Obtener los email de alumnos que desaprobaron la cursada de una materia en particular.
SELECT a.matricula, p.nombre, p.apellido, c.email, ac.nota as nota
FROM contactos c
JOIN personas p ON p.dni = c.personas_dni
JOIN alumnos a ON p.dni = a.personas_dni
JOIN alumnos_cursadas ac ON a.matricula = ac.alumnos_matricula
JOIN cursadas cu ON cu.id = ac.cursadas_id
JOIN comisiones co ON co.id = cu.comisiones_id
JOIN materias m ON m.id = co.materias_id
WHERE m.nombre = 'Fisica II' AND ac.nota < 4
order by ac.nota;


-- 12. Calcular el promedio de notas de cursada de un alumno en específico.
SELECT p.nombre, p.apellido, a.matricula, AVG(ac.nota) AS prom_notas_cursada
FROM personas p
JOIN alumnos a ON a.personas_dni = p.dni
JOIN alumnos_cursadas ac ON ac.alumnos_matricula = a.matricula
WHERE p.dni = 34567890
GROUP BY a.matricula;


-- 13. Mostrar los 3 mejores alumnos de una carrera
-- (3 mejores notas -> 3 mejores PROMEDIOS)
SELECT a.matricula, p.nombre, p.apellido, AVG(aef.nota) as promedio_notas_finales
FROM personas p
JOIN alumnos a ON a.personas_dni = p.dni
JOIN alumnos_examenes_finales aef ON a.matricula = aef.alumnos_matricula
JOIN examenes_finales ef ON aef.examenes_finales_id = ef.id
JOIN comisiones c ON c.id = ef.comisiones_id
JOIN materias m ON m.id = c.materias_id
JOIN planes_de_estudios pde ON pde.materias_id = m.id
JOIN carreras ca ON ca.id = pde.carreras_id
WHERE ca.nombre = 'Ingenieria en Informatica'
GROUP BY a.matricula
ORDER BY promedio_notas_finales DESC
LIMIT 3;


-- 14. Obtener el docente con el promedio de notas de cursada más bajo
SELECT p.nombre, p.apellido, d.cuil, AVG(ac.nota) AS promedio_notas
FROM personas p
JOIN docentes d ON p.dni = d.personas_dni
JOIN comisiones co ON co.docentes_cuil = d.cuil
JOIN cursadas c ON c.comisiones_id = co.id
JOIN alumnos_cursadas ac ON ac.cursadas_id = c.id
GROUP BY d.cuil
ORDER BY promedio_notas ASC
LIMIT 1;


-- 15. Contar los edificios "grandes" (edificios con 10 aulas o más)
SELECT COUNT(e.id) AS Cant_Edif_Grandes
FROM edificios e
JOIN aulas a ON e.id = a.edificios_id
WHERE LENGTH(a.numero) > 1;
