char33:
	tya
	tcs
	; Line 7
	tsc
	sec
	sbc #160
	tcs
	; Line 6
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00d0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00d0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4
	tsc
	sec
	sbc #160
	tcs
	; Line 3
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00d0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00a0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00b0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff0f
	ora #$00f0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0ff
	ora #$0f00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp returnFromTest
