.data
    texto1: .string "uNa fRa"
    texto2: .string "una frase"

.text
    li a7,1
    la a4, texto1
    la a5, texto2
    jal strCmpi
    ecall
    li a7,10
    ecall
    nop


#Le paso a4 dir. cadena1 y a5 dir. cadena2
strCmpi:
    addi sp, sp, -4*3
    sw a4, 0(sp) # guardo la dir. de primer cadena
    sw a5, 4(sp) # guardo la dir. de segunda cadena
    sw ra, 8(sp) # guardo la dir. de la funcion main
    
    1:
        lb a0, 0(a4)
        jal toLower
        addi t0, a0, 0
        
        lb a0, 0(a5)
        jal toLower
        addi t1, a0, 0
        
        addi a0, zero, 0
        beq t0, x0, 2f #Se comprueba si alguno de los dos es cero.
        beq t1, x0, 2f #Aca tambien. Se busca el final de cadena.
        addi a4,a4,1
        addi a5,a5,1
        beq t0, t1, 1b
        
        addi a0, zero, -1 ##Si llego hasta aca, es porque las cadenas son diferentes.
    2:
        lw ra, 8(sp)
        lw a5, 4(sp)
        lw a4, 0(sp)
        addi sp, sp, 4*3
        ret

toLower:
    addi sp, sp, -4
    sw ra, 0(sp)
    addi t6, zero, 97
    bge a0, t6, 2f
    beq a0, zero, 2f
    addi a0, a0, 32
    
    2:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
