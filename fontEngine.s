.include "equates.s"
.include "macros.s"

.org $0000

FIRST_CHAR = 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString (Far entry point)
;
; Draws a Pascal string
;
; PARAM0L = Pointer to string
; Y = VRAM position of lower right corner of string at which to draw
;
; Trashes SCRATCHL, X, Y, A
;
renderString:
	NATIVE
	sty SCRATCHL

	BITS8
	lda (PARAML0)
	tax
	BITS16

renderStringLoop:

	; Fetch and render next character in string
	txy
	lda #0
	BITS8A
	lda (PARAML0),y
	BITS16
	ldy SCRATCHL
	jsr renderChar

	dex
	beq renderStringDone

	; Calculate VRAM pointer for position of next character
	lda SCRATCHL
	sec
	sbc #4
	sta SCRATCHL
	bra renderStringLoop

renderStringDone:
	rtl

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderChar
;
; Draws a single character
;
; A = ASCII code to draw
; Y = VRAM position of lower right corner at which to draw
;
renderChar:
	SAVE_AXY

	sec					; Bounce off glyph-rendering jump table
	sbc #FIRST_CHAR
	asl
	tax
	FASTGRAPHICS
	jmp (characterJumpTable,x)

renderCharJumpReturn:	; Compiled glyphs jump back here. Can't rts because stack is turboborked
	SLOWGRAPHICS
RESTORE_AXY
	rts

.include "font8x8.s"

; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"

