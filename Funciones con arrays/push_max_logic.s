.data
    vector: .word 100, -10, 20, 1000, 66500, 1000000, -20, 34, 56
    finVector: 

.text
    la a3, vector
    la a4, finVector
    jal pushMax
    la a1, vector
    la a2, finVector
    jal printVector
    li a7,10
    ecall
    nop


# a3 recibe el inicio del vector. a4 el final.

pushMax:
    addi sp,sp,-4*2
    sw ra, 0(sp)
    sw s0, 4(sp)    
	
	
	
    #Aclaracion. Aca abajo le puse menos cuatro, porque si lo ponia directamente en la direccion de finVector, se salia del vector, y me leia un elemento de mas.
    #Por este motivo, le puse menos cuatro. Para que apunte al ultimo elemento real dentro del vector, y no haya una iteracion de mas.
    addi, s0, a4, -4 #Guardo en s0 la direccion que hay en a4.
    addi a4, a3, 4 #Le doy a a4 la siguiente direccion despues de a3.
    
    1:
        lw t2, 0(a3) #cargo en t2 el valor de la izquierda.
        lw t3, 0(a4) #cargo en t3 el valor de la derecha.
        blt t2, t3,2f #Si el de la izquierda es menor, se salta el swap.
        jal swap 
    2:
        addi a3,a3,4 #Voy al siguiente elemento de cada uno
        addi a4,a4,4
        bne s0,a4, 1b
    3:
        
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp,sp,4*2


# Aca a3 y a4 deben intercambiar su contenido.
# cont. de a3 va a auxiliar. cargo a3 con lw en t0
# se carga el contenido de a4 en a3. cargo el contenido de a4 en t1
# se carga el auxiliar en a4
swap:
    lw t0, 0(a3)
    lw t1, 0(a4)
    sw t0, 0(a4)
    sw t1, 0(a3)
    ret

printVector:
    1:
      lw a0, 0(a1)
      li a7,1
      ecall
      li a7,11
      li a0, 32
      ecall
      ecall
      addi a1, a1, 4
      bne a1, a2, 1b
  
    ret 