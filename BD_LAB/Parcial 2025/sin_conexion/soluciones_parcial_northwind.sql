-- ============================================================
-- Bases de Datos 2025 - Parcial I: SQL (Northwind)
-- Soluciones verificadas contra la base real (probadas en MySQL/MariaDB 8/10.x)
-- ============================================================
-- Nombres de tabla reales (respetar mayúsculas EXACTAS, MySQL en Linux
-- es case-sensitive para nombres de tabla):
--   Categories, Customers, Employees, `Order Details`, Orders,
--   Products, Region, Shippers, Suppliers, Territories
-- ============================================================


-- ============================================================
-- Ejercicio 1: Listar los 5 clientes que más ingresos han
-- generado a lo largo del tiempo.
-- ============================================================
-- Idea: revenue = UnitPrice * (1 - Discount) * Quantity, por línea
-- de Order Details. Agrupar por CLIENTE (no por pedido), sumando
-- todas sus líneas de todos sus pedidos.
SELECT
    c.ContactName AS cliente,
    SUM(od.UnitPrice * (1 - od.Discount) * od.Quantity) AS ingresos
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
INNER JOIN `Order Details` AS od
    ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY ingresos DESC
LIMIT 5;


-- ============================================================
-- Ejercicio 2: Listar cada producto con sus ventas totales,
-- agrupados por categoría.
-- ============================================================
SELECT
    ca.CategoryName AS categoria,
    p.ProductName AS producto,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ventas_totales
FROM Products AS p
INNER JOIN Categories AS ca
    ON p.CategoryID = ca.CategoryID
INNER JOIN `Order Details` AS od
    ON p.ProductID = od.ProductID
GROUP BY ca.CategoryID, p.ProductID
ORDER BY ca.CategoryName, p.ProductName;


-- ============================================================
-- Ejercicio 3: Calcular el total de ventas para cada categoría.
-- ============================================================
SELECT
    ca.CategoryName AS categoria,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ventas_totales
FROM Categories AS ca
INNER JOIN Products AS p
    ON p.CategoryID = ca.CategoryID
INNER JOIN `Order Details` AS od
    ON od.ProductID = p.ProductID
GROUP BY ca.CategoryID
ORDER BY ventas_totales DESC;


-- ============================================================
-- Ejercicio 4: Vista con el/los empleado(s) de más ventas por
-- año (empleado, año, total de ventas), ordenado por año ASC.
-- ============================================================
-- Patrón: CTE que calcula ventas por (empleado, año), y afuera
-- un filtro con subquery escalar correlacionada por año que
-- se queda solo con la fila que iguala al máximo de ese año.
-- (Si dos empleados empatan el máximo de un año, aparecen los dos
-- - es correcto, no es un bug).
CREATE VIEW employeeOfTheYear AS
WITH ventasPorEmpleadoAnio AS (
    SELECT
        e.EmployeeID,
        e.LastName AS empleado,
        YEAR(o.OrderDate) AS anio,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
    FROM Employees AS e
    INNER JOIN Orders AS o
        ON o.EmployeeID = e.EmployeeID
    INNER JOIN `Order Details` AS od
        ON od.OrderID = o.OrderID
    GROUP BY e.EmployeeID, anio
)
SELECT
    empleado,
    anio,
    total_ventas
FROM ventasPorEmpleadoAnio AS v
WHERE total_ventas = (
    SELECT MAX(total_ventas)
    FROM ventasPorEmpleadoAnio
    WHERE anio = v.anio
)
ORDER BY anio ASC;

-- Para probarla:
-- SELECT * FROM employeeOfTheYear;


-- ============================================================
-- Ejercicio 5: Trigger AFTER INSERT en `Order Details` que
-- descuenta el stock del producto insertado.
-- ============================================================
-- DELIMITER es necesario porque el cuerpo del trigger tiene sus
-- propios ";" internos; sin cambiar el delimitador, el cliente
-- SQL corta la sentencia en el primer ";" que encuentra.
DELIMITER $$

CREATE TRIGGER updateStock
AFTER INSERT ON `Order Details`
FOR EACH ROW
BEGIN
    UPDATE Products
    SET UnitsInStock = UnitsInStock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END$$

DELIMITER ;


-- ============================================================
-- Ejercicio 6: Rol admin con permisos sobre Customers.
-- (Según la clase de repaso, roles NO entra en el parcial del
-- lab este año -  la dejo igual, ya que estaba en el parcial
-- 2025 y es rápida de repasar)
-- ============================================================
CREATE ROLE admin_role;

GRANT INSERT
    ON northwind.Customers
    TO admin_role;

GRANT UPDATE (Phone)
    ON northwind.Customers
    TO admin_role;
