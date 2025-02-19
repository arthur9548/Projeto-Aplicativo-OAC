# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"

.text
MAIN:
	sleep(35)
	call GAME_RENDER
	call GAME_CONTROL
	call GAME_LOGIC
	#call GAME_AUDIO
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
	
process_input:
	memo(ra)
	call GET_INPUT
	
	li t0, KEY_LEFT
	beq a0, t0, going_left_input
	
	li t0, KEY_RIGHT
	beq a0, t0, going_right_input
	
	li t0, KEY_NOTHING
	beq a0, t0, staying_input
	
ret_process_input:
	unmemo(ra)
	ret

going_left_input:
	li t0, -1
	la t1, PLAYER_VEL_X
	sh t0, 0(t1)
	j ret_process_input
	
going_right_input:
	li t0, 1
	la t1, PLAYER_VEL_X
	sh t0, 0(t1)
	j ret_process_input
	
staying_input:
	li t0, 0
	la t1, PLAYER_VEL_X
	sh t0, 0(t1)
	j ret_process_input
	
move_player:
	la t0, PLAYER_VEL_X
	lh t0, 0(t0)
	la t1, PLAYER_X
	lh t1, 0(t1)
	add t1, t1, t0
	la t0, PLAYER_X
	sh t1, 0(t0)
	ret

.include "../src/video/video.s"
.include "../src/audio/audio.s"	
.include "../src/logic/logic.s"
.include "../src/control/control.s"
