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

# Constantes de áudio
.eqv MG_MIN_WORD 0x10000000 #MIN_WORD Mage Embler

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
