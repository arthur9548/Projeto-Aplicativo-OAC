# programa que realiza o processamento lógico do jogo

#inicializa uma fase escolhida no jogo
#escolha é feita na memória
INIT_MAP:
	la t0, PLAYER_X
	li t1, START_X
	sh t1, 0(t0)
	la t0, PLAYER_Y
	li t1, START_Y
	sh t1, 0(t0)
	la t3, CUR_MAP_INDEX 
	lb t3, 0(t3) #mapa atual
	la t2, MAP_ADDRESS #endereço do mapa atual
	la t4, MAP_ITSELF
	sw t4, 0(t2) #endereço para o mapa atual
	la t1, MAP_TILE_SPRITES #endereço dos tiles desse mapa
	
	li t0, 0
	beq t3, t0, case0_init_map
	
	li t0, 1
	beq t3, t0, case1_init_map
	
	li t0, 2
	beq t3, t0, case2_init_map 
	
ret_init_map: #t0 é o endereço do mapa, copiar ele pro map_itself
	memo(ra)
	mv a0, t0
	call COPY_MAP #retorna em a0 MAP_ITSELF
	call INIT_ENEMIES #inicializa os inimigos no mapa
	unmemo(ra)
	ret
	
case0_init_map:
	la t0, brick_tile
	sw t0, 0(t1)
	la t0, metal_tile
	sw t0, 4(t1)
	la t0, water_tile
	sw t0, 8(t1) #informações de tile
	la t0, open_door_tile
	sw t0, 12(t1)
	la t0, closed_door_tile 
	sw t0, 16(t1)
	la t0, mapa_fase_0
	j ret_init_map
	
		
case1_init_map:
	la t0, oak_tile
	sw t0, 0(t1)
	la t0, box_tile
	sw t0, 4(t1)
	la t0, water_tile
	sw t0, 8(t1) #informações de tile
	la t0, open_door_tile
	sw t0, 12(t1)
	la t0, closed_door_tile 
	sw t0, 16(t1)
	la t0, mapa_fase_1
	j ret_init_map
	
case2_init_map:
	la t0, wood_tile
	sw t0, 0(t1)
	la t0, round_tile
	sw t0, 4(t1)
	la t0, water_tile
	sw t0, 8(t1) #informações de tile
	la t0, open_door_tile
	sw t0, 12(t1)
	la t0, closed_door_tile 
	sw t0, 16(t1)
	la t0, mapa_fase_2
	j ret_init_map
	
COPY_MAP: #copia o mapa em a0 pra MAP_ITSELF
	memo(s0)
	memo(s1)
	mv s0, a0
	lb s1, 0(s0) #tamanho
	la a0, MAP_ITSELF
	sb s1, 0(a0)
	addi s0, s0, 1 #passa para os dados
	addi a0, a0, 1
	li t0, MAP_H
	mul s1, s1, t0 #tamanho do mapa em si
	add s1, s0, s1 #final desse mapa
loop_copy_map:
	beq s0, s1, end_copy_map
	lb t0, 0(s0)
	sb t0, 0(a0)
	addi s0, s0, 1 #anda 1
	addi a0, a0, 1 #anda 1
	j loop_copy_map
end_copy_map:
	la a0, MAP_ITSELF
	unmemo(s1)
	unmemo(s0)
	ret
	
	
	
#limpa a lista de inimigos do mapa
CLEAR_ENEMIES:
	la t0, ENEMIES_ADDRESS
	li t1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul t1, t1, t2
	add t1, t0, t1 #t1 guarda o fim do array de inimigos
loop_clear_enemies:
	beq t0, t1, end_clear_enemies
	sw zero, 0(t0)
	addi t0, t0, 4 #zera todas as words no endereço
	j loop_clear_enemies
end_clear_enemies:
	ret
	
#coloca um inimigo no jogo
#a0: tipo, a1: X, a2: Y
PUT_ENEMY:
	la t0, ENEMIES_ADDRESS #endereço dos inimigos
	li t1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul t1, t1, t2
	add t1, t0, t1 #t1 guarda o fim do array de inimigos
loop_put_enemy:
	beq t0, t1, end_put_enemy #encontrar uma posição para colocar o inimigo atual
	lb t2, ENEMY_ACTIVE(t0)
	beqz t2, found_put_enemy
	addi t0, t0, ENEMY_MEMORY_SIZE #passa para o próximo inimigo
	j loop_put_enemy
end_put_enemy:
	ret
found_put_enemy: #inicilizar inimigo
	sh a1, ENEMY_X(t0)
	sh a2, ENEMY_Y(t0)
	sh zero, ENEMY_VEL_X(t0)
	sh zero, ENEMY_VEL_Y(t0)
	sw zero, ENEMY_COUNTER(t0)
	sw zero, ENEMY_EXTRA(t0)
	sb zero, ENEMY_DIR(t0)
	li t1, 1
	sb t1, ENEMY_ACTIVE(t0)
	sb t1, ENEMY_HP(t0)
	sb a0, ENEMY_TYPE(t0)
	li t1, BOSS_CODE
	bne a0, t1, end_put_enemy #caso especial do boss
	li t1, BOSS_HP
	sb t1, ENEMY_HP(t0)
	j end_put_enemy
	
#inicializa os inimigos no mapa passado em a0
INIT_ENEMIES:
	memo(ra)
	call CLEAR_ENEMIES
	lbu t2, 0(a0) #dimensão no X
	li t6, TILE_W
	mul t2, t2, t6 #t2 é o X máximo do mapa
	li t3, MAP_H #dimensão no Y é MAP_H
	li t6, TILE_H
	mul t3, t3, t6 #t3 é o Y máximo do mapa
	
	addi a0, a0, 1 #passa para o início dos dados
	li t0, 0 #x
	li t1, 0 #y
row_loop_init_enemies:
	bge t0, t2, end_row_init_enemies
	li t1, 0 #zera o y
col_loop_init_enemies:
		bge t1, t3, end_col_init_enemies
		memo(t0)
		memo(t1)
		memo(t2)
		memo(t3)
		memo(a0) #guardar o endereço do mapa
		lb a0, 0(a0) #tile atual
		mv a1, t0 #x
		mv a2, t1 #y
		li t0, ENEMY_TILE_CODE
		blt a0, t0, continue_init_enemies #não faz nada se tile não for inimigo
		sub a0, a0, t0 #código real do inimigo
		call PUT_ENEMY #coloca o inimigo no jogo
		unmemo(a0)
		li t0, BACKGROUND_TILE #substitui por um tile de fundo
		sb t0, 0(a0)
		memo(a0)
continue_init_enemies:
		unmemo(a0) #recuperamos o endereço do mapa
		unmemo(t3)
		unmemo(t2)
		unmemo(t1)
		unmemo(t0)
		addi t1, t1, TILE_H #Y aumenta
		addi a0, a0, 1 #andamos para o próximo endereço
		j col_loop_init_enemies
end_col_init_enemies:
	addi t0, t0, TILE_W #X aumenta
	j row_loop_init_enemies
end_row_init_enemies:
	unmemo(ra)
	ret
	
#move objetos no mapa de acordo, e calcula MAP_OFFSET
#MOVE_OBJECTS:
#	ret
	
#entende o que aconteceu na fase e atualiza flags: PLAYER_ALIVE, PLAYER_WIN e talvez flags de som
#PROCESS_RESULTS:
#	ret
