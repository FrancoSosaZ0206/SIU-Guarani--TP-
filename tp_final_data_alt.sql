use tp_final_siu_guarani;

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
