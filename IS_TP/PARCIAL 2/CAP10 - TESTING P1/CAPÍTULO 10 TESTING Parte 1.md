## ¿Qué es un test? ¿Para qué sirve? ¿Qué actores intervienen?
Definición de la Profe: *"Un test (o caso de test) es un PAR, donde el primer elemento es la entrada de nuestro sistema que usaremos para testear, y el segundo elemento es la salida esperada"*

* Un test es un programa que se ejecuta con el objetivo de *detectar defectos* en el software, para poder así corregirlos, aumentando la calidad del producto entregado.
* Los tests se llevan a cabo por los mismos programadores presentes en el proceso de codificación u otros nuevos. Los encargados son los llamados *Testers*.

*Observaciones:*
	La unica forma de garantizar que no hay errores es mediante los métodos formales
	Y en la sección donde se puede estar seguro es en la *Verificación*.
	*Error*: Una discrepancia entre lo que queremos, y lo que obtenemos.
	Tipico de parcial: *No asumir nada por sentado*.
## Defecto vs Desperfecto (Fault vs Failure)
* *Defecto:* Es un bug, problema que tiene el código el cuál generó un comportamiento inesperado.
* *Desperfecto:* Es la observación de un defecto.

## ¿Cuál es el rol del Testing? ¿Cómo se lleva a cabo?
* Su rol es garantizar calidad en el software mediante la identificación de defectos
* Se lleva a cabo ejecutando un programa que sigue un conjunto de casos de tests, si hay desperfectos en la ejecución, entonces hay defectos en el software. Durante el testing debemos causar estos desperfectos para detectar defectos posteriormente mediante el *debugging*.

## ¿Qué es un Oráculo de Test? ¿Para qué sirve?
* Es aquello que conoce el comportamiento correcto para algún caso de test.
* Sirve para saber si nuestro test presenta algún desperfecto o no, y así proceder (o no) a identificar al defecto.
* Siempre se pretende que el Oráculo dé el resultado correcto, es por ello que no es un humano.
* En algunos casos, los oráculos se generan directamente desde la *especificación*.

*Observación:*
	Generalmente podemos recurrir como oráculo a la SRS, pero si nos preguntan quién es el Oráculo, es quien sabe la respuesta. No garantiza que no cambie, incluso si se trata de la SRS. Además, debería ser único generalmente.

## ¿Qué es un caso de test? ¿Qué es un criterio de seleccion de test? ¿Para qué existen?
* Un caso de test son los datos de entrada con los que se va a correr un test, generalmente los valores de variables.
* Se busca que los casos de test evidencien defectos a través de fallas
* Se desearía:
	* Construir un conjunto de casos de test tal que la ejecución satisfactoria de todos ellos implique la *ausencia de defectos*
	* A su vez, por el alto costo, se desea que este *conjunto sea reducido*
	* Como genera una contradicción estos dos deseos, se debe recurrir a un *Criterio de selección de test*
* *Criterio de selección de test* son reglas que nos determinan qué tests integran el conjunto seleccionado y debe ser finito y acotado.

*Observaciones:* 
	En el libro Confiabilidad y Validez, es complicado, generalmente lo pueden decir mal, no entra en el parcial.
	Los casos de tests deben ser destructivos.

## Testing de Caja Negra
* Es funcional, no es visible la estructura.
* Entradas -> Implementación bajo test -> Salida.
* Tengo un oráculo para poder comparar la salida y evaluar si el test pasa o no.
* Premisa: El comportamiento esperado está especificado (voy a tener un intento de oráculo).
* Los casos de test se seleccionan a partir del comportamiento esperado del sistema.
* El testing funcional más minucioso es el exhaustivo.
* No es viable, demasiado costoso.

### Particionado por Clases de equivalencia
* Enfoque para selección de tests en testing de caja negra.
* Consiste en la división del estado de entrada en *clases de equivalencia*.
	* *Clases de equivalencia:* Subconjuntos disyuntos de entradas/salidas del conjunto total, tal que la unión forma el Universo, y que voy a presuponer que si un test funciona para un elemento de una clase (subconjunto), voy a suponer que toda la clase (subconjunto) se comporta de la misma manera.
	  * Y también tenemos las negaciones a dichas clases como clases de equivalencias
* Para la partición, se *identificarán las Clases* para las cuáles se especifican *distintos comportamientos*.
* Se deben armar clases de equivalencia para entradas inválidas
* Dos criterios de selección de test:
	* 1. Cada caso cubre tantas clases de equivalencia como sea posible
	* 2. Cada caso cubre a lo sumo una clase. (Y a estos casos se les suma un caso más por cada clase de equivalencia para las entradas inválidas)
### Análisis de Valores Límites
* Enfoque para selección de tests en testing de caja negra.
* Un caso de test de valores limites es un conjunto de datos de entrada que están en los límites de las clases de equivalencia
* Para cada clase se seleccionan valores en los límites, valores que están justo fuera de los límites, valores que estén justo dentro de los límites y un valor normal.
* Para las clases válidas, se elije un valor normal.
* Si nos piden en valores límites, con poner los 6 casos en los límites, están bien.
* A la hora de seleccionar los casos de test tenemos:
	* *Para los programas de una entrada con rango definido, un criterio:*
		* 2 valores limite, 2 valores justo fuera, 2 valores justo dentro, 1 valor normal => 7 Casos
	* *Para los programas de múltiples entradas,dos criterios:*
		* Todas las combinaciones posibles de las distintas entradas (inviable) => 7^n
		* Valores limites en una variable y valores normales en las otras + un caso con valores normales para todas => 6n + 1
### Grafo de causa-efecto
* Enfoque para selección de tests en testing de caja negra.
* Ayuda a seleccionar las combinaciones de las clases de equivalencia como condiciones de entrada. Y por ende estamos analizando las salidas.
* Primero se deben identificar *causas & efectos* y luego *qué causas producen qué efectos*.
	* *Causa:* distintas condiciones en la entrada que pueden ser verdaderas o falsas.
	* *Efectos:* idem con las salidas
* *Causas y Efectos* son *Nodos* en el Grafo. Las dependencias son las  *Aristas*, que pueden ser "positivas" y "negativas". Además, existen nodos "and" y "or" para combinar la causalidad.
* Se puede armar una *Tabla de decisión* a partir del Grafo y esta puede utilizarse para armar los distintos casos de tests.

*Observaciones:*
	En la tabla que genera el grafo son 1 y 0 (positivos/negativos) y las X es, no me importa.
 
### Testing de a pares
* Enfoque para selección de tests en testing de caja negra.
### Casos Especiales
* Enfoque para selección de tests en testing de caja negra. No se toman mucho
### Testing basado en estados
* Enfoque para selección de tests en testing de caja negra.
* Se debe lograr pasar por todas las transiciones
* Cobertura de transiciones, cobertura de par de transiciones, cobertura de arbol de transiciones

## Testing de Caja Blanca
* Sí utiliza la estructura interna del código, se enfoca principalmente en ella
* Los casos de test se derivan de allí
* 

## Testing de Caja Negra vs Testing de Caja Blanca

* Vemos Caja Negra como *FUNCIONAL* y Caja Blance como *ESTRUCTURADO*.
* La principal diferencia es que: *Uno no tiene acceso al código, el otro sí*
* Es incorrecto decir tener acceso al software, pues los tests se enfocan principalmente en código, y existen componentes del SW que NO son código. Además, SIEMPRE se tiene acceso al SW como tal.
* Tener cuidado con las filminas que dice sobre software como caja negra.
* Mientras que el testing funcional es útil a un Alto Nivel y para detectar errores de Input/Output, el testing estructural es útil a un bajo nivel y para detectar errores de lógica del programa.
* Son complementarias y pueden usarse ambas.
* *Caja Gris* como un punto intermedio, tenés accesos a ciertas partes del código. Ejemplo: Lenguaje orientado a objetos, podes ver la signatura pero no podes ver como esta implementado => ver una parte de código.
