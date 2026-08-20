## Respecto al Partido:
* 6 Jugadores de cada equipo por partido (formato 3 vs 3) 3 jugadores titulares, 3 jugadores suplentes.
* Se pueden cambiar los comportamientos establecidos de los jugadores DURANTE el partido.
* Duración por partido: N minutos.
* Turnos (jugadas): En vivo y síncronos.
* Hay 3 pausas: 2 cooling break y 1 entretiempo.
* Un cambio por pausa (o entre pausas), es decir, 3 cambios por partido.
* No hay cansancio ni factores externos que modifiquen el partido.
## Respecto a las Ligas:
* Cada una contendría: Nombre, tiempo de partido, cantidad de equipos max, min (con cota inferior de al menos 3 equipos), contraseña debe ser opcional.
* Una vez creada la liga, el usuario que la creó automáticamente está participando con su equipo *(atentos a los casos de uso aquí)*.
* Se juegan todos contra todos a partido único, con tabla de puntaje. 
*  Los 6 jugadores se eligen por liga y son a elección del usuario.
## Respecto a Usuarios:
* Cada Usuario tiene un equipo.
* Definimos y especificamos al usuario el comportamiento (no hacerlo tan complicado).
## Respecto a los Jugadores:
* Un jugador es manejado por un bot, vía comportamientos en base a estadísticas.
* No hay limite de creación de jugadores, pueden ser N.
* Los jugadores actúan en tiempo real mediante *código Python*.
## Respecto a los Comportamientos:
* No hay limite de cantidad de comportamientos, son N.
* Los comportamientos se crean con antelación, al momento del partido solo se validan.
* Los cambios de comportamientos es manual (salvo que implementemos al DT como un script automatico).
* Los cambios de comportamientos se ejecutan en el siguiente tick (turno), y no son definitorios (es decir, que se pueden volver a cambiar).
* Los jugadores titulares deben tener comportamientos pre-partido, los suplentes no es necesario.
## Reglas varias:
* No hay arqueros (comportamientos de agarrar con la mano).
* No hay arbitros, faltas ni offside.
