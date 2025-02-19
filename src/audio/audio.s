# arquivo de áudio do jogo

# faltando:
# - tocar música da respectiva fase
# - reproduzir efeitos sonoros que tenham acontecido

GAME_AUDIO:
	memo(ra) #chamada de outras funções
	
	#primeiro ve qual é o estado atual do jogo pra saber o que tocar
	la t0, GAME_STATE
	lb t0, 0(t0)
	
	li t1, GAME_STATE_INIT #se está no início do jogo
	beq t0, t1, GAME_AUDIO_INIT
	
	li t1, GAME_STATE_ACTION #se está no meio de uma fase
	beq t0, t1, GAME_AUDIO_ACTION
	
	li t1, GAME_STATE_OVER #se chegou ao fim do jogo
	beq t0, t1, GAME_AUDIO_OVER
	
	li t1, GAME_STATE_CONFIG #se a fase deve ser reiniciada
	beq t0, t1, GAME_AUDIO_CONFIG
	
RET_GAME_AUDIO:
	unmemo(ra)
	ret
	
GAME_AUDIO_INIT:
	la t0, START_SONG
	la t1, CONFIG_MUSIC
	sw t0, 0(t1) #música a ser tocada durante a configuração é a de início
	j RET_GAME_AUDIO
	
GAME_AUDIO_ACTION:
	#carrega música da fase e toca
	la a0, FASE_SONG
	call PLAY_AUDIO
	#descobre se algum som aconteceu e toca
	la t0, PLAYER_ALIVE #ver se o jogador tá vivo
	lb t0, 0(t0)
	bnez t0, alive_gaa #não faz nada se estiver vivo
	la t0, DIE_SONG
	la t1, CONFIG_MUSIC
	sw t0, 0(t1) #música a ser tocada durante a configuração é a de morte
	j ret_gaa #retorna
alive_gaa:
	la t1, CONFIG_MUSIC
	sw zero, 0(t1) #não deve tocar música na configuração
ret_gaa:
	j RET_GAME_AUDIO
	
GAME_AUDIO_OVER:
	la a0, WIN_SONG
	call PLAY_AUDIO #toca a música de vitória
	j RET_GAME_AUDIO
	
GAME_AUDIO_CONFIG:
	la t0, CONFIG_MUSIC
	lw a0, 0(t0) #música a ser tocada
	beqz a0, ret_gac #não faz nada se não for tocar música
	memo(ra)
	call PLAY_WHOLE_SONG #toca a música durante configuração
	unmemo(ra)
ret_gac:
	j RET_GAME_AUDIO

#toca a próxima nota de uma música (ou reinicia)
#musica em a0, da forma: instrumento, volume, musica do MageEmbler
PLAY_AUDIO:
	memo(ra)
	lw a1, 0(a0) #instrumento
	lw a2, 4(a0) #volume
	addi a0, a0, 8 #passa para o início das informações da música
	call playAudio #chama o audio_player para tocar a nota atual
	unmemo(ra)
	ret

#toca a música em a0 até o final
PLAY_WHOLE_SONG:
	memo(ra)
	memo(s0)
	mv s0, a0 #s0 irá guardar o endereço da música
loop_play_whole_song:
	call PLAY_AUDIO
	mv a0, s0
	lw t0, 12(a0) #lê a posição na música
	beqz t0, end_play_whole_song #se voltou para o início termina
	j loop_play_whole_song
end_play_whole_song:
	unmemo(s0)
	unmemo(ra)
	ret 
	
#toca o som em a0, caracterizado por:
#nota, duração, instrumento e volume
PLAY_SOUND:
	memo(ra)
	lw a1, 4(a0) #duração
	lw a2, 8(a0) #instrumento
	lw a3, 12(a0) #volume
	call MIDI_OUT #chama o audio_player
	unmemo(ra)
	ret
	
	
.include "audio_player.s"
