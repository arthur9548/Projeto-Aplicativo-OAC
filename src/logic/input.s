# arquivo para ler do teclado

GET_INPUT:
	# arugmentos: nenhum
	# retorna: a0 (KEY_LEFT, KEY_RIGHT, KEY_JUMP, KEY_ABSORB. KEY_SPECIAL) ou 0 (KEY_NOTHING), caso nenhuma tecla pressionada
	
	li t1, KBD_CONTROL		      		# carrega o endereco de controle do KDMMIO
 	lw t0, 0(t1)			          	# Le bit de Controle Teclado
	andi t0, t0, 0x0001		      		# mascara o bit menos significativo
	beq t0, zero, no_kdb_input	    		# não tem tecla pressionada entao retorna
	
	lw t0, 4(t1) #tecla pressionada
	
	li t2, 'a'
	beq t0, t2, left_key_input
	
	li t2, 'd'
	beq t0, t2, right_key_input
	
	li t2, 'w'
	beq t0, t2, jump_key_input
	
	li t2, 'e'
	beq t0, t2, absorb_key_input
	
	li t2, 'f'
	beq t0, t2, special_key_input
	
	j no_kdb_input #tecla não válida como input
	
ret_get_input:
	ret
	
left_key_input:
	li a0, KEY_LEFT
	j ret_get_input
	
right_key_input:
	li a0, KEY_RIGHT
	j ret_get_input
	
jump_key_input:
	li a0, KEY_JUMP
	j ret_get_input
	
absorb_key_input:
	li a0, KEY_ABSORB
	j ret_get_input
	
special_key_input:
	li a0, KEY_SPECIAL
	j ret_get_input
	
no_kdb_input:
	li a0, KEY_NOTHING
	j ret_get_input
		
# processar o input do jogador
PROCESS_INPUT:
	ret
