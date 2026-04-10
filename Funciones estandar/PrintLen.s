.data
	texto: .string "Hola mundo!"
.text
	la a1, texto
	jal x1, PrintLen
	li a7,10
	ecall

#Basicamente es sumar uno en x5, por cada char diferente a 0

PrintLen:
	addi sp, sp, -8
	sw a1, 0(sp)
	sw a0, 4(sp)
	addi a0, x0, 0

	1:
		lb x6, 0(a1)
		addi a0, a0, 1
		addi a1, a1, 1
		bne x6, x0, 1b

	addi a0, a0, -1
	li a7, 1
	ecall
	lw a0, 4(sp)
	lw a1, 0(sp)
	addi sp, sp, 8	
	ret