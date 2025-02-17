#source: https://github.com/RISCV-Games/Mage-Embler/tree/main/src/video.s

#########################################################
#	Desenha uma string na tela                            #
#########################################################
#  a0    =  endereco da string                          #
#  a1    =  x                                           #
#  a2    =  y                                           #
#  a3    =  cor		    	                                #
#########################################################

PRINT_STRING:	
	addi	sp, sp, -12                        # aloca espaco
	sw	ra, 0(sp)                           # salva ra
  	sw	s0, 4(sp)                           # salva s0
	sw  s1, 8(sp)
	mv	s0, a0                              # s0 = endereco do caractere na string
	mv s1, a1                               # s1 = x para voltar caso \n

loop_PRINT_STRING:
	lb	a0, 0(s0)                           # le em a0 o caracter a ser impresso
	beq     a0, zero, fimloop_PRINT_STRING  # string ASCIIZ termina com NULL

	li t6, '\n'
	beq a0, t6, pula_linha_PRINT_STRING     # Checking if char is \n

	jal     PRINT_CHAR                      # imprime char
	addi    a1, a1, 8                       # incrementa a linha
	li 	t6, 313		
	blt	a1, t6, naopulalinha_PRINT_STRING   # se ainda tiver lugar na linha

pula_linha_PRINT_STRING:
	addi    a2, a2, 9                       # incrementa a coluna
	mv    	a1, s1                        # volta a linha para inicial

naopulalinha_PRINT_STRING:	
	addi    s0, s0, 1                       # proximo caractere
	j       loop_PRINT_STRING               # volta ao loop

fimloop_PRINT_STRING:	
	lw      ra, 0(sp)  	                    # recupera ra
	lw 	    s0, 4(sp)		                    # recupera s0 original
	lw 	    s1, 8(sp)		                    # recupera s0 original
	addi    sp, sp, 12		                    # libera espaco
fimprintString:	

  ret      	    			                    # retorna

#########################################################
#  PrintChar                                            #
#  a0 = char(ASCII)                                     #
#  a1 = x                                               #
#  a2 = y                                               #
#  a3 = cores (0x0000bbff) 	b = fundo, f = frente	      #
#########################################################
#	 s9 e s8 foram utilizados que nao ha registradores t suficiente


PRINT_CHAR:	
	addi sp, sp, -8
	sw s9, 0(sp)
	sw s8, 4(sp)

	li t4, 0xFF                                      # t4 temporario
	slli t4, t4, 8                                   # t4 = 0x0000FF00 (no RARS, nao podemos fazer diretamente "andi rd, rs1, 0xFF00")
	and	t5, a3, t4                                   # t5 obtem cor de fundo
	srli t5, t5, 8                                   # numero da cor de fundo
	andi t6, a3, 0xFF                                # t6 obtem cor de frente
	
	li 	s8, ' '
	blt a0, s8, naoimprimivel_PRINT_CHAR	           # ascii menor que 32 nao eh imprimivel
	li 	s8, '~'
	bgt	a0, s8, naoimprimivel_PRINT_CHAR	           # ascii Maior que 126  nao eh imprimivel
	j imprimivel_PRINT_CHAR
    
naoimprimivel_PRINT_CHAR: 
  	li      a0, 32		                               # Imprime espaco

imprimivel_PRINT_CHAR:	
	li	s8, PIXELS_IN_ROW	                            # Num colunas 320
	mul     t4, s8, a2			                          # multiplica a2x320  t4 = coordenada y

	add     t4, t4, a1                                # t4 = 320*y + x
	addi    t4, t4, 7                                 # t4 = 320*y + (x+7)
	
	GET_BUFFER_TO_DRAW(s8)
	
	add     t4, t4, s8                                # t4 = endereco de impressao do ultimo pixel da primeira linha do char
	addi    t2, a0, -32                               # indice do char na memoria
	slli    t2, t2, 3                                 # offset em bytes em relacao ao endereco inicial
	la      t3, LabelTabChar                          # endereco dos caracteres na memoria
	add     t2, t2, t3                                # endereco do caractere na memoria
	lw      t3, 0(t2)                                 # carrega a primeira word do char
	li 	    t0, 4				                              # i=4

forchar1I_PRINT_CHAR:	
  	beq     t0, zero, endforchar1I_PRINT_CHAR         # if(i == 0) end for i
  	addi    t1, zero, 8               	              # j = 8

forchar1J_PRINT_CHAR:	
	beq     t1, zero, endforchar1J_PRINT_CHAR         # if(j == 0) end for j
	andi    s9, t3, 0x001			                        # primeiro bit do caracter
	srli    t3, t3, 1             		                # retira o primeiro bit
	beq     s9, zero, printcharpixelbg1_PRINT_CHAR	  # pixel eh fundo?
	sb      t6, 0(t4)             		                # imprime pixel com cor de frente
	j       endcharpixel1_PRINT_CHAR

printcharpixelbg1_PRINT_CHAR:	
  	sb      t5, 0(t4)                                 # imprime pixel com cor de fundo

endcharpixel1_PRINT_CHAR: 
  	addi    t1, t1, -1                	              # j--
  	addi    t4, t4, -1                	              # t4 aponta um pixel para a esquerda
  	j       forchar1J_PRINT_CHAR		                  # vollta novo pixel

endforchar1J_PRINT_CHAR: 
  	addi    t0, t0, -1 		                            # i--
  	addi    t4, t4, 328           	                  # 2**12 + 8
  	j       forchar1I_PRINT_CHAR	                    # volta ao loop

endforchar1I_PRINT_CHAR:	
  	lw      t3, 4(t2)           	                    # carrega a segunda word do char
	li 	t0, 4			# i = 4

forchar2I_PRINT_CHAR:    
  	beq     t0, zero, endforchar2I_PRINT_CHAR         # if(i == 0) end for i
  	addi    t1, zero, 8                               # j = 8

forchar2J_PRINT_CHAR:	
  	beq	t1, zero, endforchar2J_PRINT_CHAR             # if(j == 0) end for j
  	andi    s9, t3, 0x001	    		                    # pixel a ser impresso
  	srli    t3, t3, 1                 	              # desloca para o proximo
  	beq     s9, zero, printcharpixelbg2_PRINT_CHAR    # pixel eh fundo?
  	sb      t6, 0(t4)			                            # imprime cor frente
  	j       endcharpixel2_PRINT_CHAR		              # volta ao loop

printcharpixelbg2_PRINT_CHAR:
  	sb      t5, 0(t4)		                              # imprime cor de fundo

endcharpixel2_PRINT_CHAR:
  	addi    t1, t1, -1		                            # j--
  	addi    t4, t4, -1                                # t4 aponta um pixel para a esquerda
  	j       forchar2J_PRINT_CHAR

endforchar2J_PRINT_CHAR:	
  	addi	t0, t0, -1 		                              # i--
  	addi    t4, t4, 328		                            #
  	j       forchar2I_PRINT_CHAR	                    # volta ao loop

endforchar2I_PRINT_CHAR:
  	lw s9, 0(sp)
  	lw s8, 4(sp)
  	addi sp, sp, 8                                  # reduzindo pilha
  	ret				                                        # retorna