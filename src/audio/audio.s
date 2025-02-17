# arquivo de áudio do jogo

GAME_AUDIO:
	#primeiro ve qual é o estado atual do jogo pra saber o que tocar
	
	#se for jogo normal, tudo isso vai ser uma função:
	
	#descobre a musica do jogo
	call playAudio #toca a musica
	
	#descobre de algum jeito se aconteceu alguma coisa
	#acha as informações do respectivo efeito sonoro
	call MIDI_OUT
	
	ret
	
.include "audio_player.s"