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



