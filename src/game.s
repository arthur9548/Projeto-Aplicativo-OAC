#arquivo principal do jogo
.include "util/util.s"
.include "data/data.s"
#.include "../MACROSv24.s"
.text

MAIN:	#roda o jogo completo
	sleep(35)
	call GAME_RENDER
	call GAME_CONTROL
	call GAME_LOGIC
	call GAME_AUDIO
	#li t0, GAME_STATE
	#lb t0, 0(t0)
	#li t1, GAME_STATE_ACTION
	#bne t0, t1, MAIN
	
	#call process_input
	#call move_player
	#call MOVE_ENEMIES
	la t0, GAME_STATE
	lb t0, 0(t0)
	li t1, GAME_STATE_ACTION
	bne t0, t1, MAIN
	
	jal CHECK_CURRENT_TILE
	
	jal GET_INPUT_TEST

	mv s0, a0
	jal PROCESS_MOVEMENT
	jal CHECK_FOR_ENEMY_DAMAGE
	
	j MAIN

.include "logic/logic.s"
.include "audio/audio.s"
.include "video/video.s"
.include "control/control.s"
#.include "../SYSTEMv24.s"
