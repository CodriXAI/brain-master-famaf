## Explique Punto Función
* Es una métrica que define el tamaño del sistema en términos de funcionalidad.
* Requiere solo la SRS.
* Hay 5 parámetros que logran capturar la funcionalidad total del sistema:
### Entradas externas
Dato/Control, Externa a la aplicacion
### Salidas externas
Tipo de salida que deja el sistema
### Archivos lógicos internos
Grupo lógico de dato/control manipulado
### Archivos de interfaz externa
Archivos pasados compartidos entre aplicaciones
### Transacciones externas
queries.

* Se clasifican todas las funciones del sistema en alguno de estos parámetros y se la vuelve a clasificar en *simple, promedio o compleja*. Hay una tabla que asigna un peso numérico en cada función según su clasificación.

**Cálculo de Puntos Función (PF)**

**1. Puntos Función No Ajustados ($UFP$)**

$$UFP = \sum_{i=1}^{5} \sum_{j=1}^{3} w_{ij} \cdot C_{ij}$$
Donde:

- **$w_{ij}$**: Peso asociado al tipo de función $i$ con complejidad $j$ (Baja, Media, Alta).
    
- **$C_{ij}$**: Cantidad de funciones del tipo $i$ con complejidad $j$.
    
- **$i$**: Representa los 5 tipos de componentes (EE, SE, CE, ALI, AIE).
    
- **$j$**: Representa los 3 niveles de complejidad (Baja, Media, Alta).
    

**2. Factor de Ajuste de Complejidad ($CAF$)**

Una vez obtenido el **Punto Función No Ajustado ($UFP$)**, se lo ajusta según la complejidad del entorno. Se evalúan **14 características generales del sistema** (como comunicación de datos, reusabilidad, facilidad de operación, facilidad de instalación, etc.) en una escala de **0 a 5**.

$$CAF = 0{,}65 + 0{,}01 \cdot \sum_{i=1}^{14} F_i$$

- **$F_i$**: Evaluación (grados de influencia de 0 a 5) para cada una de las 14 características del entorno.
    

**3. Puntos Función Ajustados ($PF$)**

Con los dos valores calculados previamente, se obtiene el **Punto Función final**:

$$PF = CAF \cdot UFP$$

**Nota rápida de examen:** 

 *NO ES RELEVANTE LAS CANTIDADES EQUIVALENTES DE PUNTO FUNCIÓN EN LOC, SI MENCIONAR LA RELACIÓN DE PF CON LOC DEPENDIENDO LA EMPRESA.* 