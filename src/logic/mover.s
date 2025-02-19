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
row_loop_collision:
	bge s0, s2, no_collision
	li s1, 0 #zera o y
col_loop_collision:
		bge s1, s3, end_col_collision
		lb t0, 0(a0) #tile atual
		mv a3, s0 #x
		mv a4, s1 #y
		li t1, BLOCK_TILE
		bne t0, t1, continue_collision #não faz nada se tile não for bloco
		memo(a0)
		memo(a1)
		memo(a2)
		call TILE_INTERSECT
		unmemo(a2)
		unmemo(a1)
		mv t0, a0
		unmemo(a0)
		bnez t0, has_collision #pode ter havido colisão
continue_collision:
		addi s1, s1, TILE_H #Y aumenta
		addi a0, a0, 1 #andamos para o próximo endereço
		j col_loop_collision
end_col_collision:
	addi s0, s0, TILE_W #X aumenta
	j row_loop_collision
ret_collision:
	unmemo(s3)
	unmemo(s2)
	unmemo(s1)
	unmemo(s0)
	unmemo(ra)
	ret
no_collision:
	li a0, 0
	j ret_collision
has_collision:
	li a0, 1
	j ret_collision