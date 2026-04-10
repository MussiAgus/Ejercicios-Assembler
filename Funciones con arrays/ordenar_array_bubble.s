.data
    vector: .word 100, -10, 20, 1000, 66500, 1000000, -20, 34, 56
    finVector: 

.text
    la a3, vector
    la a4, finVector
    sub, t5, a4, a3 #Se hace la resta entre los dos, en bytes.
    srai t5,t5,2 #Divido ese resultado, en 4.
    
    mainLoop:
        la a3, vector
        la a4, finVector
        jal pushMax
        beq a0,x0,2f
        la a1, vector
        la a2, finVector
        jal printVector
        li a7,11
        li a0, 10
        ecall
        addi t5,t5,-1
        blt x0, t5, mainLoop
    2:
    li a7,10
    ecall


# a3 recibe el inicio del vector. a4 el final.

pushMax:
    addi sp,sp,-4*2
    sw ra, 0(sp)
    sw s0, 4(sp)    

    addi s0, a4, 0 #Guardo en s0 la direccion que hay en a4.
    addi a4, a3, 4 #Le doy a a4 la siguiente direccion despues de a3.
    li a0,0
    
    1:
        lw t2, 0(a3) #cargo en t2 el valor de la izquierda.
        lw t3, 0(a4) #cargo en t3 el valor de la derecha.
        blt t2, t3, 2f #Si el de la izquierda es menor, se salta el swap.
        jal swap 
        li a0,1
    2:
        addi a3,a3,4 #Voy al siguiente elemento de cada uno
        addi a4,a4,4
        bne a4,s0, 1b
        
    lw s0, 4(sp)
    lw ra, 0(sp)
    addi sp,sp,4*2
    ret

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
    
#Que paso? NO habia puesto el ret al final de la funcion pushMax. Entonces, cuando finalmente pushMax llegaba al final,
#no volvia al main, sino que pasaba por el swap, y ahi es donde se daba ese ultimo intercambio.
