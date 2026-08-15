Sea una BD de una universidad:
	• Materia con atributos: nombre y semestre;
	• Carrera con atributos: nombre y duración;
	• Facultad con atributos: nombre y universidad.

• Una carrera puede ser dictada en diferentes facultades, con significados
diferentes.

Suponer que esos son todos los atributos que se van a usar y no hay más. Hacer
un diagrama de entidad-relación.

Pensar:
• ¿Qué tipo de conjunto de entidades es carrera?
• ¿Cómo se relaciona carrera con facultad?
• ¿Qué tipo de conjunto de entidades es materia?
• ¿Cómo se relaciona materia con carrera?

OBS: Cuando nos preguntan **TIPO DE CE** se refieren a si es:
* **FUERTE:** Tiene atributos suficientes para formar una clave primaria por si misma
* **DÉBIL:** NO tiene atributos suficientes para identificarse por si sola y necesita de una "entidad padre" y una "relación" para existir y ser distinguida

## Preguntas:

• ¿Qué tipo de conjunto de entidades es carrera?
Es Conjunto **DÉBIL**, nos dicen que una carrera con mismos atributos entre facultades puede cambiar el significado => Dependemos de Facultad para identificar a la Carrera.

• ¿Cómo se relaciona carrera con facultad?
Una carrera (como significan distinto por facultad) puede ser de A LO SUMO una Facultad
mientras que una Facultad puede tener VARIAS carreras. Es relación 1 <-> N

• ¿Qué tipo de conjunto de entidades es materia?
Es Conjunto **DÉBIL**, pues una materia con mismos atributos puede significar distinto entre diferentes carreras (Análisis Matemático de Física NO es igual a Análisis Matemático de Compu) => Dependemos de qué carrera estemos hablando

• ¿Cómo se relaciona materia con carrera?
Una materia puede estar en UNA carrera, mientras que una carrera puede tener VARIAS materias,
Es relación 1 <-> N

## Diagrama de E-R


![[p1_e3.png]]
