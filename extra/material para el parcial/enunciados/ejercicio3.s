# Notas sobre el ejercicio

* cada elem tiene un largo de hasta 2bytes,


.text:
la a1, mediciones       # Dirección de la 1er medición.
lb a2, largo            # Cantidad de mediciones.
li a3, 0x0F00           # Valor del umbral.

li t0, 0                # Contador de las mediciones que superan el umbral.
li t1, 0                # Para trackear cuántas mediciones ya revisamos en el while.
li t2, 0x0000FFFF       # Máscara para limpiar la extensión de signo de las mediciones.

while:
bge t1, a2, exit        # Chequeamos la guarda del while: ya revisamos todas las mediciones?

lh t3, 0(a1)            # Cargamos la i-ésima medición.
and t3, t3, t2          # Aplicamos la máscara a la medición para limpiar la parte alta.
bleu t3, a3, continue   # Chequeamos si la medición <= umbral.
addi t0, t0, 1          # Como medición > umbral incrementamos el contador.

continue:
addi a1, a1, 2          # Avanzamos el puntero a la siguiente medición.
addi t1, t1, 1          # Incrementamos el contador de mediciones.
j while

exit:
srai a2, a2, 1          # Shiftear 1 a la derecha equivale a dividir por 2.
li a0, 0                # Seteamos a0 = 0.
ble t0, a2, print       # Chequeamos si el contador de mediciones es <= largo / 2.
li a0, 1                # Hay más de largo / 2 mediciones que superan el umbral.

print:
li a7, 1
ecall                   # Imprime a0 en la consola.

li a7, 10
ecall                   # Frena la ejecución del simulador.

.data:
mediciones: .half 0x1100 0x00F0 0xA200 0x1000
largo: .byte 4


### mis notas:
La mascara se aplica sobre el registro rd donde se guarda el dato que es un halfword.
En otras palabras el dato tiene 16bits, 
cuando se guarda en el rd pasa a tener 32bits 
y por defecto lw, lh, extiende el signo.
Pero despues al comparar rd, con el umbral (que esta en otro registro) podria malintepretarse su valor, 
ademas por enunciado el dato no tiene signo.
Por ultimo el dato es de 2bytes (16bits) por eso al actualizar el puntero (inicio del vector) le sumo 2.

### Como usar la mascara:
como mi dato es de 2bytes, y me registo donde lo guardo es de 4bytes, uso 0x0000FFFF, 
los F, son 1111 y dejan pasar el bit los 0 matan al bit.

### Extra:
Para evitar usar una mascara, podria usar las instrucciones que terminan el u (unsigned), 
en este caso el dato es un halfword(16bits) , y pordria usar la instruccion lhu. 
si fuese el caso tambien podria usar SLLI, dezplamiento de hacia la izq logico(que es unsigned)
 
