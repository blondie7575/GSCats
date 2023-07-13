font16characterJumpTable:
	.addr font16char32
	.addr font16char33
	.addr font16char34
	.addr font16char35
	.addr font16char36
	.addr font16char37
	.addr font16char38
	.addr font16char39
	.addr font16char40
	.addr font16char41
	.addr font16char42
	.addr font16char43
	.addr font16char44
	.addr font16char45
	.addr font16char46
	.addr font16char47
	.addr font16char48
	.addr font16char49
	.addr font16char50
	.addr font16char51
	.addr font16char52
	.addr font16char53
	.addr font16char54
	.addr font16char55
	.addr font16char56
	.addr font16char57
	.addr font16char58
	.addr font16char59
	.addr font16char60
	.addr font16char61
	.addr font16char62
	.addr font16char63
	.addr font16char64
	.addr font16char65
	.addr font16char66
	.addr font16char67
	.addr font16char68
	.addr font16char69
	.addr font16char70
	.addr font16char71
	.addr font16char72
	.addr font16char73
	.addr font16char74
	.addr font16char75
	.addr font16char76
	.addr font16char77
	.addr font16char78
	.addr font16char79
	.addr font16char80
	.addr font16char81
	.addr font16char82
	.addr font16char83
	.addr font16char84
	.addr font16char85
	.addr font16char86
	.addr font16char87
	.addr font16char88
	.addr font16char89
	.addr font16char90
	.addr font16char91

; Chroma Key is $e

font16char32:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char33:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #318
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char34:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: 8882 2eee 2222 2eee 
	tsc
	sec
	sbc #1602
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8288
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 22ee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: 8888 822e 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	; Line 2, Pixel values: e888 882e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2088
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: ee88 888e ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char35:
	tya
	tcs
	; Line 15, Pixel values: ee22 222e e333 34ee 
	tsc
	sec
	sbc #8
	tcs
	lda 7,S
	and #$ff00
	ora #$0034
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3303
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 14, Pixel values: ee22 222e e233 43ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0043
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3302
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: 2222 2222 2223 3334 
	tsc
	sec
	sbc #152
	tcs
	pea $3433
	pea $2322
	pea $2222
	pea $2222
	; Line 12, Pixel values: 2222 2222 2232 3343 
	tsc
	sec
	sbc #152
	tcs
	pea $4333
	pea $3222
	pea $2222
	pea $2222
	; Line 11, Pixel values: 2222 2222 2222 2333 
	tsc
	sec
	sbc #152
	tcs
	pea $3323
	pea $2222
	pea $2222
	pea $2222
	; Line 10, Pixel values: 2222 2222 2222 3233 
	tsc
	sec
	sbc #152
	tcs
	pea $3332
	pea $2222
	pea $2222
	pea $2222
	; Line 9, Pixel values: 2222 2222 2222 2223 
	tsc
	sec
	sbc #152
	tcs
	pea $2322
	pea $2222
	pea $2222
	pea $2222
	; Line 8, Pixel values: ee22 222e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 7, Pixel values: ee22 222e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 6, Pixel values: 8822 2222 2222 2222 
	tsc
	sec
	sbc #152
	tcs
	pea $2222
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2222 2222 2222 
	tsc
	sec
	sbc #152
	tcs
	pea $2222
	pea $2222
	pea $2222
	pea $8288
	; Line 4, Pixel values: 8888 2222 2222 2222 
	tsc
	sec
	sbc #152
	tcs
	pea $2222
	pea $2222
	pea $2222
	pea $8888
	; Line 3, Pixel values: 8888 8222 2222 2222 
	tsc
	sec
	sbc #152
	tcs
	pea $2222
	pea $2222
	pea $2282
	pea $8888
	; Line 2, Pixel values: 8888 8822 2222 2222 
	tsc
	sec
	sbc #152
	tcs
	pea $2222
	pea $2222
	pea $2288
	pea $8888
	; Line 1, Pixel values: ee88 888e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: ee88 888e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	jmp renderCharJumpReturn

font16char36:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee ee22 2eee eeee 
	tsc
	sec
	sbc #808
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 9, Pixel values: eeee e2ee e2ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$fff0
	ora #$0002
	sta 5,S
	lda 3,S
	and #$fff0
	ora #$0002
	sta 3,S
	; Line 8, Pixel values: eeee e2ee eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$0002
	sta 3,S
	; Line 7, Pixel values: eeee e2ee eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$0002
	sta 3,S
	; Line 6, Pixel values: eeee ee2e e2ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$fff0
	ora #$0002
	sta 5,S
	lda 3,S
	and #$0fff
	ora #$2000
	sta 3,S
	; Line 5, Pixel values: eeee eee2 2eee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char37:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eee2 eeee eeee 
	tsc
	sec
	sbc #168
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 13, Pixel values: eeee eee2 eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 12, Pixel values: eeee ee22 2eee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 11, Pixel values: eeee 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 10, Pixel values: ee22 22ee e222 3eee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: e222 2e22 2e22 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 8, Pixel values: 2222 2e22 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 7, Pixel values: 8222 2e22 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 6, Pixel values: 8822 22e2 2e22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$f000
	ora #$0222
	sta 3,S
	; Line 5, Pixel values: 8882 222e e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 4, Pixel values: e888 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 822e 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: eee8 88ee e222 eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0088
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char38:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char39:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: 8882 2eee eeee eeee 
	tsc
	sec
	sbc #1606
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: 8888 822e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	; Line 2, Pixel values: e888 882e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2088
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: ee88 888e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char40:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0030
	sta 5,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2eee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char41:
	tya
	tcs
	; Line 15, Pixel values: 222e eeee eeee eeee 
	tsc
	sec
	sbc #8
	tcs
	lda 1,S
	and #$0f00
	ora #$2022
	sta 1,S
	; Line 14, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 12, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 11, Pixel values: e222 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 10, Pixel values: ee22 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: eee2 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 8, Pixel values: eee2 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 7, Pixel values: eee2 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 6, Pixel values: eee2 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 5, Pixel values: eee2 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 4, Pixel values: ee88 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 3, Pixel values: 8888 8222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2282
	pea $8888
	; Line 2, Pixel values: 8888 882e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$2088
	sta 3,S
	; Line 1, Pixel values: 8888 888e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	; Line 0, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char42:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eee2 eeee eeee 
	tsc
	sec
	sbc #168
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 13, Pixel values: eeee eee2 eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 12, Pixel values: eeee ee22 2eee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 11, Pixel values: eeee 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 10, Pixel values: ee22 2222 2222 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: e222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 5, Pixel values: 8882 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 4, Pixel values: e888 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 822e 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: eee8 88ee e222 eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0088
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char43:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char44:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: e222 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: ee22 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char45:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: 2222 2222 2222 eeee 
	tsc
	sec
	sbc #962
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 8, Pixel values: 2222 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 7, Pixel values: 8222 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	; Line 6, Pixel values: 8822 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8288
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char46:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char47:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 2222 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 11, Pixel values: 2222 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 10, Pixel values: e222 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 9, Pixel values: ee22 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 8, Pixel values: eee2 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 7, Pixel values: eeee 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 6, Pixel values: eeee e222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 5, Pixel values: eeee ee22 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 4, Pixel values: eeee eee2 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 3, Pixel values: eeee eeee 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: eeee eeee e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	; Line 1, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char48:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23ee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 22ee 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 222e e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 9, Pixel values: 2222 2222 ee22 222e 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 8, Pixel values: 2222 2e22 2e22 223e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 7, Pixel values: 8222 2ee2 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 6, Pixel values: 8822 22ee 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 5, Pixel values: e882 222e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8208
	sta 1,S
	; Line 4, Pixel values: e888 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: ee88 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 2, Pixel values: eee8 8822 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 1, Pixel values: eeee e882 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$8208
	sta 3,S
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char49:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 3eee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 11, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 10, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 9, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 8, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 7, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 6, Pixel values: e822 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2208
	sta 1,S
	; Line 5, Pixel values: e882 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$8208
	sta 1,S
	; Line 4, Pixel values: e888 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: eee8 8822 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 1, Pixel values: eeee 8882 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 0, Pixel values: eeee 8888 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	jmp renderCharJumpReturn

font16char50:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 344e 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: e222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 8, Pixel values: e222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 7, Pixel values: ee22 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 6, Pixel values: eeee 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 5, Pixel values: eeee eeee e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	; Line 4, Pixel values: e888 222e 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: ee88 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char51:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23ee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 22ee e222 23ee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 8, Pixel values: eeee e222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 7, Pixel values: eeee e222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 6, Pixel values: eeee e222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 5, Pixel values: eeee e222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 4, Pixel values: eeee eeee e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	; Line 3, Pixel values: ee88 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: ee88 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: ee88 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	jmp renderCharJumpReturn

font16char52:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee e333 34ee 
	tsc
	sec
	sbc #8
	tcs
	lda 7,S
	and #$ff00
	ora #$0034
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3303
	sta 5,S
	; Line 14, Pixel values: eeee eeee e233 43ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0043
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3302
	sta 5,S
	; Line 13, Pixel values: eeee eeee e223 33ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2302
	sta 5,S
	; Line 12, Pixel values: eeee eeee e232 33ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3202
	sta 5,S
	; Line 11, Pixel values: 2222 2222 2222 233e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	; Line 10, Pixel values: 2222 2222 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: e822 22ee e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2208
	sta 1,S
	; Line 5, Pixel values: ee82 222e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8200
	sta 1,S
	; Line 4, Pixel values: ee88 222e e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 3, Pixel values: eee8 8222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 2, Pixel values: eee8 8822 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eee8 8888 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	jmp renderCharJumpReturn

font16char53:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 233e eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$3023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 22ee e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: eeee eeee e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	; Line 8, Pixel values: 2222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 5, Pixel values: e882 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$8208
	sta 1,S
	; Line 4, Pixel values: e888 2eee eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: ee88 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: ee88 8888 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	jmp renderCharJumpReturn

font16char54:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 233e eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$3023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 22ee e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2eee e222 22ee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $8288
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 4, Pixel values: e888 22ee ee22 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char55:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 14, Pixel values: eeee 2222 3eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0030
	sta 5,S
	; Line 13, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 12, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 11, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 10, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 9, Pixel values: eeee 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 8, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 7, Pixel values: eeee e222 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 6, Pixel values: eeee ee22 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 5, Pixel values: eeee eee2 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 4, Pixel values: eeee eeee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 3, Pixel values: 8888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char56:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23ee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: e222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 7, Pixel values: ee22 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 6, Pixel values: ee22 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 5, Pixel values: e882 222e 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8208
	sta 1,S
	; Line 4, Pixel values: e888 22ee e222 22ee 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: e888 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: ee88 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: eeee 8888 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	jmp renderCharJumpReturn

font16char57:
	tya
	tcs
	; Line 15, Pixel values: eeee ee22 23ee eeee 
	tsc
	sec
	sbc #8
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 14, Pixel values: eeee ee22 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 13, Pixel values: eeee ee22 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 12, Pixel values: eeee ee22 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 11, Pixel values: eeee eeee 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	; Line 10, Pixel values: eeee 2222 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	; Line 9, Pixel values: ee22 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 8, Pixel values: e222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 7, Pixel values: e222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 6, Pixel values: 8822 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 22ee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: e888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: e888 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: ee88 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: eeee 8888 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	jmp renderCharJumpReturn

font16char58:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #326
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: 8222 2eee eeee eeee 
	tsc
	sec
	sbc #318
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char59:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #166
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 2222 222e eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 11, Pixel values: e222 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 10, Pixel values: ee22 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: ee22 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: ee22 222e eeee eeee 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 6, Pixel values: ee22 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 5, Pixel values: ee82 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8200
	sta 1,S
	; Line 4, Pixel values: ee88 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 3, Pixel values: ee88 822e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char60:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char61:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 3eee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 11, Pixel values: 2222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 10, Pixel values: 2222 2222 2222 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: 2222 2222 2222 2eee 
	tsc
	sec
	sbc #314
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 5, Pixel values: 8882 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8288
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 4, Pixel values: 8888 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 3, Pixel values: 8888 8222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char62:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char63:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 14, Pixel values: eeee 2222 3eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0030
	sta 5,S
	; Line 13, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 12, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #316
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 9, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 8, Pixel values: eeee 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 7, Pixel values: eeee e222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 6, Pixel values: eeee e222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 5, Pixel values: eeee eee2 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 4, Pixel values: 8888 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: e888 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: e888 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 0, Pixel values: eee8 8888 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	jmp renderCharJumpReturn

font16char64:
	tya
	tcs
	; Line 15, Pixel values: eeee eeee eeee eeee 
	; Line 14, Pixel values: eeee eeee eeee eeee 
	; Line 13, Pixel values: eeee eeee eeee eeee 
	; Line 12, Pixel values: eeee eeee eeee eeee 
	; Line 11, Pixel values: eeee eeee eeee eeee 
	; Line 10, Pixel values: eeee eeee eeee eeee 
	; Line 9, Pixel values: eeee eeee eeee eeee 
	; Line 8, Pixel values: eeee eeee eeee eeee 
	; Line 7, Pixel values: eeee eeee eeee eeee 
	; Line 6, Pixel values: eeee eeee eeee eeee 
	; Line 5, Pixel values: eeee eeee eeee eeee 
	; Line 4, Pixel values: eeee eeee eeee eeee 
	; Line 3, Pixel values: eeee eeee eeee eeee 
	; Line 2, Pixel values: eeee eeee eeee eeee 
	; Line 1, Pixel values: eeee eeee eeee eeee 
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char65:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee ee33 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee ee23 333e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee ee32 334e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee ee22 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2222 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: 8822 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char66:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 233e eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$3023
	sta 5,S
	; Line 14, Pixel values: 2222 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	; Line 11, Pixel values: 2222 2eee 2222 233e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2eee e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2eee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2eee 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8288
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	; Line 1, Pixel values: 8888 8882 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	; Line 0, Pixel values: 8888 8888 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	pea $8888
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	jmp renderCharJumpReturn

font16char67:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 2333 eeee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	; Line 14, Pixel values: ee22 2222 3233 43ee 
	tsc
	sec
	sbc #156
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0043
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char68:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 eeee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	; Line 14, Pixel values: 2222 2222 3233 43ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0043
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 2eee e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee ee22 223e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8288
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2ee2 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	; Line 1, Pixel values: 8888 8882 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8288
	pea $8888
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 0, Pixel values: 8888 8888 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	pea $8888
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	jmp renderCharJumpReturn

font16char69:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 344e 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 8, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 7, Pixel values: 8222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2282
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 6, Pixel values: 8822 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2288
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 5, Pixel values: 8882 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: 8888 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char70:
	tya
	tcs
	; Line 15, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 14, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 12, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 11, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 8, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 7, Pixel values: 8222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2282
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 6, Pixel values: 8822 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2288
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 5, Pixel values: 8882 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: 8888 22ee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char71:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23e3 344e 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$f000
	ora #$0323
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char72:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee ee33 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee ee23 333e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee ee32 334e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee ee22 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	jmp renderCharJumpReturn

font16char73:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 3eee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 11, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 10, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 9, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 8, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 7, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 6, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 5, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 4, Pixel values: eeee 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 3, Pixel values: 8888 8222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	jmp renderCharJumpReturn

font16char74:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23ee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee ee22 223e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 6, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 5, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 4, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 3, Pixel values: eeee 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: eeee 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: eeee 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: eeee 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char75:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 3444 
	pea $4434
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee e233 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3302
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2ee2 2232 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 11, Pixel values: 2222 2e22 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 10, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 9, Pixel values: 2222 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 8, Pixel values: 2222 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 7, Pixel values: 8222 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2282
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	; Line 6, Pixel values: 8822 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2288
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 5, Pixel values: 8882 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $8288
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 4, Pixel values: 8888 2e22 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 3, Pixel values: 8888 8ee2 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0280
	sta 3,S
	; Line 2, Pixel values: 8888 8eee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char76:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 344e 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char77:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee ee33 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee ee23 333e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee ee32 334e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2ee2 ee22 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 10, Pixel values: 2222 2e22 2e22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 5, Pixel values: 8882 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 4, Pixel values: 8888 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 3, Pixel values: 8888 822e 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	; Line 2, Pixel values: 8888 88ee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0088
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 eeee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	jmp renderCharJumpReturn

font16char78:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee ee33 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee e223 333e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2302
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee e232 334e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2eee 2222 233e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2ee2 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 9, Pixel values: 2222 2e22 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 6, Pixel values: 8822 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 5, Pixel values: 8882 2222 2e22 222e 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	; Line 4, Pixel values: 8888 2222 ee22 222e 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	; Line 3, Pixel values: 8888 822e ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	; Line 2, Pixel values: 8888 88ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0088
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	jmp renderCharJumpReturn

font16char79:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23ee eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee ee22 223e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char80:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 10, Pixel values: 2222 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 9, Pixel values: 2222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 7, Pixel values: 8222 2eee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2282
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	jmp renderCharJumpReturn

font16char81:
	tya
	tcs
	; Line 15, Pixel values: eeee 2222 23e3 344e 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$f000
	ora #$0323
	sta 5,S
	; Line 14, Pixel values: ee22 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: e222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 11, Pixel values: 2222 222e 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 22ee 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2ee2 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 8, Pixel values: 2222 2ee2 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 7, Pixel values: 8222 2eee 2e22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 22ee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: e888 222e e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 3, Pixel values: e888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: ee88 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 1, Pixel values: eee8 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0800
	sta 1,S
	; Line 0, Pixel values: eeee e888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$8808
	sta 3,S
	jmp renderCharJumpReturn

font16char82:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 3444 
	pea $4434
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2eee e233 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3302
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2eee 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2ee2 2232 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 11, Pixel values: 2222 2e22 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 10, Pixel values: 2222 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 9, Pixel values: 2222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 7, Pixel values: 8222 2ee2 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2282
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 6, Pixel values: 8822 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	jmp renderCharJumpReturn

font16char83:
	tya
	tcs
	; Line 15, Pixel values: eee2 2222 2333 eeee 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 14, Pixel values: e222 2222 3233 43ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0043
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 22ee e222 233e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 10, Pixel values: 2222 2eee ee22 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: eeee eeee e222 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	; Line 8, Pixel values: ee22 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 7, Pixel values: e222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 6, Pixel values: 8822 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 22ee e222 22ee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: e888 8222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 2, Pixel values: e888 8822 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8808
	sta 1,S
	; Line 1, Pixel values: ee88 8882 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$8800
	sta 1,S
	; Line 0, Pixel values: eeee 8888 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $8888
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	jmp renderCharJumpReturn

font16char84:
	tya
	tcs
	; Line 15, Pixel values: eeee e222 23ee eeee 
	tsc
	sec
	sbc #8
	tcs
	lda 5,S
	and #$ff00
	ora #$0023
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 14, Pixel values: eeee e222 32ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0032
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 13, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 12, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 11, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 10, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 9, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 8, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 7, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 6, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 5, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 4, Pixel values: eeee e222 22ee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char85:
	tya
	tcs
	; Line 15, Pixel values: eee2 2222 233e eeee 
	tsc
	sec
	sbc #4
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$3023
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 14, Pixel values: e222 2222 3233 4eee 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0040
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 13, Pixel values: e222 2222 2223 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: 2222 2222 2232 33ee 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0033
	sta 7,S
	; Line 11, Pixel values: 2222 2222 2222 233e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	; Line 10, Pixel values: 2222 22ee e222 323e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2eee ee22 223e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	jmp renderCharJumpReturn

font16char86:
	tya
	tcs
	; Line 15, Pixel values: eee2 222e eeee eeee 
	tsc
	sec
	sbc #8
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 14, Pixel values: e222 2222 3eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0030
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 13, Pixel values: e222 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 12, Pixel values: 2222 2222 223e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	lda 5,S
	and #$0f00
	ora #$3022
	sta 5,S
	; Line 11, Pixel values: 2222 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 10, Pixel values: 2222 2222 2222 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	; Line 9, Pixel values: 2222 2ee2 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 8, Pixel values: 2222 2eee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2eee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8eee eeee eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char87:
	tya
	tcs
	; Line 15, Pixel values: 2222 2eee ee33 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 22ee e233 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$3302
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 222e 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: 2222 2222 2222 233e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3023
	sta 7,S
	; Line 10, Pixel values: 2222 2222 2222 323e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3032
	sta 7,S
	; Line 9, Pixel values: 2222 2222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 8, Pixel values: 2222 2222 2222 223e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3022
	sta 7,S
	; Line 7, Pixel values: 8222 2e22 2e22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$000f
	ora #$2220
	sta 5,S
	lda 3,S
	and #$000f
	ora #$2220
	sta 3,S
	; Line 6, Pixel values: 8822 2ee2 ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$f00f
	ora #$0220
	sta 3,S
	; Line 5, Pixel values: 8882 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn

font16char88:
	tya
	tcs
	; Line 15, Pixel values: 2222 eeee eee3 344e 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0300
	sta 5,S
	; Line 14, Pixel values: 2222 2eee ee33 434e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$3300
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 22ee e223 333e 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2302
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 12, Pixel values: 2222 222e 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	tsc
	dec
	dec
	tcs
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 11, Pixel values: e222 2222 2222 23ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0023
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 10, Pixel values: ee22 2222 2222 3eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0030
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: eee2 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 8, Pixel values: eeee 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 7, Pixel values: eee2 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 6, Pixel values: ee22 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 5, Pixel values: e882 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$8208
	sta 1,S
	; Line 4, Pixel values: 8888 222e 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 3, Pixel values: 8888 82ee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0082
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 eeee eee2 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0200
	sta 5,S
	; Line 0, Pixel values: eeee eeee eeee eeee 
	jmp renderCharJumpReturn

font16char89:
	tya
	tcs
	; Line 15, Pixel values: eeee ee22 233e eeee 
	tsc
	sec
	sbc #8
	tcs
	lda 5,S
	and #$0f00
	ora #$3023
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 14, Pixel values: eeee ee22 323e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$3032
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 13, Pixel values: eeee ee22 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 12, Pixel values: eeee ee22 223e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$3022
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 11, Pixel values: eeee ee22 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 10, Pixel values: eeee 2222 222e eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	; Line 9, Pixel values: ee22 2222 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 8, Pixel values: e222 2222 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 7, Pixel values: e222 2222 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 6, Pixel values: 8822 222e 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	pea $2288
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 5, Pixel values: 8882 22ee e222 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$2202
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: 8888 2eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8eee ee22 222e 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: eeee eeee ee22 222e 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$2200
	sta 5,S
	jmp renderCharJumpReturn

font16char90:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 344e 
	tsc
	dec
	dec
	tcs
	pea $3323
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4034
	sta 7,S
	; Line 14, Pixel values: 2222 2222 3233 434e 
	tsc
	sec
	sbc #154
	tcs
	pea $3332
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4043
	sta 7,S
	; Line 13, Pixel values: 2222 2222 2223 333e 
	tsc
	sec
	sbc #154
	tcs
	pea $2322
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$3033
	sta 7,S
	; Line 12, Pixel values: 2222 2222 2232 334e 
	tsc
	sec
	sbc #154
	tcs
	pea $3222
	pea $2222
	pea $2222
	lda 7,S
	and #$0f00
	ora #$4033
	sta 7,S
	; Line 11, Pixel values: e222 222e eeee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$2202
	sta 1,S
	; Line 10, Pixel values: ee22 2222 eeee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$2200
	sta 1,S
	; Line 9, Pixel values: eee2 2222 2eee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$0020
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0200
	sta 1,S
	; Line 8, Pixel values: eeee 2222 22ee eeee 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$0022
	sta 5,S
	; Line 7, Pixel values: eeee e222 222e eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$2022
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$2202
	sta 3,S
	; Line 6, Pixel values: eeee ee22 2222 eeee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$2200
	sta 3,S
	; Line 5, Pixel values: eeee eee2 2222 2eee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$0020
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 4, Pixel values: eeee eeee 2222 22ee 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$0022
	sta 7,S
	; Line 3, Pixel values: 8888 8222 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2282
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 2, Pixel values: 8888 8822 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 1, Pixel values: 8888 8882 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8288
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	; Line 0, Pixel values: 8888 8888 2222 222e 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $8888
	pea $8888
	lda 7,S
	and #$0f00
	ora #$2022
	sta 7,S
	jmp renderCharJumpReturn

font16char91:
	tya
	tcs
	; Line 15, Pixel values: 2444 4444 4444 4442 
	pea $4244
	pea $4444
	pea $4444
	pea $4424
	; Line 14, Pixel values: 4244 4444 4444 4424 
	tsc
	sec
	sbc #152
	tcs
	pea $2444
	pea $4444
	pea $4444
	pea $4442
	; Line 13, Pixel values: 4424 4444 4444 4244 
	tsc
	sec
	sbc #152
	tcs
	pea $4442
	pea $4444
	pea $4444
	pea $2444
	; Line 12, Pixel values: 4442 4444 4444 2444 
	tsc
	sec
	sbc #152
	tcs
	pea $4424
	pea $4444
	pea $4444
	pea $4244
	; Line 11, Pixel values: 4444 2444 4442 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4244
	pea $4424
	pea $4444
	; Line 10, Pixel values: 4444 4244 4424 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $2444
	pea $4442
	pea $4444
	; Line 9, Pixel values: 4444 4424 4244 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4442
	pea $2444
	pea $4444
	; Line 8, Pixel values: 4444 4442 2444 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4424
	pea $4244
	pea $4444
	; Line 7, Pixel values: 4444 4442 2444 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4424
	pea $4244
	pea $4444
	; Line 6, Pixel values: 4444 4424 4244 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4442
	pea $2444
	pea $4444
	; Line 5, Pixel values: 4444 4244 4424 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $2444
	pea $4442
	pea $4444
	; Line 4, Pixel values: 4444 2444 4442 4444 
	tsc
	sec
	sbc #152
	tcs
	pea $4444
	pea $4244
	pea $4424
	pea $4444
	; Line 3, Pixel values: 4442 4444 4444 2444 
	tsc
	sec
	sbc #152
	tcs
	pea $4424
	pea $4444
	pea $4444
	pea $4244
	; Line 2, Pixel values: 4424 4444 4444 4244 
	tsc
	sec
	sbc #152
	tcs
	pea $4442
	pea $4444
	pea $4444
	pea $2444
	; Line 1, Pixel values: 4244 4444 4444 4424 
	tsc
	sec
	sbc #152
	tcs
	pea $2444
	pea $4444
	pea $4444
	pea $4442
	; Line 0, Pixel values: 2444 4444 4444 4442 
	tsc
	sec
	sbc #152
	tcs
	pea $4244
	pea $4444
	pea $4444
	pea $4424
	jmp renderCharJumpReturn

