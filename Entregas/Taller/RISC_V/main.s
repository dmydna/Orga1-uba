# EJEMPLO 1 en C ::



# int sumar_arreglo(int a [] , int largo) {
#     int acumulador = 0
#     int i;
#     for(i=0; i<largo;i++){
#         acumulador = acumulador + a[i]
#     }
# }

# EJEMPLO 1 en RISC-V ::

.section .text
.global sumar_arreglo
sumar.arreglo:
# a0 = int a[], a1 = int largo, t0 = acumulador, t1 = i

li      t0, 0            # acumulador = 0
li      t1, 0            # i=0
ciclo:                   # comienza de ciclo
bge     t1, a1, fin      # Si i >= largo, sale del ciclo
slli    t2, t1, 2        # Multiplica i por 4 (1 << 2=4)
add     t2, a0, t2       # Actualiza la dir. de memoria
lw      t2, 0(t2)        # De referencia la dir
add     t0, t0, t2       # Agrega el valir al acumulador
addi    t1, t1, 1        # Incrementa el iterador
j       ciclo            # Vuelve a comenzar el ciclo
fin:
mv      a0, t0           # Mueve t0 (acumulador) a a0 
ret                      # Devuelve valor por a0 
                         #




# Operaciones 

# En general 
# Operacion resultado, operando , operando

# add  : suma
# sub  : resta
# addi : constante inmediata   (crea constante)
# lui  : load upper inmediate  (carga una constante)
# lw   : load word             (lee palabra)
# sw   : store word            (escribe palabra)

                         #






# RESUMEN ::



# operacion resultado, operando, operando

# add  : suma
# sub  : resta
# addi : constante inmediata   (crea constante)
# lui  : load upper inmediate  (carga una constante)
# lw   : load word             (lee palabra)
# sw   : store word            (escribe palabra)


# EJEMPLOS

        add a, b, c              # a = a + b;  
        
        # a = b + c;
        add t, b, c              # t = b + c
        sub a, t, d              # a = t - d
    
     # CONSTANTES
     
        # a = a + 4
        addi a, a, 4
        # b = a -12
        addi b, a, -12
        
        # i=0; x=2032; y=-78
        # s4=i , s5 =x, s6=y
        addi s4 , zero , 0           # i = 0
        addi s5 , zero , 2032        # i = 0
        addi s6 , zero , -78         # i = 0
     
     
     # CARGAR CONSTANTE
     
        # int a = 0xABCDE123;
        lui s2 , 0xABCDE             #s 2=0xABCDE000
        addi s2 , s2 , 0x123         #s 2=0xABCDE123
     
     
     # CARGAR PALABRAS ::
     
     #------------------------------------------
     #   lw
     #   lw var , desplazamiento(memoria) 
     #            desplazamineto = 4 * indice
     # -----------------------------------------
     
         # int a = men[2]       
         lw s7 ,8(s3)            # lw a ,8(mem)
         
         
         # men[5] = 33;          # despl = 4*5
         addi t3 , zero, 33      # s3 = men 
         sw t3, 20(s3)           # sobrescribe con sw a t3
         
        
        

# --------------------------------------------------------------------------------

# Instruciones LOGICAS

# or      : combina registros,                          0xFEED0000 o 0x0000F0CA resulta 0xFEEDF0CA. 
# and     : elimina o limpia parte del registro,        0xBABAC0C0 y 0x0000FFFF resulta 0x0000C0C0
# xor     : niega el valor?

# ejemplo :

or rd, r0, r1   
and rd, r0, r1


# --------------------------------------------------------------------------------

## DESPLAZAMIENTO 

# EN registros

# desplazar resultado, registro, k-bits

# sll :  shift left logical            (desplaza k bits a izquierda y completa con ceros a la der)
# srl :  shift right logical           (desplaza k bits a derecha y completa con ceros a izd)
# sra :  shift arithmetic logical      (desplaza k bits a derecha y conserva signo) 

# ejemplo : 

#slli : shift left logical inmediate
slli a, b, 2    # desplaza 2bits a la izquierda el registro b
                # guarda el desplamiento en a

# EN Memoria

lw t0, 8(s3)      # 8(s3) representa un desplazamiento en memoria, 
                  # pues refiere a la direccion de memoria (s3 + 8)  

sw t1, 8(s3)


# --------------------------------------------------------------------------------

# CICLOS

# condicional operando1, operando2, remplazarEnPC.  ≡   if(condicional op1, op2) then reemplazarEnPC() 

# reemplaza PC si 
# beq   :  branch if equal                    (operando1 = operando2)
# bne   :  branch if not equal                (operando1 != operando2)
# blt   :  branch if less than                (operando1 < operando2)
# bge   :  branch if greater than or equal    (operando1 >= operando2)

# ejemplo   
beq a, b, target           # si a == b entonces ejecuta target
target:                    # tarjet modifica PC
add s1 , s1 , s0



# --------------------------------------------------------------------------------
             
# Saltos incondicionales

# j : jump  (salto)

j target
srai s1 , s1 , 2       # no se ejecutan
addi s1 , s1 , 1       # no se ejecutan
sub s1 , s1 , s 0      # no se ejecutan
target :
add s1 , s1 , s 0      # se ejecuta 


# CICLO WHILE 

# int pow = 1;
# int x = 0;
#
# while(pow != 128){
#     pow = pow * 2;
#     x = x + 1;
# }


addi s0, zero, 1     # const s0 = 1
add s1, zero, zero   # var   s1 = 0

addi t0, zero, 128   # const t0 = 128      
while:
  beq s0, t0, fin    # s0 == t0 --> fin 
  slli s0, s0, 1     # s0 = s0 * 2
  addi s1, s1, 1     # s1 = s1 + 1 
  j while            # salta a while
fin:                 # termina  


# int i;
# int scores [200];

# for(!=0; i< 200; i = i +1){
#     scores[i] = scores[i] + 10;
# }


addi s1, zero, 0        # i = 0
addi t2, zero, 200      # scores = 200
for:                    #
  bge s1, t2, fin       # if (i >= score) then `fin` 
  slli t0, s1, 2        # lista = lista[i+1] ?
  add t0, t0, s0        # lista = lista + 
  lw t1, 0(t0)          # a = lista[0] 
  addi t1, t1, 10       # nuevalista[0] =  10
  sw t1, 0(t0)          # lista[0] = 10
  addi s1, s1, 1        # i = i + 1
  j for                 # salta a for
fin:                    # termina






#-----------------------------------------------------

# Jump

j   :  jump
jr  :  jump register
jal :  jump and link





