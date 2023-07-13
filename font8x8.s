font8characterJumpTable:
	.addr font8char32
	.addr font8char33
	.addr font8char34
	.addr font8char35
	.addr font8char36
	.addr font8char37
	.addr font8char38
	.addr font8char39
	.addr font8char40
	.addr font8char41
	.addr font8char42
	.addr font8char43
	.addr font8char44
	.addr font8char45
	.addr font8char46
	.addr font8char47
	.addr font8char48
	.addr font8char49
	.addr font8char50
	.addr font8char51
	.addr font8char52
	.addr font8char53
	.addr font8char54
	.addr font8char55
	.addr font8char56
	.addr font8char57
	.addr font8char58
	.addr font8char59
	.addr font8char60
	.addr font8char61
	.addr font8char62
	.addr font8char63
	.addr font8char64
	.addr font8char65
	.addr font8char66
	.addr font8char67
	.addr font8char68
	.addr font8char69
	.addr font8char70
	.addr font8char71
	.addr font8char72
	.addr font8char73
	.addr font8char74
	.addr font8char75
	.addr font8char76
	.addr font8char77
	.addr font8char78
	.addr font8char79
	.addr font8char80
	.addr font8char81
	.addr font8char82
	.addr font8char83
	.addr font8char84
	.addr font8char85
	.addr font8char86
	.addr font8char87
	.addr font8char88
	.addr font8char89
	.addr font8char90
	.addr font8char91
	.addr font8char92
	.addr font8char93
	.addr font8char94
	.addr font8char95
	.addr font8char96
	.addr font8char97
	.addr font8char98
	.addr font8char99
	.addr font8char100
	.addr font8char101
	.addr font8char102
	.addr font8char103
	.addr font8char104
	.addr font8char105
	.addr font8char106
	.addr font8char107
	.addr font8char108
	.addr font8char109
	.addr font8char110
	.addr font8char111

; Chroma Key is $e

font8char32:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char33:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeea deee 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: eeea aeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeef feee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn

font8char34:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: ebae edde 
	tsc
	sec
	sbc #804
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: ebbe eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: effe efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$f00f
	sta 1,S
	jmp renderCharJumpReturn

font8char35:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: edde ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$d00d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: ebae ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: ebae ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: ebae adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: effe ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$f00f
	sta 1,S
	jmp renderCharJumpReturn

font8char36:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: fadd ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 4, Pixel values: eeed edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: ebaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: fbea eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$f000
	ora #$0afb
	sta 1,S
	; Line 1, Pixel values: ebbb bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: eeef eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn

font8char37:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char38:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char39:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeea aeee 
	tsc
	sec
	sbc #804
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeef feee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn

font8char40:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eedd eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 4, Pixel values: ebae eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: ebae eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: ebae eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: eebb eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 0, Pixel values: eeef feee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn

font8char41:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eedd eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 3, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeff eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn

font8char42:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eaed edee 
	tsc
	sec
	sbc #324
	tcs
	lda 3,S
	and #$fff0
	ora #$000d
	sta 3,S
	lda 1,S
	and #$f0f0
	ora #$0d0a
	sta 1,S
	; Line 4, Pixel values: eead deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ad00
	sta 1,S
	; Line 3, Pixel values: ebaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: eeaa aeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: ebeb eaee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$000a
	sta 3,S
	lda 1,S
	and #$f0f0
	ora #$0b0b
	sta 1,S
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char43:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: ebad ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ad0b
	sta 1,S
	; Line 3, Pixel values: ebaa ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: eeea aeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char44:
	tya
	tcs
	; Line 7, Pixel values: eedd eeee 
	tsc
	sec
	sbc #4
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char45:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: ebaa ddde 
	tsc
	sec
	sbc #644
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char46:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char47:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: edde eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$0ff0
	ora #$d00d
	sta 1,S
	; Line 5, Pixel values: eedd eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 4, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: eeee eedd 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$00ff
	ora #$dd00
	sta 3,S
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char48:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbae edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$a0fb
	sta 1,S
	; Line 3, Pixel values: fbea edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0afb
	sta 1,S
	; Line 2, Pixel values: fbee adde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char49:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 4, Pixel values: eead eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ad00
	sta 1,S
	; Line 3, Pixel values: eeaa eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: eeaa eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: ebbb eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: eeff eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn

font8char50:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbad eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $adfb
	; Line 3, Pixel values: eeaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: eeee adde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char51:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 3, Pixel values: ebaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char52:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbad ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: fbee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char53:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: eeee ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffae 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char54:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char55:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eedd deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 5, Pixel values: eedd deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 4, Pixel values: eead deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ad00
	sta 1,S
	; Line 3, Pixel values: eeea ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: eeee adde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffae 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char56:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: ebaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char57:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char58:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eedd eeee 
	tsc
	sec
	sbc #324
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 4, Pixel values: eead eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ad00
	sta 1,S
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeaa eeee 
	tsc
	sec
	sbc #320
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: eebb eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char59:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eedd eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeea aeee 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char60:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee ddde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eead eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ad00
	sta 1,S
	; Line 3, Pixel values: ebae eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: eeaa eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: eeee ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char61:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: ebad ddde 
	tsc
	sec
	sbc #484
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ad0b
	sta 1,S
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: ebaa adde 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char62:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 3, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 2, Pixel values: eeee adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	; Line 1, Pixel values: eeeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 0, Pixel values: efff eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char63:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeed deee 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: ebbe eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: eeff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn

font8char64:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eedd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 5, Pixel values: eade eede 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0fff
	ora #$d000
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$d00a
	sta 1,S
	; Line 4, Pixel values: ebae eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: ebae ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: ebae adde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: ebbe eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: eeff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn

font8char65:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: ebad ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ad0b
	sta 1,S
	; Line 3, Pixel values: ebae edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: eeaa edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: eebb bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 0, Pixel values: eeee ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char66:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char67:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char68:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char69:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char70:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #318
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffae 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char71:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char72:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa edde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbee eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char73:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: eadd ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0a
	sta 1,S
	; Line 4, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: eeea deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: eeea aeee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: ebbb bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: efff ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char74:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 4, Pixel values: fbee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: eeee adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	; Line 1, Pixel values: ebbb bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: efff ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char75:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0dfb
	sta 1,S
	; Line 3, Pixel values: fbaa eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	; Line 2, Pixel values: fbaa eeee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	; Line 1, Pixel values: fbeb beee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0bfb
	sta 1,S
	; Line 0, Pixel values: ffee ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char76:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char77:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbed edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0dfb
	sta 1,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbaa adde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 1, Pixel values: fbbe bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char78:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbed ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0dfb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: fbaa adee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	; Line 1, Pixel values: fbbe baee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fb
	sta 1,S
	; Line 0, Pixel values: ffee ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char79:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char80:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee eeee 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn

font8char81:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd dedd 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$000f
	ora #$ddd0
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char82:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: faee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa ddee 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff feee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn

font8char83:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddee 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: eeee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	; Line 3, Pixel values: ebaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: fbee eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: efff ffae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn

font8char84:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 5, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 4, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 3, Pixel values: eeee ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	; Line 2, Pixel values: eeee adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	; Line 1, Pixel values: fbbb baee 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 0, Pixel values: ffff feee 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn

font8char85:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eddd ddee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0d
	sta 1,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbee eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char86:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eedd deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$dd00
	sta 1,S
	; Line 5, Pixel values: eadd ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$dd0a
	sta 1,S
	; Line 4, Pixel values: fbae ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$a0fb
	sta 1,S
	; Line 3, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fbee edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbee eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char87:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: fade ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$d0fa
	sta 1,S
	; Line 4, Pixel values: fbad ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbea edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0afb
	sta 1,S
	; Line 1, Pixel values: fbee eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char88:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: adee edde 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ad
	sta 1,S
	; Line 5, Pixel values: fade ddde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$d0fa
	sta 1,S
	; Line 4, Pixel values: ebad ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ad0b
	sta 1,S
	; Line 3, Pixel values: eeaa deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: ebaa adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 1, Pixel values: fbbe bade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fb
	sta 1,S
	; Line 0, Pixel values: ffee efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn

font8char89:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeed deee 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 5, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 4, Pixel values: eeed deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0d00
	sta 1,S
	; Line 3, Pixel values: eeaa ddee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00dd
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: ebae edde 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00d
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: ebbe eade 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$d00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: effe efae 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$a00f
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$f00f
	sta 1,S
	jmp renderCharJumpReturn

font8char90:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: ebad eeee 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$ad0b
	sta 1,S
	; Line 3, Pixel values: eeaa deee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00d0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: eeea adee 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ad
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffae 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char91:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: ffff fffe 
	tsc
	sec
	sbc #162
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	; Line 5, Pixel values: bbbb bbbe 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: aaaa aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 3, Pixel values: aaaa aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 1, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 0, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char92:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 1, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 0, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char93:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: dddd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: aaaa aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: aaaa aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 1, Pixel values: bbbb bbbe 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 0, Pixel values: ffff fffe 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char94:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: ddda abfe 
	tsc
	sec
	sbc #162
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 4, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 3, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 2, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 1, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 0, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn

font8char95:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: dddd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: aaaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: aaaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 1, Pixel values: bbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 0, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char96:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: dddd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: ddda aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: ddda aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 1, Pixel values: ddda abbe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 0, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn

font8char97:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: ddda abfe 
	tsc
	sec
	sbc #162
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: ddda abbe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 4, Pixel values: ddda aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 3, Pixel values: ddda aaae 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 1, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 0, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char98:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: bbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: aaaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: aaaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 1, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 0, Pixel values: dddd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char99:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: addd ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $ddad
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: fadd ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $ddfa
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 4, Pixel values: fbad ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $adfb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 3, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 2, Pixel values: fbaa adde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 1, Pixel values: fbbb bade 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$d0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffae 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn

font8char100:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: afff fffe 
	tsc
	sec
	sbc #162
	tcs
	pea $ffaf
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	; Line 5, Pixel values: dabb bbfe 
	tsc
	sec
	sbc #158
	tcs
	pea $bbda
	lda 3,S
	and #$0f00
	ora #$f0bb
	sta 3,S
	; Line 4, Pixel values: ddaa abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 3, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 2, Pixel values: dddd abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 1, Pixel values: dddd dafe 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$f0da
	sta 3,S
	; Line 0, Pixel values: dddd ddae 
	tsc
	sec
	sbc #158
	tcs
	pea $dddd
	lda 3,S
	and #$0f00
	ora #$a0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char101:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #162
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	; Line 5, Pixel values: bfba adde 
	tsc
	sec
	sbc #158
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 4, Pixel values: abfb aade 
	tsc
	sec
	sbc #158
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$d0aa
	sta 3,S
	; Line 3, Pixel values: aabf baae 
	tsc
	sec
	sbc #158
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	; Line 2, Pixel values: daab fbae 
	tsc
	sec
	sbc #158
	tcs
	pea $abda
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	; Line 1, Pixel values: ddaa bfbe 
	tsc
	sec
	sbc #158
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	; Line 0, Pixel values: ddda abfe 
	tsc
	sec
	sbc #158
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn

font8char102:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: ddda abfe 
	tsc
	sec
	sbc #162
	tcs
	pea $dadd
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: ddaa bfbe 
	tsc
	sec
	sbc #158
	tcs
	pea $aadd
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	; Line 4, Pixel values: daab fbae 
	tsc
	sec
	sbc #158
	tcs
	pea $abda
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	; Line 3, Pixel values: aabf baae 
	tsc
	sec
	sbc #158
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	; Line 2, Pixel values: abfb aade 
	tsc
	sec
	sbc #158
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$d0aa
	sta 3,S
	; Line 1, Pixel values: bfba adde 
	tsc
	sec
	sbc #158
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$d0ad
	sta 3,S
	; Line 0, Pixel values: fbaa ddde 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$d0dd
	sta 3,S
	jmp renderCharJumpReturn

font8char103:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char104:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char105:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char106:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char107:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char108:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char109:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char110:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

font8char111:
	tya
	tcs
	; Line 7, Pixel values: eeee eeee 
	; Line 6, Pixel values: eeee eeee 
	; Line 5, Pixel values: eeee eeee 
	; Line 4, Pixel values: eeee eeee 
	; Line 3, Pixel values: eeee eeee 
	; Line 2, Pixel values: eeee eeee 
	; Line 1, Pixel values: eeee eeee 
	; Line 0, Pixel values: eeee eeee 
	jmp renderCharJumpReturn

