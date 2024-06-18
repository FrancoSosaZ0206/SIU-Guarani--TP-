-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Base de datos tp_final_siu_guarani
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS tp_final_siu_guarani;
USE tp_final_siu_guarani;

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
