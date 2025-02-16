# teste da renderização visual

.include "../src/data/data.s"
.include "../src/util/util.s"

.text

MAIN:
call INIT_FRAMES
li a0, 0x0ff
GET_BUFFER_TO_DRAW(a7)
call FILL_SCREEN
li a0, mine_tile
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
li a0, mine_tile
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
GET_BUFFER_TO_DRAW(a7)
sleep(1000)
li a0, 0x0ff
li a1, 80
call FILL_SCREEN_FROM
call SWAP_FRAMES
exit_loop

FILL_SCREEN_FROM: #preenche a tela com a cor em a0, a partir da linha a1
	mv t0, a7 #t0 recebe a tela
	li t1, PIXELS_IN_ROW
	mul a1, a1, t1
	li t1, NUMBER_OF_SCREEN_PIXELS 
	sub t1, t1, a1
	add a0, a0, a1
	add t1, a7, t1 #fim da tela
loop_fill_screen_from:
		bge t0, t1, end_fill_screen_from
		sb a0, 0(t0)
		addi t0, t0, 1 #anda 1 byte na tela
		j loop_fill_screen_from
end_fill_screen_from:
	ret

.include "../src/video/video.s"
