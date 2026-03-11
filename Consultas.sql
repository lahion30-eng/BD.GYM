-- aqui hablitamos el uso de las claves foraneas
PRAGMA foreign_keys = ON;

-- creamos una tabla para las clases
CREATE TABLE Clase (
    id_clase INTEGER PRIMARY KEY,
    nombre_clase TEXT NOT NULL,
    dia_semana TEXT NOT NULL,
    horario TEXT NOT NULL
);

-- tabla para los miembros del gym
CREATE TABLE Miembro (
    cedula INTEGER PRIMARY KEY,
    nombre_completo TEXT NOT NULL,
    telefono TEXT NOT NULL
);

-- esta es la tabla intermedia porque tenemos una relacion de muchos a muchos N:M
CREATE TABLE IF NOT EXISTS Inscripcion (
    cedula INTEGER,
    id_clase INTEGER,
    PRIMARY KEY (cedula, id_clase),
    FOREIGN KEY (cedula) REFERENCES Miembro (cedula),
    FOREIGN KEY (id_clase) REFERENCES Clase (id_clase)
);

Insertar Miembros
INSERT INTO
    Miembro (cedula, nombre_completo, telefono)
VALUES (
        '40212345678',
        'Juan Soto',
        '8093457821'

    ),
    (
        '00123456789',
        'Julio Rodriguez',
        '8296149053'
    ),
    (
        '03198765432',
        'Vladimir Guerrero',
        '8492734689'
    ),
    (
        '40287654321',
        'Rafael Devers',
        '8095561294'
    ),
    (
        '22345678901',
        'Fernando Tatis',
        '8494465081'
    );

Insertar Clases
INSERT INTO
    Clase (id_clase, nombre_clase, dia_semana, horario)
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
        'Yoga',
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
        'Bachata',
        'Viernes',
        '6 a 7 p.m'
    );

Insertar Inscripciones
INSERT INTO Inscripcion (cedula, id_clase)
VALUES
(40212345678, 401),
(00123456789, 402),
(03198765432, 403),
(40287654321, 404),
(22345678901, 405);

Consulta con tablas relacionadas
SELECT
    Miembro.cedula,
    Miembro.nombre_completo,
    Clase.nombre_clase,
    Clase.dia_semana,
    Clase.horario
FROM Miembro
INNER JOIN Inscripcion
ON Miembro.cedula = Inscripcion.cedula
INNER JOIN Clase
ON Clase.id_clase = Inscripcion.id_clase;

