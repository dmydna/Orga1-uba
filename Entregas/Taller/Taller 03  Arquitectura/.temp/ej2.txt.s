li a0, 4228             # a0 = 4228         
li a1, 2114             # a1 = 2114      
jal ra, resta           # rd --> fin, salta a resta 
                        # incializa pila (pila de rd)    
fin: beq zero, zero, fin       
resta:                      
prologo: addi sp, sp, -4             #  reserva espacio en pila   
         sw ra, 0(sp)                #  guarda rd en mem -4 ,-16  
sub a0, a0, a1                       #  a0 = a0 - a1  
beq a0, zero, epilogo                #  si cumple a0=0, ejecuta epilgo   
sigo: jal ra, resta                  #  si no sigue   
epilogo: lw ra, 0(sp)                #  rd = mem -4 , -16   
         addi sp, sp, 4              #     
         ret                         # vuelve al rd actual   

# Observaciones

# la pila son los distintos valores de rd guardados en la adress sp.
# ra se modifica y se pierde, por eso se guardan en la pila sus diferentes valores.

  # ra guarda una dirreccion de memoria
  # sp es una direccion de memoria
  # ret vuelve al ra_actual
  
# main

  # asigna a0 y a1 constantes
  # guarda ra_inicial(fin),  ignora fin y ejecuta resta 
  # pasa a prologo (que es parte de resta)  
  
# prologo escribe memoria y apila (reserva espacio):
    # guarda ra en memoria
    # pasa a resta
    
# resta:
    # resta a0 - a1 y vuelve a restar hasta que a0 = 0
    # cada vez que se ejecuta resta se modifica ra y vuelve a prologo  
    # pasa a epilogo
    
# epilogo escribe en registro (consulta a memoria) y desapila (libera espacio):
    # sobre-escribe el registro ra por los valores en memoria (pila) y vuelve al ra_actual
    # "se busca volver a ra_inicial."
    # pasa a fin

# fin :
    # se cumple condicion y termina