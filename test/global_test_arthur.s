# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
MAIN:
	#sleep(400)
	call GAME_CONTROL
	call GAME_LOGIC
	call GAME_RENDER
	#call GAME_AUDIO
	li t0, GAME_STATE
	lb t0, 0(t0)
	li t1, GAME_STATE_ACTION
	bne t0, t1, MAIN
	
	call process_input
	call move_player
	call move_enemies 
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
	
move_enemies:
	la t0, ENEMIES_ADDRESS
	li t1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul t1, t1, t2
	add t1, t0, t1 #t1 guarda o fim do array de inimigos
loop_enemies:
	beq t0, t1, end_enemies
	lb t2, ENEMY_ACTIVE(t0)
	mv a0, t0
	addi t0, t0, ENEMY_MEMORY_SIZE #já prepara o próximo inimigo
	beqz t2, loop_enemies
	memo(t0)
	memo(t1)
	lh t0, ENEMY_VEL_X(a0)
	#print_int(t0)
	lh t1, ENEMY_X(a0)
	add t0, t0, t1
	sh t0, ENEMY_X(a0)
	
	lh t0, ENEMY_VEL_Y(a0)
	lh t1, ENEMY_Y(a0)
	add t0, t0, t1
	sh t0, ENEMY_Y(a0)
	unmemo(t1)
	unmemo(t0)
	j loop_enemies
end_enemies:
	ret

.include "../src/video/video.s"
.include "../src/audio/audio.s"	
.include "../src/logic/logic.s"
.include "../src/control/control.s"
.include "../SYSTEMv24.s"
