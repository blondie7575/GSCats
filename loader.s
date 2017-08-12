;
;  loader
;  A very simplistic code loader designed to manage
;  GS code under ProDOS 8 (if it's good enough for Will Harvey...)
;
;  Created by Quinn Dunki on 7/29/17
;

.org $800

main:
	NATIVE

; Copy main code that ProDOS 8 loaded into bank 2.
; Bank 2 is our "main" code bank because the GS fast
; graphics path really messes with banks 0 and 1.
; ProDOS 8 doesn't know anything about non-zero banks
; though, so things get loaded here and moved.

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

	; Set up a long jump into bank 2, and
	; a way for game code to get back here to exit
	; properly to ProDOS 8
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

