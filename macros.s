.macro OP8
	.i8
	.a8
.endmacro


.macro OP16
	.i16
	.a16
.endmacro


.macro BITS8
	sep #%00110000
	OP8
.endmacro


.macro BITS16
	rep #%00110000
	OP16
.endmacro


.macro DBR bankNum
	BITS8
	lda bankNum
	pha
	plb
	BITS16
.endmacro


.macro SYNCDBR
	phk
	plb
.endmacro


.macro EMULATION
	sec		; Enable 8-bit mode
	xce
	OP8
.endmacro


.macro NATIVE
	clc				; Enable 16-bit mode
	xce
	BITS16
.endmacro


.macro SHRVIDEO
	BITS8
	lda NEWVIDEO
	ora	#%11000001
	sta NEWVIDEO
	BITS16
.endmacro


.macro CLASSICVIDEO
	BITS8
	lda NEWVIDEO
	and #%00111111
	sta NEWVIDEO
	BITS16
.endmacro


.macro FASTGRAPHICS			;51 cycles, 12 bytes
	sei						;2
	phd						;4
	sep #%00100000	;		 3   16-bit A only, to preserve X/Y
	.a8

	lda SHADOW				;5
	sta shadowRegister		;4
	lda #0					;2
	sta SHADOW				;5

	lda STACKCTL			;5
	sta stackRegister		;4
	ora #$30				;2
	sta STACKCTL			;5

	rep #%00100000			;3
	.a16
	tsc						;2
	sta stackPtr			;5
.endmacro


.macro SLOWGRAPHICS			;38 cycles, 12 bytes
	sep #%00100000	;        3    16-bit A only, to preserve X/Y
	.a8

	lda shadowRegister		;4
	sta SHADOW				;5

	lda stackRegister		;4
	sta STACKCTL			;5

	rep #%00100000			;3
	.a16
	lda stackPtr			;5
	tcs						;2
	pld						;5
	cli						;2
.endmacro


.macro LOADPARAM24 bankNumDoubled,addr16
	lda #bankNumDoubled
	sta PARAM24+1
	lda #addr16
	sta PARAM24
.endmacro


.macro  pstring Arg
	.byte   .strlen(Arg), Arg
.endmacro


.macro  qbyte Arg
	.dbyt   Arg>>16,Arg&$0000ffff
.endmacro

.macro BREAK
	pha
	lda breakpoint
	beq nobrk
	lda #1
	sta $e1c029
	pla
	brk
nobrk:
	pla
.endmacro

;;;;;;;;;;
; Stack Macros


.macro SAVE_AXY				; Saves all registers
	pha
	phx
	phy
.endmacro


.macro RESTORE_AXY			; Restores all registers
	ply
	plx
	pla
.endmacro


.macro SAVE_AY				; Saves accumulator and Y index
	pha
	phy
.endmacro


.macro RESTORE_AY			; Restores accumulator and Y index
	ply
	pla
.endmacro


.macro SAVE_AX				; Saves accumulator and X index
	pha
	phx
.endmacro


.macro RESTORE_AX			; Restores accumulator and X index
	plx
	pla
.endmacro


.macro SAVE_XY				; Saves X and Y index
	phx
	phy
.endmacro


.macro RESTORE_XY			; Restores X and Y index
	ply
	plx
.endmacro


.macro SAVE_P0				; Saves PARAML0
	lda PARAML0
	pha
.endmacro


.macro RESTORE_P0			; Restores PARAML0
	pla
	sta PARAML0
.endmacro
