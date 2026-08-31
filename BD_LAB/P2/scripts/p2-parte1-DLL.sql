-- PRACTICO 2 | PARTE 1 | DDL

-- 1) Crear la base de datos inicial:
CREATE DATABASE IF NOT EXISTS world; 
USE world;

-- Auxiliares para borrar y empezar desde 0:

-- Desactivar la revisión de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS countrylanguage;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS Continent;

-- Volver a activar la revisión de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- 2) Generar los esquemas correspondientes al diagrama:
CREATE TABLE country (
	Code CHAR(3) NOT NULL,
	Name VARCHAR(52) NOT NULL,
	Continent VARCHAR(20) NOT NULL,
	Region VARCHAR(25) NOT NULL,
	SurfaceArea DECIMAL(10,2) NOT NULL DEFAULT '0.00',
	IndepYear SMALLINT NULL,
	Population INT NOT NULL DEFAULT '0',
	LifeExpectancy DECIMAL(3,1) DEFAULT NULL,
	GNP DECIMAL(10,2) DEFAULT NULL,
	GNPOld DECIMAL(10,2) DEFAULT NULL,
	LocalName VARCHAR(45) NOT NULL DEFAULT '',
	GovernmentForm VARCHAR(45) NOT NULL DEFAULT '',
	HeadOfState VARCHAR(60) DEFAULT NULL,
	Capital INT DEFAULT NULL,
	Code2 CHAR(2) NOT NULL DEFAULT '',
	
	-- Restricciones:
	PRIMARY KEY (Code)
);

CREATE TABLE countrylanguage (
	CountryCode CHAR(3) NOT NULL DEFAULT '',
	Language CHAR(30) NOT NULL DEFAULT  '',
	IsOfficial ENUM('T', 'F') NOT NULL DEFAULT 'F',
	Percentage DECIMAL(4,1) NOT NULL DEFAULT '0.0',
	
	-- Restricciones:
	PRIMARY KEY (CountryCode, Language),
	CONSTRAINT fk_country_language_country FOREIGN KEY (CountryCode) REFERENCES country (Code)
);

CREATE TABLE city (
	ID INT AUTO_INCREMENT NOT NULL,
	Name VARCHAR(35) NOT NULL DEFAULT '',
	CountryCode CHAR(3) NOT NULL DEFAULT '',
	District VARCHAR(20) NOT NULL DEFAULT '',
	Population INT NOT NULL DEFAULT 0,
	
	-- Restricciones:
	PRIMARY KEY (ID),
	CONSTRAINT fk_city_country FOREIGN KEY (CountryCode) REFERENCES country (Code)
);


-- 3) Insertar los datos descargados
-- Sería el script insert-data

-- 4) Crear la tabla continent:
CREATE TABLE Continent(
	Name VARCHAR(30) NOT NULL DEFAULT '',
	Area INT NOT NULL,
	LandMassPercentage DECIMAL(4,1) NOT NULL,
	MostPopulatedCityID INT UNIQUE, -- Permite NULL si es opcional y UNIQUE para 1 : 1
	
	-- Restricciones:
	PRIMARY KEY (Name),
	CONSTRAINT fk_continent_city FOREIGN KEY (MostPopulatedCityID) REFERENCES city (ID)
);

-- 5) Insertar valores en la tabla Continent:

-- Primero inserto en la tabla de city a McMurdo Station
INSERT INTO `city` VALUES (4080,'McMurdo Station','ATA','Antártica',1000);

-- Consultas para conocer los IDs:
SELECT ID, Name 
FROM city 
WHERE Name LIKE '%Cairo%'
   OR Name LIKE '%McMurdo%'
   OR Name LIKE '%Mumbai%'
   OR Name LIKE '%stanbul%'
   OR Name LIKE '%M%xico%'   -- El % reemplaza la 'é' por si tiene tilde o no
   OR Name LIKE '%Sydney%'
   OR Name LIKE '%Paulo%';

-- Insertar en Continent con los datos obtenidos:
INSERT INTO Continent VALUES 
('Africa', 30370000, 20.4, 608),
('Antarctica', 14000000, 9.2, 4080),
('Asia', 44579000, 29.5, 1024),
('Europe', 10180000, 6.8, 3357),
('North America', 24709000, 16.5, 2515),
('Oceania', 8600000, 5.9, 130),
('South America', 17840000, 12.0, 206);

-- 6) Modificar la tabla country para que el campo continent sea foranea de la tabla continent:

ALTER TABLE country
ADD CONSTRAINT fk_country_continent
FOREIGN KEY (Continent) REFERENCES Continent(Name);

DESCRIBE country;
