## ¿Qué es? ¿Cuál es su objetivo? ¿Cómo debe llevarse a cabo para no "romper" la función existente?
Decimos que es la tarea que permite realizar cambios en el programa con el fin de simplificarlo y mejorar su comprensión, se realiza durante el proceso de codificación sobre código que ya está funcionando ya que su propósito no es cambiar el comportamiento externo del software.

Siempre con el objetivo de:
* Reducción de acoplamiento
* Aumento de la cohesión
* Mejora de la respuesta de los principios SOLID

Para evitar "romper" funcionalidades podemos:
* *Refactorizar en pequeños pasos*
	* Permite identificar errores más facilmente
* *Disponer de tests automatizados para testear la funcionalidad existente*
	* Facilita la verificación de que si el comportamiento externo se preserva o no

## ¿Cuáles son las refactorizaciones más comunes?
Las refactorizaciones más comunes se enfocan en:

### Mejoras en los métodos
* **Extracción en los métodos:** Se realiza si el método es demasiado largo, con el fin de obtener métodos más cortos cuya signatura sea clara.
* **Agregar o eliminar parámetros:** Simplifica las interfaces. Se agregan si falta información y se eliminan si no se utilizan.
### Mejoras en las clases
* **Desplazamiento de métodos:** Cuando el método interactúa mucho con objetos de otra clase 
* **Desplazamiento de atributos:** Cuando el atributo se usa más en otra clase que la actual
* **Extracción de clases:** Cuando la clase agrupa múltiples conceptos, estos se separan en nuevas clases cada uno
* **Reemplazo de valores de datos por objetos:** se separa como una clase, una colección de atributos que se transformaron en entidad lógica
### Mejoras de jerarquía
* **Reemplazo de condicionales con polimorfismos:** Encontrar jerarquía de clases apropiada para aquellos análisis de casos que dependan de indicadores de tipo.
* **Subir métodos / atributos:** Si un método / atributo se usa en más de una subclase, se puede subir a la superclase.