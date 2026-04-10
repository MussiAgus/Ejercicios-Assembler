# 1. Complete el siguiente programa en ASM de RISC-V. El programa debe imprimir por la
#terminal el contenido de las posiciones de memoria pares cuyo contenido sea un número
#par. Salida esperada: 0x02
#.data
#	vector: .byte 0x01,0x10,0x02,0xFF,0x33,0x90,0x55
#	finvector:
#.text
#
#
# 2. A partir del programa y el vector anterior, escriba un programa que lea cada elemento
#que conforma el vector, complemente a la base dicho elemento , y finalmente guarde el
#elemento complementado en la misma posición de memoria de donde fue leído. Salida
#esperada: 0xFF 0xF0 0xFE 0x01 0xCD 0x70 0xAB

.data
    vector: .byte 0x01,0x10,0x02,0xFF,0x33,0x90,0x55
    finVector:
.text
    la a2, vector
    la a3, finVector
    jal puntoB
    la a2, vector
    jal printByte
    li a7,10
    ecall
    nop

puntoB:
    1:
        lb a0, 0(a2)
        xori a0,a0,-1
        addi a0,a0,1
        sb a0, 0(a2)
        addi a2,a2,1
        blt a2,a3,1b
    ret

printByte:
    li a7,34
    1:
        lbu a0, 0(a2)
        ecall
        li a0, 32
        li a7, 11
        ecall
        li a7, 34
        addi a2,a2,1
        blt a2, a3, 1b
    ret

puntoA:
    addi sp, sp, -4
    sw ra, 0(sp)
    1:
        bge a2, a3, 2f # Pregunto si a2 es mayor a a3 (el final del vector)
        lb a0, 0(a2) # Cargo el contenido en a0.
        andi t0, a0, 1 # Basicamente, estoy extrayendo el bit 0 de la palabra que hay en a0. 
        
        addi a2,a2,2
        bne t0, x0 , 1b
        li a7,34
        ecall
        jal 1b
    2: 
    lw ra, 0(sp)
    addi sp, sp, 4
    ret