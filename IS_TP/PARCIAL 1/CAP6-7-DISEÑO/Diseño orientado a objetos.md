## ¿Qué es el Diseño Orientado a Objetos?
**Objetivo:** Definir las clases del sistema a construir y las relaciones entre estas.
**Enfoque:** Comportamiento dinámico.

## Análisis OO (AOO) y diseño OO (DOO)
* Las técnicas OO pueden usarse tanto para Análisis de reqs como para el diseño.
* Los métodos y notaciones son similares
### Diferencias:
| AOO                          |                                                                                                  DOO |
| :--------------------------- | -------------------------------------------------------------------------------------------------: |
| Modela el problema                                                                                   Modela la solución al problema |
| Manipulan objetos semánt Además de los objetos semánticos, manipulan: Objetos de interfaces, de aplicaciones, y de utilidad s,  n:  |

## Clases y Objetos
### Objetos:
* Propiedad básica de los objetos es **encapsulamiento**, provee interfaces de acceso y manipulación de los datos o información
* Abstracción y ocultamiento de la info.
* Tienen **Estado Persistente** (En clase se explicó que, como el objeto tiene conocimiento de su pasado, puede adaptarse y bajo una misma funcionalidad con los mismos valores responder de formas distintas en diferente timeline)
* Los objetos tienen Identidad: Cada objeto puede ser identificado y tratado como entidad distinta.
### Clases:
* Plantilla sobre las cuales se crean objetos (instancias de clase).
* Posee: Interfaz, cuerpo, variables de instancia para retener el estado de un objeto
* Operaciones: Publicas, privadas, Protegidas
* Operaciones constructoras y destructoras

## Relaciones entre objetos
### Asociacion
Un objeto está vinculado con otro durante un tiempo

### Agregación
Si un objeto es parte de otra clase, también se puede llamar colección

### Composición
Si un objeto está compuesto por otros

## Herencias y Polimorfismo

La herencia induce **polimorfismo**, en especifico la múltiple, un objeto puede ser de distintos tipos pues un objeto puede ser de distintas clases por ejemplo.

### Herencia estricta:
Una subclase toma todas las características de su superclase, solo agrega características para especializarla

### Herencia no estricta:
La subclase redefine alguna de las características

## ¿Qué es el acoplamiento en objetos? ¿Cuáles tipos de acoplamientos existen?
Describe la relación entre los módulos, por lo que es un concepto inter-modular. El objetivo como en funcional, es lograr *bajo acoplamiento*.

Existen 3 tipos distintos de acoplamiento en objetos:
### Por Interacción:
* Métodos de una clase invocan a otros
* **Aumenta:**
	* Métodos acceden a partes internas de otros métodos
	* Manipulan variables de otras clases
* **Disminuye:** 
	* Métodos se comunican a través de parámetros
### De componentes:
* **Aumenta:** Cuando una clase A tiene variables de otra clase C (variables de instancia, parámetros, variables locales)
 * **Disminuye:** Si las variables de clase C en A son, o bien atributos, parámetros en un método, son visibles.
### De herencia:
* Dos clases están acopladas si una es subclase de otra
* **Aumenta:** Si las subclases modifican la *SIGNATURA (firma)* de un método, no modifican la signatura pero si su comportamiento o si eliminan un método
* **Disminuye:** Si la subclase sólo agrega variables de instancia y  métodos pero no modifica los existentes en la superclase

## ¿Qué es Cohesión en objetos? ¿Cuáles tipos existen? 
La cohesión captura cuán relacionado están los elementos de un módulo, es un concepto intra-modular. El objetivo como en funcional es lograr *alta cohesión*.

Existen 3 tipos de Cohesión en objetos:
### Cohesión de método
* Describe el ¿Por qué elementos están juntos en el mismo método?
* *Aumenta:* Si cada método implementa una ÚNICA función claramente definida con todos sus elementos contribuyendo a implementar la función.
### Cohesión de clase
* Describe ¿Por qué los atributos y métodos están en una misma clase?
* *Aumenta:* Si una clase representa un único concepto.
* *Disminuye:* Si una clase representa múltiples conceptos.
### Cohesión de herencia
* Describe ¿Por qué distintas clases están juntas en la misma jerarquía?
* *Aumenta:* Clases jerarquizadas en consecuencia de generalización-especificación

## ¿Qué principios debe cumplir el diseño Orientado a Objetos? (SOLID) Explicarlos brevemente

Se llaman SOLID por:

* *S*ingle Responsability
* *O*pen-Closed
* *L*iskov Substitution
* *I*nterface Segregation
* *D*ependency inversion

A continuación se explicará cada uno:
### Principio de responsabilidad única
* Una clase debe tener una única razón para cambiar => Tener un solo trabajo o responsabilidad.
### Principio abierto-cerrado
*"Las entidades deben ser abiertas para extenderse y cerradas para modificarse"*
B-Meyer

* El comportamiento del sistema puede extenderse pero el código existente no debe modificarse. Posible con correcta herencia y polimorfismo.
### Principio de sustitución de Liskov (Bárbara Hubermann)
*"Un programa que utiliza un objeto de la clase C debería permanecer inalterado si se reemplaza ese objeto por uno de una subclase de C"* 
Bárbara Hubermann
### Principio de segregación de interfaces
* Las interfaces deben ser específicas y centrarse en requerimientos de los clientes que la usen
* Evitar enviar información innecesaria al cliente dará como resultado una interfaz mucho mas simple
### Principio de inversión de dependencias
Las clases deben depender de las abstracciones/interfaces y no de implementaciones concretas
## ¿Qué es la metodología OTM (Object  Modeling Technique)?
Una serie de pasos para lograr obtener un modelo detallado final.
### 1. Producir el diagrama de clases
* Mismo que obtenemos en el análisis
### 2. Producir el modelo dinámico y usarlo para definir operaciones de las clases
* Especifica como cambia el estado de los objetos frente a un evento
	* Donde *evento*, es una solicitud de operación al objeto
	* Y un *escenario* es una secuencia de eventos que ocurre en una ejecución particular del sistema.
* Define las operaciones de una clase
### 3. Producir el modelo funcional y usarlo para definir operaciones de las clases
* Describe las operaciones que tienen lugar en el sistema
* Especifica cómo computar las salidas a partir de las entradas
* Se utiliza el DFD
### 4. Identificar las clases internas y sus operaciones
* Se evalúan críticamente las clases para ver si son necesarias en su forma actual teniendo en cuenta cuestiones de implementación
### 5. Optimizar y empaquetar
* Agregar asociaciones redundantes
* Guardar atributos derivados
* Usar tipos genéricos
* Ajustar la herencia
## ¿Cuáles son las métricas en el diseño Orientado a Objetos?

### Métodos pesados por clase (WMC)
* Mide complejidad de una clase
* Depende de la cantidad de métodos de la misma y su complejidad

Sean M1 ... Mn los métodos de la clase C en consideración.

Sea C(Mi) la complejidad del método i. Ejemplo: la longitud estimada,
complejidad de la interfaz, complejidad del ujo de datos, etcétera.

Luego: WMC = ∑ C(Mi)
### Profundidad del árbol de herencia (DIT)
* Una clase muy por debajo de la jerarquía dificulta la predicción de su comportamiento
### Cantidad de hijos (NOC)
* Cantidad de subclases inmediatas de una clase, cuantifican el *REUSO*
### Acoplamiento entre clases (CBC)
* Cantidad de clases a las que una clase está acoplada. Cuantifica modificabilidad y propensión a errores.
### Respuesta para una clase (RFC)
* Cantidad de métodos que pueden ser invocados como respuesta a un mensaje recibido por un objeto de una clase