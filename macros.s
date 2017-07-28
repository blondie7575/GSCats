.macro EMULATION
	sec		; Enable 8-bit mode
	xce
	.i8
	.a8
.endmacro


.macro NATIVE
	clc				; Enable 16-bit mode
	xce
	rep	#$30
	.i16
	.a16
.endmacro

.macro SHRVIDEO
	sep #$30
	.i8
	.a8
	lda NEWVIDEO
	ora	#%11000001
	sta NEWVIDEO
	rep	#$30
	.i16
	.a16
.endmacro

.macro CLASSICVIDEO
	sep #$30
	.i8
	.a8
	lda NEWVIDEO
	and #%00111111
	sta NEWVIDEO
	rep	#$30
	.i16
	.a16
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

