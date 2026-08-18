En una universidad hay alumnos con atributos: 
* id_persona
* nombre
* DNI
* carrera
* año_ingreso; 
También hay profesores con atributos: 
* id_persona
* nombre
* DNI
* título
* dedicación
Finalmente hay administrativos con atributos: 
* id_persona
* nombre
* DNI
* puesto 
* Antigüedad. 

Los alumnos, profesores y administrativos están asociados a una facultad. 

Hacer el diagrama de entidad-relación; aplicar generalización y especialización. 

No olvidar las restricciones de integridad de diferentes tipos. ¿Qué se gana con aplicar especialización y generalización?

**Especialización:** Creación de *subgrupos* dentro de una CE para distinguir entre diferentes entidades, heredan atributos, relaciones, claves, etc del CE padre.
**Generalización:** Se determina en base a los *subgrupos*, qué comparten y que no del CE padre: Si una entidad del CE padre puede pertenecer a más de un subgrupo (solapada) o no (disjunta) o si es parcial (varias entidades del CE padre pueden estar en los subgrupos) o total (todas las entidades del CE padre deben estar en los subgrupos).

## Diagrama de E-R sin especialización-generalización:

![[p1_ej5_v1.png]]
## Diagrama E-R con Especialización:

![[p1_ej5_v2.png]]
## Diagrama con especialización-generalización:

![[p1_ej5_v3.png]]

## ¿Qué ganamos?
* Evitamos rebundancia entre CE.
* Diagrama más limpio y legible.
* Optimización.