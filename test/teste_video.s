# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text

MAIN:
la t1, MAP_TILE_SPRITES
la t0, brick_tile
sw t0, 0(t1)
la t0, metal_tile
sw t0, 4(t1)
la t0, water_tile
sw t0, 8(t1)
la t0, mapa_de_testes
li t1, MAP_ADDRESS
sw t0, 0(t1)

la s0, GAME_STATE
li t0, GAME_STATE_INIT
sb t0, 0(s0)
call GAME_RENDER
sleep(2000)

li t0, GAME_STATE_ACTION
sb t0, 0(s0) #estado do jogo é ação

ACTION:
la t0, MAP_OFFSET
lh t0, 0(t0)
li t1, 159
beq t0, t1, END
addi t0, t0, 1
la t1, MAP_OFFSET
sh t0, 0(t1)
la t1, PLAYER_X
lh t0, 0(t1)
addi t0, t0, 2
sh t0, 0(t1)
call GAME_RENDER
sleep(1)
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

.include "../src/video/video.s"
.include "../SYSTEMv24.s"
