.data
dato: .word   7
str1:     .string "El factorial de "
str2:     .string " es "
# recuerden que los ecall son llamadas a sistema
# en este caso sirven para imprimir por pantalla
# toma por a0 el valor y por a7 el tipo de ecall
# si a7 vale 4 imprime un string, si vale 1 imprime
# un entero y si vale 10 sale del programa
# !! no van a entrar en el parcial !!
# los usamos para diagnosticar en informar el resultado
# del programa
.text
main:
        lw  a0, dato   # Carga el valor del dato
        jal ra, fact   # Hace jal a fact

        # Imprime el resultado a consola
        mv  a1, a0
        lw  a0, argument
        jal ra, printResult

        # Sale del programa
        li a7, 10
        ecall

fact:
        # prologo
        addi sp, sp, -8
        sw   ra, 4(sp)
        sw   a0, 0(sp)
        addi t0, a0, -1
        bge  t0, zero, nfact

        addi a0, zero, 1
        addi sp, sp, 8
        jr ra

nfact:
        addi a0, a0, -1
        jal  ra, fact
        addi t1, a0, 0
        lw   a0, 0(sp)
        lw   ra, 4(sp)
        addi sp, sp, 8
        mul a0, a0, t1
        ret

# --- printResult ---
# a0: El valor con el que calculamos el factorial
# a1: El resultado
printResult:
        mv t0, a0
        mv t1, a1
        la a0, str1
        li a7, 4
        ecall
        mv a0, t0
        li a7, 1
        ecall
        la a0, str2
        li a7, 4
        ecall
        mv a0, t1
        li a7, 1
        ecall
        ret

