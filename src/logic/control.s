# controle lógico dos estados e fases do jogo

#determina o próximo estado e fase do jogo
GAME_CONTROL:
	la t1, NEXT_GAME_STATE
	lb t0, 0(t1)
	la t1, GAME_STATE
	sb t0, 0(t1) #estado atual recebe o estado novo anterior
	
	li t1, GAME_STATE_INIT
	beq t0, t1, from_init_game_control
	
	li t1, GAME_STATE_ACTION
	beq t0, t1, from_action_game_control
	
	li t1, GAME_STATE_OVER
	beq t0, t1, from_over_game_control
	
	li t1, GAME_STATE_CONFIG
	beq t0, t1, from_config_game_control
	
ret_game_control: #deve receber em a0 o próximo estado
	la t0, NEXT_GAME_STATE
	sb a0, 0(t0) #configura o próximo estado
	ret
	
from_init_game_control:
	#inicializar o jogo
	
	#sem grandes coisas pra inicializar além da fase
	
	#próximo estado é configuração da fase
	li a0, GAME_STATE_CONFIG
	#fase inicia como 0
	
	j ret_game_control
	
from_config_game_control:
	memo(ra) #chama outra função
	#configura a fase atual
	call INIT_MAP #inicializa as informações do mapa atual na memória
	
	#próximo estado é o jogo em si (ação)
	li a0, GAME_STATE_ACTION
	
	unmemo(ra)
	j ret_game_control
	
from_action_game_control:
	#verificar o que aconteceu durante o jogo
	
	la t0, PLAYER_ALIVE #ver se o jogador tá vivo
	lb t0, 0(t0)
	beqz t0, died_fagm
	
	la t0, PLAYER_WON
	lb t0, 0(t0)
	li t1, 1
	beq t0, t1, won_fagm
	
	#se nada relevante aconteceu o jogo continua
ret_fagm:
	ret
	
died_fagm:
	li a0, GAME_STATE_CONFIG #configurar nova fase
	#mesma fase atual
	j ret_fagm
won_fagm:
	la t2, CUR_MAP_INDEX
	lb t0, 0(t2) #verifica o índice da fase atual
	li t1, FINAL_MAP_INDEX
	beq t0, t1, over_won_fagm #verifica se a pessoa ganhou o jogo
	
	addi t0, t0, 1 #aumenta o índice da fase
	sb t0, 0(t2) #atualiza o índice da fase atual
	li a0, GAME_STATE_CONFIG
	j ret_fagm
	
over_won_fagm:
	li a0, GAME_STATE_OVER #fim de jogo
	j ret_fagm
	
from_over_game_control:
	exit_loop #termina o jogo se o jogador venceu

#inicializa uma fase escolhida no jogo
#escolha é feita na memória
INIT_MAP:
	la t3, CUR_MAP_INDEX #mapa atual
	lb t3, 0(t3)
	la t2, MAP_ADDRESS #endereço do mapa atual
	la t1, MAP_TILE_SPRITES #endereço dos tiles desse mapa
	
	li t0, 0
	beq a0, a0, case0_init_map
	
ret_init_map:
	ret
	
case0_init_map:
	la t0, brick_tile
	sw t0, 0(t1)
	la t0, metal_tile
	sw t0, 4(t1)
	la t0, water_tile
	sw t0, 8(t1) #informações de tile
	la t0, mapa_de_testes
	sw t0, 0(t2) #endereço do mapa
	j ret_init_map