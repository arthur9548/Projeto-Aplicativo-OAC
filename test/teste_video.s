# teste da renderização visual

.include "../src/util/util.s"
.include "../src/data/data.s"
.include "../MACROSv24.s"

.text
MAIN:
	call GAME_CONTROL
	call GAME_LOGIC
	call GAME_RENDER
	#call GAME_AUDIO
	j MAIN

.include "../src/video/video.s"
.include "../src/audio/audio.s"	
.include "../src/control/control.s"
.include "../src/logic/logic.s"
.include "../SYSTEMv24.s"
