# API - CONTRATO

### 1. `POST /api/v1/auth/register`

Registra un nuevo usuario en la plataforma.

### Request Body:

```json
{ 
	"username": "Maradona10", 
	"email": "diego@famaf.unc.edu.ar", 
	"password": "Password123!"
}
```

### Responses:

#### 201 Created

```json
{
  "user_id": 1,
  "username": "Maradona10",
  "email": "diego@famaf.unc.edu.ar"
}
```

#### 400 Bad Request (Datos de entrada inválidos o duplicados)

*Caso 1: Email existente*:

```json
{
	"error" : "DUPLICATE_EMAIL",
	"message" : "El email ingresado se encuentra en uso. Intentar de nuevo"
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado al procesar el registro"
}
```

### 2. `PATCH /api/v1/users/{userId}`

**Path Parameters:**
* userId(integer, requerido): ID único del usuario a modificar.

Cambia el nombre del usuario especificado.

### Request Body:

```json
{ 
	"username": "Pepe"
}
```

### Responses:

#### 200 Ok

```json
{
  "user_id": 1,
  "username": "Pepe",
  "email": "diego@famaf.unc.edu.ar"
}
```

#### 400 Bad Request

*Caso 1: Username ya en uso*:

```json
{
	"error" : "DUPLICATE_USERNAME",
	"message" : "El nombre elegido ya está siendo utilizado por otro usuario"
}
```

#### 404 Not Found
```json
{
    "error": "USER_NOT_FOUND",
    "message": "El usuario solicitado no existe."
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado"
}
```

### 3. `DELETE /api/v1/users/{userId}`

**Path Parameters:**
* userId(integer, requerido): ID único del usuario a eliminar.

Elimina el usuario especificado.

### Request Body:

(void)

### Responses:

#### 204 No Content

#### 404 Not Found
```json
{
    "error": "USER_NOT_FOUND",
    "message": "El usuario solicitado no existe."
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado"
}
```

### 4. `POST /api/v1/teams/`

Registra un equipo en la plataforma.

### Request Body:

```json
{ 
	"teamName" : "alfajoresFC", 
	"teamAvatar" : "https://example.com/avatars/alfajores.png"
}
```

### Responses:

#### 201 Created

```json
{
  "team_id" : 1,	
  "teamName" : "alfajoresFC",
  "teamAvatar" : "https://example.com/avatars/alfajores.png"
}
```

#### 400 Bad Request (Datos de entrada inválidos o duplicados)

*Caso 1: Nombre de equipo existente*:

```json
{
	"error" : "DUPLICATE_TEAM_NAME",
	"message" : "El nombre ingresado se encuentra en uso por otro equipo. Intentar de nuevo"
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado al procesar el registro"
}
```

### 5. `DELETE /api/v1/teams/{teamId}`

**Path Parameters:**
* teamId(integer, requerido): ID único del equipo a eliminar.

Elimina el equipo especificado.

### Request Body:

(void)

### Responses:

#### 204 No Content

#### 404 Not Found
```json
{
    "error": "TEAM_NOT_FOUND",
    "message": "El equipo solicitado no existe."
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado"
}
```