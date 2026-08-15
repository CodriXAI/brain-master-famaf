Indicar conjuntos de relaciones y restricciones de integridad (i.e.
correspondencia de cardinalidades y forma de participación) para el siguiente
enunciado.

* Un socio puede tener prestado varios libros 
* Todo libro ha sido prestado a lo sumo a un socio. 
* Una biblioteca puede tener varios libros
* Todo libro debe pertenecer a lo sumo a una biblioteca. 
* Un socio puede estar inscripto en varias bibliotecas 
* Una biblioteca puede tener varios socios. 
* Bibliotecario trabaja en a lo sumo una biblioteca 
* En una biblioteca puede haber varios bibliotecarios. (AMBIGUO SI NO TIENE BIBLIOTECARIOS XD pero bueno, asi se define)

## Detección de Entidades (CE):
* Socios
* Libros
* Bibliotecas
* Bibliotecarios
## Detección de Relaciones:
* Socio:
	* Libros (varios)
	* Bibliotecas (varios)
* Libro:
	* Socios (max uno)
	* Bibliotecas (max uno)
* Biblioteca:
	* Libros (varios)
	* Socios (varios)
	* Bibliotecarios (varios)
* Bibliotecario:
	* Biblioteca (max uno)

## Detección de Participaciones:
* Socio:
	* Libros (parcial)
	* Bibliotecas (parcial)
* Libro:
	* Socios (parcial)
	* Bibliotecas (parcial)
* Biblioteca:
	* Libros (parcial)
	* Socios (parcial)
	* Bibliotecarios (parcial)
* Bibliotecario:
	* Biblioteca (parcial)

## Diagrama:


![[p1_e2.png]]