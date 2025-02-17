# teste de audio
.data
.include "../src/data/data.s"
.include "../src/data/test_data.s"
.include "../src/util/util.s"

.text

MAIN:
	la a0, START_MENU_SONG
	li a1, 1
	li a2, 100
	call playAudio
	lw t0, 4(a0)
	beq t0, zero, END #não toca do início
	j MAIN
END: exit_system
.include "../src/audio/audio.s"