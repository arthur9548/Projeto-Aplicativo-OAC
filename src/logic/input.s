# arquivo para ler do teclado

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
		
# processar o input do jogador
PROCESS_INPUT:
	ret