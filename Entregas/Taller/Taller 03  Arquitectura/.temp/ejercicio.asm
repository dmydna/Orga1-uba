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