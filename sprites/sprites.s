# arquivo que junta todos os sprites
.include "test_sprites.s"

### Fixos:
closed_door_tile: .byte 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,3,3,3,3,3,0,0,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,0,0,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,


open_door_tile: .byte 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,0,0,0,0,0,0,0,0,0,0,0,0,10,10,
10,10,0,0,0,0,0,0,0,0,0,0,0,0,10,10,
10,10,0,0,0,0,0,0,0,0,0,0,0,0,10,10,
10,10,0,0,0,0,0,0,0,0,0,0,0,0,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,3,3,3,3,3,3,3,3,3,3,3,3,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,

water_tile: .byte 243,163,161,162,234,234,161,162,161,234,234,234,234,162,162,162,
243,243,161,161,234,234,162,170,161,162,234,234,234,234,162,162,
161,162,161,161,234,234,162,162,162,161,234,234,234,234,162,162,
162,162,162,170,234,171,234,234,234,161,161,234,234,162,162,162,
162,234,234,234,234,170,161,234,234,162,162,161,161,162,234,162,
162,162,234,171,243,162,162,234,234,234,162,162,161,234,234,234,
162,162,235,243,170,162,162,234,234,234,234,162,161,234,234,234,
162,162,243,234,171,170,162,162,234,171,162,162,162,234,234,234,
162,243,243,234,234,162,162,162,162,162,162,162,161,234,234,234,
235,234,243,162,234,234,162,162,162,162,162,162,162,243,234,234,
243,234,235,161,234,234,234,162,162,162,170,234,162,162,243,171,
243,234,234,161,162,235,161,161,161,161,234,234,234,161,162,243,
243,234,234,161,161,235,161,161,234,161,161,234,234,161,162,162,
243,234,234,161,162,161,161,234,235,161,161,234,234,161,162,162,
243,234,234,243,162,162,161,161,161,235,162,234,234,161,162,243,
235,171,234,162,162,243,243,161,161,161,243,161,161,161,161,170,

### Fase 0:
brick_tile: .byte 10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,10,10,10,10,12,12,12,10,10,10,10,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,10,10,10,10,12,12,12,10,10,10,10,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,10,10,10,10,12,12,12,10,10,10,10,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,10,10,10,10,12,12,12,10,10,10,10,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,10,10,10,10,12,12,12,10,10,10,10,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,
10,10,10,10,10,12,12,12,10,10,10,10,10,12,12,12,
10,12,12,12,10,12,12,12,10,12,12,12,10,12,12,12,

metal_tile:.byte 91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,164,164,164,164,164,164,164,164,164,164,164,164,164,164,91,
91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,


### Fase 1:

oak_tile: .word
.byte  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
3,0,37,37,37,37,37,3,3,146,146,146,146,146,146,3,
3,0,37,37,37,37,37,3,3,146,146,146,146,146,146,3,
3,146,146,146,146,146,146,3,3,0,97,97,97,97,97,3,
3,146,146,146,146,146,146,3,3,0,97,97,97,97,97,3,
3,0,148,148,148,148,148,3,3,0,97,97,97,97,97,3,
3,0,148,148,148,148,148,3,3,14,14,14,14,14,14,3,
3,0,148,148,148,148,148,3,3,14,14,14,14,14,14,3,
3,12,12,12,12,12,12,3,3,3,3,3,3,3,3,3,
3,12,12,12,12,12,12,3,3,0,0,148,148,148,148,3,
3,29,29,29,29,29,29,3,3,0,0,148,148,148,148,3,
3,29,29,29,29,29,29,3,3,0,91,91,91,91,91,3,
3,29,29,29,29,29,29,3,3,0,91,91,91,91,91,3,
3,0,97,97,97,97,97,3,3,12,12,12,12,12,12,3,
3,0,97,97,97,97,97,3,3,12,12,12,12,12,12,3,
3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,


box_tile: .byte 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,
10,21,10,20,20,21,21,21,21,20,20,20,20,10,21,10,
10,21,10,10,20,21,21,21,20,20,20,20,20,10,20,10,
10,20,10,20,10,10,10,10,10,10,10,10,10,10,21,10,
10,21,10,10,20,10,20,20,20,20,20,20,20,10,21,10,
10,21,10,20,10,20,10,20,20,20,20,20,20,10,20,10,
10,21,10,10,10,10,20,10,10,10,10,10,10,10,20,10,
10,20,10,20,20,20,10,20,10,20,20,20,20,10,20,10,
10,20,10,20,20,20,20,10,20,10,20,20,20,10,20,10,
10,20,10,10,10,10,10,10,10,20,10,10,10,10,20,10,
10,20,10,20,20,21,21,20,20,10,20,10,20,10,20,10,
10,20,10,20,21,21,21,20,20,20,10,20,10,10,20,10,
10,20,10,10,10,10,10,10,10,10,10,10,20,10,21,10,
10,20,10,20,20,21,20,21,21,20,20,20,10,10,21,10,
10,20,10,20,21,21,21,20,21,20,20,20,20,10,20,10,
10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,

# Fase 2:

wood_tile: .byte 93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
93,93,93,93,93,4,93,93,93,93,93,93,93,93,93,93,
4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,
93,93,93,93,93,93,93,93,93,93,93,93,93,4,93,93,

round_tile: .byte 93,93,173,173,173,173,173,173,173,173,173,173,173,173,93,93,
93,173,183,183,173,173,183,183,183,183,183,183,173,183,173,93,
173,183,183,173,173,183,183,183,183,183,183,173,173,183,183,173,
173,183,173,173,183,183,183,183,173,173,173,173,183,183,183,173,
173,183,173,183,183,183,183,183,173,183,183,183,183,183,183,173,
173,173,173,183,183,183,183,173,183,183,183,183,183,183,183,173,
173,183,183,183,183,183,173,173,183,183,183,183,183,183,183,173,
173,183,183,183,183,173,173,183,183,183,183,183,183,183,183,173,
173,183,183,183,183,173,183,183,183,183,173,173,173,173,183,173,
173,173,173,173,173,173,183,183,183,173,173,183,183,173,173,173,
173,183,183,183,183,183,183,183,173,173,183,183,183,183,183,173,
173,183,183,183,183,183,183,173,173,183,183,183,183,183,183,173,
173,183,183,183,183,173,173,173,183,183,183,183,183,173,173,173,
173,173,173,173,173,173,183,183,183,183,183,173,173,173,183,173,
93,173,183,183,183,183,183,183,183,183,173,173,183,183,173,93,
93,93,173,173,173,173,173,173,173,173,173,173,173,173,93,93,

#Imagens:

mouse_projetil: .byte 199,199,199,199,199,199,199,47,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,47,47,47,199,199,199,199,199,199,199,
199,199,199,199,199,199,7,7,7,199,199,199,199,199,199,199,
199,199,199,199,199,199,7,7,7,199,199,199,199,199,199,199,
199,199,199,199,199,199,7,7,7,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,


mouse_final_boss: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,9,9,167,199,199,199,199,199,199,199,199,
199,46,199,9,9,91,91,9,199,199,166,9,9,9,9,166,
199,199,46,91,57,91,91,9,9,9,91,91,91,91,91,9,
199,55,55,91,91,91,91,9,91,91,166,91,91,91,91,9,
199,199,55,91,57,91,91,91,91,91,91,91,91,91,91,166,
199,119,119,91,91,91,91,91,91,91,91,91,91,91,91,166,
199,199,199,9,91,91,5,91,91,91,91,91,91,91,91,9,
199,199,9,167,9,9,5,91,91,91,91,91,91,91,91,9,
199,199,9,9,199,199,5,9,91,91,91,91,91,91,91,9,
199,199,199,199,199,199,5,5,9,9,9,9,9,9,9,167,
199,199,199,199,199,199,199,5,5,5,5,5,5,5,5,167,
199,199,199,199,199,199,199,199,5,5,5,5,5,5,5,167,
199,199,199,199,199,199,199,199,199,199,199,199,199,5,5,94,


spider_kurby_jumping_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,91,82,82,9,9,199,199,
0,0,0,0,255,11,0,0,82,9,91,9,9,9,199,199,
0,0,0,0,11,11,0,0,82,91,9,91,91,0,199,199,
0,0,0,0,83,82,0,0,91,74,91,9,91,0,199,199,
0,0,0,0,82,82,91,91,9,82,82,82,9,0,199,199,
0,0,0,0,255,11,9,91,9,9,82,9,91,0,199,199,
0,0,0,0,11,11,82,9,82,91,9,91,9,9,199,199,
199,0,0,0,0,0,0,0,0,0,91,91,9,9,199,199,
199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,


spider_kurby_jumping_right:  .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,0,91,91,9,9,199,199,
0,0,0,0,11,11,82,9,82,91,9,91,9,9,199,199,
0,0,0,0,255,11,9,91,9,9,82,9,91,0,199,199,
0,0,0,0,82,82,91,91,9,82,82,82,9,0,199,199,
0,0,0,0,83,82,0,0,91,74,91,9,91,0,199,199,
0,0,0,0,11,11,0,0,82,91,9,91,91,0,199,199,
0,0,0,0,255,11,0,0,82,9,91,9,9,9,199,199,
199,0,0,0,0,0,0,0,0,91,82,82,9,9,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,


spider_kurby_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,91,82,82,9,9,
199,199,0,0,0,0,255,11,0,0,82,9,91,9,9,9,
199,199,0,0,0,0,11,11,0,0,82,91,9,91,91,0,
199,199,0,0,0,0,83,82,0,0,91,74,91,9,91,0,
199,199,0,0,0,0,82,82,91,91,9,82,82,82,9,0,
199,199,0,0,0,0,255,11,9,91,9,9,82,9,91,0,
199,199,0,0,0,0,11,11,82,9,82,91,9,91,9,9,
199,199,199,0,0,0,0,0,0,0,0,0,91,91,9,9,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


spider_kurby_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,0,91,91,9,9,
199,199,0,0,0,0,11,11,82,9,82,91,9,91,9,9,
199,199,0,0,0,0,255,11,9,91,9,9,82,9,91,0,
199,199,0,0,0,0,82,82,91,91,9,82,82,82,9,0,
199,199,0,0,0,0,83,82,0,0,91,74,91,9,91,0,
199,199,0,0,0,0,11,11,0,0,82,91,9,91,91,0,
199,199,0,0,0,0,255,11,0,0,82,9,91,9,9,9,
199,199,199,0,0,0,0,0,0,0,0,91,82,82,9,9,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,


spider_kurby_inhaling_left: .byte 199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,91,82,82,9,9,
199,199,0,0,0,0,255,11,0,0,82,9,91,9,9,9,
199,199,0,0,0,0,11,11,0,0,82,91,9,91,91,0,
199,199,0,0,0,0,83,82,0,0,91,74,91,9,91,0,
199,199,0,0,0,0,82,82,91,91,9,82,82,82,9,0,
199,199,0,0,0,0,255,11,9,91,9,9,82,9,91,0,
199,199,0,0,0,0,11,11,82,9,82,91,9,91,9,9,
199,199,199,0,0,0,0,0,0,0,0,0,91,91,9,9,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,

spider_kurby_inhaling_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,0,91,91,9,9,
199,199,0,0,0,0,11,11,82,9,82,91,9,91,9,9,
199,199,0,0,0,0,255,11,9,91,9,9,82,9,91,0,
199,199,0,0,0,0,82,82,91,91,9,82,82,82,9,0,
199,199,0,0,0,0,83,82,0,0,91,74,91,9,91,0,
199,199,0,0,0,0,11,11,0,0,82,91,9,91,91,0,
199,199,0,0,0,0,255,11,0,0,82,9,91,9,9,9,
199,199,199,0,0,0,0,0,0,0,0,91,82,82,9,9,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,
    

spider_tile_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,9,9,
199,199,199,199,199,199,199,199,9,199,9,199,9,9,9,199,
199,199,199,199,199,199,91,91,91,83,91,82,82,9,199,199,
199,199,199,199,199,199,91,11,255,11,83,91,82,199,199,9,
199,199,199,199,199,199,91,11,11,11,83,91,82,9,9,9,
199,199,199,199,199,199,91,91,91,91,91,91,9,9,199,199,
199,199,199,199,199,199,91,91,91,91,91,91,82,199,9,9,
199,199,199,199,199,199,199,91,82,82,91,82,82,9,199,199,
199,199,199,199,199,199,199,91,82,82,91,82,82,9,199,199,
199,199,199,199,91,91,91,91,91,91,91,91,82,199,9,9,
199,199,199,199,91,91,91,91,82,91,91,82,9,9,199,199,
199,199,199,91,91,91,82,82,82,82,91,91,82,9,9,9,
199,199,91,91,82,82,82,82,82,82,82,82,82,199,199,9,
199,199,91,82,82,82,82,82,82,82,73,9,9,9,199,199,
199,199,91,82,82,82,82,73,73,73,73,199,9,9,9,199,
199,199,73,82,74,73,73,73,73,199,199,199,199,199,9,9,


spider_tile_right: .byte 199,199,73,82,74,73,73,73,73,199,199,199,199,199,9,9,
199,199,91,82,82,82,82,73,73,73,73,199,9,9,9,199,
199,199,91,82,82,82,82,82,82,82,73,9,9,9,199,199,
199,199,91,91,82,82,82,82,82,82,82,82,82,199,199,9,
199,199,199,91,91,91,82,82,82,82,91,91,82,9,9,9,
199,199,199,199,91,91,91,91,82,91,91,82,9,9,199,199,
199,199,199,199,91,91,91,91,91,91,91,91,82,199,9,9,
199,199,199,199,199,199,199,91,82,82,91,82,82,9,199,199,
199,199,199,199,199,199,199,91,82,82,91,82,82,9,199,199,
199,199,199,199,199,199,91,91,91,91,91,91,82,199,9,9,
199,199,199,199,199,199,91,91,91,91,91,91,9,9,199,199,
199,199,199,199,199,199,91,11,11,11,83,91,82,9,9,9,
199,199,199,199,199,199,91,11,255,11,83,91,82,199,199,9,
199,199,199,199,199,199,91,91,91,83,91,82,82,9,199,199,
199,199,199,199,199,199,199,199,9,199,9,199,9,9,9,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,9,9,



spider_web_tile_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,255,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,255,255,199,199,255,199,199,199,199,199,
199,199,199,255,255,199,255,255,255,199,199,255,199,199,199,199,
199,255,199,255,199,255,199,255,199,255,199,255,199,255,199,199,
199,255,255,255,199,199,255,255,199,199,199,255,255,255,255,255,
255,199,255,199,255,255,199,255,199,255,255,199,255,199,255,199,
199,255,199,199,255,199,199,255,255,255,199,255,199,255,199,255,
199,255,255,199,199,255,199,255,199,255,199,199,255,255,199,255,
199,255,199,255,199,255,199,255,255,255,199,255,255,199,255,199,
199,199,255,199,255,199,255,255,255,199,255,199,199,255,255,199,
199,199,255,255,255,199,199,255,199,199,255,199,255,255,199,199,
199,199,199,255,255,255,199,255,199,255,255,255,255,199,199,199,
199,199,199,199,255,255,255,255,255,255,255,255,199,199,199,199,
199,199,199,199,199,199,255,255,255,255,199,199,199,199,199,199,


spider_web_tile_right: .byte 199,199,199,199,199,199,255,255,255,255,199,199,199,199,199,199,
199,199,199,199,255,255,255,255,255,255,255,255,199,199,199,199,
199,199,199,255,255,255,255,199,255,199,255,255,255,199,199,199,
199,199,255,255,199,255,199,199,255,199,199,255,255,255,199,199,
199,255,255,199,199,255,199,255,255,255,199,255,199,255,199,199,
199,255,199,255,255,199,255,255,255,199,255,199,255,199,255,199,
255,199,255,255,199,199,255,199,255,199,255,199,199,255,255,199,
255,199,255,199,255,199,255,255,255,199,199,255,199,199,255,199,
199,255,199,255,199,255,255,199,255,199,255,255,199,255,199,255,
255,255,255,255,255,199,199,199,255,255,199,199,255,255,255,199,
199,199,255,199,255,199,255,199,255,199,255,199,255,199,255,199,
199,199,199,199,255,199,199,255,255,255,199,255,255,199,199,199,
199,199,199,199,199,255,199,199,255,255,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,255,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,


fly_tile_left: .byte 199,199,199,199,199,199,0,199,199,199,0,199,199,199,199,199,
199,199,199,199,199,199,0,0,0,0,0,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,199,199,199,199,199,199,199,
199,0,199,199,65,65,65,65,0,0,199,199,199,199,199,199,
199,199,0,199,65,14,255,65,65,65,199,199,199,199,199,199,
0,199,199,0,65,14,14,65,65,65,199,199,199,199,199,199,
199,0,0,65,65,65,65,65,65,65,0,199,199,199,199,199,
199,199,82,24,24,24,24,8,8,8,0,0,199,199,199,199,
199,82,91,24,24,24,24,24,8,8,0,0,199,199,199,199,
199,91,91,24,24,24,24,8,8,8,199,0,199,199,199,199,
82,91,82,24,24,24,24,8,8,8,199,199,199,199,199,199,
82,91,199,24,24,24,8,8,8,8,199,199,199,199,199,199,
91,91,199,24,24,8,8,8,8,8,0,199,199,199,199,199,
91,82,199,24,24,8,8,8,8,8,0,0,199,199,199,199,
82,199,199,24,24,8,8,8,8,8,0,0,199,199,199,199,
199,199,199,199,199,8,8,199,199,199,199,0,199,199,199,199,

fly_tile_right: .byte 199,199,199,199,199,199,8,8,199,199,199,199,0,199,199,199,
164,82,199,199,24,24,8,8,8,8,8,0,0,199,199,199,
164,91,82,199,24,24,8,8,8,8,8,0,0,199,199,199,
91,91,91,199,24,24,8,8,8,8,8,0,199,199,199,199,
199,82,91,199,24,24,24,8,8,8,8,199,199,199,199,199,
199,82,91,82,24,24,24,24,8,8,8,199,199,199,199,199,
199,199,91,91,24,24,24,24,8,8,8,199,0,199,199,199,
199,199,82,91,24,24,24,24,24,8,8,0,0,199,199,199,
199,199,199,82,24,24,24,24,8,8,8,0,0,199,199,199,
199,199,0,0,65,65,65,65,65,65,65,0,199,199,199,199,
199,0,199,199,0,65,14,14,65,65,65,199,199,199,199,199,
199,199,199,0,199,65,14,255,65,65,65,199,199,199,199,199,
199,199,0,199,199,65,65,65,65,0,0,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,0,0,0,0,0,199,199,199,199,
199,199,199,199,199,199,199,0,199,199,199,0,199,199,199,199,

fly_kirby_jumping_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,0,246,246,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,255,246,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,255,255,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,8,8,8,82,82,199,199,
0,0,0,0,7,255,0,0,24,8,8,8,82,82,199,199,
0,0,0,0,255,255,0,0,24,24,8,8,8,0,199,199,
0,0,0,0,65,65,0,0,24,24,8,8,8,0,199,199,
0,0,0,0,65,65,65,24,24,24,8,8,8,0,199,199,
0,0,0,0,7,255,65,24,24,24,8,8,8,0,199,199,
0,0,0,0,255,255,65,24,24,24,24,8,82,82,199,199,
199,0,0,0,0,0,0,0,0,24,24,8,82,82,199,199,
199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,

fly_kirby_jumping_right: .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,24,24,8,82,82,199,199,
0,0,0,0,255,255,65,24,24,24,24,8,82,82,199,199,
0,0,0,0,7,255,65,24,24,24,8,8,8,0,199,199,
0,0,0,0,65,65,65,24,24,24,8,8,8,0,199,199,
0,0,0,0,65,65,0,0,24,24,8,8,8,0,199,199,
0,0,0,0,255,255,0,0,24,24,8,8,8,0,199,199,
0,0,0,0,7,255,0,0,24,8,8,8,82,82,199,199,
199,0,0,0,0,0,0,0,0,8,8,8,82,82,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,255,255,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,255,246,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,246,246,


fly_kirby_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,8,8,8,82,82,
199,199,0,0,0,0,7,255,0,0,24,8,8,8,82,82,
199,199,0,0,0,0,255,255,0,0,24,24,8,8,8,0,
0,199,0,0,0,0,65,65,0,0,24,24,8,8,8,0,
199,0,0,0,0,0,65,65,65,24,24,24,8,8,8,0,
0,199,0,0,0,0,7,255,65,24,24,24,8,8,8,0,
199,199,0,0,0,0,255,255,65,24,24,24,24,8,82,82,
199,199,199,0,0,0,0,0,0,0,0,24,24,8,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


fly_kirby_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,24,24,8,82,82,
199,199,0,0,0,0,255,255,65,24,24,24,24,8,82,82,
0,199,0,0,0,0,7,255,65,24,24,24,8,8,8,0,
199,0,0,0,0,0,65,65,65,24,24,24,8,8,8,0,
0,199,0,0,0,0,65,65,0,0,24,24,8,8,8,0,
199,199,0,0,0,0,255,255,0,0,24,24,8,8,8,0,
199,199,0,0,0,0,7,255,0,0,24,8,8,8,82,82,
199,199,199,0,0,0,0,0,0,0,0,8,8,8,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,



fly_kirby_inhaling_left: .byte 199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,8,8,8,82,82,
199,199,0,0,0,0,7,255,0,0,24,8,8,8,82,82,
199,199,0,0,0,0,255,255,0,0,24,24,8,8,8,0,
0,199,0,0,0,0,65,65,0,0,24,24,8,8,8,0,
199,0,0,0,0,0,65,65,65,24,24,24,8,8,8,0,
0,199,0,0,0,0,7,255,65,24,24,24,8,8,8,0,
199,199,0,0,0,0,255,255,65,24,24,24,24,8,82,82,
199,199,199,0,0,0,0,0,0,0,0,24,24,8,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


fly_kirby_inhaling_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,24,24,8,82,82,
199,199,0,0,0,0,255,255,65,24,24,24,24,8,82,82,
0,199,0,0,0,0,7,255,65,24,24,24,8,8,8,0,
199,0,0,0,0,0,65,65,65,24,24,24,8,8,8,0,
0,199,0,0,0,0,65,65,0,0,24,24,8,8,8,0,
199,199,0,0,0,0,255,255,0,0,24,24,8,8,8,0,
199,199,0,0,0,0,7,255,0,0,24,8,8,8,82,82,
199,199,199,0,0,0,0,0,0,0,0,8,8,8,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,



player_tile_inhaling_left: .byte 199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


player_tile_inhaling_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,


player_tile_left_jumping: .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
0,0,0,0,255,255,167,167,167,167,167,167,82,82,199,199,
0,0,0,0,144,255,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,255,255,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,144,255,0,0,167,167,167,167,82,82,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,

player_tile_right_jumping: .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
0,0,0,0,255,255,167,167,167,167,167,167,82,82,199,199,
0,0,0,0,144,255,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,255,255,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,144,255,0,0,167,167,167,167,82,82,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,



player_tile_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,


player_tile_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


player_tile_old: .byte 199,199,199,199,199,199,199,199,199,75,75,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,75,75,75,75,78,78,
199,199,199,199,199,199,199,199,199,159,159,75,75,75,78,78,
199,199,199,199,199,199,199,199,159,159,159,159,75,75,199,199,
199,199,199,199,199,199,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,199,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,75,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,199,75,159,159,145,159,159,159,75,199,199,
199,199,199,199,199,199,199,199,159,159,159,159,75,75,78,78,
199,199,199,199,199,199,199,199,199,159,159,75,75,75,78,78,
199,199,199,199,199,199,199,199,199,199,75,75,75,75,199,199,
199,199,199,199,199,75,75,75,75,75,75,75,199,199,199,199,
199,199,199,199,199,75,199,199,199,199,199,199,199,199,75,75,
199,199,199,199,199,75,75,75,75,75,75,75,75,75,75,75,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,75,75,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,75,75,

