# arquivo para escrita na tela

WRITE_START:
	la a0, GAME_NAME
	li a1, 10
	li a2, 10
	li a3, BASE_STRING_COLOR 
	li a7, 104
	ecall
	
	la a0, STRING_CONTROLS
	li a1, 10
	li a2, 40
	li a3, BASE_STRING_COLOR 
	li a7, 104
	ecall
	
	la a0, STRING_WASD
	li a1, 10
	li a2, 52
	li a3, BASE_STRING_COLOR 
	li a7, 104
	ecall
	
	la a0, STRING_ABSORB
	li a1, 10
	li a2, 64
	li a3, BASE_STRING_COLOR 
	li a7, 104
	ecall
	
	la a0, STRING_POWER
	li a1, 10
	li a2, 76
	li a3, BASE_STRING_COLOR 
	li a7, 104
	ecall
	
	la a0, STRING_SOON
	li a1, 10
	li a2, 110
	li a3, BASE_STRING_COLOR
	li a7, 104
	ecall
	
	ret
	
WRITE_MENU:
	li a0, STRING_HP
	li a1, 10
	li a2, 180
	li a3, MENU_COLOR
	slli a3, a3, 8 #bits do fundo da string
	li t0, MENU_STRING_COLOR 
	add a3, a3, t0
	li a7, 104
	ecall
	
WRITE_END:
	la a0, STRING_WIN
	li a1, 40
	li a2, 40
	li a3, BASE_STRING_COLOR
	li a7, 104
	ecall
	
	la a0, STRING_SCORE
	li a1, 40
	li a2, 60
	li a3, BASE_STRING_COLOR
	li a7, 104
	ecall
	
	ret