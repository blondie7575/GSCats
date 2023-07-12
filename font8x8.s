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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char33:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeea deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeea aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeef feee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00f0
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: ebae edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbe eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: effe efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: edde ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: ebae ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebae ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: ebae adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: effe ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eeed edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbea eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbb bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeef eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char38:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char39:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeea aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeef feee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00f0
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: ebae eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebae eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: ebae eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eebb eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeef feee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00f0
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeff eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eaed edee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$fff0
	ora #$000d
	sta 2,S
	lda 0,S
	and #$f0f0
	ora #$0d0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eead deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeaa aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebeb eaee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$fff0
	ora #$000a
	sta 2,S
	lda 0,S
	and #$f0f0
	ora #$0b0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char43:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: ebad ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeea aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char44:
	tya
	tcs
	; Line 7, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char45:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: ebaa ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char46:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char47:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: edde eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$d00d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeee eedd
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$00ff
	ora #$dd00
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char48:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbae edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbea edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee adde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ad
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eead eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeaa eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeaa eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbb eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeff eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbad eeee
	tsc
	sec
	sbc #3
	tcs
	pea $adfb
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: eeaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char51:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char52:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbad ddde
	tsc
	sec
	sbc #3
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: fbee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eeee ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffae
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char54:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eedd deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eedd deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eead deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeea ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffae
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char56:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eead eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeaa eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eebb eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char59:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eedd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeea aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char60:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eead eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$ad00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebae eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeaa eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char61:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: ebad ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: ebaa adde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ad
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char62:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eeeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0b00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: efff eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbe eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eedd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eade eede
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0fff
	ora #$d000
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$d00a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: ebae eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebae ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: ebae adde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ad
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbe eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: ebad ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebae edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeaa edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: eebb bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$bb00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: eeee ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	jmp renderCharJumpReturn

char66:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char67:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char69:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffae
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char71:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa edde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eadd ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeea deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeea aeee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00a0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbb bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: efff ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbb bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$bb0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: efff ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa eeee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbaa eeee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: fbeb beee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00b0
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0bfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee eeee
	tsc
	sec
	sbc #4
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbed edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbaa adde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: fbbe bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbed ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0dfb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbaa adee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: fbbe baee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ba
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char81:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd dedd
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$000f
	ora #$ddd0
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: faee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbaa ddee
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff feee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char83:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddee
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: eeee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: ebaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: efff ffae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$a0ff
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeee ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeee adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb baee
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff feee
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char85:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eddd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0d
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eedd deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$dd00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eadd ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$dd0a
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbae ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$a0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: fbee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fade ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$d0fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: fbad ddde
	tsc
	sec
	sbc #3
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbea edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$f000
	ora #$0afb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbee eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: adee edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$ff00
	ora #$00ad
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: fade ddde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0dd
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$d0fa
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: ebad ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeaa deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: ebaa adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	lda 0,S
	and #$00f0
	ora #$aa0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbe bade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0f00
	ora #$d0ba
	sta 2,S
	lda 0,S
	and #$0f00
	ora #$b0fb
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: ffee efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 5, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 4, Pixel values: eeed deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0d00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeaa ddee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00dd
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: ebae edde
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00d
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$a00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: ebbe eade
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$d00a
	sta 2,S
	lda 0,S
	and #$0ff0
	ora #$b00b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 0, Pixel values: effe efae
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$0ff0
	ora #$a00f
	sta 2,S
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
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: ebad eeee
	tsc
	sec
	sbc #4
	tcs
	lda 0,S
	and #$00f0
	ora #$ad0b
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 3, Pixel values: eeaa deee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff0f
	ora #$00d0
	sta 2,S
	lda 0,S
	and #$00ff
	ora #$aa00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 2, Pixel values: eeea adee
	tsc
	sec
	sbc #4
	tcs
	lda 2,S
	and #$ff00
	ora #$00ad
	sta 2,S
	lda 0,S
	and #$f0ff
	ora #$0a00
	sta 0,S
	tsc
	sec
	sbc #156
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffae
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char91:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: ffff fffe
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: bbbb bbbe
	tsc
	sec
	sbc #3
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: aaaa aaae
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aaaa aaae
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char92:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char93:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aaaa aaae
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: aaaa aaae
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: bbbb bbbe
	tsc
	sec
	sbc #3
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff fffe
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char94:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char95:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aaaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: aaaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: bbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char96:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: ddda aaae
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: ddda aaae
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: ddda abbe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char97:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: ddda abbe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: ddda aaae
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: ddda aaae
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char98:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: bbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: aaaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aaaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: dddd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char99:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: addd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: fadd ddde
	tsc
	sec
	sbc #3
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: fbad ddde
	tsc
	sec
	sbc #3
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: fbaa adde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: fbbb bade
	tsc
	sec
	sbc #3
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ffff ffae
	tsc
	sec
	sbc #3
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char100:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: afff fffe
	tsc
	sec
	sbc #3
	tcs
	pea $ffaf
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: dabb bbfe
	tsc
	sec
	sbc #3
	tcs
	pea $bbda
	lda 3,S
	and #$0f00
	ora #$f0bb
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: ddaa abfe
	tsc
	sec
	sbc #3
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: dddd abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: dddd dafe
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$f0da
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: dddd ddae
	tsc
	sec
	sbc #3
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$a0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char101:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: bfba adde
	tsc
	sec
	sbc #3
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: abfb aade
	tsc
	sec
	sbc #3
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$d0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aabf baae
	tsc
	sec
	sbc #3
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: daab fbae
	tsc
	sec
	sbc #3
	tcs
	pea $abda
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: ddaa bfbe
	tsc
	sec
	sbc #3
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char102:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: ddda abfe
	tsc
	sec
	sbc #3
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 5, Pixel values: ddaa bfbe
	tsc
	sec
	sbc #3
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 4, Pixel values: daab fbae
	tsc
	sec
	sbc #3
	tcs
	pea $abda
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 3, Pixel values: aabf baae
	tsc
	sec
	sbc #3
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 2, Pixel values: abfb aade
	tsc
	sec
	sbc #3
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$d0aa
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 1, Pixel values: bfba adde
	tsc
	sec
	sbc #3
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	; Line 0, Pixel values: fbaa ddde
	tsc
	sec
	sbc #3
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	tsc
	sec
	sbc #155
	tcs
	jmp renderCharJumpReturn

char103:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char104:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char105:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char106:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char107:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char108:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char109:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char110:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

char111:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 6, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 5, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 4, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 3, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 2, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 1, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	; Line 0, Pixel values: eeee eeee
	tsc
	sec
	sbc #160
	tcs
	jmp renderCharJumpReturn

