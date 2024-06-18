/* TRABAJO PRACTICO FINAL

Tema: SIU Guarani
Materia: Introduccion a las Bases de Datos (IBD)
Alumno: SOSA Franco Nahuel (DNI 43.265.222)
Docente: Nicolas Perez

-- -----------------------------------------------------

LINK AL DER: https://github.com/FrancoSosaZ0206/SIU-Guarani--TP-/blob/main/tp_final_der.svg
LINK AL VIDEO EXPLICATIVO: [paste here]

*/



-- -----------------------------------------------------
-- CREACION DE LA BASE DE DATOS
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS tp_43265222_SOSA;
USE tp_43265222_SOSA;

-- -----------------------------------------------------
-- Tabla personas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS personas (
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  dni INT NOT NULL PRIMARY KEY
);


-- -----------------------------------------------------
-- Tabla alumnos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alumnos (
  matricula VARCHAR(10) NOT NULL PRIMARY KEY,
  personas_dni INT NOT NULL,
  CONSTRAINT alumno_es_persona
    FOREIGN KEY (personas_dni)
    REFERENCES personas (dni)
);


-- -----------------------------------------------------
-- Tabla docentes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS docentes (
    matricula VARCHAR(10) NOT NULL,
    cuil BIGINT NOT NULL PRIMARY KEY,
    personas_dni INT NOT NULL,
    CONSTRAINT docente_es_persona
      FOREIGN KEY (personas_dni)
	    REFERENCES personas (dni)
);


-- -----------------------------------------------------
-- Tabla materias
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS materias (
  nombre VARCHAR(50) NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);


-- -----------------------------------------------------
-- Tabla comisiones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comisiones (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  docentes_cuil BIGINT NOT NULL,
  materias_id INT NOT NULL,
  cupos_maximos INT NULL,
  CONSTRAINT docente_imparte_comisiones
    FOREIGN KEY (docentes_cuil)
    REFERENCES docentes (cuil),
  CONSTRAINT materia_tiene_comisiones
    FOREIGN KEY (materias_id)
    REFERENCES materias (id)
);


-- -----------------------------------------------------
-- Tabla edificios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS edificios (
    nombre VARCHAR(50) NOT NULL,
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);


-- -----------------------------------------------------
-- Tabla aulas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS aulas (
  numero INT NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  edificios_id INT NOT NULL,
  CONSTRAINT fk_aulas_edificios1
    FOREIGN KEY (edificios_id)
    REFERENCES edificios (id)
);


-- -----------------------------------------------------
-- Tabla departamentos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS departamentos (
    nombre VARCHAR(50) NOT NULL,
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    edificios_id INT NOT NULL,
    CONSTRAINT fk_departamentos_edificios
    FOREIGN KEY (edificios_id)
    REFERENCES edificios (id)
);


-- -----------------------------------------------------
-- Tabla carreras
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS carreras (
  nombre VARCHAR(50) NOT NULL,
  id INT NOT NULL primary key AUTO_INCREMENT,
  departamentos_id int not null,
  CONSTRAINT fk_departamentos_carreras
    FOREIGN KEY (departamentos_id)
    REFERENCES departamentos (id)
);


-- -----------------------------------------------------
-- Tabla contactos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS contactos (
  email VARCHAR(50) NOT NULL,
  telefono INT NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  personas_dni INT NOT NULL,
  CONSTRAINT fk_contactos_Personas1
    FOREIGN KEY (personas_dni)
    REFERENCES personas (dni)
);


-- -----------------------------------------------------
-- Tabla correlatividades
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS correlatividades (
  materias_id INT NOT NULL,
  materias_id1 INT NOT NULL,
  PRIMARY KEY (materias_id, materias_id1),
  CONSTRAINT fk_materias_has_materias_materias1
    FOREIGN KEY (materias_id)
    REFERENCES materias (id),
  CONSTRAINT fk_materias_has_materias_materias2
    FOREIGN KEY (materias_id1)
    REFERENCES materias (id)
);


-- -----------------------------------------------------
-- Tabla turnos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS turnos (
  turno VARCHAR(2) NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);


-- -----------------------------------------------------
-- Tabla horarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS horarios (
  inicio DATETIME NOT NULL,
  fin DATETIME NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  turnos_id INT NOT NULL,
  CONSTRAINT fk_horarios_turnos1
    FOREIGN KEY (turnos_id)
    REFERENCES turnos (id)
);


-- -----------------------------------------------------
-- Tabla modalidades
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS modalidades (
  tipo VARCHAR(50) NOT NULL,
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);


-- -----------------------------------------------------
-- Tabla examenes_finales
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS examenes_finales (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  comisiones_id INT NOT NULL,
  aulas_id INT NOT NULL,
  horarios_id INT NOT NULL,
  CONSTRAINT fk_Examenes_Finales_comisiones
    FOREIGN KEY (comisiones_id)
    REFERENCES comisiones (id),
  CONSTRAINT fk_Examenes_Finales_aulas
    FOREIGN KEY (aulas_id)
    REFERENCES aulas (id),
  CONSTRAINT fk_Examenes_Finales_horarios
    FOREIGN KEY (horarios_id)
    REFERENCES horarios (id)
);


-- -----------------------------------------------------
-- Tabla alumnos_examenes_finales
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Alumnos_Examenes_Finales (
    alumnos_matricula VARCHAR(10) NOT NULL,
    Examenes_Finales_id INT NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (alumnos_matricula, Examenes_Finales_id),
    CONSTRAINT fk_Examenes_Finales_has_alumnos
        FOREIGN KEY (alumnos_matricula)
        REFERENCES alumnos (matricula),
    CONSTRAINT fk_Alumnos_has_Examenes_Finales
        FOREIGN KEY (Examenes_Finales_id)
        REFERENCES Examenes_Finales (id)
);


-- -----------------------------------------------------
-- Tabla cursadas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cursadas (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  horarios_id INT NOT NULL,
  modalidades_id INT NOT NULL,
  comisiones_id INT NOT NULL,
  aulas_id INT NOT NULL,
  CONSTRAINT fk_cursadas_aulas
      FOREIGN KEY (aulas_id)
      REFERENCES aulas (id),
  CONSTRAINT fk_cursadas_comisiones
      FOREIGN KEY (comisiones_id)
      REFERENCES comisiones (id),
  CONSTRAINT fk_cursadas_horarios
      FOREIGN KEY (horarios_id)
      REFERENCES horarios (id),
  CONSTRAINT fk_cursadas_modalidades
      FOREIGN KEY (modalidades_id)
      REFERENCES modalidades (id)
);


-- -----------------------------------------------------
-- Tabla examenes_finales_alumnos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Alumnos_Cursadas (
    alumnos_matricula VARCHAR(10) NOT NULL,
    cursadas_id INT NOT NULL,
    nota INT NOT NULL,
    PRIMARY KEY (alumnos_matricula, cursadas_id),
    CONSTRAINT fk_alumnos_has_cursadas
        FOREIGN KEY (cursadas_id)
        REFERENCES cursadas (id),
    CONSTRAINT fk_cursadas_has_alumnos
        FOREIGN KEY (alumnos_matricula)
        REFERENCES alumnos (matricula)
);


-- -----------------------------------------------------
-- Tabla inscripciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS inscripciones (
  alumnos_matricula VARCHAR(10) NOT NULL,
  materias_id INT NOT NULL,
  fecha DATETIME NULL,
  nro_tramite INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  CONSTRAINT fk_alumnos_has_materias_alumnos1
    FOREIGN KEY (alumnos_matricula)
    REFERENCES alumnos (matricula),
  CONSTRAINT fk_alumnos_has_materias_materias1
    FOREIGN KEY (materias_id)
    REFERENCES materias (id)
);


-- -----------------------------------------------------
-- Tabla legajos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS legajos (
  carreras_id INT NOT NULL,
  alumnos_matricula VARCHAR(10) NOT NULL,
  PRIMARY KEY (carreras_id, alumnos_matricula),
  CONSTRAINT fk_carreras_has_alumnos_alumnos1
    FOREIGN KEY (alumnos_matricula)
    REFERENCES alumnos (matricula),
  CONSTRAINT fk_carreras_has_alumnos_carreras1
    FOREIGN KEY (carreras_id)
    REFERENCES carreras (id)
);


-- -----------------------------------------------------
-- Tabla Planes_De_Estudios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Planes_De_Estudios (
    carreras_id INT NOT NULL,
    materias_id INT NOT NULL,
    PRIMARY KEY (carreras_id , materias_id),
    CONSTRAINT fk_carreras_has_materias_carreras1
        FOREIGN KEY (carreras_id)
        REFERENCES carreras (id),
    CONSTRAINT fk_carreras_has_materias_materias1
        FOREIGN KEY (materias_id)
        REFERENCES materias (id)
);




















-- -----------------------------------------------------
-- INSERCION DE REGISTROS:
-- -----------------------------------------------------


use tp_43265222_SOSA;

INSERT INTO Personas
(nombre,     apellido,      dni) VALUES 
('Juan',     'Perez',       12345678),
('Maria',    'Gomez',       23456789),
('Carlos',   'Rodriguez',   34567890),
('Ana',      'Fernandez',   45678901),
('Luis',     'Lopez',       56789012),
('Laura',    'Martinez',    67890123),
('Jose',     'Garcia',      78901234),
('Marta',    'Sanchez',     89012345),
('Pedro',    'Martin',      90123456),
('Sofia',    'Jimenez',     11234567),
('Diego',    'Ruiz',        87654321),
('Natalia',  'Hernandez',   76543210),
('Sergio',   'Diaz',        65432109),
('Andrea',   'Torres',      54321098),
('Fernando', 'Vazquez',     43210987),
('Lucia',    'Ramos',       32109876),
('Alberto',  'Moreno',      21098765),
('Patricia', 'Romero',      10987654),
('Roberto',  'Gutierrez',   99876543),
('Daniela',  'Navarro',     88776655);

INSERT INTO Alumnos
(matricula,  personas_dni) VALUES 
('A-A12345', 12345678),
('A-B23456', 23456789),
('A-C34567', 34567890),
('A-D45678', 45678901),
('A-E56789', 56789012),
('A-F67890', 67890123),
('A-G78901', 78901234),
('A-H89012', 89012345),
('A-I90123', 90123456),
('A-J01234', 11234567);

INSERT INTO Docentes
(matricula,  cuil,        personas_dni) VALUES 
('D-A12345', 20876543211, 87654321),
('D-B23456', 27765432102, 76543210),
('D-C34567', 20654321093, 65432109),
('D-D45678', 27543210984, 54321098),
('D-E56789', 20432109875, 43210987);

INSERT INTO contactos (email, telefono, personas_dni) VALUES
('juanperez@example.com',            11111111,       12345678),
('mariagomez@example.com',           22222222,       23456789),
('carlosrodriguez@example.com',      33333333,       34567890),
('anafernandez@example.com',         44444444,       45678901),
('luislopez@example.com',            55555555,       56789012),
('lauramartinez@example.com',        66666666,       67890123),
('josegarcia@example.com',           77777777,       78901234),
('martasanchez@example.com',         88888888,       89012345),
('pedromartin@example.com',          99999999,       90123456),
('sofiajimenez@example.com',         10101010,       11234567),
('diegoruiz@example.com',            12121212,       87654321),
('nataliahernandez@example.com',     13131313,       76543210),
('sergiodiaz@example.com',           14141414,       65432109),
('andreatorres@example.com',         15151515,       54321098),
('fernandovazquez@example.com',      16161616,       43210987),
('luciaramos@example.com',           17171717,       32109876),
('albertomoreno@mail.com',           18181818,       21098765),
('patriciaromero@example.com',       19191919,       10987654),
('robertogutierrez@example.com',     20202020,       99876543),
('danielanavarro@example.com',       21212121,       88776655);

insert into edificios (nombre) values
('Jose Hernandez'),
('Comedor Universitario Padre Mujica'),
('Estudio de Grabacion E. S. Discepolo'),
('Lola Mora'),
('Hernandez Arregui'),
('Gimnasio Comunitario Gatica'),
('Quincho Roberto Fontanarrosa'),
('Juana Manso'),
('Inadi'),
('Campo de deportes Delfo Cabrera'),
('Irna Laciar de Carrica'),
('Leonardo Werthein'),
('Oscar Varsavsky'),
('Jardin Maternal A. Villaflor'),
('Hector Oesterheld'),
('Cine Tita Merello'),
('Casa del Estudiante'),
('Lisandro de la Torre'),
('Macedonio Fernandez'),
('Raul Scalabrini Ortiz'),
('Arturo Jauretche'),
('Manuel Ugarte'),
('Homero Manzi'),
('Ortega Pena'),
('Leopoldo Marechal'),
('Juana Azurduy'),
('Pascual Contursi'),
('Nestor Kirchner');

INSERT INTO departamentos (nombre, edificios_id) VALUES
('Desarrollo Productivo y Tecnologico',  1),
('Humanidades y Artes',                 25),
('Planificacion y Politicas Publicas',  14),
('Salud Comunitaria',                   22);

INSERT INTO Carreras (nombre, departamentos_id) VALUES
('Licenciatura en Economia',                       4),
('Ingenieria en Informatica',                      3),
('Licenciatura en Administracion',                 1),
('Ingenieria Industrial',                          2),
('Licenciatura en Ciencias Ambientales',           1),
('Licenciatura en Comunicacion Social',            3),
('Licenciatura en Diseno de Comunicacion Visual',  4),
('Licenciatura en Educacion',                      2),
('Ingenieria en Electronica',                      3),
('Ingenieria en Sistemas de Informacion',          2);

INSERT INTO legajos
(carreras_id, alumnos_matricula) VALUES
(1,             'A-A12345'),
(1,             'A-B23456'),
(1,             'A-C34567'),
(1,             'A-D45678'),
(1,             'A-E56789'),
(2,             'A-F67890'),
(2,             'A-G78901'),
(2,             'A-H89012'),
(2,             'A-I90123'),
(2,             'A-J01234'),
(3,             'A-A12345'),
(3,             'A-B23456'),
(3,             'A-C34567'),
(3,             'A-D45678'),
(3,             'A-E56789'),
(4,             'A-F67890'),
(4,             'A-G78901'),
(4,             'A-H89012'),
(4,             'A-I90123'),
(4,             'A-J01234'),
(5,             'A-A12345'),
(5,             'A-B23456'),
(5,             'A-C34567'),
(5,             'A-D45678'),
(5,             'A-E56789'),
(6,             'A-F67890'),
(6,             'A-G78901'),
(6,             'A-H89012'),
(6,             'A-I90123'),
(6,             'A-J01234'),
(7,             'A-A12345'),
(7,             'A-B23456'),
(7,             'A-C34567'),
(7,             'A-D45678'),
(7,             'A-E56789'),
(8,             'A-F67890'),
(8,             'A-G78901'),
(8,             'A-H89012'),
(8,             'A-I90123'),
(8,             'A-J01234'),
(9,             'A-A12345'),
(9,             'A-B23456'),
(9,             'A-C34567'),
(9,             'A-D45678'),
(9,             'A-E56789'),
(10,            'A-F67890'),
(10,            'A-G78901'),
(10,            'A-H89012'),
(10,            'A-I90123'),
(10,            'A-J01234');

insert into Materias (nombre) values
('Matematica I'),
('Introduccion a la Economia'),
('Algoritmos y Programacion'),
('Contabilidad I'),
('Fisica I'),
('Programacion Avanzada'),
('Estadistica'),
('Microeconomia'),
('Economia Internacional'),
('Algebra Lineal'),
('Ingles I'),
('Gestion Empresarial'),
('Derecho Empresarial'),
('Macroeconomia'),
('Fisica II'),
('Probabilidad y Estadistica'),
('Base de Datos'),
('Econometria'),
('Matematica Financiera'),
('Historia Economica'),
('Teoria de Juegos'),
('Economia del Desarrollo'),
('Finanzas Corporativas'),
('Econometria Avanzada'),
('Sociologia Economica');

insert into planes_de_estudios (carreras_id, materias_id) values 
(1, 1),  (1, 2),  (1, 3),  (1, 4),  (1, 5),
(2, 6),  (2, 7),  (2, 8),  (2, 9),  (2, 10),
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
(5, 21), (5, 22), (5, 23), (5, 24), (5, 25);

insert into turnos (turno) values
('TM'),
('TT'),
('TN');

INSERT INTO aulas
(numero, edificios_id) VALUES
(12,        15),
(5,         22),
(18,        10),
(9,         4),
(3,         19),
(7,         11),
(20,        8),
(14,        26),
(6,         2),
(10,        23),
(17,        12),
(2,         16),
(16,        1),
(8,         24),
(11,        5),
(4,         20),
(19,        14),
(13,        6),
(1,         25),
(15,        3),
(12,        21),
(5,         7),
(18,        17),
(9,         13),
(3,         18);

insert into modalidades (tipo) values
('Presencial'),
('Virtual Sincronica'),
('Virtual Asincronica'),
('Mixta');

INSERT INTO correlatividades
(materias_id, materias_id1) VALUES
(1,             2),
(2,             5),
(3,             4),
(4,             7),
(5,             6),
(6,             9),
(7,             8),
(8,             11),
(9,             10),
(10,            13),
(11,            12),
(12,            15),
(13,            14),
(14,            17),
(15,            16),
(16,            19),
(17,            18),
(18,            21),
(19,            20),
(20,            23),
(21,            22),
(22,            1),
(23,            24),
(24,            3),
(25,            2);

INSERT INTO comisiones
(docentes_cuil, materias_id, cupos_maximos) VALUES
(20876543211,  12,                  45),
(27765432102,  6,                   120),
(20654321093,  22,                  75),
(27543210984,  3,                   30),
(20432109875,  14,                  100),
(20876543211,  13,                  90),
(27765432102,  1,                   15),
(20654321093,  20,                  60),
(27543210984,  10,                  110),
(20432109875,  19,                  50),
(27543210984,  15,                  34);

INSERT INTO horarios (inicio, fin, turnos_id) VALUES
('2024-06-14 08:00:00', '2024-06-14 10:00:00', 1),
('2024-06-15 09:00:00', '2024-06-15 11:00:00', 1),
('2024-06-16 14:00:00', '2024-06-16 16:00:00', 2),
('2024-06-17 16:00:00', '2024-06-17 18:00:00', 2),
('2024-06-18 19:00:00', '2024-06-18 21:00:00', 3),
('2024-06-19 20:00:00', '2024-06-19 22:00:00', 3),
('2024-06-20 07:00:00', '2024-06-20 09:00:00', 1),
('2024-06-21 13:00:00', '2024-06-21 15:00:00', 2),
('2024-06-22 15:00:00', '2024-06-22 17:00:00', 2),
('2024-06-23 18:00:00', '2024-06-23 20:00:00', 3);


INSERT INTO cursadas
(horarios_id, modalidades_id, comisiones_id, aulas_id) VALUES
(1,           2,              7,             9),
(8,           4,              3,             20),
(2,           1,              5,             6),
(4,           3,              1,             14),
(5,           2,              9,             11),
(3,           4,              6,             2),
(7,           1,              10,            15),
(10,          3,              8,             4),
(9,           2,              4,             8),
(6,           4,              2,             1),
(4,           1,              11,            25);

INSERT INTO Alumnos_Cursadas
(alumnos_matricula, cursadas_id, nota) VALUES
('A-A12345',        1,              7),
('A-A12345',        2,              4),
('A-A12345',        3,              9),
('A-A12345',        4,              2),
('A-A12345',        5,              8),
('A-B23456',        6,              3),
('A-B23456',        7,              5),
('A-B23456',        8,              6),
('A-B23456',        9,              10),
('A-B23456',        10,             1),
('A-C34567',        1,              8),
('A-C34567',        2,              2),
('A-C34567',        3,              7),
('A-C34567',        4,              5),
('A-C34567',        5,              3),
('A-D45678',        6,              6),
('A-D45678',        7,              9),
('A-D45678',        8,              4),
('A-D45678',        9,              7),
('A-D45678',        10,             3),
('A-E56789',        1,              1),
('A-E56789',        2,              10),
('A-E56789',        3,              5),
('A-E56789',        4,              8),
('A-E56789',        5,              6),
('A-F67890',        6,              3),
('A-F67890',        7,              7),
('A-F67890',        8,              4),
('A-F67890',        9,              9),
('A-F67890',        10,             2),
('A-G78901',        1,              6),
('A-G78901',        2,              3),
('A-G78901',        3,              8),
('A-G78901',        4,              1),
('A-G78901',        5,              5),
('A-H89012',        6,              9),
('A-H89012',        7,              2),
('A-H89012',        8,              7),
('A-H89012',        9,              4),
('A-H89012',        10,             8),
('A-I90123',        1,              4),
('A-I90123',        2,              6),
('A-I90123',        3,              3),
('A-I90123',        4,              10),
('A-I90123',        5,              7),
('A-J01234',        6,              2),
('A-J01234',        7,              8),
('A-J01234',        8,              1),
('A-J01234',        9,              5),
('A-J01234',        10,             9),
('A-A12345',        11,             4),
('A-B23456',        11,             2),
('A-C34567',        11,             3),
('A-D45678',        11,             1),
('A-E56789',        11,             8),
('A-F67890',        11,             4),
('A-G78901',        11,             3),
('A-H89012',        11,             1),
('A-I90123',        11,             10),
('A-J01234',        11,             2);

INSERT INTO examenes_finales
(comisiones_id, aulas_id, horarios_id) VALUES
(7,             10,         3),
(3,             15,         1),
(9,             5,          8),
(1,             20,         4),
(5,             25,         6),
(8,             8,          2),
(2,             12,         7),
(6,             3,          9),
(4,             18,         5),
(10,            22,         10);

INSERT INTO alumnos_examenes_finales
(alumnos_matricula, examenes_finales_id, nota) VALUES
('A-A12345',        1,                      1),
('A-A12345',        2,                      5),
('A-A12345',        3,                      5),
('A-A12345',        4,                      9),
('A-A12345',        5,                      7),
('A-A12345',        6,                      6),
('A-A12345',        7,                      4),
('A-A12345',        8,                      9),
('A-A12345',        9,                      10),
('A-B23456',        8,                      2),
('A-C34567',        1,                      7),
('A-D45678',        7,                      8),
('A-E56789',        2,                      4),
('A-F67890',        10,                     4),
('A-G78901',        5,                      10),
('A-H89012',        6,                      6),
('A-I90123',        4,                      9),
('A-J01234',        9,                      2),
('A-B23456',        7,                      4),
('A-C34567',        7,                      1),
('A-E56789',        7,                      8),
('A-F67890',        7,                      7),
('A-G78901',        7,                      9),
('A-H89012',        7,                      2),
('A-I90123',        7,                      5),
('A-J01234',        7,                      6),
('A-B23456',        3,                      4),
('A-C34567',        3,                      1),
('A-E56789',        3,                      3),
('A-F67890',        3,                      8),
('A-G78901',        3,                      9),
('A-H89012',        3,                      6),
('A-I90123',        3,                      10),
('A-J01234',        3,                      7);

INSERT INTO inscripciones
(alumnos_matricula, materias_id, fecha) VALUES
('A-A12345', 17, '2019-05-15 08:30:00'),
('A-B23456', 3, '2020-03-12 09:00:00'),
('A-C34567', 22, '2021-02-25 14:15:00'),
('A-D45678', 9, '2022-01-19 11:45:00'),
('A-E56789', 25, '2023-04-10 16:30:00'),
('A-F67890', 12, '2023-06-22 10:00:00'),
('A-G78901', 4, '2022-07-18 13:30:00'),
('A-H89012', 21, '2021-08-29 15:45:00'),
('A-I90123', 7, '2020-09-14 08:00:00'),
('A-J01234', 19, '2019-10-05 17:15:00');




















-- -----------------------------------------------------
-- CONSULTAS:
-- -----------------------------------------------------


use tp_43265222_SOSA;

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
JOIN contactos c ON a.personas_dni = c.Personas_dni
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
