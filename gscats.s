;
;  gscats
;
;  Created by Quinn Dunki on 7/9/17
;


.include "macros.s"
.include "equates.s"

.org $0000


mainBank2:
	SYNCDBR

	BITS8
	lda #$f0
	sta TEXTCOLOR
	BITS16

	; Set up SCBs
	jsr initSCBs
	SHRVIDEO

	jmp beginGameplay

quitGame:
	CLASSICVIDEO
	jml (PRODOSRETURN)


.include "graphics.s"
.include "font.s"
.include "terrain.s"
.include "collision.s"
.include "gameobject.s"
.include "player.s"
.include "utility.s"
.include "tables.s"
.include "gamemanager.s"
.include "input.s"
.include "projectile.s"

endMainBank2:


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
