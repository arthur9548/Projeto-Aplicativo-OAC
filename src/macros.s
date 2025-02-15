.macro memo(%reg) #salvar um registrador na pilha
	addi sp, sp, -4
	sw %reg, 0(sp)
.end_macro

.macro unmemo(%reg) #recuperar o último valor inserido na pilha
	lw %reg, 0(sp)
	addi sp, sp, 4
.end_macro

.macro exit() #sai do programa
	li a7, 10
	ecall
.end_macro

.macro GET_BUFFER_TO_DRAW(%reg) #obter buffer para desenhar na tela
	memo s11
	la %reg, FRAME_TO_DRAW
	lb %reg, 0(%reg)
	slli %reg, %reg, 20
	li s11, BUFFER_ADDRESS
	add %reg, s11, %reg
	unmemo s11
.end_macro