\# escuela\_db



Base de datos relacional en MySQL para la gestión académica de nivel medio superior (alumnos, tutores, profesores, materias, grupos, aulas, carga académica y horarios).



\## Estructura del repositorio



\* `01\Script.sql` — Creación de la base de datos y definición de tablas, llaves primarias y foráneas.

\* `02\Script-1.sql` — Datos de prueba para poblar las tablas.

\* `03\Script-2.sql` — Consultas SQL (boletas de calificaciones, promedios y horarios por grupo).



\## Cómo ejecutar



1\. Abrir \*\*MySQL Workbench\*\* y conectarse a una instancia local de MySQL Server 8.0.

2\. Ejecutar `01\Script.sql` para generar la estructura.

3\. Ejecutar `02\Script-1.sql` para cargar los registros iniciales.

4\. Ejecutar las consultas de `03\Script-2.sql`.

