.data
dato: .word   5
.text

lw a0 dato
jal ra sumatoria

fin: beq zero zero fin   

sumatoria:
apila: 
	addi sp, sp, -8
	sw a0, 0 (sp)
	sw ra, 4 (sp)

	beq a0, zero, casobase

	addi a0, a0, -1
	jal ra, sumatoria

casobase:
	bne a0, zero, recursion 
	addi a0, zero, 0

recursion:
	addi t1, a0, 0
	lw t1, 0 (sp)

	add a0, a0, t1

desapila:
	lw ra, 4 (sp)
	addi sp, sp (8)
	ret



