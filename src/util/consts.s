# Constantes de display:
.eqv CURRENT_DISPLAY_FRAME_ADDRESS 0xFF200604
.eqv BUFFER_ADDRESS 0xFF000000
.eqv NUMBER_OF_SCREEN_PIXELS 76800
.eqv PIXELS_IN_ROW 320
.eqv PIXELS_IN_COL 240
.eqv TILE_W 16
.eqv TILE_H 16
.eqv MAP_W 20
.eqv MAP_H 10
.eqv MAP_SIZE 200
.eqv MENU_X 160
.eqv MENU_COLOR 0b10010111 


# Constantes do player:
.eqv PLAYER_FACING_LEFT 0
.eqv PLAYER_FACING_RIGHT 1
.eqv PLAYER_STATE_NORMAL 0
.eqv PLAYER_STATE_ENEMY_RANGER 1
.eqv PLAYER_STATE_ENEMY_MELEE 2
.eqv PLAYER_NOT_MID_AIR 0
.eqv PLAYER_MID_AIR 1

# Constantes do input:
.eqv KBD_CONTROL 0xFF200000
.eqv KEY_NOTHING 0
.eqv KEY_LEFT 1
.eqv KEY_RIGHT 2
.eqv KEY_JUMP 3
.eqv KEY_ABSORB 4
.eqv KEY_SPECIAL 5