.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"


.text
call MAIN

GET_INPUT_TEST:
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
	
	li t0, KEY_RIGHT
	beq t0, a0, right_check
	
	li t0, KEY_LEFT
	beq t0, a0, left_check
	
	#li t0, KEY_JUMP
	#beq t0, a0, jump_check
	
	j no_input
	
	#jump_check:
	#	la t0, PLAYER_IS_MID_AIR
	#	lb t2, 0(t0)
	#	li t1, PLAYER_NOT_MID_AIR
	#	beq t2, t1, jump_activate
	#	jump_activate:
	#		li t0, PLAYER_VEL_Y
			
		
	
	left_check:
		
		addi t6, zero, -6
		
		
		# check for X obstacle (top left)
		mv t0, t5
		mv t1, t4
		addi t0, t0, -1
		# (t0, t1) = (x-1, y)
		
		srai t0, t0, 4
		srai t1, t1, 4
		addi t2, zero, 10
		mul t2, t2, t0
		add t2, t2, t1
		addi t2, t2, 1
		# t2 -> posicao do tile
		la t3, mapa_de_testes #MUDAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		add t3, t3, t2
		lb t4, 0(t3)
		
		addi t0, zero, 1
		beq t4, t0, WALL_DETECTED
		
		#j SKIP_HORIZONTAL_DETECTION
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		
		# check for X obstacle (bot left)
		
		mv t0, t5
		mv t1, t4
		addi t0, t0, -1
		addi t1, t1, 15
		# (t0, t1) = (x-1, y+15)
		
		srai t0, t0, 4
		srai t1, t1, 4
		addi t2, zero, 10
		mul t2, t2, t0
		add t2, t2, t1
		addi t2, t2, 1
		
		
		# t2 -> posicao do tile
		la t3, mapa_de_testes #MUDAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		add t3, t3, t2
		lb t4, 0(t3)
		
		addi t0, zero, 1
		beq t4, t0, WALL_DETECTED
		
		j SKIP_HORIZONTAL_DETECTION
		
		
	right_check:
		
		addi t6, zero, 6
		
		# check for X obstacle (top right)
		mv t0, t5
		mv t1, t4
		addi t0, t0, 16
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
		
		#j SKIP_HORIZONTAL_DETECTION
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		
		# check for X obstacle (bot right)
		
		mv t0, t5
		mv t1, t4
		addi t0, t0, 16
		addi t1, t1, 15
		# (t0, t1) = (x+17, y+16)
		
		srai t0, t0, 4
		srai t1, t1, 4
		addi t2, zero, 10
		mul t2, t2, t0
		add t2, t2, t1
		addi t2, t2, 1
		
		
		# t2 -> posicao do tile a direita de baixo (t0, t1)
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
	
	no_input:
	mv t6, zero
	la t0, PLAYER_VEL_X
	sh t6, 0(t0)
	
	
	
	unmemo(ra)
	ret

MAIN:
	sleep(2)
	call GAME_RENDER
	call GAME_CONTROL
	call GAME_LOGIC
	li t0, GAME_STATE
	lb t0, 0(t0)
	li t1, GAME_STATE_ACTION
	bne t0, t1, MAIN
	
	jal GET_INPUT
	print_int(a0)
	mv s0, a0
	jal PROCESS_MOVEMENT
	
	j MAIN

.include "../src/control/control.s"
.include "../src/logic/logic.s"
.include "../src/video/video.s"
.include "../SYSTEMv24.s"
