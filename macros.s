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


.macro FASTGRAPHICS
	sei
	sep #%00100000	; 16-bit A only, to preserve X/Y
	.a8

	lda SHADOW
	sta shadowRegister
	lda #0
	sta SHADOW

	lda STACKCTL
	sta stackRegister
	ora #$30
	sta STACKCTL

	rep #%00100000
	.a16
	tsc
	sta stackPtr
.endmacro


.macro SLOWGRAPHICS
	sep #%00100000	; 16-bit A only, to preserve X/Y
	.a8

	lda shadowRegister
	sta SHADOW

	lda stackRegister
	sta STACKCTL

	rep #%00100000
	.a16
	lda stackPtr
	tcs

	cli
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

