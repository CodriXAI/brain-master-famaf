CREATE DATABASE IF NOT EXISTS world;
USE world;

-- 1) Listar el nombre de la ciudad y el nombre del país de todas las 
-- ciudades que pertenezcan a países con una población menor a 10000 habitantes.

SELECT c.Name, co.Name, co.Population
FROM city c JOIN country co ON c.CountryCode = co.Code
WHERE co.Population < 10000;

-- 2) Listar todas aquellas ciudades cuya población sea mayor que la población promedio
-- entre todas las ciudades.

SELECT * 
FROM city
WHERE Population > (SELECT avg(Population) FROM city);

-- 3) Listar todas aquellas ciudades no asiáticas cuya población sea igual o mayor a la
-- población total de algún país de Asia

SELECT c.*
FROM city c JOIN country co ON c.CountryCode = co.Code -- En las ciudades no tengo el continente, debo buscarlo en country
WHERE co.Continent <> 'Asia' -- <> Es distinto de en SQL
  AND c.Population >= SOME(  -- SOME es al menos un (lo que diga la subq)
  	SELECT Population FROM country WHERE Continent = 'Asia'
  )
  
-- 4) Listar aquellos países junto a sus idiomas no oficiales, que superen en porcentaje de
-- hablantes a cada uno de los idiomas oficiales del país.
  
SELECT co.Name, cl.Language
FROM country co JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'F'
	AND cl.Percentage > ALL(
		SELECT cl2.Percentage 
		FROM countrylanguage cl2 
		WHERE cl2.CountryCode = cl.CountryCode
			AND cl.IsOfficial = 'T'
	)

-- 5) Listar (sin duplicados) aquellas regiones que tengan países con una superficie menor
-- a 1000 km2 y exista (en el país) al menos una ciudad con más de 100000 habitantes.
-- (Hint: Esto puede resolverse con o sin una subquery, intenten encontrar ambas
-- respuestas).
	
-- Con subquery mediante EXISTS:
SELECT DISTINCT co.Region -- Para evitar seleccionar duplicados 
FROM country co
WHERE co.SurfaceArea < 1000
	AND EXISTS (
		SELECT 1
		FROM city c 
		WHERE c.CountryCode = co.Code AND c.Population > 100000
	)

-- Sin subquery:
SELECT DISTINCT co.Region
FROM country co JOIN city c ON co.Code = c.CountryCode AND c.Population > 100000
WHERE co.SurfaceArea < 1000

-- 6) Listar el nombre de cada país con la cantidad de habitantes de su ciudad más
-- poblada. (Hint: Hay dos maneras de llegar al mismo resultado. Usando consultas
-- escalares o usando agrupaciones, encontrar ambas).

-- Con consultas escalares:
SELECT co.Name, (SELECT MAX(c.Population) from city c WHERE c.CountryCode = co.Code) AS max_pop
FROM country co;

-- Observación: Tira NULL en French Southern territories, pues no hay ciudades, comprobable con:
SELECT * FROM city WHERE CountryCode = 'ATF';

-- Con Agrupaciones:
SELECT co.Name, MAX(c.Population) AS max_pop
FROM country co JOIN city c ON c.CountryCode = co.Code
GROUP BY co.Name

-- 7) Listar aquellos países y sus lenguajes no oficiales cuyo porcentaje de hablantes sea
-- mayor al promedio de hablantes de los lenguajes oficiales.

SELECT co.*, cl.Language
FROM country co JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'F'
	AND cl.Percentage > (
		SELECT AVG(cl2.Percentage) 
		FROM countrylanguage cl2 
		WHERE cl2.IsOfficial = 'T' AND cl2.CountryCode = co.Code
	) 

-- 8) Listar la cantidad de habitantes por continente ordenado en forma descendente.

SELECT SUM(co.Population) AS total_pop
FROM country co
GROUP BY co.Continent
ORDER BY total_pop DESC

-- 9) Listar el promedio de esperanza de vida (LifeExpectancy) por continente con una
-- esperanza de vida entre 40 y 70 años.

SELECT co.Continent, AVG(co.LifeExpectancy) AS prom
FROM country co
GROUP BY co.Continent
HAVING prom >= 40 AND prom <= 70

-- 10) Listar la cantidad máxima, mínima, promedio y suma de habitantes por continente.

SELECT
	MAX(co.Population) AS max_pop, 
	MIN(co.Population) AS min_pop, 
	AVG(co.Population) AS avg_pop, 
	SUM(co.Population) AS sum_pop
FROM country co
GROUP BY co.Continent






