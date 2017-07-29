;
;  gsshr
;  GS sample application
;
;  Created by Quinn Dunki on 7/9/17
;


.include "macros.s"
.include "equates.s"


.org $800

main:
	NATIVE

mainCopyStart:
	ldx #0
	lda #mainBank2
	sta mainCopyDest+1

mainCopyLoop:
	lda mainBank2,x

mainCopyDest:
	sta $020800,x
	inx
	cpx #endMainBank2-mainBank2
	bne mainCopyLoop

	lda #returnToProDOS
	sta proDOSLongJump
	lda #mainBank2
	sta mainLongJump
	jml (mainLongJump)

returnToProDOS:
	SYNCDBR
	EMULATION
	rts

mainLongJump:
	.byte 00,08,02
proDOSLongJump:
	.byte 00,00,00


mainBank2:
	SYNCDBR

	BITS8
	lda #$f0
	sta TEXTCOLOR
	BITS16

	jsr initSCBs
	SHRVIDEO

	lda #basePalette
	sta PARAML0
	lda #0
	jsr setPalette
	
	ldx #$1111
	jsr colorFill

	jsr kbdWait
	CLASSICVIDEO

	jml (proDOSLongJump)



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


endMainBank2:


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
