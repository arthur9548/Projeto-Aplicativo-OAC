# codigo para manipulação geral de vídeo

#faltando:
# - renderizar projéteis, inimigos e chefe
# - pra isso precisa arrumar também o sprites.s

GAME_RENDER:
	memo(ra)
	#primeiro descobre qual é o estado atual do jogo pra saber o que renderizar
	la t0, GAME_STATE
	lb t0, 0(t0) #t0 é o estado atual do jogo
	
	li t1, GAME_STATE_INIT #se está no início do jogo
	beq t0, t1, GAME_RENDER_INIT
	
	#se não for inicial, vamos desenhar algo
	GET_BUFFER_TO_DRAW(a7) #a7 é o frame para desenhar
	
	li t1, GAME_STATE_ACTION #se está no meio de uma fase
	beq t0, t1, GAME_RENDER_ACTION
	
	li t1, GAME_STATE_OVER #se chegou ao fim do jogo
	beq t0, t1, GAME_RENDER_OVER
	
	li t1, GAME_STATE_CONFIG #se a fase deve ser reiniciada
	beq t0, t1, GAME_RENDER_CONFIG
	
RET_GAME_RENDER:
	call SWAP_FRAMES
	unmemo(ra)
	ret

GAME_RENDER_INIT:
	call INIT_FRAMES
	call WRITE_START
	j RET_GAME_RENDER
	
GAME_RENDER_ACTION:
	#desenha as informações do menu
	call DRAW_MENU
	call WRITE_MENU
	
	call CALC_OFFSET #calcula offset do mapa atual
	
	memo(s0)
	la s0, MAP_OFFSET
	lh s0, 0(s0) #offset do mapa
	la a0, MAP_ADDRESS
	lw a0, 0(a0)
	mv a1, s0 #entende qual é o mapa e o offset
	call DRAW_MAP
	
	la a1, PLAYER_X
	lh a1, 0(a1)
	la a2, PLAYER_Y
	lh a2, 0(a2)
	sub a1, a1, s0 #aplicar offset para desenho
	call GET_PLAYER_SPRITE #retorna em a0 o sprite correto
	call DRAW_TILE
	
	la t0, ENEMIES_ADDRESS
	li t1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul t1, t1, t2
	add t1, t0, t1 #t1 guarda o fim do array de inimigos
loop_enemies_gra:
	beq t0, t1, end_enemies_gra
	lh a1, ENEMY_X(t0)
	sub a1, a1, s0 #offset
	lh a2, ENEMY_Y(t0)
	lb t2, ENEMY_ACTIVE(t0)
	lb a0, ENEMY_TYPE(t0)
	addi t0, t0, ENEMY_MEMORY_SIZE #já prepara o próximo inimigo
	beqz t2, loop_enemies_gra
	call GET_ENEMY_SPRITE #pega o sprite certo
	#call DRAW_TILE
	j loop_enemies_gra
end_enemies_gra:
	
	#agora deve loopar pelos projéteis fazendo a mesma coisa
	
	#por ultimo vê o boss
	
	unmemo(s0)
	j RET_GAME_RENDER
	
GAME_RENDER_OVER:
	li a0, 0
	li a1, 0
	call FILL_SCREEN_FROM
	call WRITE_END
	j RET_GAME_RENDER
	
GAME_RENDER_CONFIG:
	#mudar ?
	call SWAP_FRAMES #não muda o frame exibido
	j RET_GAME_RENDER

.include "frames.s"
.include "drawing.s"
.include "sprite_getter.s"
.include "writing.s"
.include "printer.s"
