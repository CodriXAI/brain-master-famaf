## ¿Qué es el diseño orientado a funciones?
El sistema es visto como una función que transforma entradas en salidas deseadas.
Lo mismo ocurre con los módulos especificandose como funciones o procesos.

## ¿Qué es un Módulo?
* Un módulo es una parte lógicamente separable de un programa.
* Es una unidad discreta e identificable respecto a compilación y carga.

## ¿Qué es el Acoplamiento en Funciones?
* Definido como un grado de dependencia (relaciones) que hay *ENTRE LOS MÓDULOS*.
* Es un concepto inter-modular.
* Deseable que haya *bajo acoplamiento* entre módulos.
Puede darse por:
* **Tipo de conexión:**
	* Tiene que ver con la complejidad y oscuridad de las interfaces de un módulo.
		* **Disminuye:** Solo las entradas definidas en un módulo son usadas por otro.
		* **Aumenta:** Usamos interfaces indirectas y oscuras (no es facil de ver), variables compartidas.
* **Complejidad de cada interfaz:**
	* Cantidad y complejidad de los parámetros.
	* Más compleja => Más acoplamiento.
* **Tipo de flujo de información:**
	* Con qué info se comunican los módulos:
	* **Bajo acoplamiento:** La comunicación es solo a través de info de datos o info de control
	* **Alto acomplamiento:** Comunicación híbrida (datos + control).

## ¿Qué es la Cohesión en Funciones? Listar los Tipos de más baja cohesión a mas alta y definir.
* Definido como la relación que hay entre los elementos *DEL MISMO MÓDULO*.
* Es un concepto intra-modular.
* Deseable que haya *alta cohesión* entre elementos del módulo.
* Tipos de Cohesión, ordenados de más baja cohesión a más alta (y su escala no es LINEAL, ejemplo: Funcional está mucho mas lejos que el resto en términos de cohesión):
### Casual:
* La relación no tiene significado.
### Lógica:
* Existe relación lógica entre elementos del módulo
* Necesito de Flags para indicar tipo de registro
### Temporal:
* Similar a la anterior pero están relacionados con el tiempo y se ejecutan juntos
### Procedural:
* Elementos que pertenecen a una misma unidad procedural.
### Comunicacional:
* Elementos que operan sobre un mismo dato.
### Secuencial:
* La salida de un elemento es la entrada de otro.
### Funcional: 
* La mejor, todos los elementos trabajan juntos para cumplir una sola función.

## ¿Cómo se determina la Cohesión de un módulo?
* Describir el propósito del módulo en una oración (generalmente sigue los siguientes casos).
* **Oración Compuesta:** Comas o mas de un verbo, secuencial o comunicacional.
* **Oración relacionada al tiempo:** secuencial o temporal.
* **Oración sin un unico objeto específico:** lógica.
* **Oración con palabras como inicializar/limpiar:** temporal.
* **Oración simple:** Funcional.

## ¿Qué es el diagrama de estructura? ¿Para qué sirve?
* Es una notación gráfica para especificar una *estructura estática* del sistema.
* Representa los módulos sin jerarquía y sus interconexiones.
* Los diseñadores pueden representar de forma rapida sus decisiones para poder evaluarlas/modificarlas

## ¿Qué es la metodología de diseño estructurado? ¿Cuáles son sus pasos? Explique
Son pautas que ayudan al diseñador durante el proceso de diseño
Su objetivo es especificar módulos de funciones y sus conexiones siguiendo una estructura jerárquica de bajo acoplamiento y alta cohesión. Objetivo: Crear un árbol post factorización.

**PASOS:**
### 1. Reformar el problema como un DFD:
Captura el flujo de datos del sistema propuesto y lo representa en un DFD.
### 2. Identificar entradas y salidas más abstractas:
* **MAI (entradas):**  Elementos de datos en el DFD que están más distantes de la entrada real pero que pueden considerarse entradas
* **MAO (salidas):** Idem con las salidas.
* Separa las distintas funciones del sistema:
	* Subsistema que realiza principalmente entradas.
	* Idem con transformadores.
	* Idem con la presentación de las salidas.
### 3. Realizar el primer nivel de factorización:
* Especificar el módulo principal.
* Un módulo de entrada subordinado por cada MAI.
* Un módulo de salida subordinado por cada MAO.
* Un módulo de transformados subordinado por cada transformador central.
### 4. Factorizar módulos de entrada salida y transformadores:
* Se "explotan" los módulos realizados en paso 3.
### 5. Mejorar la estructura:
* Aquí se utilizan *Heurísticas y Verificación*.

## Heurísticas de diseño:
* Son reglas generales o principios básicos para mejorar la estructura del sistema (Paso 5)
* Tienen que ver con:
	* Tamaño del módulo (Sospechar si se pasa de las 100 LOC).
	* Cantidad de Flechas de salida y llegada (Sospechar si son más de 5 flechas de salida y las de llegada debe maximizarse).
	* Alcance del efecto y control de un módulo.
	* Rule of Thumb (Dirección del Viento con el dedo) "Por cada módulo, el alcance de efecto debe ser subconjunto del de control" (Que si yo me modifico, me voy a verificar a mis subordinados, y en caso de que haya un cambio fuera del subconjunto, sospechar)
## ¿Cuál es el objetivo de la verificación del diseño?
Asegurar que el diseño implemente los requerimientos => Corrección

## Métricas del Diseño orientado a funciones
### Tamaño
Cant de módulos y sus tamaños.
### Complejidad
Módulos simples es mejor
### Métricas de red
Enfocado en diagrama de estructura. Es bueno si el módulo tiene un solo módulo invocador
### Métricas de estabilidad
Cantidad de módulos dependientes de el que tiene otro módulo
### Métricas de flujo de información
Mide complejidad en funcion de la info. que entra/sale, modulos que llaman/llama:

DC = fun_in * fun_out + in_flow * outflow

Se calcula el promedio y desviación estándar de todos los módulos => 
DC = media + estándar  -> Propenso a error
media < DC < media + estándar -> Complejo
Normal en caso contrario