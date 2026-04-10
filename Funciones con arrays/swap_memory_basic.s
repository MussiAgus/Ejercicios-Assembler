.data
    vector: .word 100, -10, 20, 1000, 66500, 1000000, -20, 34, 56
    finVector: 

.text
    la a3, vector
    addi a3, a3, 4 # segundo elemento del vector.
    addi a4, a3, 12 # quinto elemento del vector.
    jal swap
    la a1, vector
    la a2, finVector
    jal printVector
    li a7, 10
    ecall
    nop


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
      addi a1, a1, 4
      bne a1, a2, 1b
  
    ret 