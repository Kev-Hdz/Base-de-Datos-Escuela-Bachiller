CREATE DATABASE IF NOT EXISTS escuela_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE escuela_db;



CREATE TABLE tutor (
id_tutor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido_paterno VARCHAR(100) NOT NULL,
apellido_materno VARCHAR(100) NOT NULL,
fecha_nacimiento DATETIME NOT NULL,
correo VARCHAR(150) NULL,
telefono VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE ciclo_escolar (
id_ciclo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE profesor (
id_profesor INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido_paterno VARCHAR(100) NOT NULL,
apellido_materno VARCHAR(100) NOT NULL,
fecha_nacimiento DATETIME NOT NULL,
correo VARCHAR(150) NULL,
telefono VARCHAR(20) NOT NULL,
cedula VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE materia (
id_materia INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(150) NOT NULL,
clave_materia VARCHAR(50) NOT NULL,
creditos INT NOT NULL,
semestre_preferible INT NOT NULL
) ENGINE=InnoDB;
CREATE TABLE aula (
id_aula INT AUTO_INCREMENT PRIMARY KEY,
tipo_aula VARCHAR(50) NOT NULL,
nombre VARCHAR(100) NOT NULL,
capacidad VARCHAR(50) NOT NULL
NOT NULL
) ENGINE=InnoDB;

-- 2. Tablas dependientes 
CREATE TABLE alumno (
id_alumno INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido_paterno VARCHAR(100) NOT NULL,
apellido_materno VARCHAR(100) NOT NULL,
fecha_nacimiento DATETIME NOT NULL,
semestre_actual INT NOT NULL,
id_tutor INT NOT NULL,
CONSTRAINT fk_alumno_tutor
FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE grupo (
id_grupo INT AUTO_INCREMENT PRIMARY KEY,
clave_grupo VARCHAR(50) NOT NULL,
semestre INT NULL,
turno VARCHAR(50) NULL,
id_ciclo_escolar INT NOT NULL,
CONSTRAINT fk_grupo_ciclo
FOREIGN KEY (id_ciclo_escolar) REFERENCES ciclo_escolar(id_ciclo)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE clase (
id_clase INT AUTO_INCREMENT PRIMARY KEY,
modalidad VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cupo INT NOT NULL,
id_grupo INT NOT NULL,
id_profesor INT NOT NULL,
id_materia INT NOT NULL,
CONSTRAINT fk_clase_grupo
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_clase_profesor
FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_clase_materia
FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE inscripciones (
id_alumno INT NOT NULL,
id_grupo INT NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY (id_alumno, id_grupo),
CONSTRAINT fk_inscripciones_alumno
FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_inscripciones_grupo
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE carga_academica (
id_alumno INT NOT NULL,
id_clase INT NOT NULL,
parcial_1 DECIMAL(3,2) NULL,
parcial_2 DECIMAL(3,2) NULL,
parcial_3 DECIMAL(3,2) NULL,
PRIMARY KEY (id_alumno, id_clase),
CONSTRAINT fk_carga_alumno
FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno)
ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_carga_clase
FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE horarios (
id_horario INT AUTO_INCREMENT PRIMARY KEY,
dia_semana VARCHAR(20) NOT NULL,
hora_inicio TIME NOT NULL,
hora_fin TIME NOT NULL,
id_clase INT NOT NULL,
id_aula INT NOT NULL,
CONSTRAINT fk_horarios_clase
FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_horarios_aula
FOREIGN KEY (id_aula) REFERENCES aula(id_aula)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;