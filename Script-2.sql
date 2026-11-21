USE escuela_db;

-- Boleta de calificaciones y promedio por alumno
SELECT 
    CONCAT(a.nombre, ' ', a.apellido_paterno, ' ', a.apellido_materno) AS alumno,
    m.clave_materia,
    m.nombre AS materia,
    ca.parcial_1,
    ca.parcial_2,
    ca.parcial_3,
    ROUND((IFNULL(ca.parcial_1, 0) + IFNULL(ca.parcial_2, 0) + IFNULL(ca.parcial_3, 0)) / 3, 2) AS promedio_general
FROM carga_academica ca
INNER JOIN alumno a ON ca.id_alumno = a.id_alumno
INNER JOIN clase c ON ca.id_clase = c.id_clase
INNER JOIN materia m ON c.id_materia = m.id_materia
ORDER BY alumno, m.nombre;

-- Horario completo por grupo
SELECT 
    g.clave_grupo,
    g.turno,
    h.dia_semana,
    h.hora_inicio,
    h.hora_fin,
    m.nombre AS materia,
    au.nombre AS aula,
    au.tipo_aula,
    CONCAT(p.nombre, ' ', p.apellido_paterno) AS profesor
FROM horarios h
INNER JOIN clase c ON h.id_clase = c.id_clase
INNER JOIN grupo g ON c.id_grupo = g.id_grupo
INNER JOIN materia m ON c.id_materia = m.id_materia
INNER JOIN aula au ON h.id_aula = au.id_aula
INNER JOIN profesor p ON c.id_profesor = p.id_profesor
WHERE g.clave_grupo = '1A-MAT'
ORDER BY FIELD(h.dia_semana, 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'), h.hora_inicio;

-- Control de cupo
SELECT 
    c.id_clase,
    g.clave_grupo,
    m.nombre AS materia,
    c.cupo AS cupo_maximo,
    COUNT(ca.id_alumno) AS alumnos_inscritos,
    (c.cupo - COUNT(ca.id_alumno)) AS lugares_disponibles
FROM clase c
INNER JOIN grupo g ON c.id_grupo = g.id_grupo
INNER JOIN materia m ON c.id_materia = m.id_materia
LEFT JOIN carga_academica ca ON c.id_clase = ca.id_clase
GROUP BY c.id_clase, g.clave_grupo, m.nombre, c.cupo;

-- Directorio de alumnos y sus tutores
SELECT 
    CONCAT(a.nombre, ' ', a.apellido_paterno) AS alumno,
    a.semestre_actual,
    CONCAT(t.nombre, ' ', t.apellido_paterno, ' ', t.apellido_materno) AS tutor,
    t.telefono,
    IFNULL(t.correo, 'Sin correo registrado') AS correo_tutor
FROM alumno a
INNER JOIN tutor t ON a.id_tutor = t.id_tutor
ORDER BY tutor, alumno;

-- Carga docente
SELECT 
    CONCAT(p.nombre, ' ', p.apellido_paterno) AS profesor,
    p.cedula,
    COUNT(c.id_clase) AS total_clases,
    IFNULL(SUM(m.creditos), 0) AS total_creditos_asignados
FROM profesor p
LEFT JOIN clase c ON p.id_profesor = c.id_profesor
LEFT JOIN materia m ON c.id_materia = m.id_materia
WHERE p.estado = 'Activo'
GROUP BY p.id_profesor, profesor, p.cedula;