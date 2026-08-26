*OBS:* Este es un borrador de lo que interpretamos como un contrato de API, con fines de lograr perfeccionarlo y completarlo, traemos a colación un ejemplo de endpoint: 
*Registro de Nuevo Usuario* vinculado directamente con los *Casos de Uso y Requerimientos*.

### 1. `POST /api/v1/auth/register` (Basado en CU-01)

Registra un nuevo usuario en la plataforma y crea su equipo asociado.

### Request Body:

```json
{ 
	"username": "Maradona10", 
	"email": "diego@famaf.unc.edu.ar", 
	"password": "Password123!", 
	"team_name": "La Paternal FC", 
	"team_avatar": "???"            // Maybe URL? 
}
```

### Responses:

#### 201 Created

```json
{
  "user_id": 1,
  "username": "Maradona10",
  "email": "diego@famaf.unc.edu.ar",
  "team": {
    "id": 10,
    "name": "La Paternal FC",
    "avatar": "???"
  }
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

*Caso 2: Nombre de equipo existente*:

```json
{
	"error" : "DUPLICATE_TEAM_NAME",
	"message" : "El nombre de equipo ingresado se encuentra en uso. Por favor elegir otro nombre"
}
```

*Caso 3: Avatar inválido*:

```json
{
	"error" : "INVALID_AVATAR",
	"message" : "Formato del Avatar inválido"
}
```

#### 500 Internal Server Error (Error no controlado por el servidor)

```json
{
	"error" : "INTERNAL_SERVER_ERROR",
	"message" : "Ocurrió un error inesperado al procesar el registro"
}
```