# Especificación Tickets FutBot | Cris

## Tickets a especificar:

* 1.4  [FRONT] Integrar el formulario con el endpoint de registrar usuario y manejar errores de registro
* 3.2  [BACK] Implementar endpoint de crear jugador `POST /api/v1/players`
* 4.3  [BACK] Implementar comportamientos por default 
* 5.3  [FRONT] Integrar  “UI” con el endpoint `GET /api/v1/behaviors/{behavior_id}` (provisional) [e implementar manejo de errores si los hay].
* 7.1  [BACK] Implementar endpoint de listar ligas `GET /api/v1/leagues`
* 8.3  [FRONT] Integrar formulario con el endpoint e implementar manejo de errores
* 11.3 [FRONT] Implementar  UI de la creación del amistoso.
* 13.1 [BACK] Implementar endpoint de unirse a partido amistoso `POST /api/v1/matches/{matchId}/join`
* 14.6 [FRONT] Redirigir a la pantalla de partido **Duda sobre el propósito de la existencia de este ticket, consultarlo si es posible con Fer, y si no podríamos utilizar directamente el requerimiento 16**

## Nuevos Tickets a especificar:
Iniciar Partido:
* 14.3 [BACK] Implementar Websocket del partido
Ejecutar comportamientos:
* 15.3 [BACK] Enviar resultados de los cambios realizados por el comportamiento. 
Inicialización del sistema:
* 18.2 [FRONT] Inicialización de proyecto ReactJS. 
Websockets:
* 19.1 [WS] Implementar Event Bus y WS global de eventos del sistema.

## Especificaciones:

### 1.4 [FRONT] Integrar el formulario con el endpoint de registrar usuario y manejar errores de registro

**Dado que** el usuario completó el formulario de registro con datos válidos,

**cuando** confirma el envío,

**entonces** el Frontend se comunica con la API y maneja la respuesta según el resultado

**Notas Técnicas**
* Endpoint: `POST /api/v1/auth/register`
* Utiliza el servicio `createHttpService` para realizar la llamada al Backend
* Al recibir la respuesta:
    * Mostrar el mensaje acorde al código HTTP

**Criterios de Aceptación**
* Bloqueo de reenvío ante request en curso
* Si recibe `201`, mensaje de éxito con redirección hacia login
* Si recibe `400 DUPLICATE_EMAIL`, mensaje error puntual sin resetear el form
* Si recibe `500`, mensaje de error inesperado del servidor sin romper la UI

### 3.2  [BACK] Implementar endpoint de crear jugador `POST /api/v1/players`

**Dado que** el usuario tiene un equipo creado y debe tener jugadores para participar de un partido,

**cuando** el usuario envía los datos del nuevo jugador,

**entonces** el backend debe validar los datos enviados y, si son correctos, crear el jugador asociado a su equipo.

De esta forma, el usuario puede crear el jugador con sus atributos dentro del rango permitido.

**Notas Técnicas:**

* Endpoint: `POST /api/v1/players`
* El backend utiliza la clase jugador para crear la instancia del mismo.
* Requiere autorización: *Bearer Token*.
* Request Body: name, number, power, agility, control, speed, strength.
* Al recibir la respuesta:
    * Agregar al jugador al equipo.
    * Actualizar la lista de jugadores en la base de datos.

**Criterios de aceptación:**

* Debe persistir en memoria el jugador creado asociado al equipo.
* Debe responder `201 CREATED` con: player_id, name, number, power, agility, control, speed, strength.
* Debe responder `401 UNAUTHORIZED` si el token falta, está vencido o es inválido.
* Debe responder `400 INVALID_PACCS_TOTAL` si la suma de atributos es distinta de 300 o si algún atributo está fuera del rango 20-100.
* Debe responder `400 DUPLICATE_JERSEY_NUMBER` si el equipo ya tiene un jugador creado con el atributo número definido con el valor detectado del jugador en proceso de creación.
* Debe responder `400 INVALID_PLAYER_DATA` si el nombre es vacío o solo espacios, si falta algún campo o si algún valor numérico no es entero.

### 4.3  [BACK] Implementar comportamientos por default

**Dado que** el sistema debe proveer comportamientos por default desde el primer momento.

**cuando** se ejecuta la inicialización del sistema.

**entonces** deben existir al menos 3 comportamientos, disponibles para cualquier usuario vía `GET /api/v1/behaviors`.

**Notas técnicas:**
* Campo: **is_default** bool en behaviors (true = del sistema; false = del usuario).
* Endpoint: `GET /api/v1/behaviors`
* Los comportamientos por default serán de tipo:
    * Ofensivo: patea la pelota, establece acciones agresivas. 
    * Defensivo: se mantiene cerca del arco propio, intercepta dentro de `get_reach_distance()`. 
    * Neutro/portero: bajo movimiento, reacciona solo en su radio.

**Criterios de aceptación:**

* Existen al menos 3 comportamientos cargados cuyo flag **is_default** en True.
* `GET /api/v1/behaviors` los devuelve para cualquier usuario autenticado, incluso sin haber creado comportamientos propios.
* Ejecutan sin excepción en un tick de prueba.
* Cada uno es funcionalmente distinguible en una simulación simple (ej. el ofensivo se acerca a la pelota, el defensivo no se aleja de su arco).

### 5.3 [FRONT] Integrar  “UI” con el endpoint `GET /api/v1/behaviors/{behavior_id}` [e implementar manejo de errores si los hay].

**Dado que** el listado completo de comportamientos por default ya fue obtenido vía `GET /api/v1/behaviors`,
**cuando** el usuario selecciona uno,
**entonces** el frontend realiza una petición a `GET /api/v1/behaviors/{behavior_id}` y despliega el detalle completo (nombre, descripción y código) en la UI.

**Notas Técnicas:**
* Endpoint `GET /api/v1/behaviors/{behavior_id}`
* Token de autenticación
* Utiliza el servicio `createHttpService` para realizar la llamada al Backend
* Al recibir la respuesta:
    * Mostrar el mensaje acorde al código HTTP

**Criterio de Aceptación**
* Ante respuesta `200`: renderiza correctamente el nombre, la descripción y el bloque de código del comportamiento.
* Ante respuesta `401`: redirige automáticamente al usuario al /login notificando que la sesión expiró.
* Ante respuesta `404`: muestra un mensaje de error indicando que el comportamiento no existe o fue eliminado.


### 7.1  [BACK] Implementar endpoint de listar ligas `GET /api/v1/leagues`

**Dado que** existen ligas registradas en el sistema,

**cuando** el usuario autenticado con token solicita el listado,

**entonces** el backend devuelve las ligas paginadas por estado según el parámetro recibido.

**Notas técnicas:**
* Endpoint: `GET /api/v1/leagues`
* Query params: page (default 1), limit (default 20), status (PENDING/IN_PROGRESS/FINISHED)

**Criterios de Aceptación**
* Devuelve `200` paginado según `page` y `limit`.
* Si no hay ligas, devuelve lista vacía, no error.
* Devuelve `401` si no hay token válido.

### 8.3  [FRONT] Integrar formulario con el endpoint e implementar manejo de errores

**Dado que** el usuario seleccionó una liga, ingresó la contraseña si correspondía, y configuró su alineación y formación,

**cuando** el usuario confirma la inscripción,

**entonces** el Frontend invoca el endpoint `POST /api/v1/leagues/{leagueId}/teams` con esos datos, y ante éxito, redirige a la sala de espera (lobby) de la liga.

**Notas técnicas:**

* Body combina: password (si liga privada) y team_id se infiere del equipo del usuario autenticado. **(Saqué lo de alineaciones / formaciones si va a ser un endpoint aparte)**
* Bloqueo de reenvío mientras hay request en curso.

**Criterios de Aceptación:**
* `201` → redirige a la sala de espera.
* `400` LEAGUE_UNAVAILABLE → "la liga ya está iniciada".
* `400` PASSWORD_UNAVAILABLE → la liga requiere contraseña (en caso que lo amerite).
* `401` PASSWORD_INCORRECT → error puntual, sin resetear la configuración táctica ya elegida.
* `404` NOT_FOUND → liga ya no existe (sugerir refrescar el listado).
* `409` ALREADY_JOINED → el equipo ya está inscripto.

### 11.3 [FRONT] Implementar UI de la creación del amistoso

**Dado que** el usuario quiere crear un partido amistoso,

**cuando** accede a la pantalla de creación,

**entonces** ve un formulario con la duración de un partido, con un botón para confirmar.

**Notas técnicas:**
* Único campo propio: duración del partido (número, minutos).
* **Este ticket no llama al backend**.

**Criterios de aceptación:**
* El formulario muestra duración.
* El botón "Crear" está deshabilitado hasta completar el campo duración del partido.

### 13.1 [BACK] Implementar endpoint de unirse a partido amistoso `POST /api/v1/matches/{matchId}/join`

**Dado que** existe un partido en espera de un rival,

**cuando** un equipo con el mínimo de jugadores y comportamientos envía su alineación y formación para unirse,

**entonces** el sistema inscribe al equipo y marca al partido como `IN_PROGRESS`

**Notas técnicas:**
* Endpoint: POST /api/v1/matches/{matchId}/join
* Request body: team_id.
* Al confirmarse la unión, el sistema debe disparar el evento `MATCH_STARTED` por el Event Bus.

**Criterios de aceptación**
* Dado equipo válido y partido disponible, responde `200` y el partido pasa a `IN_PROGRESS`.
* Dado alineación/formación inválida, responde `400` `INVALID_SETTING`.
* Dado partido inexistente o cancelado, responde `404` `MATCH_NOT_FOUND`.
* Dado partido ya iniciado o cupo ocupado por otro equipo (condición de carrera), responde `409` `MATCH_UNAVAILABLE` sin duplicar la inscripción.
* Dado equipo sin mínimo de jugadores y/o comportamientos, responde `422` `PRECONDITION_FAILED`.

### 14.6 [FRONT] Redirigir a la pantalla de partido

**Dado que** el usuario está en la sala de espera

**cuando** el sistema emite `MATCH_STARTED` para ese partido por el canal WS global.

**entonces** el frontend solicita el token del partido, conecta al canal correspondiente, y recién ahí redirige de la sala de espera a la pantalla de partido.

**Notas técnicas:**
* Gestión de la pantalla de partido vía conexión con websockets global

**Criterios de aceptación:**
* Al recibir la respuesta de websockets global: se ejecuta la redirección de manera automática sin intervención del usuario.

## Nuevas especificaciones:

### 14.3 [WS] Implementar Websocket del partido

**Dado que** un partido pasa a estado IN_PROGRESS,

**cuando** un jugador de ese partido solicita conectarse a la transmisión en vivo,

**entonces** el sistema le emite un token temporal y acepta la conexión WS autenticada con ese token.

**Notas técnicas:**
* `POST /api/v1/matches/{matchId}/live-token` → websocket_url + token JWT, expira en 60s.
* **No incluye** la emisión de **TICK_UPDATE**, eso depende del motor de simulación. Este ticket es solo la infraestructura de conexión/autenticación.

**Criterios de Aceptación:**
* `POST /api/v1/matches/{matchId}/live-token` devuelve credenciales válidas para un partido en curso.
* Devuelve `404` si el partido no existe o no está iniciado.
* La conexión WS se rechaza con token inválido/expirado.

### 15.3 [BACK] Enviar resultados de los cambios realizados por el comportamiento.
**Bloqueado hasta resolver lo del motor.**

### 18.2 [FRONT] Inicialización de proyecto ReactJS

**Dado que** el equipo necesita una base común para el frontend,

**cuando** se inicializa el repositorio,

**entonces** queda un proyecto ReactJS corriendo localmente, con la estructura y herramientas que el resto de los tickets FRONT van a reutilizar.

**Notas Técnicas**
* Ruteo (React Router u otro).
* Capa de cliente HTTP compartida *createHTTPService*.
* Variables de entorno (URL base del backend).
* README de instalación/ejecución.

**Criterios de aceptación**
* El proyecto corre de manera local.
* Existe la capa HTTP compartida, lista para usarse.
* El README alcanza para levantar el proyecto sin ayuda externa.

### 19.1 [WS] Implementar Event Bus y WS global de eventos del sistema.

**Dado que** varias pantallas necesitan enterarse en tiempo real de eventos del sistema,

**cuando** ocurre una acción REST que genera uno de esos eventos,

**entonces** el sistema lo retransmite de forma asíncrona a los clientes conectados al canal global.

**Notas Técnicas:**

* POST /api/v1/live-token/global → token + websocket_url, expira en 60s.
* Eventos a implementar: `FRIENDLY_CREATED, FRIENDLY_CANCELLED, GUEST_JOINED_FRIENDLY, LEAGUE_CREATED, LEAGUE_INITIATED, LEAGUE_CANCELLED, TEAM_JOINED_LEAGUE, MATCH_STARTED, MATCH_FINISHED,LEAGUE_MATCH_FINISHED, LEAGUE_FINISHED, LEAVE_LOBBY_LEAGUE, LEAVE_LOBBY_FRIENDLY`.
* Esto implica tocar los endpoints REST ya implementados (crear/cancelar amistoso, unirse, etc.) para que publiquen al bus — no reimplementarlos.

**Criterios de aceptación**
* Token global válido y conexión rechazada si es inválido/expirado.
* Cada acción REST relevante dispara su evento correspondiente en la misma operación (no diferido).
* Un cliente conectado lo recibe sin polling.

## Observaciones:

* En la **especificación del 1.4** se redirecciona al login al recibir `201`, pues por cómo está definida nuestra API, el token para poder acceder al menú principal nos lo da recien al iniciar sesión correctamente. Por eso lo redirecciono a dicha sección. Sino, deberíamos modificar el contrato si lo queremos distinto.

* En la **especificación del 4.3** lo especifiqué como `BACK`, pues aunque no utilice como tal la API HTTP, si utiliza la API de comportamientos. Además, hemos resuelto lo de la bifurcación, solo me faltaría ver si les convence que usemos una flag bool `is_default` con True = del sistema / False = del usuario, o un atributo nulleable `owner_id` que especifique el id del usuario si hay un dueño o *NULL* si el comportamiento es del sistema (por default).

* En la **especificación del 5.3** ya resolvimos lo de la bifurcación, lo único que me falta es saber es si me acoplo al sprint para solamente obtener los datos de los comportamientos por default para ver los detalles, o si me voy un paso adelante y ya lo dejo escalable para el siguiente sprint cuando nos pidan crear comportamientos custom.

* En la **especificación del 7.1** en el **entonces**, "por estado" se refiere  a utilizar el `status = PENDING` como factor a determinar si una liga está o no disponible. 
 