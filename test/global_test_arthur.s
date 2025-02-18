# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
MAIN:
	sleep(400)
	call GAME_CONTROL
	call GAME_RENDER
	call GAME_AUDIO
	call GAME_LOGIC
	call GET_INPUT
	li t0, KEY_LEFT
	beq a0, t0, lose
	li t0, KEY_RIGHT
	beq a0, t0, win
	j MAIN
lose:
	la t1, PLAYER_ALIVE
	li t0, 0
	sb t0, 0(t1) #morre
	j MAIN
win:
	la t1, PLAYER_WON
	li t0, 1
	sb t0, 0(t1) #ganha
	j MAIN

.include "../src/video/video.s"
.include "../src/audio/audio.s"	
.include "../src/logic/logic.s"
.include "../src/control/control.s"
.include "../SYSTEMv24.s"
