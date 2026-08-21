## ¿Cuál es la salida final de esta primer etapa?
La SRS.

## ¿Por qué los modelados (DFD, OO,  Prototipado) NO son SRS?
El modelado se enfoca en la estructura del problema, mientras que la SRS se enfoca principalmente en comportamientos externos del sistema.

Diferencia de ejemplo: La IU no se modela, pero es necesaria en la SRS.

La transición del modelo a la SRS, *NO ES DIRECTA*.

Tampoco la SRS es una formalización del modelo.

## ¿Cuáles son las características de una SRS?
### Correcta
Todos los requerimientos de la SRS hayan sido deseados por el cliente.
### Completa
Todos los requerimientos deseados por el cliente están en la SRS (MUY Dificil).
### No Ambigua
Los requerimientos tienen un solo significado bajo ese contexto.
### Consistente
No hay contradicciones entre requerimientos.
### Verificable
Para cada requerimiento hay un proceso efectivo que garantiza que se está cumpliendo. Que sea medible o chequeable por cada req.
### Rastreable
Puede determinarse el origen de cada requerimiento (de la SRS al sistema) y cómo se relaciona con el software, de manera bidireccional:
*Hacia Adelante:* Qué elementos del software satisfacen el requerimiento.
*Hacia Atrás:* Qué requerimiento satisfacen los elementos del software.
### Modificable
Permite incorporar cambios fácilmente manteniendo completitud y consistencia (anteriormente mencionados). Se debe evitar a toda costa la *rebundancia*, porque complica la modificación.
### Ordenada en términos de importancia y estabilidad
Tiene bien definido el orden de prioridades, así, se reducen riesgos debido a cambios de reqs.
Los requerimientos pueden ser críticos, importantes pero no críticos, deseables pero no importantes.
Algunos reqs son *esenciales* y dificilmente cambien con el tiempo, otros son más propensos a cambiar.

## ¿Qué debe contener una SRS?
Una SRS debe contener requerimientos sobre:
### Funcionalidad
* Conforma la mayor parte de la especificación
* Especifica toda la funcionalidad que el sistema debe proveer
* Salidas, entradas y relaciones entre ellas
* Todas las operaciones que el sistema debe realizar
* Entradas válidas y verificaciones de validez de entrada/salida
* Comportamiento del sistema ante entradas inválidas, errores u otras anomalías o casos normales pero imposibles de operar.
### Desempeño (Performance)
*Requerimientos Dinámicos:* Especifican restricciones en runtime:
* Tiempo de respuesta
* Tiempo esperado de terminación dada una operación
* Tasa de transferencia o rendimiento
* Cant de operaciones realizadas en un tiempo dado
*Requerimientos Estáticos:* No imponen restricción en runtime:
* Cantidad de terminales admitidas
* Cantidad de usuarios admitidos en simultáneo
* Cantidad de archivos a procesar y sus tamaños
Todos los requisitos se especifican en términos medibles, por ende, verificables.
### Restricciones de Diseño
Hay factores en el entorno del cliente que restringen el diseño, por ejemplo:
Ajustarse a estándares y compatibilidad con otros sistemas.
### Interfaces Externas
* Todas las interacciones del software con gente, hardware y otros softwares se debe especificar de forma clara.
* La IU debe recibir atención adecuada
* Deben permitir ser verificables, evitar "debe ser bonito", ser lo más específicos posibles

## ¿Cuál es el objetivo de validar la SRS? ¿Cómo se valida?
Asegurar que esta refleje de forma clara y certera las necesidades del cliente, se hace una revisión entre cliente, usuarios, autor y desarrollador. Se suelen usar checklists

## ¿Cuál es el ALCANCE en la Especificación de los Requerimientos?
* Qué cosas abarca y NO abarca el proyecto.
* Objetivos, entregables y requerimientos. Tiempos de entrega.
* Orden de Prioridades para saber que hacer primero.
* Criterio de aceptación (¿Qué tipo de usuario lo aceptará?).
* Limites presupuestarios.
