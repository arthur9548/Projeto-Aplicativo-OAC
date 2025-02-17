# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text

MAIN:
la s0, GAME_STATE
li t0, GAME_STATE_INIT
sb t0, 0(s0)
call GAME_RENDER
sleep(2000)
li t0, GAME_STATE_ACTION
sb t0, 0(s0)
la t0, mapa_de_testes
la t1, MAP_ADDRESS
sw t0, 0(t1)
ACTION:
la t0, MAP_OFFSET
lh t0, 0(t0)
li t1, 100
beq t0, t1, END
addi t0, t0, 1
la t1, MAP_OFFSET
sh t0, 0(t1)
la t1, PLAYER_X
lh t0, 0(t1)
addi t0, t0, 2
sh t0, 0(t1)
call GAME_RENDER
sleep(10)
j ACTION
END:
sleep(1000)
li t0, GAME_STATE_OVER
sb t0, 0(s0)
call GAME_RENDER
exit_loop


SLIDE_TEST:
call INIT_FRAMES
li s0, 0 #offset inicial
la s1, mapa_de_testes
lb s1, 0(s1) #largura do mapa
li t0, MAP_W
sub s1, s1, t0 #tiles sobrando
li t0, TILE_W
mul s1, s1, t0 #pixels sobrando
LOOP:
	bgt s0, s1, END #enquanto o offset for válido
	GET_BUFFER_TO_DRAW(a7)
	la a0, mapa_de_testes
	mv a1, s0
	call DRAW_MAP
	li a0, 0b10010111
	li a1, 160
	call FILL_SCREEN_FROM
	call SWAP_FRAMES
	#sleep(50)
	addi s0, s0, 1
	j LOOP
END:
	exit_loop


BORDER_ROUTINE: #testa o desenho nas bordas
	li a0, 0x0ff
	GET_BUFFER_TO_DRAW(a7)
	li a1, 0
	call FILL_SCREEN_FROM
	li a0, water_tile
	li a1, -8
	li a2, 232
	call DRAW_TILE
	li a0, grass_tile
	li a1, 300
	li a2, 230
	call DRAW_TILE
	li a0, water_tile
	li a1, 312
	li a2, -8
	call DRAW_TILE
	li a0, grass_tile
	li a1, 16
	li a2, 16
	call DRAW_TILE
	call SWAP_FRAMES
	sleep(100)

#desenha a disposição inicial do mapa de teste (20x10)na tela
#a0: endereço do mapa de teste
#a7: tela (não mudado)
DRAW_INITIAL_MAP:
	addi a0, a0, 1 #ignora tamanho X
	memo(ra) #função de ordem superior
	li t0, 0 #x
	li t1, 0 #y
	li t2, MAP_W 
	li t6, TILE_W
	mul t2, t2, t6 #t2 é o X máximo do mapa
	li t3, MAP_H
	li t6, TILE_H
	mul t3, t3, t6 #t3 é o Y máximo do mapa
row_loop_draw_initial_map:
	bge t0, t2, end_row_draw_initial_map
	li t1, 0 #zera o y
col_loop_draw_initial_map:
		bge t1, t3, end_col_draw_initial_map #descobrir o tipo do tile
		lb t6, 0(a0) #tile atual
		memo(a0) #guardar o endereço do mapa
		beq t6, zero, if1_cldim
		la a0, grass_tile
	j c1_cldim
if1_cldim:
			la a0, water_tile
c1_cldim: 
		mv a1, t0
		mv a2, t1
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
		j col_loop_draw_initial_map
end_col_draw_initial_map:
	addi t0, t0, TILE_W #X aumenta
	j row_loop_draw_initial_map
end_row_draw_initial_map:
	unmemo(ra)
	ret

TRY_MENU: #a1 = tamanho de teste, a7 = tela
	li a0, 0x0ff
	memo(a1)
	li a1, 0
	call FILL_SCREEN_FROM
	li a0, 0x03
	unmemo(a1)
	call FILL_SCREEN_FROM
	call SWAP_FRAMES

.include "../src/video/video.s"
.include "../SYSTEMv24.s"
