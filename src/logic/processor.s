# programa que realiza o processamento lógico do jogo

#inicializa uma fase escolhida no jogo
#escolha é feita na memória
INIT_MAP:
	la t3, CUR_MAP_INDEX 
	lb t3, 0(t3) #mapa atual
	la t2, MAP_ADDRESS #endereço do mapa atual
	la t1, MAP_TILE_SPRITES #endereço dos tiles desse mapa
	
	li t0, 0
	beq t3, t0, case0_init_map
	
	li t0, 1
	beq t3, t0, case1_init_map 
	
	li t0, 2
	beq t3, t0, case2_init_map 
	
ret_init_map:
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
	la t0, mapa_de_testes
	sw t0, 0(t2) #endereço do mapa
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
	la t0, mapa_de_testes
	sw t0, 0(t2) #endereço do mapa
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
	la t0, mapa_de_testes
	sw t0, 0(t2) #endereço do mapa
	j ret_init_map
	
#move objetos no mapa de acordo, e calcula MAP_OFFSET
MOVE_OBJECTS:
	ret
	
#entende o que aconteceu na fase e atualiza flags: PLAYER_ALIVE, PLAYER_WIN e talvez flags de som
PROCESS_RESULTS:
	ret
