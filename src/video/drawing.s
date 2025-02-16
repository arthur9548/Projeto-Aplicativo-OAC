# funcoes de desenho
# a7 sempre é o frame a ser desenhado (GET_BUFFER_TO_DRAW)
# e nunca modificamos o a7

FILL_SCREEN_FROM: #preenche a tela com a cor em a0, a partir da linha a1
	mv t0, a7 #t0 recebe a tela
	li t1, PIXELS_IN_ROW
	mul a1, a1, t1
	li t1, NUMBER_OF_SCREEN_PIXELS 
	sub t1, t1, a1
	add t0, t0, a1
	add t1, t0, t1 #fim da tela
loop_fill_screen_from:
		bge t0, t1, end_fill_screen_from
		sb a0, 0(t0)
		addi t0, t0, 1 #anda 1 byte na tela
		j loop_fill_screen_from
end_fill_screen_from:
	ret

#desenha uma imagem qualquer na tela, apenas nos espaços com intersecção com a tela real
#a0: endereço da imagem
#a1: X
#a2: Y
#a3: W
#a4: H
#a7: tela (não mudado)
DRAW_IMAGE:
	mv t0, a7 #t0 será o endereço de desenho
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
		
#desenha um tile de tamanho fixo na tela
#a0: endereço da imagem
#a1: X
#a2: Y
#a7: tela (não mudado)
DRAW_TILE:
	memo(ra) #função de ordem superior
	li a3, TILE_W
	li a4, TILE_H #tamanhos fixos do tile
	call DRAW_IMAGE
	unmemo(ra)
	ret
	
#desenha a disposição inicial do mapa na tela
#a0: endereço do mapa
#a7: tela (não mudado)
DRAW_INITIAL_MAP:
	li t0, 0 #x
	li t1, 0 #y
	ret