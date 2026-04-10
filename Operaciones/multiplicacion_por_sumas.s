.text
    li a1,3
    li a2,5
    jal mult
    li a7,1
    ecall
    li a1,3
    li a2,0
    jal mult
    ecall
    li a7,10
    ecall

# En a1 y a2 recibe los numeros
# En a0 devuelve el resultado
mult:
    addi t1, a1, 0
    addi t2, a2, 0
    li t0,1
    li a0, 0
    beq t1, zero, 2f
    beq t2, zero, 2f
    1:
        add a0, a0, t1
        addi t2, t2, -1
        bge t2, t0 , 1b
    2:
    ret
