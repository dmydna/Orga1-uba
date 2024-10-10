
.data
dato: .word   7
.text

main:
lw a0 dato
jal ra fact
fin: beq zero zero fin

fact:
prologo:                     
    addi sp, sp, -8           
    sw a0, 0, sp                  
    sw ra, 4, sp                 
           
    beq a0, zero, casobase                  
    addi a0, a0, -1           
    jal ra, fact              
           
casobase:
    bne a0, zero, recursion  
    addi a0, zero, 1

recursion:                     
   addi t1, a0, 0             
   lw a0, 0, sp          
   mul a0, a0, t1              

epilogo:                     
   lw ra, 4, sp                  
   addi sp, sp, 8               
   ret

