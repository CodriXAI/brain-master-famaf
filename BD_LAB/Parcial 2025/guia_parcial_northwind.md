# Guía Parcial Northwind — diagnóstico + cómo correrlo en DBeaver

Todo lo de acá está probado corriendo de verdad contra tu `Northwind.sql`
(instalé un MySQL de prueba, cargué tu base tal cual la subiste, y corrí
cada consulta — no es teoría, son resultados reales).

## 1. El bug que rompe casi todo: mayúsculas en los nombres de tabla

Tu `Northwind.sql` define las tablas así (mirá el `CREATE TABLE`):

```
Categories, Customers, Employees, `Order Details`, Orders, Products,
Region, Shippers, Suppliers, Territories
```

Con mayúscula inicial, en singular/plural exacto como está ahí. Varias
soluciones de la clase de repaso usaban `products`, `categories`,
`category`, `order_detail`, `Order_Detail` — todas en minúscula o con
guion bajo. En MySQL corriendo sobre Linux (que es como vas a tener la
base en el parcial, probablemente), **los nombres de tabla son
sensibles a mayúsculas**. Literalmente probé correr esas versiones tal
cual estaban escritas y tiraron:

```
ERROR 1146: Table 'northwind.products' doesn't exist
ERROR 1146: Table 'northwind.category' doesn't exist
ERROR 1146: Table 'northwind.Order_Detail' doesn't exist
```

**Regla para el parcial: copiá el nombre de tabla tal cual aparece en
el diagrama/`CREATE TABLE`, letra por letra.** Si el motor del profe
tiene la config en modo case-insensitive puede que a él le funcione
igual con minúscula — pero no es algo que quieras dejar librado al
azar el día del parcial.

## 2. Ejercicio 1 — la trampa del GROUP BY equivocado

La clase de repaso mostró dos versiones. La primera:

```sql
GROUP BY o.OrderID
```

Esto agrupa por **pedido**, no por **cliente**. Si un cliente hizo 5
pedidos, te aparece 5 veces (una fila por pedido), no una fila con el
total acumulado. El resultado que te da el "top 5" son en realidad los
5 *pedidos* más caros, no los 5 *clientes* que más gastaron en total —
lo confirmé corriendo las dos versiones: dan resultados distintos
("Horst Kloss" aparece en ambas pero con montos totalmente diferentes,
16.387 vs 110.277 — el segundo es la suma real de todos sus pedidos).

La versión corregida agrupa por `o.CustomerID`, así cada cliente queda
en una sola fila con la suma de **todas** sus líneas de **todos** sus
pedidos.

**Patrón general para llevarte:** cuando el enunciado dice "los N que
más X generaron", preguntate primero **"¿agrupado por qué entidad?"**
antes de escribir el GROUP BY. Es fácil agrupar por la tabla que tenés
más a mano (Orders, porque es la que estás joineando) en vez de por la
que el enunciado realmente pide (Customers).

## 3. Ejercicio 3 — el `;` que corta la consulta a la mitad

```sql
INNER JOIN order_detail od ON od.ProductID = p.ProductID;
GROUP BY ca.CategoryID;
```

Ese `;` después del último JOIN termina la sentencia ahí. Todo lo que
sigue (`GROUP BY ...`) queda como una sentencia nueva, incompleta, sin
SELECT — error de sintaxis directo. Es un típico error de
copiar/pegar, no de lógica: revisá siempre que el `;` esté solo al
final de la consulta completa, nunca en medio.

## 4. Ejercicio 4 — la columna que nunca existió

El resultado final de la clase de repaso hacía:

```sql
SELECT Empleado, anio, total_de_ventas FROM VentasOrdenadas v ...
```

Pero el CTE (`ventasOrdenadas`) nunca seleccionaba ninguna columna de
nombre — solo `EmployeeID`. `Empleado` no existe en ningún lado, así
que esa consulta tira error de columna desconocida. La corrección:
meter el nombre del empleado (`e.LastName`) directo adentro del CTE,
para tenerlo disponible afuera.

Ya con esto corregido y corrido de verdad, la vista te da:

| empleado  | anio | total_ventas |
|-----------|------|---------------|
| Peacock   | 1996 | 49945.115     |
| Peacock   | 1997 | 128809.791    |
| Leverling | 1998 | 76562.7275    |

(Coincide con los números que ya habían salido en el screenshot de la
clase — o sea que la lógica de fondo estaba bien, solo faltaba esa
columna.)

**Patrón general — "el X con más Y, por cada Z"** (acá: el empleado
con más ventas, por cada año): armá una tabla intermedia con el total
por combinación (empleado, año), y después filtrá quedándote con la
fila cuyo total iguala al máximo *de ese mismo año* (subquery escalar
correlacionada por año). Es el mismo patrón que ya vimos para "la
ciudad más poblada de cada país" en el práctico de Bases — cambia el
dominio, no la estructura.

## 5. Ejercicio 5 — el trigger estaba bien, pero atenti al `DELIMITER`

El trigger de la clase de repaso (la versión "sí" con `NEW.Quantity` /
`NEW.ProductID`) es correcto tal cual. Lo probé insertando una línea
de pedido de verdad: el stock bajó exactamente en la cantidad
insertada. `NEW` referencia la fila que se acaba de insertar en
`Order Details` — por eso el trigger sabe qué producto y cuánto
descontar.

Lo que le falta si lo vas a correr como **script completo** (por
ejemplo con `mysql < soluciones.sql`, que es como probablemente se
corrige la entrega): envolver el trigger entre
`DELIMITER $$ ... END$$` y volver a `DELIMITER ;` al final. Sin eso,
el cliente SQL corta la sentencia en el primer `;` que encuentra
**dentro** del `BEGIN...END`, mucho antes de terminar de definir el
trigger. En DBeaver, si ejecutás el bloque completo seleccionado
(Ctrl+Enter con todo el trigger resaltado) a veces lo maneja bien
solo, pero para no depender de eso, mejor incluir el `DELIMITER`
siempre.

## 6. Ejercicio 6 — el rol está bien, pero probablemente no entra

La nota de la clase de repaso dice explícito: *"Roles no entra al
parcial! Triggers y vistas sí entra."* Repasalo igual porque es rápido
y ya lo tenés resuelto, pero priorizá tiempo en vistas/triggers si
andás corto.

---

## Cómo correr esto en DBeaver

1. **Conectate a un servidor MySQL** (nueva conexión → MySQL → si no
   tenés uno corriendo local, XAMPP/MAMP o un Docker con
   `mysql:8` sirven).
2. **Abrí `Northwind.sql`** en un editor SQL de DBeaver conectado a esa
   base (el script hace `DROP DATABASE IF EXISTS` + `CREATE DATABASE`
   + `USE northwind`, así que no hace falta crear la base antes a
   mano).
3. **Ejecutá el script completo**, no consulta por consulta — en
   DBeaver es el botón "Execute SQL Script" (▶▶, o `Alt+X`), distinto
   del botón de una sola sentencia (`Ctrl+Enter`). Esto te crea y
   puebla las 13 tablas.
4. **Refrescá el árbol de la conexión** (botón derecho → Refresh) para
   que DBeaver te muestre las tablas nuevas.
5. Abrí un editor nuevo apuntando a la base `northwind` y corré las
   consultas de a una (`soluciones_parcial_northwind.sql`).
6. Para el trigger: seleccioná el bloque completo (`DELIMITER $$`
   hasta `DELIMITER ;`) y ejecutalo como script, no como sentencia
   única.

## Para llevarte al parcial del lab

Este parcial de Northwind es un buen espejo de lo que te van a tomar:
mismo tipo de JOINs, agregaciones y (posiblemente) vistas/triggers,
solo que con el esquema `world` en vez de `northwind`. Los tres
reflejos que instalamos hoy sirven igual para cualquier esquema:

1. **Copiar nombres de tabla exactos** del diagrama, sin asumir
   mayúscula/minúscula.
2. **Preguntarte "¿agrupado por qué entidad?"** antes de escribir el
   GROUP BY — no por la tabla que tenés más a mano en el JOIN.
3. **El patrón "el máximo de Y por cada grupo, con más columnas que
   Y"** — CTE/subquery con el total por grupo, después filtrar por
   `= MAX(...) correlacionado por grupo`. Te va a volver a aparecer.
