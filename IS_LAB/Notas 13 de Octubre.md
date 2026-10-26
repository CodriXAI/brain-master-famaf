* Santi esta atentos a los detalles, esto implica:
	* Análisis y fundamentos sobre tecnisismos y casos de fortalecimiento excesivo.
* Map en el front facilita la busqueda en O(1), no recomendable para para cantidades pequeñas.

## Requerimientos Importantes

### Validacion de cuentas
Posiblemente validación de cuenta (Si es que llegamos, será necesario validar un mail)
Recuperación de contraseña (lo mismo, si es que llegamos)
Edición de Perfil (a decisión de diseño, NO es importante)

### Ranking
*Ranking Global (Ordena por puntos en todos los partidos de liga publica, no cuenta amistosos ni ligas privadas, en caso de empate, NO puede NO haber un ganador, puntos, goles a favor, en caso de querer agregar algo más, se soluciona el problema como decisión de diseño nuestra, lo más simple posible)*
### Comportamientos:
*Crear y editar un comportamiento de jugador (Esencial por lo que dijo Santi, hay que hacer n validaciones de seguridad, LAS QUE SEAN CONVENIENTES)*
Eliminar comportamiento (no se puede eliminar un comportamiento que está siendo utilizado)
Probar el comportamiento (posiblemente para debugging, nada esencial)
Intercambiar comportamientos
Comportamiento de DT (No lo consideremos hasta terminar los esenciales, pero si hay asignado un comportamiento de DT => NO puedo hacer cambios manualmente)
### Ligas:
**Crear liga privada (En teoría debería estar hecho)**
*Iniciar la liga (Esencial, pensar antes de hacerlo el intérvalo de los partidos, si será secuencial uno tras otro, o añadiremos un break entre partidos, generar la tabla de posiciones, me tiene que mostrar el calendario o fixture, y la liga se juega SOLA, en ningun momento un jugador inicia un partido)*
*Cancelar la liga (siendo owner, y si tenemos ya salir de la liga entonces debería poder eliminarse también)*
*Lobby de liga en curso (Esencial, cuando está iniciada, el ranking, el fixture, etc. Incluyen espectadores posiblemente)*
*Cambiar alineación (muy conveniente para aprovechar la mecánica de los amistosos, NO se puede elegir nuevos jugadores, a diferencia de un cambio, el cambio de alineación se cambia la alineación por default, solo la de UNA LIGA en concreto)*
Buscar Ligas/Amistosos (Posiblemente podamos hacer un query, sale rapido)

No se admitiría que las ligas hayan empates, si hay empates, se definen por penales, se gana normal: son 3 puntos, por penales son 2, y perder da 0 puntos. Puede patear cualquier jugador, son solo 5. Habría una pausa extra para los penales (NO lo considero esencial para lo que ya tenemos para hacer).

### Partidos
*Pausas (HALF Y COOLING, decidir intérvalos, si habrán pantallas adicionales, etc. a decisión de diseño el reposicionamiento, con la cancha espejada tras el HALF TIME, se hace uno por pausa, no preocuparse mucho por las condiciones de carrera)*
*Intercambios de jugadores (durante las pausas, y durante el partido en curso, frena el reloj, NO se calculan los ticks durante la pausa, POSIBLEMENTE haya que modificar el motor acá)*

## SPRINT 3
* Análisis y descomposición de tickets, estimación y selección de prioridades
* Enfocar las prioridades de los requerimientos para que Futbot pueda tener una mejor experiencia de juego.
* Armar parejas de BACK-FRONT para el desarrollo.
* El jueves ya tener la descomposición, estimación, todo en Jira distribuido, y con la idea (workflow) de orden de prioridades (qué es y qué no es lo más importante) pero tener un criterio.
* Requisitos para el proceso: 
	* Ningún requerimiento está completo sin sus unit test
	* Todo cambio en una PR
	* Etc etc, lo tipico.
* Si ya hay requerimientos del sprint 3 hechos por adelantados, ya está.
## ROADMAP PARA EL JUEVES (IDEAL TENER BASTANTE ARMADO) NADA OFICIAL
* Definir nuevos POs y SMs avisar por zulip
* Descomposición de tickets + estimación (incluidos los del sprint 2)
* Armar la lista de prioridades (es posible cambiar)
* Asignar todos los tickets
## OBJETIVO DEL SPRINT
* Entregar el juego más divertido, completo posible. Siempre priorizar la jugabilidad.
* El principal diferenciador respecto a proyectos es que los comportamientos son automáticos.
* Importante tener en cuenta el 2do parcial, calendario, contratiempos, para la gestión de los tiempos.

