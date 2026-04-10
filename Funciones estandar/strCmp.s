.data
    cadena1: .string "Hola mundo!"
    cadena2: .string "Inserte cadena de texto"
    cadena3: .string "Hola mundo!"
    cadena4: .string "Hola mundo! mas largo"
.text
    li a7,1
    la a4, cadena1
    la a5, cadena2
    jal strCmp
    ecall
    la a5, cadena3
    jal strCmp
    ecall
    la a5, cadena4
    jal strCmp
    ecall
    li a7, 10
    ecall

#Le paso a4 dir. cadena1 y a5 dir. cadena2
strCmp:
    addi sp, sp, -4*3
    sw a4, 0(sp) # guardo la dir. de primer cadena
    sw a5, 4(sp) # guardo la dir. de segunda cadena
    sw ra, 8(sp) # guardo la dir. de la funcion main
    
    addi a0, x0, 0 #Cambia a -1 si hay dos char diferentes.
    
    1:
        lb t0, 0(a4)
        lb t1, 0(a5)
        beq t0, x0, 2f #Se comprueba si alguno de los dos es cero.
        beq t1, x0, 2f #Aca tambien. Se busca el final de cadena.
        addi a4,a4,1
        addi a5,a5,1
        beq t0, t1, 1b
        
        addi a0, a0, -1 ##Si llego hasta aca, es porque las cadenas son diferentes.
    2:
        lw ra, 8(sp)
        lw a5, 4(sp)
        lw a4, 0(sp)
        addi sp, sp, 4*3
        ret