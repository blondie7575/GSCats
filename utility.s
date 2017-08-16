;
;  utility
;  Helper routines
;
;  Created by Quinn Dunki on 8/14/17
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; intToString
;
; PARAML0 = Number to convert
; Returns result as pascal string in intToStringResult
;
intToString:
	SAVE_AXY

	; Convert value to BCD digits
	; This section courtesy of John Brooks
	sep #9
	tdc
	rol PARAML0
intToStringLoop:
	sta SCRATCHL
	adc SCRATCHL
	rol intToStringBCD
	asl PARAML0
	bne intToStringLoop
	cld
	xba
	sta intToStringBCD+1

	; Convert digits to characters
	BITS8

	; Skip leading double zeros
	ldx #0
	ldy #1

intToStringSkipLoop:
	lda intToStringBCD,x
	bne intToStringSkipSingle
	inx
	cpx #3
	bne intToStringSkipLoop

	; Special case for full zero
	sty intToStringResult
	lda #'0'
	sta intToStringResult+1
	bra intToStringDone

intToStringSkipSingle:
	; Process transition from leading-zero nibble
	lda intToStringBCD,x
	and #$f0
	bne intToStringFullDigitsLoop
	lda intToStringBCD,x
	clc
	adc #'0'
	sta intToStringResult,y
	iny
	inx

intToStringFullDigitsLoop:
	; Remaining bytes all contain two digits
	lda intToStringBCD,x
	lsr
	lsr
	lsr
	lsr
	clc
	adc #'0'
	sta intToStringResult,y
	iny
	lda intToStringBCD,x
	and #$0f
	clc
	adc #'0'
	sta intToStringResult,y
	iny
	inx
	cpx #3
	bne intToStringFullDigitsLoop

	; Store final length and we're done
	dey
	sty intToStringResult

intToStringDone:
	BITS16
	RESTORE_AXY
	rts

intToStringBCD: .byte 0,0,0
intToStringResult: .byte 0,0,0,0,0,0
