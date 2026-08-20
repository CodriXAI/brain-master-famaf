## ¿Cuál es el objetivo del Análisis del Problema?
Lograr una buena comprensión de las necesidades, requerimientos y restricciones del software
### El Análisis incluye:
* Entrevistas con clientes y usuarios.
* Lectura de manuales.
* Estudio del sistema actual.
* Ayudar al cliente/usuario a comprender nuevas posibilidades.

## Nombre y explique los distintos métodos para el Análisis del Problema
### Enfoque Informal
* No hay una metodología definida y no se construye un modelo formal del software.
* La información se plasma y se organiza directamente en la SRS.

### Método de Análisis Estructurado
* Se enfoca en las funciones que realiza el software.
* Visualizado como una red de transformaciones de datos por los que fluye la información.

**Pasos:**
1. Dibujar el *Diagrama de Contexto*, donde el sistema es tratado como un solo proceso con sus respectivas entradas, salidas, fuentes, sumideros, entre otros.
2. Dibujar el *DFD* del sistema existente, refinando el del contexto, un DFD es una representación gráfica del flujo de datos del sistema.
3. Dibujar el DFD del sistema propuesto e identificar la *barrera hombre-máquina*, se agregan al DFD todos los procesos (automatizados o no) identificando cada grupo.
### Modelado Orientado a Objetos
El sistema es visto como objetos que interactúan entre sí o con el usuario a través de servicios provistos. Se modela utilizando el *Diagrama de Clases*.
### Prototipado
Se construye un sistema parcial prototípico que ayuda a visualizar como será el sistema final, tiene dos enfoques:
* **Descartable:** El prototipo se descarta al finalizar la fase.
* **Evolutivo:** Se piensa el prototipo de manera que evolucione al sistema final.