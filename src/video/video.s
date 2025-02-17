# codigo para manipulação geral de vídeo

INIT:
	memo(ra)
	call INIT_FRAMES
	unmemo(ra)
	ret
GAME_RENDER:
	memo(ra)
	#primeiro descobre qual é o estado atual do jogo pra saber o que renderizar
	
	#se for jogo normal: (tudo isso vai ser uma função)
	GET_BUFFER_TO_DRAW(a7) #a7 é o frame para desenhar
	
	#desenha o menu (provavelmente vai virar uma função
	li a0, MENU_COLOR
	li a1, MENU_X
	call FILL_SCREEN_FROM
	#desenha as outras informações do menu
	
	#entende qual é o mapa e o offset
	call DRAW_MAP
	
	#itera pelos personagens, inimigos e projéteis
	#pra cada um, pega o endereço da imagem e desenha na posição X Y certa
	call DRAW_TILE #todo mundo é tile na teoria
	
	call SWAP_FRAMES
	unmemo(ra)
	ret
	

.include "frames.s"
.include "drawing.s"