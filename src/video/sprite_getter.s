# arquivo que retorna o sprite correto para objetos

#retorna em a0 o endereço do sprite do jogador
GET_PLAYER_SPRITE:
	lb a0, PLAYER_STATE
	
	li t1, PLAYER_STATE_ENEMY_RANGER
	beq t1, a0, PS_RANGER
	
	li t1, PLAYER_STATE_ENEMY_MELEE
	beq t1, a0, PS_MELEE
	
	
        lb a0, PLAYER_FACING
        li t1, PLAYER_FACING_LEFT
        beq a0, t1, SET_LEFT
        
        li t1, PLAYER_FACING_RIGHT
        beq a0, t1, SET_RIGHT
        
	la a0, test_tile #teste
	ret
	
	#sprite depende de:
	#inimigo absorvido (3 tipos)
	#orientação (2 tipos)
	#pulando (2 tipos)
	#fazer alguma coisa pra retornar o endereço certo
SET_LEFT: lb a0, PLAYER_IS_ASPIRING
          bgt a0, zero, ASPIRING_LEFT
          
          lb a0, PLAYER_IS_GROUNDED
          bgt a0, zero, JUMP_PLAYER_LEFT
          
          la a0, player_tile_left
          j FIM_RENDER_PLAYER
           
             
ASPIRING_LEFT:
         la a0, player_tile_inhaling_left
         j FIM_RENDER_PLAYER
         
         
JUMP_PLAYER_LEFT:
         la a0, player_tile_left_jumping
         j FIM_RENDER_PLAYER
         
         
SET_RIGHT:
          lb a0, PLAYER_IS_ASPIRING
          bgt a0, zero, ASPIRING_RIGHT
          
          lb a0, PLAYER_IS_GROUNDED
          bgt a0, zero, JUMP_PLAYER_RIGHT
          
          la a0, player_tile_left
          j FIM_RENDER_PLAYER
          
ASPIRING_RIGHT:
          la, a0, player_tile_inhaling_right
          j FIM_RENDER_PLAYER

JUMP_PLAYER_RIGHT:
         la a0, player_tile_right_jumping
         j FIM_RENDER_PLAYER              

PS_RANGER:
        lb a0, PLAYER_FACING
        li t1, PLAYER_FACING_LEFT
        beq a0, t1, SET_LEFT_R
        
        li t1, PLAYER_FACING_RIGHT
        beq a0, t1, SET_RIGHT_R

SET_LEFT_R:
        lb a0, PLAYER_IS_GROUNDED
        bgt a0, zero, JUMP_PLAYER_LEFT_R
        
        la a0, spider_kurby_left
        j FIM_RENDER_PLAYER
        
JUMP_PLAYER_LEFT_R:
       la a0, spider_kurby_jumping_left
       j FIM_RENDER_PLAYER

SET_RIGHT_R:
        lb a0, PLAYER_IS_GROUNDED
        bgt a0, zero, JUMP_PLAYER_RIGHT_R
        
        la a0, spider_kurby_right
        j FIM_RENDER_PLAYER
JUMP_PLAYER_RIGHT_R:
        la a0, spider_kurby_jumping_right
        j FIM_RENDER_PLAYER
            
PS_MELEE:
        lb a0, PLAYER_FACING
        li t1, PLAYER_FACING_LEFT
        beq a0, t1, SET_LEFT_M
        
        li t1, PLAYER_FACING_RIGHT
        beq a0, t1, SET_RIGHT_M

SET_LEFT_M:
        lb a0, PLAYER_IS_GROUNDED
        bgt a0, zero, JUMP_PLAYER_LEFT_M
        
        la a0, spider_fly_left
        j FIM_RENDER_PLAYER
JUMP_PLAYER_LEFT_M:
        la a0, fly_kurby_jumping_left
        j FIM_RENDER_PLAYER
SET_RIGHT_M:
        lb a0, PLAYER_IS_GROUNDED
        bgt a0, zero, JUMP_PLAYER_RIGHT_M
        
        la a0, spider_fly_right
        j FIM_RENDER_PLAYER

JUMP_PLAYER_RIGHT_M:
        la a0, fly_kurby_jumping_right
        j FIM_RENDER_PLAYER
FIM_RENDER_PLAYER:          ret
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
