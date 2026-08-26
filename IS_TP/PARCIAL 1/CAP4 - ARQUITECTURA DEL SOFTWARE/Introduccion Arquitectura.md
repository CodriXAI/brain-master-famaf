El objetivo de la Arquitectura, es formar una estructura mediante la subdivisión del software, dividir al sistema en partes independientes y visualizarlo en un nivel alto de abstracción.

## ¿Qué es la Arquitectura?
Es la estructura del sistema que comprende los elementos del software, propiedades externamente visible de tales elementos  y la relación entre ellas

Obs: No está claro en la definición de Arquitectura, los requisitos a cumplir para que sea considerada buena arquitectura, o mala arquitectura. 

## Rol de la Arquitectura del Software
Divide al sistema en partes lógicas tal que puedan ser *entendidas independientemente*.
Además describe las relaciones entre ellas.

Las distintas estructuras posibles son:

### Entendimiento y Comunicación:
* Presentación de un sistema a alto nivel => Esconder complejidades y facilitar su entendimiento
* Además facilita la comunicación entre sus actores involucrados (usuarios, cliente, arquitecto, diseñador, entre otros).
### Reuso:
*  La arquitectura debe elegirse de forma tal que se pueda componer el sistema con partes ya existentes, reusadas o nuevas.
* Aumenta la Productividad.
### Construcción y Evolución:
* Dividir en componentes sirve como guía para el desarrollo del sistema.
* Útil para evolucionar el sistema, ayudando a decidir qué componentes modificar y ver el impacto que se tendrá.
### Análisis:
* Se desea que *confiabilidad/desempeño* se pueda determinar en el diseño de alto nivel
* Se consideran alternativas de diseño hasta tener niveles de satisfacción deseados


## Diferencia con el Analista
El Analista entiende el problema (dominio del problema), el Arquitecto entiende como resolverlo (dominio de la solución).

## Definiciones complementarias:
En la Arquitectura del Software, es la etapa más temprana donde se pueden evaluar propiedades tales como:

*Confiabilidad:*  Capacidad del sistema de sostener un nivel de funcionamiento bajo condiciones determinadas por un tiempo prolongado. 

*Desempeño:* Referible a los tiempos y respuesta del sistema y este depende fuertemente de la arquitectura elegida.

Véase estructura *Análisis*.