li a0, 4228                    # a0 = 4228
li a1, 2114                    # a1 = 2114
jal ra, resta                  # ra = pc , ejecuta resta 
                              
fin: beq zero, zero, fin       # if zero = zero, then fin .  # al salir de resta se retona a esta linea 

resta:                         # FUNCION RESTA
prologo: addi sp, sp, -4       # sp = sp - 4.                         # Reserva espacio en la pila (4bytes)
sw ra, 0(sp)                   # escribe la memoria, mem[sp] = ra     # Guarda el valor del registro ra en la pila
sub a0, a0, a1                 # SE RESTA a0 = a0 - a1
beq a0, zero, epilogo          # if a == zero then epeligo else...
sigo: jal ra, resta            # else : ra = pc2, ejecuta resta 
   
epilogo: lw ra, 0(sp)          # ra = mem[sp]           # al salir de resta se retona a esta linea 
addi sp, sp, 4                 # sp = sp + 4            # Libera el espacio de la pila
ret                            # regresa vuelve a direccion ra.    




li a0, 4228                   
li a1, 2114                   
jal ra, resta                  # se reserva un nuevo espacio en memoria
fin: beq zero, zero, fin       
resta:                         
prologo: addi sp, sp, -4       
sw ra, 0(sp)                  
sub a0, a0, a1                
beq a0, zero, epilogo          
sigo: jal ra, resta            
epilogo: lw ra, 0(sp)          
addi sp, sp, 4                
ret                            



