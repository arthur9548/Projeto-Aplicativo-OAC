#arquivo principal do jogo
.include "util/util.s"
.include "data/data.s"
.include "../MACROSv24.s"
.text

MAIN:	#roda o jogo completo
	call GAME_CONTROL #controle da máquina de estados
	call GAME_LOGIC #processamento da lógica do jogo
	call GAME_RENDER #renderização dinâmica do jogo
	call GAME_AUDIO #música e efeitos sonoros do jogo
	j MAIN

.include "logic/logic.s"
.include "audio/audio.s"
.include "video/video.s"
.include "control/control.s"
.include "../SYSTEMv24.s"
