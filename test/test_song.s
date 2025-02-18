.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
	#la a0, START_SONG
	#call PLAY_WHOLE_SONG

	#la a0, PULA
	#call PLAY_WHOLE_SONG
	#sleep(500)

	#la a0, ASPIRA
	#call PLAY_WHOLE_SONG
	#sleep(500)

	la a0, PULA
        call PLAY_WHOLE_SONG
        
        sleep(500)

	li a7, 10
	ecall
.include "../src/audio/audio.s"
.include "../SYSTEMv24.s"
