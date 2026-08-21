## ¿Qué son los Casos de Uso?
* Capturan el comportamiento del sistema como *interacción* entre los usuarios con el sistema
* Se enfocan solo en la especificación con la funcionalidad
* Se pueden utilizar durante el análisis
## Objetivos de Casos de Uso
* Es un contrato entre el usuario y el comportamiento del sistema
* La forma básica es *textual*.
* Generalmente a los usuarios les agrada, comprenden el formato y reaccionan facilmente. Es útil para la recolección de reqs.
## Formato de Casos de Uso
* **Actor:** Una persona o un sistema que interactúa con el sistema propuesto para alcanzar un objetivo. El actor (sea primario o secundario) es el que inicia del Caso de Uso, *NO el sistema*.
* **Actor Primario:** El actor tiene la razón de ser, es el que genera que se haga el Caso de Uso.
* **Actor Secundario:** Cuando el actor primario da la orden y el actor secundario interactúa con el sistema porque por alguna razón el actor primario no está interactuando. Ergo: El cajero de banco humano. *NO siempre existe*.
* **Escenario:** Conjunto de acciones realizadas con el fin de alcanzar un objetivo bajo ciertas condiciones, las acciones se especifican paso a paso, Un paso es una acción lógicamente completa realizada tanto por el actor como por el sistema, la interacción es SOLO entre Actor a Sistema y no entre actores.
* **Escenario exitoso principal:** Cuando todo funciona bien y se alcanza el objetivo, *podría tener subcasos*.
* **Escenarios Alternativos (de Excepción):** Cuando algo sale mal y el objetivo no pudo ser alcanzado.
## Observaciones
* Un caso de uso es una colección de escenarios .
* Un escenario puede emplear otros casos de uso en un paso.
* Por ende, hay jerarquía.
* Los casos de uso NO forman la SRS completa, *solo la parte funcional*.
## ¿Cómo se elaboran los casos de uso?
Se elaboran haciendo refinamientos paso a paso, para lo cuál se proveen cuatro niveles de abstracción de forma natural:

1. Actores y Objetivos
2. Escenarios exitosos y principales
3. Condiciones de falla
4. Manipulación de fallas

Además, los cuatro niveles pueden dirigir el diseño desde lo más abstracto hacia lo más concreto, especificándo los casos de uso al nivel de detalle que sea suficiente , no hay criterio general para esto. 

Para escribirlos, lo ideal siempre es elegir una buena gramática simple.