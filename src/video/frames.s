# codigo para manipulação dos frames do bitmap

INIT_FRAMES: #inicializa frames
	li t0, CURRENT_DISPLAY_FRAME_ADDRESS
	sw zero, 0(t0) #frame exibido é o 0
	la t0, FRAME_TO_DRAW 
	li t1, 1 
	sb t1, 0(t0) #frame a ser desenhado é o 0
	ret

SWAP_FRAMES: #troca frame desenhado e visto
	li t0, CURRENT_DISPLAY_FRAME_ADDRESS
	lw t1, 0(t0)
	xori t2, t1, 1
	sw t2, 0(t0)
	la t0, FRAME_TO_DRAW
	sb t1, 0(t0)
	ret

CALC_OFFSET: #calcula offset certo de acordo com a posição x do personagem
	la t0, PLAYER_X
	lh t0, 0(t0) #x do player
	la t1, MAP_OFFSET
	lh t1, 0(t1) #offset do mapa
	sub t0, t0, t1 #posição do x em relação ao offset
	li t1, RIGHT_OFFSET
	sub t2, t1, t0
	bltz t2, push_offset
	li t1, LEFT_OFFSET
	sub t2, t1, t0
	bgtz t2, push_offset
ret_calc_offset:
	ret
push_offset:
	la t0, MAP_OFFSET
	lh t1, 0(t0)
	sub t1, t1, t2
	sh t1, 0(t0)
	j ret_calc_offset
	