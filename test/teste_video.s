# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text

MAIN:
#init phase
la t1, MAP_TILE_SPRITES
la t0, brick_tile
sw t0, 0(t1)
la t0, metal_tile
sw t0, 4(t1)
la t0, water_tile
sw t0, 8(t1)
la t0, mapa_de_testes
la t1, MAP_ADDRESS
sw t0, 0(t1)

#init game
la s0, GAME_STATE
li t0, GAME_STATE_INIT
sb t0, 0(s0)
call GAME_RENDER
sleep(2000)

#change to action
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
sleep(10)
li t0, GAME_STATE_OVER
sb t0, 0(s0)
call GAME_RENDER
exit_loop


.include "../src/video/video.s"
.include "../SYSTEMv24.s"
