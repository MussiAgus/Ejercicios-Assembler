.text
    li a7,1
    li a0,-104
    jal div8
    ecall
    li a0, 10
    li a7, 11
    ecall
    li a7,1
    li a0, -56
    jal div8
    ecall
    li a7,10
    ecall
    nop

div8:
    addi t0, a0, 0	# Guardo el valor original de a0, para verificar si es negativo o positivo despues.
    bge t0, x0, 1f	# Si el valor ya es positivo, se salta la parte en la que, con neg, lo convierto en positivo.
    neg t0,t0
    
    1:
        addi t0, t0, 4	# Le sumo 4, O sea, la mitad del numero por el que estoy dividiendo. Esto es para que el resto se redondee hacia arriba cuando corra los bits.
        srai t0,t0, 3	# Corro los bits tres lugares a la derecha, como se muestra abajo de todo.
        
     bge a0, x0, 4 	# a0 era mayor a cero? Si es asi, no hace falta volverlo a su estado original, ya que nunca se lo forzo a convertirse en positivo.
     neg t0,t0
     
     addi a0,t0,0
     ret
    
    
    

#Funcionamiento del srli y srai: 
	
    #128 64 32 16 8 4 2 1
    #           1 1     1
    #             1 1     1
    #               1 1     1
    #                 1 1     1

