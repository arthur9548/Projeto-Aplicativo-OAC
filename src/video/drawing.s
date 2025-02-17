# funcoes de desenho
# a7 sempre é o frame a ser desenhado (GET_BUFFER_TO_DRAW)
# e nunca modificamos o a7

FILL_SCREEN_FROM: #preenche a tela com a cor em a0, a partir da linha a1
	mv t0, a7 #t0 recebe a tela
	li t1, PIXELS_IN_ROW
	mul a1, a1, t1 #pixels descartados
	li t1, NUMBER_OF_SCREEN_PIXELS 
	add t1, t0, t1 #fim da tela
	add t0, t0, a1 #inicia a tela a partir da linha certa
loop_fill_screen_from:
		bge t0, t1, end_fill_screen_from
		sb a0, 0(t0) #armazena o valor da cor no pixel
		addi t0, t0, 1 #anda 1 pixel na tela
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
	
#desenha o mapa na tela de acordo com o offset
#a0: endereço do mapa
#a1: offset no X
#a7: tela (não mudado)
DRAW_MAP:
	lbu t2, 0(a0) #dimensão no X
	li t6, TILE_W
	mul t2, t2, t6 #t2 é o X máximo do mapa
	li t3, MAP_H #dimensão no Y é MAP_H
	li t6, TILE_H
	mul t3, t3, t6 #t3 é o Y máximo do mapa
	
	addi a0, a0, 1 #passa para o início dos dados
	memo(ra) #função de ordem superior
	li t0, 0 #x
	sub t0, t0, a1 #offset no X
	sub t2, t2, a1 #offset no X máximo
	li t1, 0 #y
row_loop_draw_map:
	bge t0, t2, end_row_draw_map
	li t1, 0 #zera o y
col_loop_draw_map:
		bge t1, t3, end_col_draw_map 
		lb t6, 0(a0) #tile atual
		
		#descobrir o tipo do tile
		memo(a0) #guardar o endereço do mapa
		memo (t1)
		beq t6, zero, if1_cldm #ver se é 0
		addi t1, zero, 1
		beq t6, t1, if2_cldm #ver se é 1
		la a0, water_tile #é 2
	j c1_cldm
if1_cldm:
			la a0, brick_tile #é 0
	j c1_cldm
if2_cldm:
			la a0, metal_tile #é 1
c1_cldm: 
		unmemo(t1)
		mv a1, t0 #x
		mv a2, t1 #y
		memo(t0)
		memo(t1)
		memo(t2)
		memo(t3) #precisa-se guardar o estado da função atual
		call DRAW_TILE #desenhamos o tile
		unmemo(t3)
		unmemo(t2)
		unmemo(t1)
		unmemo(t0) #recuperamos o estado
		unmemo(a0) #recuperamos o endereço do mapa
		addi t1, t1, TILE_H #Y aumenta
		addi a0, a0, 1 #andamos para o próximo endereço
		j col_loop_draw_map
end_col_draw_map:
	addi t0, t0, TILE_W #X aumenta
	j row_loop_draw_map
end_row_draw_map:
	unmemo(ra) #recuperar o endereço de retorno
	ret


#desenha o menu na tela em a7
DRAW_MENU:
	memo(ra)
	li a0, MENU_COLOR
	li a1, MENU_X
	call FILL_SCREEN_FROM
	unmemo(ra)
	ret
	#não escreve coisas no menu ainda
