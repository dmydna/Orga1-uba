.data
dato: .byte 0xF0 0x0F 0xFE 0x3C
dato_msg: .string "El dato es:"
result_msg: .string "Cantidad de impares:"
.text
main:
    #cargamos el dato
    lw s0, dato
    li a7, 4
    la a0, dato_msg
    ecall 
    mv a0, s0
    li a7, 34
    ecall 
    #limpiamos s1 para tener la constante 1
    xor s1, s1, s1
    addi s1, s1, 1
    #limpiamos s2 para el contador
    xor s2, s2, s2
    #comparamos el primer byte 
    and s3, s0, s1
    #contamos
    add s2, s2, s3
    #corremos un byte
    srli s0, s0, 8
    #comparamos el segundo byte 
    and s3, s0, s1
    #contamos
    add s2, s2, s3
    #corremos un byte
    srli s0, s0, 8
    #comparamos el tercer byte 
    and s3, s0, s1
    #contamos
    add s2, s2, s3
    #corremos un byte
    srli s0, s0, 8
    #comparamos el cuarto byte 
    and s3, s0, s1
    #contamos
    add s2, s2, s3
    li a7, 4
    la a0, result_msg
    ecall 
    mv a0, s2
    li a7, 34
    ecall 
    #salimos
    li a7, 93
    li a0, 0
    ecall



### mis notas:
para saber si un dato es inpar , me fijo en su ultimo bit, 
si es 1 es impar ,caso contrario si es 0 es par.
la idea del ejercicio es ir limpiando y solo dejar el ultimo bit de cada dato e ir sumando
### Extra:



    
