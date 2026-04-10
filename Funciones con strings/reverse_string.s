.data
    texto: .string "YVAN EHT NIOJ"
.text 
     la a1, texto
     jal x1, reverseStr
     li a7,10
     ecall
     nop
 
 #Solo recibe a1, con la direccion del string
reverseStr:
     addi sp, sp, -4*2
     sw x1, 0(sp)
     sw a1, 4(sp)
     jal x1, StrLen #Despues de esto, en a0 estara cargada la cant. de letras.
     add x5, a1, a0 # Hago la suma entre la dir. original del string, mas la cant. de bytes.
     li a7, 11
    1:
        lb a0, 0(x5)
        ecall
        addi x5, x5, -1
        bge x5, a1, 1b

    lw a1, 4(sp)
    lw x1, 0(sp)
    addi sp, sp, 4*2
    ret #En a1 queda la dir. inicial del vec.

 #Basicamente es sumar uno en x5, por cada char diferente a 0
 StrLen:
     addi sp, sp, -4
     sw a1, 0(sp)
     
     addi a0, x0, 0
     1:
         lb x6, 0(a1)
         addi a0, a0, 1
         addi a1, a1, 1
         bne x6, x0, 1b
     
     addi a0, a0, -1
     
     lw a1, 0(sp)
     addi sp, sp, 4
     ret #Finalmente devuelve en a0 el largo del string