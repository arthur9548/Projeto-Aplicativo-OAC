# arquivo que reúne todos os dados do jogo
# antes de rodar na plaquinha entender como funciona o alinhamento, ou só usar words
.data

.include "../../sprites/sprites.s"
.include "../../sprites/test_sprites.s"
.include "map_info.s"
.include "player_data.s"
.include "map_data.s"
.include "player_data.s"
.include "dialog_data.s"

#Dados do jogo:
GAME_STATE: .byte 0

#Dados de display:
FRAME_TO_DRAW: .byte 0 #0 ou 1

#Dados úteis:
ENDL: .string "\n"
