# arquivo que reúne todos os dados do jogo
# antes de rodar na plaquinha entender como funciona o alinhamento, ou só usar words
.data

.include "../../sprites/sprites.s"
.include "map.s"
#<<<<<<< HEAD
.include "player_data.s"
#=======
.include "map_data.s"
.include "player_data.s"

#Dados do jogo:
GAME_STATE: .byte 0
ENEMIES_ADDRESS: .word 0
SHOTS_ADDRESS: .word 0
MAP_ADDRESS: .word 0
#>>>>>>> 63573d8cc732443e4287dca5ec22c90a5f6d1501

#Dados de display:
FRAME_TO_DRAW: .byte 0 #0 ou 1

#Dados úteis:
ENDL: .string "\n"
