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
	cpx #3
	beq intToStringFinish		; Single digit number so we're done

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

intToStringFinish:
	; Store final length and we're done
	dey
	sty intToStringResult

intToStringDone:
	BITS16
	RESTORE_AXY
	rts

intToStringBCD: .byte 0,0,0
intToStringResult: .byte 0,0,0,0,0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; mult16
;
; PARAML0 = Operand 1 (16 bits)
; PARAML1 = Operand 2 (16 bits)
; A => Op1 * Op2 (16 bits)
; Algorithm from https://apple2.gs/downloads/Programmanual.pdf
; Trashes X
;
mult16:
	lda #0			; Initialize result

mult16L1:
	ldx PARAML0		; Get operand 1
	beq mult16Done	; If operand is zero, we're done
	lsr PARAML0		; Get low bit
	bcc mult16L2	; If clear, no additions to previous products
	clc				; Otherwise add oeprand 2 to partial result
	adc PARAML1

mult16L2:
	asl	PARAML1		; Now shift operand 2 left for possible add next time
	bra mult16L1

mult16Done:
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; mult88
;
; PARAML0 = Operand 1 (8.8 fixed point)
; PARAML1 = Operand 2 (8.8 fixed point)
; A => Op1 * Op2 (8.8 fixed point)
; Substantial precision loss occurs here, but it's usually good enough
;
mult88:
	lda PARAML0		; Convert operands to 12.4
	lsr
	lsr
	lsr
	lsr
	sta PARAML0

	lda PARAML1
	lsr
	lsr
	lsr
	lsr
	sta PARAML1

	jsr mult16		; Result is 8.8
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; delayShort
; Sleeps for a teeny bit
;
delayShort:
	SAVE_AXY

	ldy		#$01	; Loop a bit
delayShortOuter:
	ldx		#$ff
delayShortInner:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dex
	bne		delayShortInner
	dey
	bne		delayShortOuter

	RESTORE_AXY
	rts
