#Imagens:
empty_tile: .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,

player_tile_inhaling_left: .byte 199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,


player_tile_inhaling_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,199,
199,199,199,199,0,0,0,0,0,0,0,0,0,0,199,199,
199,199,199,199,0,73,9,9,9,73,82,82,82,0,199,199,


player_tile_left_jumping: .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
0,0,0,0,255,255,167,167,167,167,167,167,82,82,199,199,
0,0,0,0,144,255,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,255,255,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,144,255,0,0,167,167,167,167,82,82,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,

player_tile_right_jumping: .byte 199,199,0,0,199,199,199,199,199,0,0,0,0,199,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
0,0,0,0,255,255,167,167,167,167,167,167,82,82,199,199,
0,0,0,0,144,255,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,167,167,167,167,167,167,167,0,199,199,
0,0,0,0,167,167,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,255,255,0,0,167,167,167,167,167,0,199,199,
0,0,0,0,144,255,0,0,167,167,167,167,82,82,199,199,
199,0,0,0,0,0,0,0,0,167,167,167,82,82,199,199,
199,199,0,0,199,199,0,0,199,0,0,0,0,199,199,199,
199,199,199,199,199,199,0,0,199,199,199,199,199,0,173,173,
199,199,199,199,199,199,0,0,199,199,199,199,0,0,255,255,
199,199,199,199,199,199,0,0,0,0,0,0,0,0,173,173,
199,199,199,199,199,199,199,0,0,0,0,0,0,0,255,255,
199,199,199,199,199,199,199,199,199,199,199,199,0,0,173,173,
199,199,199,199,199,199,199,199,199,199,199,199,199,0,255,255,



player_tile_right: .byte 199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,



player_tile_left: .byte 199,199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,0,0,0,0,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,0,0,
199,199,199,199,199,199,199,199,0,0,199,199,199,199,199,0,
199,199,199,199,0,0,199,199,0,0,199,0,0,0,0,199,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,0,0,0,0,144,255,0,0,167,167,167,167,82,82,
199,199,0,0,0,0,255,255,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,0,0,167,167,167,167,167,0,
199,199,0,0,0,0,167,167,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,144,255,167,167,167,167,167,167,167,0,
199,199,0,0,0,0,255,255,167,167,167,167,167,167,82,82,
199,199,199,0,0,0,0,0,0,0,0,167,167,167,82,82,
199,199,199,199,0,0,199,199,199,199,199,0,0,0,0,199,

player_tile_old: .byte 199,199,199,199,199,199,199,199,199,75,75,199,199,199,199,199,
199,199,199,199,199,199,199,199,199,199,75,75,75,75,78,78,
199,199,199,199,199,199,199,199,199,159,159,75,75,75,78,78,
199,199,199,199,199,199,199,199,159,159,159,159,75,75,199,199,
199,199,199,199,199,199,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,199,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,75,199,159,159,159,159,159,159,75,199,199,
199,199,199,199,199,199,75,159,159,145,159,159,159,75,199,199,
199,199,199,199,199,199,199,199,159,159,159,159,75,75,78,78,
199,199,199,199,199,199,199,199,199,159,159,75,75,75,78,78,
199,199,199,199,199,199,199,199,199,199,75,75,75,75,199,199,
199,199,199,199,199,75,75,75,75,75,75,75,199,199,199,199,
199,199,199,199,199,75,199,199,199,199,199,199,199,199,75,75,
199,199,199,199,199,75,75,75,75,75,75,75,75,75,75,75,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,75,75,
199,199,199,199,199,199,199,199,199,199,199,199,199,199,75,75,
