# arquivo que retorna o sprite correto para objetos

#retorna em a0 o endereço do sprite do jogador
GET_PLAYER_SPRITE:
	la a0, player_tile_right #teste
	ret
	
	#sprite depende de:
	#inimigo absorvido (3 tipos)
	#orientação (2 tipos)
	#pulando (2 tipos)
	#fazer alguma coisa pra retornar o endereço certo
	
#retorna em a0 o endereço do sprite do inimigo cujo endereço é passado em a0
GET_ENEMY_SPRITE:
	lb t0, ENEMY_DIR(a0)
	li t1, 0
	beq t0, t1, left_ges
	j right_ges
left_ges:
	la a0, spider_tile_left
	ret
right_ges:
	la a0, spider_tile_right
	ret
	#depende da orientação e tipo de inimigo
	
#retorna em a0 o endereço do sprite do projétil cujo endereço é passado em a0
GET_SHOT_SPRITE:
	ret

#retorna em a0 o endereço do sprite do tile especificado pelo tipo em a0
GET_TILE_SPRITE:
	la t0, MAP_TILE_SPRITES #endereço dos sprites dos tiles da fase atual
	slli a0, a0, 2 #a0 *= 4 (índice do tile a ser retornado)
	add t0, t0, a0 #t0 é o endereço do sprite a ser retornado
	lw a0, 0(t0) #a0 é o endereço do sprite a ser retornado
	ret
