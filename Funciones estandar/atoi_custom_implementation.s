.data
    numero1: .string "9463"
    numero2: .string "273"
    numero3: .string "53"
    numero4: .string "8"
    decena: .byte 0,10,20,30,40,50,60,70,80,90
    centena: .half 0,100,200,300,400,500,600,700,800,900
    miles: .word 0, 1000,2000,3000,4000,5000,6000,7000,8000,9000  
.text
    la a1, numero1
    jal atoi4
    li a7,1
    ecall
    la a1, numero2
    jal atoi4
    ecall
    la a1, numero3
    jal atoi4
    ecall
    la a1, numero4
    jal atoi4
    ecall
    li a7,10
    ecall

#Se manda la direccion de la cadena por a1.
#Se devuelve el numero por a0

atoi4:
    addi sp, sp, -4*5
    sw ra, 0(sp)
    sw s1, 4(sp) 
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    
    la s1, miles
    la s2, centena
    la s3, decena
    addi s4,zero, 0 #inicio el acumulador en cero.
    addi t0, a1, 0 # guardo a1 antes de que strLen lo cambie
    jal strLen
    addi a1, t0, 0
    li t0, 4
    
    beq a0, t0, 4f
    li t0, 3
    beq a0,t0,3f
    li t0, 2
    beq a0, t0, 2f
    li t0,1
    beq a0, t0, 1f
    
    4:
        #miles
        lb t0, 0(a1)
        addi t0,t0,-48
        slli t0,t0, 2
        add t2,s1,t0
        lw t1, 0(t2)
        add s4, s4, t1 #sumo acum s4, con el contenido de miles
        addi a1,a1,1

    3:
        #centenas
        lb t0, 0(a1)
        addi t0,t0,-48
        slli t0,t0, 1
        add t2,s2,t0
        lh t1, 0(t2)
        add s4,s4,t1
        addi a1,a1,1

    2:
        #decenas
        lb t0, 0(a1)
        addi t0,t0,-48
        add t2,s3,t0 #Hay que intentar evitar los registros s3,
        lb t1, 0(t2) # porque guardan las direcciones principales del vec.
        add s4,s4,t1
        addi a1,a1,1

    1:
        #unidades
        lb t0, 0(a1)
        addi t0,t0,-48
        add s4,s4,t0
        
    add a0, s4, x0
    lw s4, 16(sp)
    lw s3, 12(sp)
    lw s2, 8(sp)
    lw s1, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 4*5
    ret

#Devuelve en a0 la longitud. Recibe en a1 la cadena.
strLen:
    addi a0, zero,0
    1:
        lb t1, 0(a1)
        addi a1,a1,1
        addi a0,a0,1
        bne t1, zero, 1b
    addi a0,a0,-1
    ret

