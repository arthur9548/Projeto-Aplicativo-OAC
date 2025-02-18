# arquivo que reúne todos os dados do jogo
# antes de rodar na plaquinha entender como funciona o alinhamento, ou só usar words
.data

.include "../../sprites/sprites.s"
.include "map_info.s"
.include "player_data.s"
.include "map_data.s"
.include "dialog_data.s"
.include "audio_data.s"

#Dados do jogo:
GAME_STATE: .byte GAME_STATE_INIT
NEXT_GAME_STATE: .byte GAME_STATE_INIT
CUR_MAP_INDEX: .byte 0

#Dados de display:
FRAME_TO_DRAW: .byte 0 #0 ou 1

#Dados de áudio:
CONFIG_MUSIC: .word 0 #música para tocar durante configuração

#Dados úteis:
ENDL: .string "\n"

#Dados da partida:
TIME: .byte 0
SCORE: .byte 0
