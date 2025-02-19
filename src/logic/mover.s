#funções para movimentos

#passa x e y no a1 e a2, diz no a0 se teve colisão com o mapa
COLLISION_MAP:
	memo(ra)
	memo(s0)
	memo(s1)
	memo(s2)
	memo(s3)
	la a0, MAP_ADDRESS
	lw a0, 0(a0) #endereço do mapa atual
	lbu s2, 0(a0) #dimensão no X
	li t6, TILE_W
	mul s2, s2, t6 #s2 é o X máximo do mapa
	li s3, MAP_H #dimensão no Y é MAP_H
	li t6, TILE_H
	mul s3, s3, t6 #t3 é o Y máximo do mapa
	
	addi a0, a0, 1 #passa para o início dos dados
	li s0, 0 #x
	li s1, 0 #y
row_loop_collision_map:
	bge s0, s2, no_collision_map
	li s1, 0 #zera o y
col_loop_collision_map:
		bge s1, s3, end_col_collision_map
		lb t0, 0(a0) #tile atual
		mv a3, s0 #x
		mv a4, s1 #y
		li t1, BLOCK_TILE
		bne t0, t1, continue_collision_map #não faz nada se tile não for bloco
		memo(a0)
		memo(a1)
		memo(a2)
		call TILE_INTERSECT
		unmemo(a2)
		unmemo(a1)
		mv t0, a0
		unmemo(a0)
		bnez t0, has_collision_map #pode ter havido colisão
continue_collision_map:
		addi s1, s1, TILE_H #Y aumenta
		addi a0, a0, 1 #andamos para o próximo endereço
		j col_loop_collision_map
end_col_collision_map:
	addi s0, s0, TILE_W #X aumenta
	j row_loop_collision_map
ret_collision_map:
	unmemo(s3)
	unmemo(s2)
	unmemo(s1)
	unmemo(s0)
	unmemo(ra)
	ret
no_collision_map:
	li a0, 0
	j ret_collision_map
has_collision_map:
	li a0, 1
	j ret_collision_map

#retorna se houve colisão no a1 no a2
COLLISION_ENEMIES:
	memo(ra)
	memo(s0)
	memo(s1)
	la s0, ENEMIES_ADDRESS
	li s1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul s1, s1, t2
	add s1, s0, s1 #t1 guarda o fim do array de inimigos
loop_collision_enemies:
	beq s0, s1, no_collision_enemies
	lb t2, ENEMY_ACTIVE(s0)
	beqz t2, continue_collision_enemies # se não estiver ativo continua
	
	lh a3, ENEMY_X(s0)
	lh a4, ENEMY_Y(s0) #inimigo atual
	
	call TILE_INTERSECT
	beqz a0, continue_collision_enemies #se não colidiu ok
	
	j has_collision_enemies
continue_collision_enemies:
	addi s0, s0, ENEMY_MEMORY_SIZE #já prepara o próximo inimigo
	j loop_collision_enemies
ret_collision_enemies:
	unmemo(s1)
	unmemo(s0)
	unmemo(ra)
	ret
no_collision_enemies:
	li a0, 0
	j ret_collision_enemies
has_collision_enemies:
	li a0, 1
	j ret_collision_enemies
	
MOVE_ENEMIES:
	memo(ra)
	memo(s0)
	memo(s1)
	la s0, ENEMIES_ADDRESS
	li s1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul s1, s1, t2
	add s1, s0, s1 #t1 guarda o fim do array de inimigos
loop_enemies:
	beq s0, s1, end_enemies
	lb t2, ENEMY_ACTIVE(s0)
	beqz t2, continue_enemies # se não estiver ativo continua
	
	lh t0, ENEMY_VEL_X(s0)
	lh t2, ENEMY_X(s0)
	memo(t2) #guarda a posição antiga
	add t0, t0, t2
	sh t0, ENEMY_X(s0)
	
	lh t1, ENEMY_VEL_Y(s0)
	lh t3, ENEMY_Y(s0)
	memo(t3) #guarda a posição antiga
	add t1, t1, t3
	sh t1, ENEMY_Y(s0)
	
	mv a1, t0
	mv a2, t1
	call COLLISION_MAP
	memo(a0)
	call COLLISION_ENEMIES
	mv t0, a0
	unmemo(a0)
	add a0, a0, t0
	unmemo(a2)
	unmemo(a1) #recupera as posições antigas
	
	beqz a0, continue_enemies #se não colidiu ok
	#print_int(a0)
	#print_int(a1)
	#print_int(a2)
	sh a1, ENEMY_X(s0)
	sh a2, ENEMY_Y(s0) #se bateu volta
continue_enemies:
	addi s0, s0, ENEMY_MEMORY_SIZE #já prepara o próximo inimigo
	j loop_enemies
end_enemies:
	unmemo(s1)
	unmemo(s0)
	unmemo(ra)
	ret