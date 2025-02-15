# funcoes de desenho

FILL_SCREEN: #preenche a tela com a cor em a0
	GET_BUFFER_TO_DRAW(t0) #endereço da tela
	li t1, NUMBER_OF_SCREEN_PIXELS 
	add t1, t0, t1 #fim da tela
loop_fill_screen:
		bge t0, t1, end_fill_screen
		sb a0, 0(t0)
		addi t0, t0, 1 #anda 1 byte na tela
		j loop_fill_screen
end_fill_screen:
	ret

#desenha uma imagem qualquer na tela, apenas nos espaços com intersecção com a tela real
#a0: endereço da imagem
#a1: X
#a2: Y
#a3: W
#a4: H
DRAW_IMAGE:
	GET_BUFFER_TO_DRAW(t0) #t0 será o endereço de desenho
	add t0, t0, a1
	li t6, PIXELS_IN_ROW #t6 = 320
	mul t1, t6, a2
	add t0, t0, t1 #endereço = base + x + |linha| * y
	li t3, 0 #i, contador de linha
	li t4, 0 #j, contador de coluna
	#iterar todos os bytes da imagem
	#desenhar esse byte na posição certa se o x está nos lugares certos
	#mais fácil iterar só a imagem e calcular posição como t0 + i + |linha|*j
row_loop_draw_image:
		bge t3, a3, end_row_draw_image #enquanto i < X
		
		add t5, t3, a1 #X desse pixel
		bge t5, t6, continue_draw_image #se x >= 320 continua
		blt t5, zero, continue_draw_image #se x < 0 continua
		
		li t5, 0
		j col_loop_draw_image #senão itere as colunas
continue_draw_image:
		addi t3, t3, 1 #adiciona 1 e continua
		add a0, a0, a3 #anda a linha toda
		j row_loop_draw_image #volta para o loop
col_loop_draw_image:
			bge t4, a4, end_col_draw_image #enquanto j < Y
			
			add t1, t0, t3 #t1 = t0 + i
			add t1, t1, t5 #t1 += 320j
			
			lb a5, 0(a0)
			sb a5, 0(t1) #desenha o pixel correspondente na tela
			
			addi a0, a0, 1 #anda no endereço
			addi t4, t4, 1 #anda nas colunas
			add t5, t5, t6 #posição anda 320
			
			j col_loop_draw_image #volta para o loop
end_col_draw_image:
		li t4, 0 #j = 0
		li t5, 0 #t5 = 320 * j
		addi t3, t3, 1 #i++
		j row_loop_draw_image #volta para o loop
end_row_draw_image:
	ret
		
	
	