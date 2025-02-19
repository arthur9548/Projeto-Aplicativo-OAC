# Estados do jogo
.eqv GAME_STATE_INIT 0
.eqv GAME_STATE_ACTION 1
.eqv GAME_STATE_OVER 2
.eqv GAME_STATE_CONFIG 3

# Constantes de fase
.eqv MAP_W 20
.eqv MAP_H 10
.eqv MAP_SIZE 200
.eqv FINAL_MAP_INDEX 2
.eqv BACKGROUND_TILE 0
.eqv BLOCK_TILE 1
.eqv WATER_TILE 2
.eqv CLOSED_DOOR_TILE 3
.eqv OPEN_DOOR_TILE 4
.eqv ENEMY_TILE_CODE 10

# Constantes de display:
.eqv CURRENT_DISPLAY_FRAME_ADDRESS 0xFF200604
.eqv BUFFER_ADDRESS 0xFF000000
.eqv NUMBER_OF_SCREEN_PIXELS 76800
.eqv PIXELS_IN_ROW 320
.eqv PIXELS_IN_COL 240
.eqv TILE_W 16
.eqv TILE_H 16
.eqv MENU_X 160
.eqv MENU_COLOR 0b01001010 
.eqv BASE_STRING_COLOR 0x0ff
.eqv MENU_STRING_COLOR 0x03f
.eqv RIGHT_OFFSET 160
.eqv LEFT_OFFSET 40

# Constantes de áudio
.eqv MG_MIN_WORD 0x10000000 #MIN_WORD Mage Embler

# Constantes dos inimigos
.eqv ENEMY_LIST_SIZE 50
.eqv ENEMY_MEMORY_SIZE 20
.eqv ENEMY_X 0 # h
.eqv ENEMY_Y 2 # h
.eqv ENEMY_VEL_X 4 # h
.eqv ENEMY_VEL_Y 6 # h
.eqv ENEMY_TYPE 8 # b
.eqv ENEMY_HP 9 # b
.eqv ENEMY_DIR 10 # b
.eqv ENEMY_ACTIVE 11 # b
.eqv ENEMY_COUNTER 12 # w
.eqv ENEMY_EXTRA 16 # w

.eqv ENEMY_TICK 50
.eqv ENEMY_ALERT_DIST 48
.eqv ENEMY_MELEE_TYPE 0
.eqv VEL_MELEE 1
.eqv ENEMY_RANGE_TYPE 1
.eqv BOSS_CODE 5
.eqv BOSS_HP 5


# Constantes do player:
.eqv PLAYER_FACING_LEFT 0
.eqv PLAYER_FACING_RIGHT 1
.eqv PLAYER_STATE_NORMAL 0
.eqv PLAYER_STATE_ENEMY_RANGER 1
.eqv PLAYER_STATE_ENEMY_MELEE 2

# Constantes do input:
.eqv KBD_CONTROL 0xFF200000
.eqv KEY_NOTHING 0
.eqv KEY_LEFT 1
.eqv KEY_RIGHT 2
.eqv KEY_JUMP 3
.eqv KEY_ABSORB 4
.eqv KEY_SPECIAL 5
