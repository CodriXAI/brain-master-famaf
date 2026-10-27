## ¿Qué es el proceso de software?¿Por qué lo dividimos en fases?
Es lo que se ejecuta para llegar al producto terminado, es un conjunto de fases donde cada una realiza una tarea bien definida y produce una salida, dichas salidas son los productos de trabajo.
Se dividen en fases con el fin de modularizar el problema, tratarlo en partes más pequeñas y manejables.

## Explicar que es el Enfoque ETVX
Es el enfoque que sigue cada una de las fases del proceso de SW, sirve para resolver el problema de cuándo una fase empieza y termina. Para ello se definen criterios de entrada y salida para cada fase:

*ETVX* Proviene de:
*E*ntry o Criterio de Entrada: Se definen qué condiciones deben cumplirse para empezar la fase
*T*ask: Se define qué tareas se harán en cada fase
*V*erification: Qué controles o inspecciones se realizan al producto de trabajo
e*X*it o Criterio de Salida: Qué condiciones deben cumplirse para finalizar la fase

Las fases se unen en un pipeline, donde los criterios de salida de una fase debe ser consistente con los criterios de entrada de la fase posterior en caso de existir.

## Explicar el proceso de inspección
Es un proceso de software estructurado, con el objetivo de detectar defectos en los productos de trabajo, mejorando calidad y productividad, para lograrlo se definen distintos roles los cuáles se reúnen:

* *Moderador :D* Tiene la responsabilidad general, asegurándose de mantener el foco de la reunión en la detección de defectos, así como un ambiente ordenado y amigable, para que nadie se sienta atacado.
* *Autor* Quien realizó el producto de trabajo
* *Revisor* Quien identifica los defectos
* *Lector* lee linea a linea el producto de trabajo para enfocar el progreso de la reunión
* *Escriba* registra las observaciones

Las fases de este proceso son:

### Planeamiento
* Se selecciona al equipo de revisión
* Se identifica al moderador
* Preparar el paquete para la distribución:
	* Producto de trabajo,
	* especificaciones del mismo,
	* lista de control con items,
	* estándares.
### Preparación y repaso
Todos los miembros revisor del equipo revisan individualmente el producto de trabajo:
* Identificar defectos potenciales en registro individual, se usan listas de control y estándares.
### Reunión de revisión grupal
* El propósito es definir la lista final de defectos
* El criterio de entrada revisiones individuales adecuadas, revisadas por el moderador
* En la reunión:
	* Se lee linea a linea el producto de trabajo
	* Se efectúa cualquier observación
	* Se discute para determinar el defecto
	* El escriba registra la decision
* Fin de reunión:
	* Escriba presenta la lista final
	* Pocos defectos => Se acepta el producto
	* Muchos defectos => Se hace otra revisión
	* Resumen de inspecciones para analizar la efectividad de la revisión
### Corrección y seguimiento
* Se entrega el producto de trabajo del autor junto con la lista de defectos /observaciones con el fin de que se hagan las correcciones necesarias
* Una vez corregido, si el moderador aprueba, finaliza el proceso, caso contrario se someterá a otra revisión. 

## Explicar el proceso de administración del proyecto
Aquel que se encarga de asegurar la ejecución eficiente de las fases del proceso de desarrollo, se divide en 3 partes.
### Planeamiento
* Se produce antes de iniciar el proyecto, incluye:
	* Estimación de costos y tiempos
	* Selección de personal
	* Planeamiento del seguimiento
	* Y del control de calidad
### Seguimiento y Control
* Se revisa constantemente el proceso de desarrollo para verificar que se esté cumpliendo en tiempo y forma:
	* Seguir y observar parámetros clave: Como costo y tiempo
	* Tomar acciones correctivas si es necesario
* Las métricas del proceso de desarrollo son las que nos brindan la info para esta etapa.
### Análisis de Terminación
* Se realiza al terminar el proceso de desarrollo, se analiza el desempeño del proceso e identifica lo aprendido, en iterativo, se realiza luego de cada iteración.

