# arquivo que retorna o sprite correto para objetos

#retorna em a0 o endereço do sprite do jogador
GET_PLAYER_SPRITE:
	la a0, player #teste
	ret
	
	#sprite depende de:
	#inimigo absorvido (3 tipos)
	#orientação (2 tipos)
	#pulando (2 tipos)
	#fazer alguma coisa pra retornar o endereço certo
	
#retorna em a0 o endereço do sprite do inimigo cujo endereço é passado em a0
GET_ENEMY_SPRITE:
	ret
	#depende da orientação e tipo de inimigo
	
#retorna em a0 o endereço do sprite do projétil cujo endereço é passado em a0
GET_SHOT_SPRITE:
	ret