-- Creación de la tabla dicubigeos con comentarios

CREATE TABLE IF NOT EXISTS `dicubigeos` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único',
    `Ubigeo` varchar(10) NOT NULL COMMENT 'Código de Ubigeo',
    `U1` varchar(2) NOT NULL COMMENT 'Primera parte del código',
    `U2` varchar(2) NOT NULL COMMENT 'Segunda parte del código',
    `U3` varchar(2) NOT NULL COMMENT 'Tercera parte del código',
    `Depa` varchar(75) NOT NULL COMMENT 'Departamento',
    `Prov` varchar(75) NOT NULL COMMENT 'Provincia',
    `Dist` varchar(75) NOT NULL COMMENT 'Distrito',
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Inserción de datos iniciales

INSERT INTO `dicubigeos` ( `Ubigeo`, `U1`, `U2`, `U3`, `Depa`, `Prov`, `Dist`) VALUES
	( '200101', '20', '01', '01', 'PUNO', 'PUNO', 'PUNO'),
	( '200102', '20', '01', '02', 'PUNO', 'PUNO', 'ACORA'),
	( '200103', '20', '01', '03', 'PUNO', 'PUNO', 'ATUNCOLLA'),
	( '200104', '20', '01', '04', 'PUNO', 'PUNO', 'CAPACHICA'),
	( '200105', '20', '01', '05', 'PUNO', 'PUNO', 'COATA');

-- Actualización del departamento para el Ubigeo 200101

UPDATE dicubigeos SET Depa = "PUNOCITY" WHERE Ubigeo = '200101';

-- Ejercicio 4.a: Contar registros por departamento

SELECT  Depa ,COUNT(*) AS cantidad
FROM dicubigeos
GROUP BY Depa;

-- Ejercicio 4.b: Contar registros por U1 y U2

SELECT U1, U2, COUNT(*) AS cantidad
FROM dicubigeos
GROUP BY U1, U2;

-- Ejercicio 4.C: Calcular el promedio del campo Id por provincia

SELECT  Prov, AVG(Id) AS promedio_id
FROM dicubigeos
GROUP BY Prov;

-- Ejercicio 5.a: Contar todas las filas de la tabla

SELECT COUNT(*) as total_filas
FROM dicubigeos;

-- Ejercicio 5.b: Contar departamentos distintos

SELECT COUNT(DISTINCT Depa) as total_departamentos
FROM dicubigeos;

-- Ejercicio 5.c: Contar registros con U3 igual a "01"

SELECT COUNT(*) as cantidad
FROM dicubigeos
WHERE U3 ="01";

-- Ejercicio 5.d: Contar registros con U1 igual a "20" y U2 igual a "01"

SELECT COUNT(*) AS cantidad
FROM dicubigeos
WHERE U1 ="20" AND U2 ="01";

-- Ejercicio 5.E: Contar registros con Depa igual a "PUNO" y Prov igual a "PUNO"

SELECT COUNT(*) AS cantidad
FROM dicubigeos
WHERE Depa ="PUNO" AND Prov ="PUNO";


--- rangos fechas

SELECT COUNT(*) AS cantidad_usuarios,Browse 
FROM logLogins
WHERE Fecha BETWEEN "2018-12-10" AND "2018-12-15";
