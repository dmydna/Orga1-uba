
# mem[4] = contenido de direccion de memoria 4
# no sabemos que hay en memoria entonces mem[4] = 0

main:
addi x11 x0 4            #   x11 = 4                               
lw x12 0 x11             #   x12 = mem[4]                          
addi x13 x0 4            #   x13 = 4                               
lw x13 0 x13             #   x13 = mem[4]                          
lw x13 0 x13             #   x13 = mem[4]                          
beq x12 x13 -20          #   como x12 == x13, vuelve a main    
                         #   el programa nunca pasa mas de esta linea?.                    
guardar:                  
lui x14 0xfffa6          #   x14 = 0xfffa6 
addi x14 x14 -1539       #   x14 = 0xfffa6 - 0x7FD =  0xff7a9   ???
add x12 x14 x12          #   x12 =  0x00 + x14
sw x11 40 x12            #   mem[40] = x12
fin_programa:              
addi x10 x0 0            #   x10 = 0
addi x17 x0 93           #   x17 = 93
ecall



# 1539 = 11000000011 ---> -1539 = 00111111100 + 1 = 00111111101 = 0x7FD



# IDEA en python 


#     mem = [0] * 50                           # incializo la memoria en 0                       
#     x11,x12,x13,x14,x10,x17 = 0,0,0,0,0,0    # incializo todos los registro en 0     

#     def main() 
#         x11 = 4
#         x12 = mem[4]
#         x13 = mem[4]
#         x13 = mem[4]

#     def guardar()
#         x14 = 0xfffa6  
#         x14 = x14 - 0x7FD  
#         x12 = mem[4] + x14  
#         mem[40] = x11

#     def fin_programa()
#         x10 = 0
#         x17 = 93
#     
#     while (x12==x13)
#        main()     
#     guardar()
#     fin_programa()
