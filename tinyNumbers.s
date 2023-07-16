num4characterJumpTable:
	.addr num4char48
	.addr num4char49
	.addr num4char50
	.addr num4char51
	.addr num4char52
	.addr num4char53
	.addr num4char54
	.addr num4char55
	.addr num4char56
	.addr num4char57
	.addr num4char58

; Chroma Key is $0

num4char48:
	tya
	tcs
	; Line 4, Pixel values: 0e00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 3, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 2, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 1, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 0, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	jmp renderCharJumpReturn

num4char49:
	tya
	tcs
	; Line 4, Pixel values: 00e0 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 3, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 2, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 1, Pixel values: 0ee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$e00e
	sta 1,S
	; Line 0, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	jmp renderCharJumpReturn

num4char50:
	tya
	tcs
	; Line 4, Pixel values: eee0 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ee
	sta 1,S
	; Line 3, Pixel values: e000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff0f
	ora #$00e0
	sta 1,S
	; Line 2, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 1, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 0, Pixel values: ee00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	jmp renderCharJumpReturn

num4char51:
	tya
	tcs
	; Line 4, Pixel values: ee00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 3, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 2, Pixel values: ee00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 1, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 0, Pixel values: ee00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	jmp renderCharJumpReturn

num4char52:
	tya
	tcs
	; Line 4, Pixel values: 00e0 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 3, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 2, Pixel values: eee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ee
	sta 1,S
	; Line 1, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 0, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	jmp renderCharJumpReturn

num4char53:
	tya
	tcs
	; Line 4, Pixel values: ee00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 3, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 2, Pixel values: ee00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 1, Pixel values: e000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff0f
	ora #$00e0
	sta 1,S
	; Line 0, Pixel values: eee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ee
	sta 1,S
	jmp renderCharJumpReturn

num4char54:
	tya
	tcs
	; Line 4, Pixel values: ee00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 3, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 2, Pixel values: ee00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ee
	sta 1,S
	; Line 1, Pixel values: e000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff0f
	ora #$00e0
	sta 1,S
	; Line 0, Pixel values: 0ee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$e00e
	sta 1,S
	jmp renderCharJumpReturn

num4char55:
	tya
	tcs
	; Line 4, Pixel values: 0e00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 3, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 2, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 1, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 0, Pixel values: eee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ee
	sta 1,S
	jmp renderCharJumpReturn

num4char56:
	tya
	tcs
	; Line 4, Pixel values: 0e00 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 3, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 2, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	; Line 1, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 0, Pixel values: 0e00 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$fff0
	ora #$000e
	sta 1,S
	jmp renderCharJumpReturn

num4char57:
	tya
	tcs
	; Line 4, Pixel values: 00e0 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 3, Pixel values: 00e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0fff
	ora #$e000
	sta 1,S
	; Line 2, Pixel values: 0ee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$e00e
	sta 1,S
	; Line 1, Pixel values: e0e0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f0f
	ora #$e0e0
	sta 1,S
	; Line 0, Pixel values: 0ee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$e00e
	sta 1,S
	jmp renderCharJumpReturn

num4char58:
	tya
	tcs
	; Line 4, Pixel values: 0000 
	; Line 3, Pixel values: 0660 
	tsc
	sec
	sbc #162
	tcs
	lda 1,S
	and #$0ff0
	ora #$6006
	sta 1,S
	; Line 2, Pixel values: 6666 
	tsc
	sec
	sbc #158
	tcs
	pea $6666
	; Line 1, Pixel values: 6f66 
	tsc
	sec
	sbc #158
	tcs
	pea $666f
	; Line 0, Pixel values: 0660 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$6006
	sta 1,S
	jmp renderCharJumpReturn

