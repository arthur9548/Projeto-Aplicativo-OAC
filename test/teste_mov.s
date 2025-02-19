.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"


.text
call MAIN

MAIN:
	sleep(35)
	call GAME_RENDER
	call GAME_CONTROL
	call GAME_LOGIC
	li t0, GAME_STATE
	lb t0, 0(t0)
	li t1, GAME_STATE_ACTION
	bne t0, t1, MAIN
	
	jal CHECK_CURRENT_TILE
	
	jal GET_INPUT_TEST

	mv s0, a0
	jal PROCESS_MOVEMENT
	jal CHECK_FOR_ENEMY_DAMAGE
	
	j MAIN

.include "../src/control/control.s"
.include "../src/logic/logic.s"
.include "../src/video/video.s"
.include "../SYSTEMv24.s"
