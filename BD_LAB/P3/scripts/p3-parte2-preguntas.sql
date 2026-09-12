-- 1)​ ¿Devuelven los mismos valores las siguientes consultas? ¿Por qué?

SELECT city.Name, country.Name
FROM city
INNER JOIN country ON city.CountryCode = country.Code AND country.Name = 'Argentina';


SELECT city.Name, country.Name
FROM city
INNER JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Argentina';

-- Si, devuelven lo mismo, ya que el INNER JOIN exige que en ambas tablas se cumplan las condiciones
-- Entonces en la opcion 1: Se combinan las ciudades de Argentina
-- En la opcion 2: Se combinan todas las ciudades y luego el WHERE solo filtra las que no son de Argentina

-- 2.​ ¿Y si en vez de INNER JOIN fuera un LEFT JOIN?
-- Ahí sería distinto, pues el LEFT JOIN deja la tabla de la izquierda totalmente intacta, y exige cumplir
-- la condición en la tabla de la derecha

-- En la opción 1: Con un LEFT JOIN practicamente listaría a todas las ciudades del mundo, y si no son de Argentina,
-- el name queda como NULL

-- En la opción 2: Se listan todas las ciudades del mundo y se filtran solo las que no son de Argentina