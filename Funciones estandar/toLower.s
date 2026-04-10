.data
    letraA: .string "D"
    letraB: .string "G"
.text
    li a7,11
    lb a0, letraA
    jal toLower
    ecall
    lb a0, letraB
    jal toLower
    ecall
    li a7,10
    ecall
    nop

toLower:
    addi sp, sp, -4
    sw ra, 0(sp)
    addi t6, zero, 97
    bge a0, t6, 2f
    addi a0, a0, 32
    
    2:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret