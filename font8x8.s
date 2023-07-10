characterJumpTable:
	.addr char32
	.addr char33
	.addr char34
	.addr char35
	.addr char36
	.addr char37
	.addr char38
	.addr char39
	.addr char40
	.addr char41
	.addr char42
	.addr char43
	.addr char44
	.addr char45
	.addr char46
	.addr char47
	.addr char48
	.addr char49
	.addr char50
	.addr char51
	.addr char52
	.addr char53
	.addr char54
	.addr char55
	.addr char56
	.addr char57
	.addr char58
	.addr char59
	.addr char60
	.addr char61
	.addr char62
	.addr char63
	.addr char64
	.addr char65
	.addr char66
	.addr char67
	.addr char68
	.addr char69
	.addr char70
	.addr char71
	.addr char72
	.addr char73
	.addr char74
	.addr char75
	.addr char76
	.addr char77
	.addr char78
	.addr char79
	.addr char80
	.addr char81
	.addr char82
	.addr char83
	.addr char84
	.addr char85
	.addr char86
	.addr char87
	.addr char88
	.addr char89
	.addr char90
	.addr char91
	.addr char92
	.addr char93
	.addr char94
	.addr char95
	.addr char96
	.addr char97
	.addr char98
	.addr char99
	.addr char100
	.addr char101
	.addr char102
	.addr char103
	.addr char104
	.addr char105
	.addr char106
	.addr char107
	.addr char108
	.addr char109
	.addr char110
	.addr char111

char32:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char33:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,a,d,e,e,e
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
	; Line 2, Pixel values: e,e,e,a,a,e,e,e
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
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,e,f,f,e,e,e
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
	jmp renderCharJumpReturn

char34:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,f,f,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$f00f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char35:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,b,a,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,e,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$f00f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char36:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,e,e,e,e
	tsc
	dec
	dec
	tcs
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
	; Line 5, Pixel values: f,a,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,e,d,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
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
	; Line 3, Pixel values: e,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,f,e,e,e,e
	tsc
	dec
	dec
	tcs
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
	jmp renderCharJumpReturn

char37:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char38:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char39:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,a,a,e,e,e
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
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,e,f,f,e,e,e
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
	jmp renderCharJumpReturn

char40:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,b,a,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,b,b,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,f,f,e,e,e
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
	jmp renderCharJumpReturn

char41:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,f,f,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ff00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char42:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,a,e,d,e,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$fff0
	ora #$000d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0f0
	ora #$0d0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,a,d,d,e,e,e
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
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,a,a,a,e,e,e
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
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,e,b,e,a,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$fff0
	ora #$000a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f0f0
	ora #$0b0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char43:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,a,a,e,e,e
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
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char44:
	tya
	tcs
	; Line 7, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char45:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char46:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char47:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 3, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,d,d
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char48:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,a,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,a,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char49:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,a,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,b,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,f,f,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ff00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char50:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,a,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	tcs
	pea $adfb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: e,e,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char51:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char52:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $adfb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: f,b,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char53:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,e,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char54:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char55:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,d,d,d,e,e,e
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
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,d,d,d,e,e,e
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
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,a,d,d,e,e,e
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
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
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
	; Line 2, Pixel values: e,e,e,e,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char56:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char57:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char58:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,a,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,b,b,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char59:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,a,a,e,e,e
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
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char60:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,a,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,e,e,e,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char61:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,a,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char62:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,b,b,e,e,e
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
	; Line 0, Pixel values: e,f,f,f,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char63:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 3, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ff00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char64:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,a,d,e,e,e,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0fff
	ora #$d000
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,b,a,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,e,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$ff00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char65:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,a,a,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char66:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char67:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char68:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char69:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char70:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char71:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char72:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char73:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 3, Pixel values: e,e,e,a,d,e,e,e
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
	; Line 2, Pixel values: e,e,e,a,a,e,e,e
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
	; Line 1, Pixel values: e,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char74:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,e,e,e
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
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char75:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,d,d,e,e,e
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
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,a,a,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: f,b,e,b,b,e,e,e
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
	and #$f000
	ora #$0bfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char76:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char77:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,d,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,a,a,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: f,b,b,e,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char78:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,a,a,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: f,b,b,e,b,a,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char79:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char80:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char81:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,e,d,d
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$000f
	ora #$ddd0
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char82:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,e,e,e
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
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char83:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,e,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,b,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: e,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ff0f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char84:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,e,e,e
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
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char85:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,d,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char86:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,d,d,d,e,e,e
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
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,a,d,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,a,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: f,b,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char87:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: f,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $adfb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,e,a,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,e,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char88:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,e,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: f,a,d,e,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,b,a,d,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,a,a,d,e,e,e
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
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,a,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: f,b,b,e,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: f,f,e,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ff
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char89:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 5, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 4, Pixel values: e,e,e,d,d,e,e,e
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
	; Line 3, Pixel values: e,e,a,a,d,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00dd
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,b,a,e,e,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,b,b,e,e,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,f,f,e,e,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00f
	sta 0,S
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0ff0
	ora #$f00f
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char90:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: e,b,a,d,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,a,a,d,e,e,e
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
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,a,a,d,e,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
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
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char91:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: f,f,f,f,f,f,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: b,b,b,b,b,b,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0bb
	sta 0,S
	tsc
	dec
	tcs
	pea $bbbb
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: a,a,a,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,a,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char92:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char93:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,a,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: a,a,a,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: b,b,b,b,b,b,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0bb
	sta 0,S
	tsc
	dec
	tcs
	pea $bbbb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char94:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char95:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: a,a,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: b,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aabb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char96:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: d,d,d,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,a,a,b,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char97:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,d,a,a,b,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,d,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: d,d,d,a,a,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char98:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: b,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aabb
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: a,a,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aaaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char99:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,d,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddad
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: f,a,d,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $ddfa
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: f,b,a,d,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $adfb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: f,b,a,a,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: f,b,b,b,b,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bbfb
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,f,f,f,f,f,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffff
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char100:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: a,f,f,f,f,f,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ff
	sta 0,S
	tsc
	dec
	tcs
	pea $ffaf
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,a,b,b,b,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0bb
	sta 0,S
	tsc
	dec
	tcs
	pea $bbda
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,d,a,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $aadd
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,d,d,d,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,d,d,d,a,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0da
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,d,d,d,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $dddd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char101:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: b,f,b,a,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	tcs
	pea $babf
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: a,b,f,b,a,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $fbab
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,b,f,b,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bfaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: d,a,a,b,f,b,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	dec
	tcs
	pea $abda
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: d,d,a,a,b,f,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0bf
	sta 0,S
	tsc
	dec
	tcs
	pea $aadd
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char102:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: d,d,d,a,a,b,f,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$f0ab
	sta 0,S
	tsc
	dec
	tcs
	pea $dadd
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: d,d,a,a,b,f,b,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$b0bf
	sta 0,S
	tsc
	dec
	tcs
	pea $aadd
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: d,a,a,b,f,b,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	dec
	tcs
	pea $abda
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: a,a,b,f,b,a,a,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$a0ba
	sta 0,S
	tsc
	dec
	tcs
	pea $bfaa
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: a,b,f,b,a,a,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0aa
	sta 0,S
	tsc
	dec
	tcs
	pea $fbab
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: b,f,b,a,a,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0ad
	sta 0,S
	tsc
	dec
	tcs
	pea $babf
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: f,b,a,a,d,d,d,e
	tsc
	dec
	dec
	tcs
	lda 0,S
	and #$0f00
	ora #$d0dd
	sta 0,S
	tsc
	dec
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char103:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char104:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char105:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char106:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char107:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char108:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char109:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char110:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char111:
	tya
	tcs
	; Line 7, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: e,e,e,e,e,e,e,e
	tsc
	dec
	dec
	tcs
	tsc
	dec
	dec
	tcs
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

