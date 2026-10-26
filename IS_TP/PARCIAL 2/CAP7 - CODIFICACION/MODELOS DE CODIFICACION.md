## INCREMENTAL
![[Pasted image 20261025190838.png]]

*Explicación:* Partiendo de la especificación, se comienza a implementar una parte de las funcionalidades, una vez implementadas se desarrollan scripts de test con el fin de testear dichas funcionalidades nuevas, al terminar el desarrollo de los tests, se deben correr los tests desarrollados y, en caso de existir tests viejos, también se evalúan. En caso de obtener errores durante la corrida de los tests, se debe arreglar el código, en implementación o en scripts de test dependiendo la causa que genera el o los errores, esto último se repite hasta que no hayan más errores por parte de los tests, una vez que no hubieron errores, se observa si todas las funcionalidades de la especificación fueron implementadas, si no es el caso, se continua implementando nuevas funcionalidades, caso afirmativo, se finaliza el proceso

*Paso a paso directo:*

**Proceso de Codificación Incremental:**
1. Inicio: Se toma la especificación de requerimientos del módulo.
2. Implementación: Se escribe el código necesario para cubrir un cierto incremento de funcionalidad.
3. Desarrollo de Tests: Se crean o actualizan los scripts de test para probar la nueva funcionalidad
4. Corrida de Tests: Se corren y evalúan los scripts de test, tanto nuevos como viejos en caso de existir.
5. Fix: En caso de surgir errores, se modifica el código de la implementación o script de test según la causa de fallo, para la posterior re-ejecución del paso anterior.
6. Alcance: Con los scripts de test libre de errores, si no se han cubierto todos los requerimientos de la especificación, se vuelve al paso 2, caso contrario se finaliza el proceso de codificación.

## TEST DRIVE DEVELOPMENT (TDD)
![[Pasted image 20261025190909.png]]

 *Explicación:* Partiendo de la especificación, se comienza escribiendo scripts de test para algunas partes de las funcionalidades de la misma, para posteriormente implementar código para que los nuevos casos de test pasen, y que los casos de tests viejos, en caso que hubiera, no se rompan. Se corren todos los scripts de test viejos y nuevos, en caso que hayan dado error, se arregla el código de implementación/scripts de test dependiendo la causa del error y se vuelven a correr los tests, en caso de haber pasado todos los tests exitosamente, se pregunta si el código implementado requiere mejoras, en caso de ser necesario, se realiza una refactorización, es decir, una mejoría en términos de cohesión, acoplamiento y principios SOLID sobre lo ya implementado, no se agrega ninguna nueva funcionalidad/test y se repite nuevamente el flujo desde la corrida de todos los tests, para evaluar si la refactorización no rompió nada en el proceso. En caso de que el código ya esté libre de errores de tests y no requiera mejoras, se pregunta si se implementó todas las funcionalidades de la especificación, de no ser así, se vuelve a correr el flujo desde la etapa de crear nuevos  scripts tests, caso afirmativo, se finaliza el proceso. 
 
**Proceso de Codificación TDD:**
1. Inicio: Se toma la especificación de requerimientos del módulo
2. Desarrollo de tests: Se escriben los scripts de test para una parte de la funcionalidad previo a su respectiva implementación. Los scripts de test comienzan fallando.
3. Implementación minima: Se escribe unicamente el código necesario para que los scripts de test dados en el paso anterior pasen, se tienen en cuenta los scripts de test viejos en caso de existir
4. Corrida de los scripts de test: Se ejecuta el código de todos los scripts de test existentes.
5. Fix: En caso de haber errores, se modifica el código de la implementación ¿o los tests? y se hace la re-ejecución del paso anterior.
6. Refactorización: En caso de no haber errores, se evalúa si el código requiere una mejoría en terminos de cohesión, acoplamiento y/o legibilidad. En caso afirmativo se refactoriza mejorando estos puntos sobre lo ya implementado, no se agregan nuevas funcionalidades ni scripts de test. Se vuelve a ejecutar el paso 4 para evaluar si la refactorización rompió algo o no. En caso negativo, no se refactoriza.
7. Alcance: Si el código ya no necesita mejoras, se consulta si se cubrieron todos los requerimientos de la especificación, en caso negativo, se volverá al paso 2, en caso afirmativo, se finaliza el proceso de codificación.
## PAIR PROGRAMMING
* Es uno de los procesos de codificación.
* El código es elaborado por dos programadores a la vez
	* Ambos diseñan los algoritmos, estructuras de datos, etc.
	* Uno escribe el código.
	* El otro revisa activamente lo que se está escribiendo.
	* Los roles se intercalan periódicamente.
* Mejora el diseño de algoritmo, estructura de datos, etc. Y es más dificil que se escapen condiciones particulares.
* Dependiendo el caso, puede haber pérdida de productividad.