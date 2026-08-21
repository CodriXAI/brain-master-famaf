## Respecto al Partido:
* 2 modos de juego: Amistosos y de liga.
* 6 Jugadores de cada equipo por partido (formato 3 vs 3) 3 jugadores titulares, 3 jugadores suplentes.
* Se pueden cambiar los comportamientos establecidos de los jugadores DURANTE el partido.
* Duración por partido: N minutos.
* Turnos (jugadas, ticks): En vivo y síncronos.
* Hay 3 pausas: 2 cooling break y 1 entretiempo, equidistantes en terminos a la duración N.
* Un cambio por pausa (o entre pausas), es decir, 3 cambios por partido.
* No hay cansancio ni factores externos que modifiquen el partido.
* En cada partido: El usuario puede ver stats y comportamientos de sus propios jugadores, sin embargo, para el usuario enemigo, solo podemos ver las stats, MAS NO sus comportamientos.
## Respecto a las Ligas:
* Se pueden listar.
* Se puede ver el ranking.
* Si tienen contraseña son privadas, si no, son publicas.
* Tiene un fixture que lo decide el sistema.
* Cada una contendría: Nombre, tiempo de partido (*sin límite*), cantidad de equipos max, min (con cota inferior de al menos 3 equipos), contraseña debe ser opcional.
* Una vez creada la liga, el usuario que la creó automáticamente está participando con su equipo *(atentos a los casos de uso aquí)*.
* Se juegan todos contra todos a partido único, con tabla de puntaje. 
*  Los 6 jugadores se eligen por liga y son a elección del usuario.
## Respecto a Usuarios:
* Se puede crear un usuario:
	* Nombre.
	* Email - *Es único*.
	* Password.
* Login por usuario:
	* Email.
	* Password.
* El usuario puede crear y eliminar jugadores, incluye al crear:
	* Nombre.
	* Número.
	* PACSS (Atributos) - *NO PUEDEN CAMBIAR por jugador*.
	* Al momento de la liga, elige los titulares y los suplentes y en cuanto a comportamientos, debemos tomar una decisión si los comportamientos son preestablecidos por default o al azar.
* El usuario puede crear Comportamientos (cada uno dura UN TICK):
	* Nombre.
	* Código.
* Cada Usuario tiene la capacidad de crear un equipo:
	* Nombre.
	* Avatar del club.
* Definimos y especificamos al usuario el comportamiento (no hacerlo tan complicado).
## Respecto a los Jugadores:
* Un jugador es manejado por un bot, vía comportamientos en base a estadísticas.
* No hay limite de creación de jugadores, pueden ser N.
* Los jugadores actúan en tiempo real mediante *código Python*.
## Respecto a los Equipos:
* Es uno por usuario
* Se pueden listar.
## Respecto a los Comportamientos:
* No hay limite de cantidad de comportamientos, son N.
* Los comportamientos se crean con antelación, al momento del partido solo se validan.
* Los cambios de comportamientos es manual (salvo que implementemos al DT como un script automatico).
* Los cambios de comportamientos se ejecutan en el siguiente tick (turno), y no son definitorios (es decir, que se pueden volver a cambiar).
* Los jugadores titulares deben tener comportamientos pre-partido, los suplentes no es necesario.
## Reglas varias:
* No hay arqueros (comportamientos de agarrar con la mano).
* No hay arbitros, faltas ni offside.
* Hay un ranking global de todos los equipos con sus puntos.
