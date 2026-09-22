## ¿Cuáles son los criterios de evaluación del diseño? Explicar

*OBS:* Eficiencia y Simplicidad no son independientes, se debe hallar un balance.

Posterior al desarrollo del diseño, se evalúan los siguientes criterios:
### Corrección:
* Es correcto si implementa todos los requerimientos
* Hay una relación del diseño con la SRS
* Es *factible* dada las restricciones (muy importante)
### Eficiencia:
* Uso apropiado de los recursos del sistema (CPU y memoria sobre todo).
* En segundo plano por bajo costo del hardware.
### Simplicidad:
* Diseño fácil de comprender => impacta en mantenibilidad (es cara)
* Facilita: testing, detección y corrección de bugs (debugging), donde:
	* **Testing:** Búsqueda constante de errores, con visión negativa del sistema, intentar romperlo
	* **Debugging:** Detectar el motivo del error encontrado en Testing.