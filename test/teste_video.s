# teste da renderização visual

.include "../src/data/data.s"
.include "../src/util/util.s"

.text

MAIN:
call INIT_FRAMES
li a0, 0x0ff
GET_BUFFER_TO_DRAW(a7)
li a1, 0
call FILL_SCREEN_FROM
li a0, water_tile
li a1, -8
li a2, 232
call DRAW_TILE
li a0, purple_tile
li a1, 300
li a2, 230
call DRAW_TILE
li a0, water_tile
li a1, 312
li a2, -8
call DRAW_TILE
li a0, purple_tile
li a1, 16
li a2, 16
call DRAW_TILE
call SWAP_FRAMES
exit_loop

TRY_MENU: #a1 = tamanho de teste, a7 = tela
	li a0, 0x0ff
	memo(a1)
	li a1, 0
	call FILL_SCREEN_FROM
	li a0, 0x03
	unmemo(a1)
	call FILL_SCREEN_FROM
	call SWAP_FRAMES

.include "../src/video/video.s"
