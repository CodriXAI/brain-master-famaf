> Opciones que me brindó Claude para esta dificil decisión :p

## Opción A — Referencia (lo que yo te propuse: is_system=True, sin copiar)

**A favor:**

Cero trabajo extra en el registro — Req 1 (Registrar Usuario) queda exactamente como lo cerraste, sin tocarlo.
Si en algún momento corrigen un bug en un comportamiento default, se arregla una sola vez y todos los usuarios (nuevos y viejos) lo ven actualizado.
Menos filas en la base — al menos 3 comportamientos totales, no al menos 3 × cantidad de usuarios.

**En contra:**

El query de listado (GET /behaviors) tiene que traer "los del sistema + los míos" en vez de "los míos" a secas — un poco más de lógica en un solo lugar.
Si en algún momento quisieran que el usuario pueda editar su copia de un default sin afectar a los demás, con referencia no se puede (pero recordá: CU-18/19/23 hablan de editar comportamientos propios, no hay ningún caso de uso que pida editar un default — así que esto probablemente ni aplique).


## Opción B — Copiar (una fila nueva por usuario, por cada default)

**A favor:**

El modelo de datos es más simple de entender a primera vista: todo comportamiento tiene dueño, sin excepciones ni flags especiales.
Si algún día quisieran permitir edición de la copia sin tocar el original, ya está resuelto de entrada.

**En contra — y este es el que más pesa:**

Genera un ticket nuevo y una dependencia que no existía. Copiar en el registro significa que 4.3 (Comportamientos default) pasa a estar blocked by Req 1 (Registrar Usuario), porque el momento de copiar es al crear la cuenta. Con la Opción A, 4.3 es completamente independiente — se puede hacer en paralelo por cualquiera del equipo sin esperar a nadie.
Consumís tiempo de sprint duplicando datos que son idénticos para todos, sin que ningún requerimiento de tu lista de 16 lo pida.
Contradice un poco el espíritu de la metodología del lab: entregar lo pedido con el menor riesgo, no la solución más "flexible por las dudas".