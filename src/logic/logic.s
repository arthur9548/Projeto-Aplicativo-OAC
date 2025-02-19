# arquivo principal de lógica do jogo. 
# inclui todos os subarquivos de lógica e 
# junta as funcionalidades

#loop de lógica do jogo
#loop de lógica do jogo
#reponsável por:
#movimentar os objetos
#calcular colisões e offset do mapa
#calcular dano/vida
#implementar uso de habilidades
#implementar IA dos inimigos
#ler input

GAME_LOGIC:
	memo(ra)
	#primeiro descobre qual é o estado atual do jogo
	la t0, GAME_STATE
	lb t0, 0(t0) #t0 é o estado atual do jogo
	
	li t1, GAME_STATE_INIT #se está no início do jogo
	beq t0, t1, GAME_LOGIC_INIT
	
	li t1, GAME_STATE_ACTION #se está no meio de uma fase
	beq t0, t1, GAME_LOGIC_ACTION
	
	li t1, GAME_STATE_OVER #se chegou ao fim do jogo
	beq t0, t1, GAME_LOGIC_OVER
	
	li t1, GAME_STATE_CONFIG #se a fase deve ser reiniciada
	beq t0, t1, GAME_LOGIC_CONFIG
	
RET_GAME_LOGIC:
	unmemo(ra)
	ret
	
GAME_LOGIC_INIT:
	#inicializar score, tempo e vida
	j RET_GAME_LOGIC

GAME_LOGIC_ACTION:
	#aqui vai ser executada toda a lógica do jogo
	call ENEMY_IA
	call PROCESS_INPUT #processar o input
	call MOVE_OBJECTS #mover personagens e projéteis
	call PROCESS_RESULTS 
	#descobrir o que aconteceu nessa iteração (jogador morreu, ganhou...)
	#e tomar decisões de acordo (reviver, somar no score...)
	j RET_GAME_LOGIC
	
GAME_LOGIC_CONFIG:
	#configurar nova fase
	call INIT_MAP #inicializa mapa da fase
	la t1, PLAYER_ALIVE
	li t0, 1
	sb t0, 0(t1) #se a fase está iniciando o jogador está vivo
	la t1, PLAYER_WON
	sb zero, 0(t1) #jogador não venceu ainda
	j RET_GAME_LOGIC
	
GAME_LOGIC_OVER:
	#lógica não precisa fazer nada no final do jogo, a princípio
	j RET_GAME_LOGIC
	
#incluir aqui os outros arquivos de lógica:
.include "input.s"
.include "processor.s"
.include "calculator.s"
.include "enemy_ia.s"
.include "mover.s"