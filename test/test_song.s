.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
	la a0, Fingerbib_Track1_Voice1_SIZE
	call PLAY_WHOLE_SONG
	li a7, 10
	ecall
.include "../src/audio/audio.s"
.include "../SYSTEMv24.s"
