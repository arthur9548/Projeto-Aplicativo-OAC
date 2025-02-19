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
   
#vê se um ponto (a1, a2) tá dentro do tile a3, a4
INSIDE_TILE:
	#print_int(a1)
	#print_int(a2)
	#print_int(a3)
	#print_int(a4)
	addi a5, a3, TILE_W
	addi a5, a5, -1
	addi a6, a4, TILE_H 
	addi a6, a6, -1
	
	sub t0, a1, a3
	bltz t0, not_inside_tile
	
	sub t0, a5, a1
	bltz t0, not_inside_tile
	
	sub t0, a2, a4
	bltz t0, not_inside_tile
	
	sub t0, a6, a2
	bltz t0, not_inside_tile
	
is_inside_tile:
	li a0, 1
	ret
not_inside_tile:
	li a0, 0
	ret
	

#retorna 1 se intersectam e 0 se não
#tiles 16 por 16
#posições a1, a2, a3 e a4
TILE_INTERSECT:
	memo(ra)
	call INSIDE_TILE
	bnez a0, has_intersection
	addi a1, a1, TILE_W
	addi a1, a1, -1
	call INSIDE_TILE
	bnez a0, has_intersection
	addi a2, a2, TILE_H
	addi a2, a2, -1
	call INSIDE_TILE
	bnez a0, has_intersection
	li a2, TILE_W
	sub a1, a1, s2
	addi a1, a1, 1
	call INSIDE_TILE
	bnez a0, has_intersection
ret_tile_intersect:
	unmemo(ra)
	ret
no_intersection:
	li a0, 0
	j ret_tile_intersect
has_intersection:
	li a0, 1
	j ret_tile_intersect