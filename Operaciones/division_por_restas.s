.text
    li a1, 154
    li a2, 3
    jal divide
    li a7,1
    ecall
    li a1, 10
    li a2, 190
    jal divide
    ecall
    li a7, 10
    ecall
    

divide:
    li a0, 1 #Lo dejo en uno por si lo siguiente se cumple.
    beq a1, a2, 3f #Verifico si son iguales
    
    li a0, 0 # Lo seteo en cero, por si alguno de los if se cumple
    blt a1,a2, 3f # El dividendo (a1) debe ser mayor al divisor (a2)
    beq a1, x0, 3f 
    beq a2, x0, 3f
    
    addi x5, x0, 0 #Este contara cuantas veces a2 "entra" en a1.
    
    2:
        addi x5,x5,1
        sub a1, a1, a2
        bge a1, a2, 2b
        addi a0, x5, 0
    3:

    ret
