- **Especificación / Oráculo**: Un sistema de monitoreo de energía de un dispositivo acepta un rango de energía $N$ en el rango de $1$ a $100$. En caso de que esté dentro del rango permitido, el sistema envía "Dispositivo con energía", en caso de ingresar un valor menor a 1, el sistema envía "El dispositivo se apagó por falta de energia" y en caso de ingresar un valor mayor a 100, el sistema envía "El dispositivo se apagó por seguridad".
## Particionado por Clases de Equivalencia
- **Clases de Equivalencia**:
    - **Clase Válida**: $1 \le N \le 100$ (Rango permitido)
    - **Clase Inválida:** $1 > N$ (Rango inferior al mínimo permitido)
    - **Clase inválida:** $100 < N$ (Rango superior al máximo permitido)
- **Casos de Test:**
	- **T1 (Clase Válida):** $N = 5$ $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"
	- **T2 (Clase Inválida):** $N = 0$ $\rightarrow$ Resultado esperado (Oráculo): "El dispositivo se apagó por falta de energia"
	- **T3 (Clase Inválida):** $N = 108$ $\rightarrow$ Resultado esperado (Oráculo): "El dispositivo se apagó por seguridad".

## Análisis de valores límites
* **Límite Inferior: (N=1)**
	* Justo afuera (Inválido): N = 0 $\rightarrow$ Resultado esperado (Oráculo): "El dispositivo se apagó por falta de energia"
	* En el borde (Válido): N = 1 $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"
	* Justo adentro (Válido): N = 2 $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"
* **Límite superior: (N = 100)**
	* Justo afuera (Inválido): N = 101 $\rightarrow$ Resultado esperado (Oráculo): "El dispositivo se apagó por seguridad"
	* En el borde (Válido): N = 100 $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"
	* Justo adentro (Válido): N = 99 $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"
* **Valor Intermedio: (N=50)**
	* Intermedio: N = 50 $\rightarrow$ Resultado esperado (Oráculo):  "Dispositivo con energía"