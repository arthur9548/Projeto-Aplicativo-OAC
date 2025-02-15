# teste da renderização visual

.include "../src/data.s"
.include "../src/consts.s"
.include "../src/macros.s"

.text

MAIN:
call INIT_FRAMES
li a0, 0x0f7
call FILL_SCREEN
call SWAP_FRAMES
li a0, 0x00f
call FILL_SCREEN
call SWAP_FRAMES
exit_loop

.include "../src/video.s"