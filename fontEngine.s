.include "equates.s"
.include "macros.s"

.org $0000

FIRST_CHAR = 32

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString (Far entry point)
;
; Draws a Pascal string
;
; PARAML0 = Pointer to string
; X = Font index
; Y = VRAM position of lower right corner of string at which to draw
;
; Trashes SCRATCHL,PARAML1,X, Y, A
;
renderString:
	NATIVE
	SAVE_DBR

	sty SCRATCHL	; Cache VRAM position

	txa				; Cache font character table
	asl
	tay
	lda fontJumpTable,y
	sta renderCharBounce+1

	lda fontCharWidthTable,y
	sta PARAML1

	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8
	lda (PARAML0)
	tax
	BITS16
	phb

renderStringLoop:

	; Fetch and render next character in string
	txy
	lda #0
	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8A
	lda (PARAML0),y
	BITS16
	phb
	ldy SCRATCHL
	jsr renderChar

	dex
	beq renderStringDone

	; Calculate VRAM pointer for position of next character
	lda SCRATCHL
	sec
	sbc PARAML1
	sta SCRATCHL
	bra renderStringLoop

renderStringDone:
	RESTORE_DBR
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

renderCharBounce:		; Self modifying code. Don't panic
	jmp (font16characterJumpTable,x)

renderCharJumpReturn:	; Compiled glyphs jump back here. Can't rts because stack is turboborked
	SLOWGRAPHICS

	RESTORE_AXY
	rts

fontJumpTable:
	.addr font8characterJumpTable
	.addr font16characterJumpTable

fontCharWidthTable:	; In bytes
	.word 4
	.word 8

.include "font8x8.s"
.include "font16x16.s"

; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"

