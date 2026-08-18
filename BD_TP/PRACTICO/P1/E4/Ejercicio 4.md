El siguiente diagrama E-R tiene algunos errores. Se pide identificarlos y corregirlos; 
además seleccionar las claves primarias y discriminadores adecuados para cada uno de los conjuntos de entidades.

![[assets/diagrama_e4.png]]

## Posibles Errores:
* Cliente, asi como está representado, parece decirnos que es CE Débil, pues con los atributos que tiene en el diagrama, no se puede identificar por si solo a cada entidad, sin embargo, un cliente no tendría por qué depender de otros CE, entonces es una CE Fuerte MAL definida, se puede solucionar colocando un atributo id_cliente y que este sea clave candidata.
* Ausencia total de Superclaves (En cliente sería ID y en Cuenta N° Cuenta) y discriminantes (N° Transaccion en Transacción).
* Además sabemos que Transacción es un CE Débil (Varias Cuentas podrían tener mismo num de transacción, monto y fecha), por lo que depende de la cuenta para identificar a una transacción como tal. Por lo tanto la relación log debería simbolizarse con doble rombo (relación identificadora) y como tal entonces tenemos que hay participación total por parte del lado de las transacciones en dicha relación, además el discriminante es el N° Transacción.

## Soluciones Plasmadas:
![[p1_ej4.png]]