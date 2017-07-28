;
;  gsshr
;  GS sample application
;
;  Created by Quinn Dunki on 7/9/17
;


.include "macros.s"
.include "equates.s"


.org $6000

main:
	NATIVE

	lda #$f0
	sta TEXTCOLOR

	jsr initSCBs
	SHRVIDEO

	lda #basePalette
	sta PARAML0
	lda #0
	jsr setPalette
	
	lda #$3333
	jsr colorFill

	jsr kbdWait
	CLASSICVIDEO

	EMULATION
	rts



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdWait
; Waits for a keystroke
;
kbdWait:
	EMULATION

kbdWaitLoop:
	lda KBD
	bpl kbdWaitLoop
	sta KBDSTROBE

	NATIVE
	rts




basePalette:
	.word $0F00,$00F0,$000F,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


.include "graphics.s"



; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
