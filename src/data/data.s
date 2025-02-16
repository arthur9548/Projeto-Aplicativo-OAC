# arquivo que reúne todos os dados do jogo
# antes de rodar na plaquinha entender como funciona o alinhamento, ou só usar words
.data

.include "../../sprites/sprites.s"
.include "fases.s"

#Dados de display:
FRAME_TO_DRAW: .byte 0 #0 ou 1

#Dados úteis
ENDL: .string "\n"
