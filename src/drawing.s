# funcoes de desenho

FILL_SCREEN: #preenche a tela com a cor em a0
	GET_BUFFER_TO_DRAW(t0) #endereço da tela
	li t1, NUMBER_OF_SCREEN_PIXELS 
	add t1, t0, t1 #fim da tela
loop_fill_screen:
		bge t0, t1, end_fill_screen
		sb a0, 0(t0)
		addi t0, t0, 1
		j loop_fill_screen
end_fill_screen:
	ret