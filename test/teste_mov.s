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

######################################################


STOP_VERTICAL_MOV:

	la t0, PLAYER_VEL_Y
	sb zero, 0(t0)
	
	j fall_check


STOP_HORIZONTAL_MOV:
	
	la t0, PLAYER_VEL_X
	sb zero, 0(t0) 
	
	
	j fall_check

APPLY_VELS:
	memo(ra)
	
	#Y
	la t0, PLAYER_VEL_Y
	lb t1, 0(t0)
	
	la t2, PLAYER_Y
	lh t3, 0(t2)
	add t3, t3, t1
	sh t3, 0(t2)
	
	#X
	la t0, PLAYER_VEL_X
	lb t1, 0(t0)
	
	la t2, PLAYER_X
	lh t3, 0(t2)
	add t3, t3, t1
	sh t3, 0(t2)
	
	unmemo(ra)
	ret
	

GROUNDED:
	#memo(ra)
	la t0, PLAYER_VEL_Y
	sb zero, 0(t0)
	
	la t0, PLAYER_IS_GROUNDED
	li t1, 1
	sb t1, 0(t0)
	
	la t2, PLAYER_Y
	lh t3, 0(t2)
	
	srai t3, t3, 4
	slli t3, t3, 4
	
	sh t3, 0(t2)

	#unmemo(ra)
	j jump_check

CEILED:
	la t0, PLAYER_VEL_Y
	lb t1, 0(t0)
	bgez t1, end_proc_mov
	sb zero, 0(t0)
	
	la t2, PLAYER_Y
	lh t3, 0(t2)
	addi t3, t3, 15
	
	srai t3, t3, 4
	slli t3, t3, 4
	
	sh t3, 0(t2)
	j end_proc_mov
######################################################

PROCESS_MOVEMENT:
	# argumentos: a0 (KEY_LEFT, KEY_RIGHT, KEY_JUMP)
	memo(ra)
	
	li t0, KEY_RIGHT
	beq t0, a0, right_check

	li t0, KEY_LEFT
	beq t0, a0, left_check
	
	li t0, KEY_JUMP
	beq t0, a0, fall_check
	
	j fall_check
	
	right_check:
	
		la t0, PLAYER_FACING
		li t1, PLAYER_FACING_RIGHT
		sb t1, 0(t0)

		# check for X obstacle (top right)
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		mv t0, t5
		mv t1, t4
		addi t0, t0, 16
		# (t0, t1) = (x+16, y)
		srai t0, t0, 4
		srai t1, t1, 4
		addi t2, zero, 10
		mul t2, t2, t0
		add t2, t2, t1
		addi t2, t2, 1
		# t2 -> posicao do tile (t0, t1)
		la t3, mapa_de_testes #MUDAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		add t3, t3, t2
		lb t4, 0(t3)
		addi t0, zero, 1
		
		beq t4, t0, STOP_HORIZONTAL_MOV
		
		# check for X obstacle (bot right)
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		mv t0, t5
		mv t1, t4
		addi t0, t0, 16
		addi t1, t1, 15
		# (t0, t1) = (x+16, y+15)
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
		
		beq t4, t0, STOP_HORIZONTAL_MOV 
		
		# finally change vel_x
		
		la t0, PLAYER_VEL_X
		li t1, 3
		sb t1, 0(t0)
		
		j fall_check
		
	left_check:
		la t0, PLAYER_FACING
		li t1, PLAYER_FACING_LEFT
		sb t1, 0(t0)
		# check for X obstacle (top left)
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
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
		# t2 -> posicao do tile (t0, t1)
		la t3, mapa_de_testes #MUDAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		add t3, t3, t2
		lb t4, 0(t3)
		addi t0, zero, 1
		
		beq t4, t0, STOP_HORIZONTAL_MOV
		
		# check for X obstacle (bot left)
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
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
		
		beq t4, t0, STOP_HORIZONTAL_MOV 
		
		# finally change vel_x
		
		la t0, PLAYER_VEL_X
		li t1, -3
		sb t1, 0(t0)
		
		j fall_check
		
	
	
	fall_check:
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		# check for Y obstacle (bot left)
		mv t0, t5
		mv t1, t4
		addi t1, t1, 16
		# (t0, t1) = (x, y+16)
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
		li t2, 1
		
		beq t4, t2, GROUNDED
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		# check for Y obstacle (bot right)
		mv t0, t5
		mv t1, t4
		addi t0, t0, 15
		addi t1, t1, 16
		# (t0, t1) = (x+15, y+16)
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
		li t2, 1
		
		beq t4, t2, GROUNDED
	
		# finally change vel_y
		
		la t0, PLAYER_IS_GROUNDED
		sb zero, 0(t0)
		
		la t0, PLAYER_VEL_Y
		lh t1, 0(t0)
		addi t1, t1, 1
		sb t1, 0(t0)
		
	
	
	jump_check:
		li t0, KEY_JUMP
		bne t0, a0, jump_skip
		
		la t0, PLAYER_IS_GROUNDED
		lb t1, 0(t0)
		li t2, 1
		bne t1, t2, jump_skip
		jump_activate:

			li t0, PLAYER_VEL_Y
			addi t1, zero, -8
			sb t1, 0(t0)
			la t0, PLAYER_IS_GROUNDED
			sb zero, 0(t0)
		jump_skip:
	
	ceil_check:
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		# check for Y obstacle (top left)
		mv t0, t5
		mv t1, t4
		addi t1, t1, -1
		# (t0, t1) = (x, y-1)
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
		li t2, 1
		
		beq t4, t2, CEILED
		
		
		la t0, PLAYER_Y
		lh t4, 0(t0)
		la t0, PLAYER_X
		lh t5, 0(t0)
		
		# check for Y obstacle (top right)
		mv t0, t5
		mv t1, t4
		addi t0, t0, 15
		addi t1, t1, -1
		# (t0, t1) = (x+15, y-1)
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
		li t2, 1
		
		beq t4, t2, CEILED
		
		
	end_proc_mov:
	
	jal APPLY_VELS
	la t0, PLAYER_VEL_X
	sb zero, 0(t0)
	
	unmemo(ra)
	ret

MAIN:
	sleep(35)
	call GAME_RENDER
	call GAME_CONTROL
	call GAME_LOGIC
	li t0, GAME_STATE
	lb t0, 0(t0)
	li t1, GAME_STATE_ACTION
	bne t0, t1, MAIN
	
	jal GET_INPUT_TEST

	mv s0, a0
	jal PROCESS_MOVEMENT
	
	j MAIN

.include "../src/control/control.s"
.include "../src/logic/logic.s"
.include "../src/video/video.s"
.include "../SYSTEMv24.s"
