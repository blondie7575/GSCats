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

; Chroma Key is $0

font8char32:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char33:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0004 3000 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 2, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	jmp renderCharJumpReturn

font8char34:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0440 0330 
	tsc
	sec
	sbc #804
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 1, Pixel values: 0440 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 0, Pixel values: 0440 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	jmp renderCharJumpReturn

font8char35:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0330 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$3003
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0440 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 3, Pixel values: 0440 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 2, Pixel values: 0440 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0440 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	jmp renderCharJumpReturn

font8char36:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0069 9000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0090
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$6900
	sta 1,S
	; Line 5, Pixel values: 0666 6900 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0069
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$6606
	sta 1,S
	; Line 4, Pixel values: 7666 6690 
	tsc
	sec
	sbc #158
	tcs
	pea $6676
	lda 3,S
	and #$0f00
	ora #$9066
	sta 3,S
	; Line 3, Pixel values: 7b66 6660 
	tsc
	sec
	sbc #158
	tcs
	pea $667b
	lda 3,S
	and #$0f00
	ora #$6066
	sta 3,S
	; Line 2, Pixel values: 76b6 6660 
	tsc
	sec
	sbc #158
	tcs
	pea $b676
	lda 3,S
	and #$0f00
	ora #$6066
	sta 3,S
	; Line 1, Pixel values: 0766 6600 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0066
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$6607
	sta 1,S
	; Line 0, Pixel values: 0077 7000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0070
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$7700
	sta 1,S
	jmp renderCharJumpReturn

font8char37:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char38:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char39:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0004 4000 
	tsc
	sec
	sbc #804
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	jmp renderCharJumpReturn

font8char40:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0033 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 4, Pixel values: 0440 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 3, Pixel values: 0440 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 2, Pixel values: 0440 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 1, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 0, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	jmp renderCharJumpReturn

font8char41:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0000 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 3, Pixel values: 0000 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 0000 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	jmp renderCharJumpReturn

font8char42:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0403 0300 
	tsc
	sec
	sbc #324
	tcs
	lda 3,S
	and #$fff0
	ora #$0003
	sta 3,S
	lda 1,S
	and #$f0f0
	ora #$0304
	sta 1,S
	; Line 4, Pixel values: 0043 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 3, Pixel values: 0444 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 0044 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 1, Pixel values: 0404 0400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$0004
	sta 3,S
	lda 1,S
	and #$f0f0
	ora #$0404
	sta 1,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char43:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0443 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4304
	sta 1,S
	; Line 3, Pixel values: 0444 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char44:
	tya
	tcs
	; Line 7, Pixel values: 0033 0000 
	tsc
	sec
	sbc #4
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char45:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0444 3330 
	tsc
	sec
	sbc #644
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char46:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char47:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0330 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$0ff0
	ora #$3003
	sta 1,S
	; Line 5, Pixel values: 0033 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 4, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 3, Pixel values: 0000 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 1, Pixel values: 0000 0033 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$00ff
	ora #$3300
	sta 3,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char48:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char49:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 4, Pixel values: 0043 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 3, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 2, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 1, Pixel values: 0444 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 0, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	jmp renderCharJumpReturn

font8char50:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4443 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $4344
	; Line 3, Pixel values: 0044 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 2, Pixel values: 0000 4330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char51:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 3, Pixel values: 0444 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char52:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4443 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4400 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char53:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0000 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char54:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char55:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0033 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 4, Pixel values: 0043 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 3, Pixel values: 0004 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 2, Pixel values: 0000 4330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char56:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 0444 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char57:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char58:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0033 0000 
	tsc
	sec
	sbc #324
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 4, Pixel values: 0043 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0044 0000 
	tsc
	sec
	sbc #320
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 1, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char59:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0004 4000 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char60:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 3330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0043 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 3, Pixel values: 0440 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 2, Pixel values: 0044 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0000 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char61:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0443 3330 
	tsc
	sec
	sbc #484
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4304
	sta 1,S
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0444 4330 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char62:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0000 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 3, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 2, Pixel values: 0000 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	; Line 1, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 0, Pixel values: 0444 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char63:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0003 3000 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 3, Pixel values: 0000 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 1, Pixel values: 0440 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 0, Pixel values: 0044 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	jmp renderCharJumpReturn

font8char64:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0430 0030 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0fff
	ora #$3000
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$3004
	sta 1,S
	; Line 4, Pixel values: 0440 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 3, Pixel values: 0440 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 2, Pixel values: 0440 4330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 1, Pixel values: 0440 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 0, Pixel values: 0044 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	jmp renderCharJumpReturn

font8char65:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 0443 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4304
	sta 1,S
	; Line 3, Pixel values: 0440 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 2, Pixel values: 0044 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 1, Pixel values: 0044 4430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 0, Pixel values: 0000 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char66:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char67:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char68:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char69:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char70:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char71:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char72:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 4330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4400 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char73:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 0433 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3304
	sta 1,S
	; Line 4, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 3, Pixel values: 0004 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 2, Pixel values: 0004 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 0444 4430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 0, Pixel values: 0444 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char74:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 4, Pixel values: 4400 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 0000 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	; Line 1, Pixel values: 0444 4430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 0, Pixel values: 0444 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char75:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4403 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0344
	sta 1,S
	; Line 3, Pixel values: 4444 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	; Line 2, Pixel values: 4444 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	; Line 1, Pixel values: 4404 4000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0444
	sta 1,S
	; Line 0, Pixel values: 4400 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char76:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char77:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4403 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0344
	sta 1,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4444 4330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 1, Pixel values: 4440 4430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$4044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char78:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4403 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0344
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4444 4300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	; Line 1, Pixel values: 4440 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$4044
	sta 1,S
	; Line 0, Pixel values: 4400 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char79:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char80:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	jmp renderCharJumpReturn

font8char81:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3033 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$000f
	ora #$3330
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4400 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char82:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4444 3300 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4000 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	jmp renderCharJumpReturn

font8char83:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3300 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0000 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	; Line 3, Pixel values: 0444 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 2, Pixel values: 4400 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 0444 4440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	jmp renderCharJumpReturn

font8char84:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0033 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 4, Pixel values: 0033 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 3, Pixel values: 0033 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 2, Pixel values: 0043 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$4300
	sta 1,S
	; Line 1, Pixel values: 4444 4400 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff00
	ora #$0044
	sta 3,S
	; Line 0, Pixel values: 4444 4000 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$ff0f
	ora #$0040
	sta 3,S
	jmp renderCharJumpReturn

font8char85:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0333 3300 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3303
	sta 1,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4400 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char86:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0033 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$3300
	sta 1,S
	; Line 5, Pixel values: 0433 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$3304
	sta 1,S
	; Line 4, Pixel values: 4440 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$4044
	sta 1,S
	; Line 3, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 2, Pixel values: 4400 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 1, Pixel values: 4400 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char87:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4430 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$3044
	sta 1,S
	; Line 4, Pixel values: 4443 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4404 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0444
	sta 1,S
	; Line 1, Pixel values: 4400 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char88:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4300 0330 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0043
	sta 1,S
	; Line 5, Pixel values: 4430 3330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$3044
	sta 1,S
	; Line 4, Pixel values: 0443 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4304
	sta 1,S
	; Line 3, Pixel values: 0044 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 2, Pixel values: 0444 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$4404
	sta 1,S
	; Line 1, Pixel values: 4440 4430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$4044
	sta 1,S
	; Line 0, Pixel values: 4400 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$0044
	sta 1,S
	jmp renderCharJumpReturn

font8char89:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0003 3000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 5, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 4, Pixel values: 0003 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0300
	sta 1,S
	; Line 3, Pixel values: 0044 3300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0033
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 2, Pixel values: 0440 0330 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3003
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 1, Pixel values: 0440 0430 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$3004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	; Line 0, Pixel values: 0440 0440 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$4004
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$4004
	sta 1,S
	jmp renderCharJumpReturn

font8char90:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 0443 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$4304
	sta 1,S
	; Line 3, Pixel values: 0044 3000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$0030
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$4400
	sta 1,S
	; Line 2, Pixel values: 0004 4300 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$0043
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0400
	sta 1,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char91:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4444 4440 
	tsc
	sec
	sbc #162
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 5, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 4, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 3, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 1, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 0, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char92:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4444 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 1, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 0, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char93:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 1, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char94:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3334 4440 
	tsc
	sec
	sbc #162
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 5, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 4, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 3, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 1, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 0, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char95:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 1, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 0, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char96:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 1, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 0, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char97:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3334 4440 
	tsc
	sec
	sbc #162
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 5, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 4, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 3, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 1, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 0, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char98:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4444 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 1, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 0, Pixel values: 3333 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char99:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4333 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $3343
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4433 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $3344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 4, Pixel values: 4443 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4344
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 3, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 2, Pixel values: 4444 4330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 1, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 0, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char100:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4444 4440 
	tsc
	sec
	sbc #162
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 5, Pixel values: 3444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4434
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 4, Pixel values: 3344 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 3, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3333 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 1, Pixel values: 3333 3440 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$4034
	sta 3,S
	; Line 0, Pixel values: 3333 3340 
	tsc
	sec
	sbc #158
	tcs
	pea $3333
	lda 3,S
	and #$0f00
	ora #$4033
	sta 3,S
	jmp renderCharJumpReturn

font8char101:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 4444 3330 
	tsc
	sec
	sbc #162
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	; Line 5, Pixel values: 4444 4330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 4, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 3, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 3444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4434
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 1, Pixel values: 3344 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 0, Pixel values: 3334 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	jmp renderCharJumpReturn

font8char102:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 3334 4440 
	tsc
	sec
	sbc #162
	tcs
	pea $3433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 5, Pixel values: 3344 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4433
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 4, Pixel values: 3444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4434
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 3, Pixel values: 4444 4440 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$4044
	sta 3,S
	; Line 2, Pixel values: 4444 4430 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3044
	sta 3,S
	; Line 1, Pixel values: 4444 4330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3043
	sta 3,S
	; Line 0, Pixel values: 4444 3330 
	tsc
	sec
	sbc #158
	tcs
	pea $4444
	lda 3,S
	and #$0f00
	ora #$3033
	sta 3,S
	jmp renderCharJumpReturn

font8char103:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char104:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char105:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char106:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char107:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char108:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char109:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char110:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

font8char111:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn

