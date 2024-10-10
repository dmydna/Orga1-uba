
.data
dato: .byte 5
.text

lb a0, dato
li t1, 1
jal ra, hanoi
fin: beqz zero fin

hanoi:
	beq a0, t1, casobase
	addi sp, sp, -4
	sw ra, 0, sp
	addi a0, a0, -1
	jal ra, hanoi

	slli a0, a0, 1  # mul por 2
	addi a0, a0, 1

	lw ra, 0 (sp)
	addi sp, sp, 4
	jr ra

casobase: jr ra  
