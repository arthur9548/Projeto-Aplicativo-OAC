# arquivo para IA dos inimigos

# calcula as decisões de todos os inimigos, conforme a posição do jogador
ENEMY_IA:
	memo(ra)
	memo(s0)
	memo(s1)
	la s0, ENEMIES_ADDRESS
	li s1, ENEMY_LIST_SIZE
	li t2, ENEMY_MEMORY_SIZE
	mul s1, s1, t2
	add s1, s0, s1
	# iterar lista de inimigos
loop_enemy_ia:
	beq s0, s1, end_enemy_ia
	lb t2, ENEMY_ACTIVE(s0) #ver se está ativo
	beqz t2, continue_enemy_ia
	mv a0, s0
	call ENEMY_DECISION #se está, decide o que vai fazer
continue_enemy_ia:
	addi s0, s0, ENEMY_MEMORY_SIZE
	j loop_enemy_ia
end_enemy_ia:
	unmemo(s1)
	unmemo(s0)
	unmemo(ra)
	ret
	
#recebe um inimigo em a0 e decide a sua ação
#possíveis ações:
#- não fazer nada (se o jogador está muito longe ou se seu contador disse pra não fazer nada)
#- atirar no jogador (se você atira e está alinhado com ele)
#- andar em direçao ao jogador (caso você possa)
ENEMY_DECISION:
	#assume-se que o inimigo está ativo
	memo(ra)
	memo(s0)
	mv s0, a0 #guardar endereço do inimigo
	
	lw t0, ENEMY_COUNTER(s0)
	addi t0, t0, 1 #counter aumenta em 1
	sw t0, ENEMY_COUNTER(s0) #armazena valor atualizado
	li t1, ENEMY_TICK
	bne t0, t1, enemy_do_nothing #contador pode obrigar a não fazer nada
	
	sw zero, ENEMY_COUNTER(s0) #zera o contador
	lb t0, ENEMY_TYPE(s0)
	li t1, BOSS_CODE
	beq t0, t1, boss_action #ação do boss é especial
	
	la a1, PLAYER_X
	lh a1, 0(a1)
	la a2, PLAYER_Y
	lh a2, 0(a2)
	lh a3, ENEMY_X(s0)
	lh a4, ENEMY_Y(s0)
	call POINT_DIST #distância entre o inimigo e o jogador
	
	li t0, ENEMY_ALERT_DIST
	bgt a0, t0, enemy_relax #inimigo relaxa se o jogador não está por perto 
	
	# se o jogador está perto, realizar ação do inimigo
	
	#primeiro se virar
	la t1, PLAYER_X
	lh t1, 0(t1)
	la t2, ENEMY_X(s0)
	sgt t0, t1, t2 #ver se o jogador tá na minha frente, aí devo virar pra direita
	lb t1, ENEMY_DIR(s0)
	bne t0, t1, enemy_change_dir #mudar de direção para encarar o personagem
	
	#se já está virado certo, ou correr ou atirar 
	j enemy_do_nothing
	
ret_enemy_decision:
	unmemo(s0)
	unmemo(ra)
	ret
	
enemy_do_nothing: #não faz literalmente nada
	sh zero, ENEMY_VEL_X(s0) #fica parado
	j ret_enemy_decision
	
enemy_relax:
	lw t0, ENEMY_COUNTER(s0)
	andi t0, t0, 0x010 #pega segundo LSB
	li t1, 1
	sub t1, t1, t0 #1 ou -1 dependendo
	sh t1, ENEMY_VEL_X(s0) #anda de forma alternada
	j ret_enemy_decision
	
enemy_change_dir: #direção certa no s0
	sb t0, ENEMY_DIR(s0)

boss_action:
	j ret_enemy_decision
	