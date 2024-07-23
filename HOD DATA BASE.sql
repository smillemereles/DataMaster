-- Crear la base de datos HODbase
CREATE DATABASE HODbase;
GO

-- Usar la base de datos HODbase
USE HODbase;
GO

-- Crear la tabla Dragones
CREATE TABLE Dragones (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    color VARCHAR(50),
    tamanio VARCHAR(10) NOT NULL CHECK (tamanio IN ('Pequeño', 'Mediano', 'Grande', 'Colosal')),
    elemento VARCHAR(50),
    fuerza INT CHECK (fuerza BETWEEN 1 AND 100),
    velocidad INT CHECK (velocidad BETWEEN 1 AND 100),
    inteligencia INT CHECK (inteligencia BETWEEN 1 AND 100),
    lugar_origen VARCHAR(100),
    estado VARCHAR(10) DEFAULT 'Vivo' CHECK (estado IN ('Vivo', 'Muerto', 'Desconocido'))
);

-- Insertar datos en la tabla Dragones
INSERT INTO Dragones (id, nombre, edad, color, tamanio, elemento, fuerza, velocidad, inteligencia, lugar_origen)
VALUES 
(1, 'Syrax', 30, 'Amarillo', 'Grande', 'Fuego', 85, 90, 88, 'Rocadragón'),
(2, 'Seasmoke', 20, 'Gris plateado', 'Mediano', 'Fuego', 75, 95, 80, 'Marcaderiva'),
(3, 'Meleys', 100, 'Escarlata', 'Grande', 'Fuego', 95, 85, 90, 'Rocadragón'),
(4, 'Vermax', 10, 'Verde y bronce', 'Mediano', 'Fuego', 70, 85, 75, 'Rocadragón'),
(5, 'Arrax', 5, 'Blanco y dorado', 'Pequeño', 'Fuego', 60, 90, 70, 'Rocadragón'),
(6, 'Dreamfyre', 80, 'Azul pálido', 'Grande', 'Fuego', 85, 80, 85, 'Rocadragón'),
(7, 'Vermithor', 100, 'Bronce', 'Grande', 'Fuego', 98, 75, 95, 'Rocadragón'),
(8, 'Silverwing', 80, 'Plateado', 'Grande', 'Fuego', 90, 85, 90, 'Rocadragón'),
(9, 'Drogon', 7, 'Negro y rojo', 'Grande', 'Fuego', 95, 90, 85, 'Desierto Rojo'),
(10, 'Rhaegal', 7, 'Verde y bronce', 'Grande', 'Fuego', 85, 88, 80, 'Desierto Rojo'),
(11, 'Vhagar', 181, 'Bronce', 'Colosal', 'Fuego', 100, 75, 90, 'Desembarco del Rey'),
(12, 'Caraxes', 75, 'Rojo', 'Grande', 'Fuego', 90, 95, 85, 'Rocadragón');
GO

-- Crear la tabla Jinetes
CREATE TABLE Jinetes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    casa VARCHAR(100),
    titulo VARCHAR(100),
    habilidad_combate INT CHECK (habilidad_combate BETWEEN 1 AND 100),
    estado VARCHAR(10) DEFAULT 'Vivo' CHECK (estado IN ('Vivo', 'Muerto', 'Desconocido'))
);

-- Insertar datos en la tabla Jinetes
INSERT INTO Jinetes (id, nombre, apellido, casa, titulo, habilidad_combate)
VALUES 
(1, 'Rhaenyra', 'Targaryen', 'Targaryen', 'Princesa de Rocadragón', 88),
(2, 'Laenor', 'Velaryon', 'Velaryon', 'Heredero de Marcaderiva', 75),
(3, 'Laena', 'Velaryon', 'Velaryon', 'Dama de Marcaderiva', 80),
(4, 'Jacaerys', 'Velaryon', 'Velaryon/Targaryen', 'Príncipe', 70),
(5, 'Lucerys', 'Velaryon', 'Velaryon/Targaryen', 'Príncipe', 65),
(6, 'Helaena', 'Targaryen', 'Targaryen', 'Princesa', 60),
(7, 'Hugh', 'Hammer', 'N/A', 'Sembrador de Semillas', 85),
(8, 'Ulf', 'White', 'N/A', 'Sembrador de Semillas', 80),
(9, 'Daenerys', 'Targaryen', 'Targaryen', 'Madre de Dragones', 85),
(10, 'Jon', 'Snow', 'Stark/Targaryen', 'Rey en el Norte', 90),
(11, 'Aemond', 'Targaryen', 'Targaryen', 'Príncipe', 95),
(12, 'Daemon', 'Targaryen', 'Targaryen', 'Príncipe Pícaro', 98);
GO

-- Crear la tabla Jinete_Dragon
CREATE TABLE Jinete_Dragon (
    id INT PRIMARY KEY,
    jinete_id INT,
    dragon_id INT,
    FOREIGN KEY (jinete_id) REFERENCES Jinetes(id),
    FOREIGN KEY (dragon_id) REFERENCES Dragones(id),
    UNIQUE (jinete_id, dragon_id) -- Esto asegura que no se pueda repetir la misma combinación jinete-dragón
);

-- Insertar datos en la tabla Jinete_Dragon
-- Suponiendo que conocemos los IDs correspondientes de cada jinete y dragón en las tablas Jinetes y Dragones.

-- Daenerys Targaryen con Drogon
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (1, 9, 9);

-- Jon Snow con Rhaegal
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (2, 10, 10);

-- Rhaenyra Targaryen con Syrax
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (3, 1, 1);

-- Laena Velaryon con Seasmoke
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (4, 3, 2);

-- Laenor Velaryon con Seasmoke (podría montar el mismo dragón)
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (5, 2, 2);

-- Hugh Hammer con Vermithor
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (6, 7, 7);

-- Ulf White con Silverwing
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (7, 8, 8);

-- Aemond Targaryen con Vhagar
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (8, 11, 11);

-- Daemon Targaryen con Caraxes
INSERT INTO Jinete_Dragon (id, jinete_id, dragon_id)
VALUES (9, 12, 12);
GO

-- Crear la tabla batallas
CREATE TABLE Batallas (
    id INT PRIMARY KEY IDENTITY,
    fecha DATE NOT NULL,
    jinete_id INT,
    dragon_id INT,
    resultado VARCHAR(50),
    FOREIGN KEY (jinete_id) REFERENCES Jinetes(id),
    FOREIGN KEY (dragon_id) REFERENCES Dragones(id)
);
INSERT INTO Batallas (fecha, jinete_id, dragon_id, resultado)
VALUES 
('2023-09-10', 3, 2, 'Laena Velaryon y Seasmoke defienden Marcaderiva'),
('2023-10-25', 7, 7, 'Hugh Hammer y Vermithor en la Batalla de Tumbleton'),
('2024-01-05', 11, 11, 'Aemond y Vhagar en la Batalla sobre el Mar Angosto'),
('2024-03-15', 12, 12, 'Daemon y Caraxes en la Danza de los Dragones'),
('2023-05-15', 1, 9, 'Victoria de Rhaenyra con Drogon'),
('2023-06-20', 9, 9, 'Daenerys y Drogon liberan Meereen'),
('2023-08-03', 10, 10, 'Rhaegal y Jon Snow en la Batalla del Norte');


CREATE TABLE ResultadosBatallas (
    id INT IDENTITY (1,1) PRIMARY KEY,
    jinete_1_id INT,
    jinete_2_id INT,
    ganador_id INT,
    jinete_1_Cambio_ELO INT,
    jinete_2_Cambio_ELO INT
);

INSERT INTO ResultadosBatallas (jinete_1_id, jinete_2_id, ganador_id, jinete_1_Cambio_ELO, jinete_2_Cambio_ELO)
VALUES
(1, 3, 1, 10, -5), -- Ejemplo: Jinete 1 vs Jinete 3, Jinete 1 gana, cambio en ELO: +10 para Jinete 1, -5 para Jinete 3
(2, 4, 2, 8, -3);  -- Ejemplo: Jinete 2 vs Jinete 4, Jinete 2 gana, cambio en ELO: +8 para Jinete 2, -3 para Jinete 4

-- Batallas de Jinetes y Dragones en House of the Dragon

-- Rhaenyra Targaryen con Syrax derrota a Aemond Targaryen con Vhagar
INSERT INTO ResultadosBatallas (jinete_1_id, jinete_2_id, ganador_id, jinete_1_Cambio_ELO, jinete_2_Cambio_ELO)
VALUES (1, 11, 1, 15, -10);

-- Laena Velaryon con Seasmoke defiende Marcaderiva contra Hugh Hammer con Vermithor
INSERT INTO ResultadosBatallas (jinete_1_id, jinete_2_id, ganador_id, jinete_1_Cambio_ELO, jinete_2_Cambio_ELO)
VALUES (3, 7, 3, 12, -8);

-- Daemon Targaryen con Caraxes gana la Danza de los Dragones contra Aemond Targaryen con Vhagar
INSERT INTO ResultadosBatallas (jinete_1_id, jinete_2_id, ganador_id, jinete_1_Cambio_ELO, jinete_2_Cambio_ELO)
VALUES (12, 11, 12, 20, -15);

-- Rhaegal montado por Jon Snow derrota a Silverwing montado por Laena Velaryon
INSERT INTO ResultadosBatallas (jinete_1_id, jinete_2_id, ganador_id, jinete_1_Cambio_ELO, jinete_2_Cambio_ELO)
VALUES (10, 8, 10, 18, -12);
