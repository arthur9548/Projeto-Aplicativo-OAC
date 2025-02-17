.include "../src/util/util.s"
.include "../src/data/data.s"


.text
call INIT_FRAMES
call MAIN

GET_INPUT:
	# arugmentos: nenhum
	# retorna: a0 (KEY_LEFT, KEY_RIGHT, KEY_JUMP, KEY_ABSORB. KEY_SPECIAL) ou 0 (KEY_NOTHING), caso nenhuma tecla pressionada
	
	memo(ra)
	li t1, KBD_CONTROL		      		# carrega o endereco de controle do KDMMIO
 	lw t0, 0(t1)			          	# Le bit de Controle Teclado
	andi t0, t0, 0x0001		      		# mascara o bit menos significativo
	beq t0, zero, ret_kbd_input	    		# não tem tecla pressionada entao retorna
	lw t0, 4(t1)
	#mv a0, t0
	
	get_dir:
		li t2, 'a'
		bne t0, t2, not_a_key
		li a0, KEY_LEFT
		
		unmemo(ra)
		ret
		
	not_a_key:
		li t2, 'd'
		bne t0, t2, not_d_key
		li a0, KEY_RIGHT
		
		unmemo(ra)
		ret
		
	not_d_key:
		li t2, 'w'
		bne t0, t2, not_jump_key
		li a0, KEY_JUMP
		
		unmemo(ra)
		ret
		
	not_jump_key:
		li t2, 'e'
		bne t0, t2, not_absorb_key
		li a0, KEY_ABSORB
		
		unmemo(ra)
		ret
		
	not_absorb_key:
		li t2, 'f'
		bne t0, t2, not_special_key
		li a0, KEY_SPECIAL
		
		unmemo(ra)
		ret
		
	not_special_key:
		li a0, KEY_NOTHING
			
	unmemo(ra)
	ret
	
	ret_kbd_input:
		mv a0, zero
		unmemo(ra)
		ret

PROCESS_MOVEMENT:
	# argumentos: a0 (KEY_LEFT, KEY_RIGHT, KEY_JUMP)
	
	memo(ra)
	
	la t0, PLAYER_Y
	lh t4, 0(t0)
	
	la t0, PLAYER_X
	lh t5, 0(t0)
	
	la t0, PLAYER_VEL_X
	lb t6, 0(t0)
	
	
	
	# t4 = y
	# t5 = x
	# t6 = vel_x
	
	# check for X obstacle (right)
	
	mv t0, t5
	mv t1, t4
	addi t0, t0, 17
	# (t0, t1) = (x+17, y)
	
	srai t0, t0, 4
	srai t1, t1, 4
	addi t2, zero, 10
	mul t2, t2, t0
	add t2, t2, t1
	addi t2, t2, 1
	# t2 -> posicao do tile a direita de cima (t0, t1)
	la t3, mapa_de_testes #MUDAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	add t3, t3, t2
	lb t4, 0(t3)
	
	addi t0, zero, 1
	beq t4, t0, WALL_DETECTED
	
	j SKIP_HORIZONTAL_DETECTION
	
	
	WALL_DETECTED:
		mv t6, zero
	
	
	# t4 -> valor do tile a direita de cima
	
	
	SKIP_HORIZONTAL_DETECTION:
	
	add t5, t5, t6
	la t0, PLAYER_X
	sh t5, 0(t0)
	
	
	unmemo(ra)
	ret

MAIN:
	sleep(10)
	
	
	jal GET_INPUT
	
	#mv s0, a0
	jal PROCESS_MOVEMENT
	
		

	memo(ra)
	#primeiro descobre qual é o estado atual do jogo pra saber o que renderizar
	
	#se for jogo normal: (tudo isso vai ser uma função)
	GET_BUFFER_TO_DRAW(a7) #a7 é o frame para desenhar
	
	#desenha o menu (provavelmente vai virar uma função
	li a0, MENU_COLOR
	li a1, MENU_X
	call FILL_SCREEN_FROM
	#desenha as outras informações do menu
	
	#entende qual é o mapa e o offset
	la a0, mapa_de_testes
	li a1, 0
	call DRAW_MAP
	
	#itera pelos personagens, inimigos e projéteis
	#pra cada um, pega o endereço da imagem e desenha na posição X Y certa
	# call DRAW_TILE #todo mundo é tile na teoria
	
	
	la a0, player_tile
	la t0, PLAYER_X
	lh a1, 0(t0)
	la t0, PLAYER_Y
	lh a2, 0(t0)
	
	
	call DRAW_TILE
	
	call SWAP_FRAMES
	unmemo(ra)
	
	j MAIN
	
.include "../src/video/video.s"
