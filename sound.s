;
;  sound
;  Code and data structures for playing sound effects
;
;  Created by Quinn Dunki on 6/30/23
;


NUM_SOUNDS = 2

SOUND_HOWL=0
SOUND_MEOW1=2

soundTable:
	; Sound Ram Address, Wave Size, Low Frequency
	.byte $00,WAVE_SIZE_8192,200		; SOUND_HOWL
	.byte $20,WAVE_SIZE_8192,100		; SOUND_MEOW1


; Ensoniq Control Register bit patterns
DOC_RAMACCESS = $40	; or
DOC_DOCACCESS = $bf	; and
DOC_AUTOINC = $20	; or
DOC_NOINC =	$df		; and

; Oscillator Control Register bit patterns
OSC_MODE_FREE = $00
OSC_MODE_ONESHOT = $02
OSC_MODE_SYNC = $04
OSC_MODE_SWAP = $06

OSC_CHANNEL_ALL = $70
OSC_CHANNEL_RIGHT = $00
OSC_CHANNEL_LEFT = $10

; Internal oscillator-related registers (additional per-oscillator registers per the big table on page 110 of Apple IIGS Hardware Reference Manual)
OSC_REG_INTERRUPT = $e0
OSC_REG_ENABLE = $e1
OSC_REG_DIGITIZE = $e2

; Wave table page size bit patterns
WAVE_SIZE_256 = $07
WAVE_SIZE_512 = $0f
WAVE_SIZE_1024 = $17
WAVE_SIZE_2048 = $1f
WAVE_SIZE_4096 = $27
WAVE_SIZE_8192 = $2f
WAVE_SIZE_16384 = $37
WAVE_SIZE_32768 = $3f


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ENSONIQ_WAIT
;
; Polls the high bit of the Sound Control Register, which tells us when we're allowed
; to talk to the DOC
;
.macro ENSONIQ_WAIT
	.local busyLoop
	BITS8A
busyLoop:
	lda ENSONIQ_CONTROL
	bmi busyLoop
	BITS16
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; writeInternalRegister - Call in 8 BIT MODE ONLY (also why it's a macro)
;
; Writes to the internal registers of the Ensoniq
;
; A = Data to write (8 bits)
; X = Register number to write to (8 bits)
;
; Trashes A
;
.macro writeInternalRegister
	pha
	txa
	sta ENSONIQ_ADDRL
	pla
	sta ENSONIQ_DATA
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; writeInternalRegisterPair - Call in 8 BIT MODE ONLY (also why it's a macro)
;
; Writes to the internal registers of the Ensoniq for a pair of oscillators
;
; A = Data to write (8 bits)
; X = Register number to write to (8 bits). X+1 will also be written
;
; Trashes A
;
.macro writeInternalRegisterPair
	pha
	txa
	sta ENSONIQ_ADDRL
	pla
	sta ENSONIQ_DATA
	pha
	inx
	txa
	sta ENSONIQ_ADDRL
	pla
	sta ENSONIQ_DATA
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; initSoundSystem
;
; Trashes SCRATCHL
;
initSoundSystem:
	SAVE_AXY

	ENSONIQ_WAIT
	
	; Load sound file bank into Ensoniq RAM
	lda #$0000		; Sound location in bank 4
	sta PARAML0
	ldx #$04
	ldy #11749
	jsr copyToSoundRAM

	; Configure all our oscillators
	lda #0
	sta SCRATCHL

	ldy #0
	
initSoundSystemLoop:
	BITS8A
	lda soundTable,y
	sta PARAM0
	iny
	lda soundTable,y
	sta PARAM1
	iny
	lda soundTable,y
	sta PARAM2
	iny
	BITS16

	phy
	ldy SCRATCHL
	jsr configureOscillatorPair

	iny
	iny
	cpy #NUM_SOUNDS*2
	beq initSoundSystemReady
	sty SCRATCHL
	ply
	bra initSoundSystemLoop

initSoundSystemReady:
	ply

	; Enable oscillators (see page 108 of Apple IIGS Hardware Reference Manual)
	BITS8
	lda #(NUM_SOUNDS*2)<<1		; Two oscillators per sound and leaving low bit untouched
	ldx #OSC_REG_ENABLE
	writeInternalRegister
	BITS16

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playSound
;
; Y = Oscillator to start (+1 also starts)
;
playSound:
	SAVE_AX

	ENSONIQ_WAIT

	BITS8
	
	; Configure run mode for our oscillators
	lda #OSC_CHANNEL_RIGHT | OSC_MODE_ONESHOT
	ldx docRegisterTableControl,y
	writeInternalRegister

	lda #OSC_CHANNEL_LEFT | OSC_MODE_ONESHOT
	ldx docRegisterTableControl+1,y
	writeInternalRegister

	BITS16
	RESTORE_AX
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; configureOscillatorPair
;
; Y = Oscillator number (+1 will also be configured)
; PARAM0 = Wave table address (one byte)
; PARAM1 = Wave table page size (must use WAVE_SIZE constants)
; PARAM2 = Low frequency (high frequency is always 0)
;
configureOscillatorPair:
	SAVE_AXY
	ENSONIQ_WAIT
	BITS8

	; Configure low frequency
	lda PARAM2
	ldx docRegisterTableLowFreq,y
	writeInternalRegisterPair

	; Configure high frequency
	lda #0
	ldx docRegisterTableHighFreq,y
	writeInternalRegisterPair

	; Configure volume
	lda #$ff	; This is relative to system volume, so set it to max
	ldx docRegisterTableVolume,y
	writeInternalRegisterPair

	; Configure sound RAM pointer
	lda PARAM0
	ldx docRegisterTableWavePointer,y
	writeInternalRegisterPair

	; Configure sound RAM size
	; Format of this register is tricky. See page 114 of Apple IIGS Hardware Reference Manual
	lda PARAM1
	ldx docRegisterTableWaveSize,y
	writeInternalRegisterPair

	BITS16
	RESTORE_AXY
	rts

; DOC register locations for each oscillator
docRegisterTableLowFreq:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f
docRegisterTableHighFreq:
	.byte $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f
docRegisterTableVolume:
	.byte $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4a,$4b,$4c,$4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5a,$5b,$5c,$5d,$5e,$5f
docRegisterTableData:
	.byte $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6a,$6b,$6c,$6d,$6e,$6f,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7a,$7b,$7c,$7d,$7e,$7f
docRegisterTableWavePointer:
	.byte $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e,$8f,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9a,$9b,$9c,$9d,$9e,$9f
docRegisterTableControl:
	.byte $a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$ab,$ac,$ad,$ae,$af,$b0,$b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$ba,$bb,$bc,$bd,$be,$bf
docRegisterTableWaveSize:
	.byte $c0,$c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$ca,$cb,$cc,$cd,$ce,$cf,$d0,$d1,$d2,$d3,$d4,$d5,$d6,$d7,$d8,$d9,$da,$db,$dc,$dd,$de,$df


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copyToSoundRAM
;
; Copies data from main RAM to sound RAM
;
; PARAML0 = Pointer to sound data in main RAM
; X = Bank number of sound data in main RAM
; Y = Size of sound bank in bytes
;
; Trashes SCRATCHL
;
copyToSoundRAM:
	SAVE_AXY
	sty SCRATCHL

	ENSONIQ_WAIT

	lda #0
	BITS8
	stx copyToSoundRAMLoop+3	; Self modifying code. Don't panic

	; Enable sound RAM access and auto-increment mode
	lda ENSONIQ_CONTROL
	ora #DOC_RAMACCESS | DOC_AUTOINC
	sta ENSONIQ_CONTROL
	BITS16

	; Prepare start address in sound RAM
	lda #$0000
	sta ENSONIQ_ADDRL

	; Copy all the data
	lda #0
	BITS8A
	ldx #0

copyToSoundRAMLoop:
	lda $ff0000,x			; Note: 8 bit accumulator! DOC takes one byte at a time
	sta ENSONIQ_DATA		; Do not use indexed addressing here- see page 107 of Apple IIGS Hardware Reference Manual
	inx
	cpx SCRATCHL
	bne copyToSoundRAMLoop

	; Enable DOC access and disable auto-increment mode
	; This is a nicer mode to leave the Ensoniq in for normal usage once loading is complete
	lda ENSONIQ_CONTROL
	and #DOC_DOCACCESS & DOC_NOINC
	sta ENSONIQ_CONTROL

	BITS16
	RESTORE_AXY
	rts

