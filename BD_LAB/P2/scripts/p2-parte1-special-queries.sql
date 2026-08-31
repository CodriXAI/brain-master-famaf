-- Query de consulta para poner Nombre y los porcentajes, hay que digerirla porque es flashera
-- Pero basicamente esta Query lo que hace es darle el formato a la tabla Continent como en la consigna
SELECT 
    c.Name,
    c.Area,
    CONCAT(c.LandMassPercentage, '%') AS `Percent total mass`,
    CONCAT(ci.Name, ', ', co.Name) AS `Most populous city`
FROM Continent c
LEFT JOIN city ci ON c.MostPopulatedCityID = ci.ID
LEFT JOIN country co ON ci.CountryCode = co.Code;

-- Respecto a Continent
-- Por si necesito hacer refresh de la tabla
TRUNCATE TABLE Continent;