# teste da renderização visual

.include "../src/data.s"
.include "../src/consts.s"
.include "../src/macros.s"

.text

MAIN:
call INIT_FRAMES
GET_BUFFER_TO_DRAW(a0)
li t0, -1
sw t0, 0(a0)
call SWAP_FRAMES
exit_loop

.include "../src/video.s"