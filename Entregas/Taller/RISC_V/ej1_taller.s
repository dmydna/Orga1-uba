      li a0,4228  # asigna a0 = 0001 0000 1000 0100                  
      li a1,2114  # asigna a1 = 0000 1000 0100 0010
     jal ra, resta
fin: beq zero, zero, fin
resta:
prologo: addi sp, sp,-4
      sw ra,0(sp)
      sub a0,a0,a1
      beq a0,zero,epilogo
sigo:jal ra, resta
epilogo:
      lw ra, 0(sp)
      addi sp, sp,4
      ret
      

# ARQUITECTURA: 

# PROCESADOR(partes)
#  - Registros  
#  - Memoria    
#  - ISA        



# ISA : (Arquitectura de Conjunto de Instrucciones)
# incluye ciruitos digitales, alu,etc.. aca viven las funciones  
# instrucciones del procesador : add, sub, or, and..

# MEMORIA: memoria cache del procesador, donde se cargan las instrucciones que son ejecutadas
#          por el procesador, las instrucciones llegan codificadas como WORDS. Y el acceso a 
#          a la misma es mediante una pila de WORDS de 4bytes.  

# Registros: 32 registro cada uno de 4bytes, se usan para guardas valores, que luego seran 
#            usados en las instrucciones que se mandas a la memoria para ser ejecutadas.  


# los registros que viven en el procesador
# se van cargando en memoria

   
# - PC: La dirección de la instrucción dada(adress actual)
# - SP : mueve la pila, maneja el acceso a memoria
#   * guarda adress actual.
#   * LE DICE AL PC la prox adrees, 
#   donde se guardar la siguiente
#   instruccion?     

# - cada instruccion ocupa 4bytes, por eso los adress
#  van de 4 en 4.


# ???: sin SP los datos de memoria se pisarian 
#      no habria loop ?



# WORDS

# las instrucciones que se mandan a la memoria 
# se codifican a WORDS para ser interpretadas por la misma
# ej de word de 4bytes(32bits) --> [r2|r1|rd|opcode]
# las instrucciones pueden ser ejecutadas una a la vez 
# osea una word por vez

# se puede decir que los words son las instrucciones
# que se cargan,osea son los elems de la pila 
# que maneja la memoria, 



