# teste da renderização visual

.include "../src/data/data.s"
.include "../src/util/util.s"

.text

MAIN:
call INIT_FRAMES
li a0, 0x0ff
GET_BUFFER_TO_DRAW(a7)
call FILL_SCREEN
li a0, enderman_transparent
li a1, -6
li a2, 236
li a3, 12
li a4, 12
call DRAW_IMAGE
li a0, enderman_transparent
li a1, 316
li a2, 236
li a3, 12
li a4, 12
call DRAW_IMAGE
li a0, enderman_transparent
li a1, 316
li a2, -6
li a3, 12
li a4, 12
call DRAW_IMAGE
li a0, enderman_transparent
li a1, -6
li a2, -6
li a3, 12
li a4, 12
call DRAW_IMAGE
call SWAP_FRAMES
exit_loop

.include "../src/video/video.s"
