# controle lógico dos estados e fases do jogo

#determina o próximo estado e fase do jogo
GAME_CONTROL:
	la t1, NEXT_GAME_STATE
	lb t0, 0(t1)
	la t1, GAME_STATE
	sb t0, 0(t1) #estado atual recebe o estado novo anterior
	#print_int(t0)
	
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
	#jogo vai se configurar sozinho
	
	li a0, GAME_STATE_ACTION #passa para o jogo em si
	
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
	li a0, GAME_STATE_ACTION
	
ret_fagm:
	j ret_game_control
	
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
	li a0, GAME_STATE_OVER
	j ret_fagm #jogo termina e continua terminado
	#exit_loop #termina o jogo se o jogador venceu


