La arquitectura tiene impacto sobre *atributos no funcionales* (modificabilidad, desempeño, confiabilidad, portabilidad, entre otros). Se deben evaluar elecciones de diseño y codificación en la arquitectura propuesta. ¿La forma? hay muchas, pero veremos una *metodología rigurosa: ATAM (Architecture Tradeoff Analysis Method)*

## ¿Qué es ATAM?
ATAM (Architecture Tradeoff Analysis Method) es una técnica elaborada y formal para evaluar la arquitectura de un sistema.

Analiza la arquitectura para ciertas propiedades, identifica dependencias entre las mismas y hace un analisis de compromisos, en relacion a atributos de calidad/interes, bajo una serie de pasos:

### 1. Recolectar Escenarios:
* Se recoletan escenarios (interacciones con el sistema) de interés para el análisis
### 2. Recolectar requerimientos y/o restricciones:
* Se define qué se espera del sistema en el escenario, especificando los niveles deseados para el atributo de interés.
### 3. Describir las vistas:
* Se recolectan las vistas que serán evaluadas
### 4. Análisis específico de cada atributo:
* Se analizan las vistas bajo los distintos escenarios separadamente para cada atributo de interés.
### 5. Identificar puntos de sensibilidad y compromiso:
* Donde:
	* **Puntos de sensibilidad:** Elementos que tienen mayor impacto en un atributo.
	* **Compromisos:** Elementos que son puntos de sensibilidad en varios atributos.