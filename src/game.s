#arquivo principal do jogo
.include "data/data.s"
.include "util/util.s"
.include "../MACROSv24.s"
.text

MAIN:	#roda o jogo de alguma forma
	exit_system

.include "logic/logic.s"
.include "audio/audio.s"
.include "video/video.s"
.include "../SYSTEMv24.s"