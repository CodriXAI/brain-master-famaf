Aquí haremos foco en la *Vista de la arquitectura C&C*, pues es la más utilizada y que más haremos foco en la materia.

## ¿Qué es un Estilo Arquitectónico?
* Estructura general que será util para la arquitectura de cierta clase de problema.
* Define una *Familia de Arquitecturas* que satisface las restricciones de ese estilo.

## Para la vista de Componentes y Conectores (C&C) ¿Cuáles son?
### Pipe & Filter (Tubos y Filtros):
* Adecuado para sistemas que realizan transformaciones de datos
* Un solo componente => Filtros, Un solo conector => Tubos
* La información llega a un Filtro, este la transforma, se la pasa a otro Filtro vía un Tubo
* Importante mencionar lo del sistema puro
* *Restricciones:* 
	* *Filtros:* 
		* Solo produce/consume datos.
		* No conoce identidad de otros filtros.
		* Hace *buffering* (Desacopla velocidad de procesamiento entre un filtro productor y un consumidor) y *Sincronización* (Permite esperar o bloquearse segun la disponibilidad de la informacion). 
	* *Tubos:*
		* Son unidireccionales.
		* Solo conectan filtros: Salida de uno es entrada del otro.
### Estilo de datos compartidos:
* Presenta dos tipos de componentes:
	* **Repositorio de Datos:**  Provee almacenamiento permanente.
	* **Usuario de Datos:** Acceden a los datos del repo, realizan acciones y colocan nuevamente los datos modificados al repo.
* Los usuarios solo se conectan al repo
* **Conector**: lectura/escritura
* Dos variantes:
	* **Estilo Pizarra:** Se notifica a todos los usuarios al modificarse/agregarse datos.
	* **Estilo Repositorio:** Repositorio Pasivo, no se avisa.
### Cliente-Servidor:
* **Componentes:** Clientes - Servidores
* Los clientes solo se comunican con el servidor, y son los que siempre inician la comunicación.
* **Conector:** Solicitud/Respuesta (request/reply) - Es asincrónico.
* Estructura multinivel en general:
	* Nivel Cliente: Clientes
	* Nivel Intermedio: Lógica de negocios del servidor
	* Nivel base de datos: Donde reside la info.
### Publicar - Subscribir:
* **Componentes:** Los que Publican y los que Subscriben
* **Conector:** Publicar/Subscribir
* Se publica un evento, se invocan componentes subscriptas a él.
### Peer To Peer:
* Solo un unico tipo de componente, cada componente le puede pasar servicios a otra.
### Procesos que se comunican:
* Procesos que se comunican entre sí mediante mensajes.