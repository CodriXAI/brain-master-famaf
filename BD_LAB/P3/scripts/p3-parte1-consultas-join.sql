CREATE DATABASE IF NOT EXISTS world;
USE world;

-- 1) Lista nombre de ciudad, nombre pais, región, y forma de gobierno de las 10 ciudades mas pobladas del mundo:
SELECT
	city.Name AS City,
	country.Name AS Country,
	country.Region,
	country.GovernmentForm
FROM city
INNER JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 10

-- 2) Listar los 10 países con menor población del mundo, junto a sus ciudades capitales

SELECT
	country.Name AS Country,
	country.Population AS Population,
	city.Name AS Capital
FROM country
LEFT JOIN city ON country.Capital = city.ID
ORDER BY country.Population ASC
LIMIT 10

-- 3) Listar el nombre, continente y todos los lenguajes oficiales de cada país. (Hint: habrá
-- más de una fila por país si tiene varios idiomas oficiales).

SELECT
 	country.Name AS Country,
 	country.Continent AS Continent,
 	countrylanguage.Language AS Language
FROM country
INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.IsOfficial = 'T'

-- 4) Listar el nombre del país y nombre de capital, de los 20 países con mayor superficie
-- del mundo.

SELECT 
	country.Name AS Country,
	city.Name AS Capital,
	country.SurfaceArea AS SurfaceArea
FROM country
LEFT JOIN city ON country.Capital = city.ID 
ORDER BY country.SurfaceArea DESC
LIMIT 20

-- 5) Listar las ciudades junto a sus idiomas oficiales (ordenado por la población de la
-- ciudad) y el porcentaje de hablantes del idioma.

SELECT 
	city.Name AS Name,
	countrylanguage.Language AS Language,
	countrylanguage.Percentage AS Percentage,
	city.Population AS Population
FROM city
INNER JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY city.Population

-- 6) Listar los 10 países con mayor población y los 10 países con menor población (que
-- tengan al menos 100 habitantes) en la misma consulta.

(
	SELECT
		country.Name AS Name,
		country.Population AS Population
	FROM country
	ORDER BY country.Population DESC 
	LIMIT 10
)

UNION

(
	SELECT
		country.Name AS Name,
		country.Population AS Population
	FROM country
	WHERE country.Population >= 100
	ORDER BY country.Population ASC 
	LIMIT 10
)

-- 7) Listar aquellos países cuyos lenguajes oficiales son el Inglés y el Francés (hint: no
-- debería haber filas duplicadas).

( 
	SELECT 
		country.Name AS Name
	FROM country
	INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
	WHERE countrylanguage.Language = 'English'
)

INTERSECT

(
	SELECT 
		country.Name AS Name
	FROM country
	INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
	WHERE countrylanguage.Language = 'French'
)

-- 8) Listar aquellos países que tengan hablantes del Inglés pero no del Español en su
-- población

( 
	SELECT 
		country.Name AS Name
	FROM country
	INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
	WHERE countrylanguage.Language = 'English'
)

EXCEPT

(
	SELECT 
		country.Name AS Name
	FROM country
	INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
	WHERE countrylanguage.Language = 'Spanish'
)
