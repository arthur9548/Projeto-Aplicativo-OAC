# teste da renderização visual

.include "../src/data.s"

.text

.include "../src/macros.s"
.include "../src/consts.s"

MAIN:
li a0, 0
add a0, a0, a0
exit

INIT_VIDEO: #inicializa frames
li t0, CURRENT_DISPLAY_FRAME_ADDRESS
sw zero, 0(t0) #frame exibido é o 0
la t0, FRAME_TO_DRAW 
li t1, 1 
sb t1, 0(t0) #frame a ser desenhado é o 0
ret

SWAP_FRAMES: #troca frame desenhado e visto
li t0, CURRENT_DISPLAY_FRAME_ADDRESS
lw t1, 0(t0)
xori t2, t1, 1
sw t2, 0(t0)
la t0, FRAME_TO_DRAW
sb t1, 0(t0)
ret