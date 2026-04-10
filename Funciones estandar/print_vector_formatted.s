.data
	var: .word 10,20,30,40,50,60,0
	finVar:
.text
	la a1, var
	la a2, finVar
	sub a2,a2,a1
	srai a2,a2,2
	jal x1, printVector
	li a7,10
	ecall

##recibe a1 dir vector, a2 cant.elem
printVector:
	addi sp, sp, -8
	sw a1, 0(sp)
	sw a2, 4(sp)
	li x5, 59
	li x6, 1

	1:
		lw a0, 0(a1)
		li a7, 1
		ecall
		beq a2, x6, 16 #Tengo que contar la cant. de bytes hasta donde quiero llegar

	li a7, 11 # 4
	add a0,x0, x5 # 8
	ecall #12
	addi a2,a2, -1 #16
	addi a1,a1, 4
	bne a2, x0, 1b
	addi sp, sp, 8
	lw a1, 0(sp)
	lw a2, 4(sp)
	jalr x0, ra, 0