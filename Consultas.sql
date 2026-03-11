-- aqui hablitamos el uso de las claves foraneas
PRAGMA foreign_keys = ON;

-- creamos una tabla para las clases
CREATE TABLE Clases (
    id_clase INTEGER PRIMARY KEY,
    nombre_clase TEXT NOT NULL,
    dia TEXT NOT NULL,
    horario TEXT NOT NULL
);

-- tabla para los miembros del gym
CREATE TABLE Miembros (
    cedula INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    telefono TEXT NOT NULL
);

-- esta es la tabla intermedia porque tenemos una relacion de muchos a muchos N:M
CREATE TABLE IF NOT EXISTS Inscripcion (
    id_inscripcion INTEGER PRIMARY KEY,
    cedula INTEGER NOT NULL,
    id_clase INTEGER NOT NULL,
    FOREIGN KEY (cedula) REFERENCES Miembros (cedula),
    FOREIGN KEY (id_clase) REFERENCES Clases (id_clase)
);

Insertar Miembros
INSERT INTO
    Miembros (cedula, nombre, apellido, telefono)
VALUES (
        '40212345678',
        'Juan',
        'Soto',
        '8093457821'

    ),
    (
        '00123456789',
        'Julio',
        'Rodriguez',
        '8296149053'
    ),
    (
        '03198765432',
        'Vladimir',
        'Guerrero',
        '8492734689'
    ),
    (
        '40287654321',
        'Rafael',
        'Devers',
        '8095561294'
    ),
    (
        '22345678901',
        'Fernando',
        'Tatis',
        '8494465081'
    );

Insertar Clases
INSERT INTO
    Clases (id_clase, nombre_clase, dia, horario)
VALUES (
        '401',
        'Boxeo Fitness',
        'Lunes',
        '6 a 7 a.m'

    ),
    (
        '402',
        'Aerobicos',
        'Martes',
        '7 a 8 p.m'
    ),
    (
        '403',
        'Bachata',
        'Miercoles',
        '5 a 6 p.m'
    ),
    (
        '404',
        'Zumba',
        'Jueves',
        '8 a 9 a.m'
    ),
    (
        '405',
        'Yoga',
        'Viernes',
        '6 a 7 p.m'
    );

Insertar Inscripciones
INSERT INTO Inscripcion (id_inscripcion, cedula, id_clase)
VALUES
(1, 40212345678, 401),
(2, 00123456789, 402),
(3, 03198765432, 403),
(4, 40287654321, 404),
(5, 22345678901, 405);

Consulta con tablas relacionadas
SELECT
    Miembros.cedula,
    Miembros.nombre,
    Miembros.apellido,
    Inscripcion.id_inscripcion,
    Inscripcion.id_clase
FROM Miembros
INNER JOIN Inscripcion
ON Miembros.cedula = Inscripcion.cedula;
