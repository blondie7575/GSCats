.macro OP8
	.i8
	.a8
.endmacro


.macro OP16
	.i16
	.a16
.endmacro


.macro BITS8A
	sep #%00100000
	.a8
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
	lda #bankNum
	pha
	plb
	BITS16
.endmacro


.macro SYNCDBR
	phk
	plb
.endmacro

.macro SAVE_DBR
	phb
	phk
	plb
.endmacro

.macro RESTORE_DBR
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


.macro SHADOWMEMORY
	sep #%00100000	;		 3   16-bit A only, to preserve X/Y
	.a8
	lda SHADOW				;5
	sta SHADOWREGISTER		;4
	lda #0					;2
	sta SHADOW				;5
	rep #%00100000			;3
	.a16
.endmacro


.macro NORMALMEMORY
	sep #%00100000	;        3    16-bit A only, to preserve X/Y
	.a8
	lda SHADOWREGISTER		;4
	sta SHADOW				;5
	rep #%00100000			;3
	.a16
.endmacro


.macro FASTGRAPHICS			;34 cycles, 12 bytes
	sei						;2
	phd						;4
	sep #%00100000	;		 3   8-bit A only, to preserve X/Y
	.a8

	lda STACKCTL			;5
	sta STACKREGISTER		;4
	ora #$30				;2
	sta STACKCTL			;5

	rep #%00100000			;3
	.a16
	tsc						;2
	sta STACKPTR			;4
.endmacro


.macro SLOWGRAPHICS			;28 cycles, 12 bytes
	sep #%00100000	;        3    8-bit A only, to preserve X/Y
	.a8

	lda STACKREGISTER		;4
	sta STACKCTL			;5

	rep #%00100000			;3
	.a16
	lda STACKPTR			;4
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

.macro  qbytei Arg
	.dbyt   ~(Arg>>16),~(Arg&$0000ffff)
.endmacro

.macro  qbyte7 Arg
	.dbyt   (Arg>>16)&$7777,Arg&$00007777
.endmacro

.macro	fontword Arg	; Converts 0->A,F->E to match our palette for font rendering
	.dbyt	(((Arg & $FF00) | $AA00) & $EE00) | (((Arg & $00FF) | $00AA) & $00EE)
.endmacro

.macro ldaA Arg			; Forces 24-bit absolute addressing to bank $00
	.byte $af
	.word Arg
	.byte $00
.endmacro

.macro BREAK
	.local nobrk
	pha
	lda breakpoint
	beq nobrk
;	lda #1
;	sta $e1c029
	pla
	brk
nobrk:
	pla
.endmacro

.macro BREAK_NOSTACK
	.local nobrk
	lda breakpoint
	beq nobrk
	lda #1
	sta $e1c029
	brk
nobrk:	
.endmacro


.macro HARDBRK
	pha
	lda #1
	sta $e1c029
	pla
	brk
.endmacro


.macro DEADLOCK
deadlock: jmp deadlock
.endmacro


.macro BREAKLOCK
	.local deadlock
	pha
	lda breakpoint
	beq nobrk
	pla
deadlock: jmp deadlock

nobrk:
	pla
.endmacro


.macro JSRA		; Destination in accumulator
	.local jsri_smc
	sta jsri_smc+1
jsri_smc:
	jsr 0
.endmacro

.macro ABSA		; Absolute value of accumulator. Assumes status flags set correctly for accumulator!
	.local done
	bpl done
	eor #$ffff
	inc
done:
.endmacro


.macro MEMCHK	; Check to see when a memory value has been stepped on
	.local chkdone
	pha
	lda $0311CC
	cmp #$4242
	bne chkdone
	lda #1
	sta $e1c029
	pla
	brk
chkdone:
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
