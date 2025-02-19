# funções úteis de cálculo

#distância manhattan entre dois pontos
#recebe a1, a2, a3, a4 (x1, y1, x2, y2) e retorna no a0

ABS: #abs de a0
	bgez a0, ret_ABS
	li t0, -1
	mul a0, a0, t0 #se < 0 multiplica por -1
ret_ABS:
	ret

POINT_DIST:
	memo(ra)
	sub a0, a2, a4 #|y1-y2|
	call ABS
	mv a4, a0
	sub a0, a1, a3 #|x1-x2|
	call ABS
	add a0, a0, a4
	unmemo(ra)
	ret

#retorna random de 0 a valor de a0
RAND_INT:
   csrr t0, time 
   remu a0, t0, a0
   ret