# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
MAIN:
	call GAME_CONTROL
	call GAME_RENDER
	call GAME_AUDIO
	j MAIN

li a0, 0
call INIT_MAP

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
sleep(10)
j ACTION

END:
sleep(10)
li t0, GAME_STATE_OVER
sb t0, 0(s0)
call GAME_RENDER
exit_loop


.include "../src/video/video.s"
.include "../src/audio/audio.s"	
.include "../SYSTEMv24.s"
.include "../src/logic/control.s"
