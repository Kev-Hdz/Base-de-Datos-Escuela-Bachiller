USE escuela_db;






INSERT INTO tutor (nombre, apellido_paterno, apellido_materno, fecha_nacimiento, correo, telefono) VALUES
('Carlos', 'Mendoza', 'Ruiz', '1980-05-14 00:00:00', 'carlos.mendoza@email.com', '555-101-2020'),
('Elena', 'Gómez', 'Salazar', '1982-09-22 00:00:00', 'elena.gomez@email.com', '555-303-4040'),
('Roberto', 'Silva', 'Ortega', '1978-11-03 00:00:00', NULL, '555-505-6060');


INSERT INTO ciclo_escolar (nombre, fecha_inicio, fecha_fin) VALUES
('2026-1 (Enero - Junio)', '2026-01-15', '2026-06-30'),
('2026-2 (Agosto - Diciembre)', '2026-08-10', '2026-12-18');


INSERT INTO profesor (nombre, apellido_paterno, apellido_materno, fecha_nacimiento, correo, telefono, cedula, estado) VALUES
('Laura', 'Torres', 'Vega', '1985-03-10 00:00:00', 'ltorres@escuela.edu', '555-701-1122', 'CED-987654', 'Activo'),
('Miguel', 'Hernández', 'Cruz', '1979-07-19 00:00:00', 'mhernandez@escuela.edu', '555-702-3344', 'CED-123456', 'Activo'),
('Sofía', 'Ramírez', 'Paredes', '1990-12-01 00:00:00', 'sramirez@escuela.edu', '555-703-5566', 'CED-654321', 'Inactivo');


INSERT INTO materia (nombre, clave_materia, creditos, semestre_preferible) VALUES
('Bases de Datos Relacionales', 'INF-101', 8, 1),
('Programación Orientada a Objetos', 'INF-102', 8, 1),
('Cálculo Diferencial', 'MAT-101', 6, 1),
('Estructura de Datos', 'INF-201', 8, 2);


INSERT INTO aula (tipo_aula, nombre, capacidad) VALUES
('Laboratorio de Cómputo', 'Lab-A1', '30'),
('Salón Teórico', 'Aula-104', '40'),
('Auditorio', 'Magna-1', '120');




INSERT INTO alumno (nombre, apellido_paterno, apellido_materno, fecha_nacimiento, semestre_actual, id_tutor) VALUES
('Ana', 'Mendoza', 'López', '2007-04-12 00:00:00', 1, 1),
('Luis', 'Gómez', 'Pérez', '2007-08-25 00:00:00', 1, 2),
('Valeria', 'Silva', 'Martínez', '2006-11-30 00:00:00', 2, 3),
('Diego', 'Mendoza', 'López', '2007-04-12 00:00:00', 1, 1); 


INSERT INTO grupo (clave_grupo, semestre, turno, id_ciclo_escolar) VALUES
('1A-MAT', 1, 'Matutino', 1),
('2A-VES', 2, 'Vespertino', 1);


INSERT INTO clase (modalidad, estado, cupo, id_grupo, id_profesor, id_materia) VALUES
('Presencial', 'Abierta', 30, 1, 1, 1), -- Bases de Datos con Prof. Laura en grupo 1A-MAT
('Presencial', 'Abierta', 35, 1, 2, 3), -- Cálculo con Prof. Miguel en grupo 1A-MAT
('Híbrida', 'Abierta', 25, 2, 1, 4);    -- Estructura de Datos con Prof. Laura en grupo 2A-VES




INSERT INTO inscripciones (id_alumno, id_grupo, fecha) VALUES
(1, 1, '2026-01-10 09:30:00'),
(2, 1, '2026-01-10 10:15:00'),
(4, 1, '2026-01-10 11:00:00'),
(3, 2, '2026-01-11 16:20:00');


INSERT INTO carga_academica (id_alumno, id_clase, parcial_1, parcial_2, parcial_3) VALUES
(1, 1, 9.50, 9.80, 9.90),
(1, 2, 8.00, 8.50, 9.00),
(2, 1, 7.50, 8.00, 7.80), 
(4, 1, 6.00, 7.00, NULL), 
(3, 3, 9.20, 9.40, 9.60); 
INSERT INTO horarios (dia_semana, hora_inicio, hora_fin, id_clase, id_aula) VALUES
('Lunes', '08:00:00', '10:00:00', 1, 1),
('Miércoles', '08:00:00', '10:00:00', 1, 1),
('Martes', '10:00:00', '12:00:00', 2, 2),
('Jueves', '16:00:00', '18:00:00', 3, 1);
