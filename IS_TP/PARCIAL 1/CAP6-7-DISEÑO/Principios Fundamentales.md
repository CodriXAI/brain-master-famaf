El diseño es *CREATIVO* (puede implementarse según interpretación subjetiva) => No hay PASOS RIGUROSOS para su creación, pero si existen ciertos principios a seguir.

## ¿Cuáles son los principios fundamentales del Diseño?

### Partición y Jerarquía:
* "Divide y vencerás"
* Dividir el problema en varias partes manejables, incluye:
	* Cada parte debe *solucionarse/modificarse* separadamente.
* Las partes no son totalmente independientes entre si, se comunican y cooperan
* Hay que tratar de minimizar la dependencia => Diseño mas simple y mantenible.
* Mayor comunicación => Mayor Complejidad.
* Dicho particionado va a generar una jerarquía entre las partes involucradas.
### Abstracción:
* Describir el comportamiento externo del componente, ocultando detalles internos.
* **En Componentes existentes:** 
	* Ve Componentes como *CAJAS NEGRAS*.
	 * Provee comportamiento externo y oculta detalles.
	* Se usa para entender sistemas existentes => rol en mantenimiento.
* **Durante proceso del diseño:**
	* Las componentes no existen
	* Solo se usa el comportamiento externo para decidir la interaccion entre componentes.
	* Nos concentramos en un componente a la vez.
	* El diseñador controla la complejidad.
	* Permite transición gradual de lo más abstracto a lo concreto.

* Existen dos tipos de mecanismos comunes de abstracción:
	* **Abstracción Funcional:**
		* Especifica el comportamiento funcional de un módulo.
		* Módulos como funciones de entrada/salida.
		* Se especifica el módulo con pre y post.
	* **Abstracción de datos:**
		* Datos como objetos junto a sus operaciones.
		* Las operaciones definidas para un objeto son realizables solo en el mismo objeto (encapsulados)
		* Desde afuera los detalles internos del objeto se ocultan y solo son visibles sus operaciones (Véase los TADs)
### Modularidad:
* Sistema modular como conjunto de componentes discretas que pueden implementarse por separado y un cambio en una no causa gran impacto en las demás. Resultado de la conjunción entre Particionado y Abstracción.

## ¿Cuáles son las estrategias/enfoques de jerarquías de componentes?
Hay 2 enfoques:
### Top-Down:
* Componente de más alto nivel (más abstracta) hasta las más concretas y simples
### Bottom-Up:
* Componentes más simples hasta las de más alto nivel
