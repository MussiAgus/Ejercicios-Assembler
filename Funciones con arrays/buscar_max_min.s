.data
    vector: .word 100, -10, 20, 1000, 66500, 1000000, -20, 34, 56
    finVector:

.text
    la a1, vector
    la a2, finVector
    jal buscarMin
    li a7, 1
    ecall
    li a7, 10
    ecall
    nop

# Recibe en a1 el comienzo del vector, y en a2 el final.
buscarMax:
    addi t0, a1,0 #Guardo el inicio del vector en un temporal.
    lw a0, 0(t0) # Aca voy a guardar el mayor, que empieza siendo el primero del vector.
    1:
        beq t0, a2, 2f
        lw t1, 0(t0) # Este es el que va a recorrer, y comparar con el mayor actual.
        addi t0, t0, 4
        blt t1, a0, 1b
        addi a0, t1, 0
        bne t1, a2, 1b
    2: 
    ret

buscarMin:
    addi t0, a1,0 #Guardo el inicio del vector en un temporal.
    lw a0, 0(t0) # Aca voy a guardar el mayor, que empieza siendo el primero del vector.
    1:
        beq t0, a2, 2f
        lw t1, 0(t0) # Este es el que va a recorrer, y comparar con el mayor actual.
        addi t0, t0, 4
        bge t1, a0, 1b
        addi a0, t1, 0
        bne t1, a2, 1b
    2: 
    ret
