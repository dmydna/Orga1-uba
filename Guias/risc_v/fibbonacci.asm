.data
dato: .byte   7
.text


lb a0, dato
jal ra, fib
fin: beq zero, zero, fin

fib:  li t0, 0
		li t1, 1
		beq a0, t0, casoBase0
		beq a0, t1, casoBase1
		addi sp, sp, -12
		sw ra, 0(sp)
		sw a0, 4(sp)
		addi a0, a0, -1
		
		jal ra, fib
		
		sw a0, 8(sp)
		lw a0, 4(sp)
		addi a0, a0, -1
		
		jal ra, fib
		
		lw ra, 8(sp)
		add a0, a0, a1
		
		lw ra, 0(sp)
		addi sp, sp, 12
		jr ra
		
casoBase0: 
li a0, 0
jr ra

casoBase1:
li a0, 1
jr ra
