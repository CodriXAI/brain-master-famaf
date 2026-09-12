# Caso de uso #1: Pedir un turno con un médico en particular

**Actor Primario:**
* Paciente

**Precondición**
* El sistema se encuentra en línea.
* Existe al menos un médico registrado con al menos un turno.

**Escenario exitoso principal:**
1. El paciente ingresa al sistema y solicita pedir un turno.
2. El sistema muestra al paciente las opciones para hacerse un estudio dado o elegir un médico en particular.
3. El paciente selecciona la opción "Elegir un médico en particular".
4. El sistema verifica que el paciente tenga un usuario y una historia clínica abierta.
5. El sistema muestra el listado de los médicos con sus respectivos turnos con día y horarios menores a 3 meses de anticipación mediante checkboxes, indicando si están o no disponibles.
6. El paciente selecciona un médico, dia y horario disponible.
7. El sistema calcula los coseguros a pagar, verifica que pueda ser pagado en efectivo y muestra el monto.
8. El paciente confirma el turno.
9. El sistema registra el turno y muestra la confirmación.

**Escenarios excepcionales**

*4.a Paciente sin usuario con historia clínica abierta y CON obra social*
* El sistema detecta que el paciente no tiene usuario con historia clínica abierta.
* El sistema solicita al paciente llenar los datos.
* El paciente ingresa un username y contraseña para el usuario, y nombre, DNI, Obra social y N° de Obra social para la historia clínica.
* El sistema crea el usuario con su respectiva historia clínica abierta.
* El sistema retoma desde el paso 5.

*4.b Paciente sin usuario con historia clínica abierta y SIN obra social*
* El sistema detecta que el paciente no tiene usuario con historia clínica abierta.
* El sistema solicita al paciente llenar los datos.
* El paciente ingresa un username y contraseña para el usuario, y nombre, DNI, y N° Tarjeta de Crédito para la historia clínica.
* El sistema crea el usuario con su respectiva historia clínica abierta.
* El sistema retoma desde el paso 5.

*5.a No existen turnos disponibles*
* El sistema detecta que todos los turnos con menos de 3 meses de anticipación están ocupados.
* El sistema informa que no hay turnos disponibles en ese momento.
* Finaliza el caso de uso.

*7.a No existen coseguros para pagar*
* El sistema calcula $\$0$ de coseguro e informa que el turno no requiere pago adicional.
* El sistema retoma desde el paso 8.

*7.b El coseguro tiene coste muy alto y el paciente POSEE una tarjeta de crédito registrada*
* El sistema detecta que el coseguro excede el monto para pagar en efectivo y que en la historia clínica del paciente existe una tarjeta de crédito asociada.
* El sistema le muestra al paciente la opción de pagar con tarjeta.
* El paciente confirma el pago con tarjeta.
* El sistema retoma desde el paso 8.

*7.c El coseguro tiene coste muy alto y el paciente NO POSEE una tarjeta de crédito registrada.*
* El sistema detecta que el coseguro excede el monto para pagar en efectivo y que en la historia clínica del paciente NO existe una tarjeta de crédito asociada.
* El sistema informa que no es posible otorgar el turno sin un medio de pago con tarjeta registrado.
* Finaliza el caso de uso.
