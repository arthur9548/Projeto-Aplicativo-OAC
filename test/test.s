# teste simples

.macro memo(%reg) #salvar um registrador na pilha
	addi sp, sp, -4
	sw %reg, 0(sp)
.end_macro

memo(t0)
addi sp, sp, -4
sw t0, 0(sp)
li a7, 10
ecall

