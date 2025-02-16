#uso de registradores
.macro memo(%reg) #salvar um registrador na pilha
	addi sp, sp, -4
	sw %reg, 0(sp)
.end_macro

.macro unmemo(%reg) #recuperar o último valor inserido na pilha
	lw %reg, 0(sp)
	addi sp, sp, 4
.end_macro

#sistema
.macro exit_system() #sai do programa e volta para o SO
	li a7, 10
	ecall
.end_macro

.macro exit_loop() #entra em um loop infinito
	EXIT_LOOP: j EXIT_LOOP
.end_macro

.macro sleep(%t) #para a execução pelo tempo em ms
	memo(a0)
	memo(a7)
	li a0, %t
	li a7, 32
	ecall
	unmemo(a7)
	unmemo(a0)
.end_macro

#debug
.macro flush_output() #imprime quebra de linha
	memo(a0)
	memo(a7)
	li a7, 4
	la a0, ENDL
	ecall
	unmemo(a7)
	unmemo(a0)
.end_macro

.macro print_int(%reg) #debuga um registrador como inteiro na tela
	memo(a0)
	memo(a7)
	mv a0, %reg
	li a7, 1
	ecall
	unmemo(a7)
	unmemo(a0)
	flush_output
.end_macro

#video
.macro GET_BUFFER_TO_DRAW(%reg) #obter buffer para desenhar na tela
	memo(s11)
	la %reg, FRAME_TO_DRAW
	lb %reg, 0(%reg)
	slli %reg, %reg, 20
	li s11, BUFFER_ADDRESS
	add %reg, s11, %reg
	unmemo(s11)
.end_macro
