

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString_tinyNum
;
; Draws a Pascal string for font "tinyNum"
;
; PARAML0 = Pointer to string
; Y = VRAM position of lower left corner of string at which to draw
;
; Trashes SCRATCHL,X,Y,A
;
renderString_tinyNum:
	sty SCRATCHL	; Cache VRAM position

	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8
	lda (PARAML0)
	tax
	BITS16
	phb

	; Advance VRAM pointer to end of string
	asl

	clc
	adc SCRATCHL
	dec
	sta SCRATCHL
	
renderStringLoop_tinyNum:

	; Fetch and render next character in string
	txy
	lda #0
	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8A
	lda (PARAML0),y
	BITS16
	phb
	ldy SCRATCHL
	jsr renderChar_tinyNum

	dex
	beq renderStringDone_tinyNum

	; Calculate VRAM pointer for position of next character
	lda SCRATCHL
	sec
	sbc #4/2					; Width of one char in bytes
	sta SCRATCHL
	bra renderStringLoop_tinyNum

renderStringDone_tinyNum:
	jmp renderStringReturn

.export renderString_tinyNum

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderChar_tinyNum
;
; Draws a single character
;
; A = ASCII code to draw
; Y = VRAM position of lower right corner at which to draw
;
renderChar_tinyNum:
	SAVE_AXY

	sec
	sbc #48		; ASCII code of first char in font sheet
	asl
	tax
	FASTGRAPHICS

	jmp (tinyNumcharacterJumpTable,x)

renderCharJumpReturn_tinyNum:	; Compiled glyphs jump back here. Can't rts because stack is turboborked
	SLOWGRAPHICS

	RESTORE_AXY
	rts


tinyNumcharacterJumpTable:
	.addr tinyNumchar48
	.addr tinyNumchar49
	.addr tinyNumchar50
	.addr tinyNumchar51
	.addr tinyNumchar52
	.addr tinyNumchar53
	.addr tinyNumchar54
	.addr tinyNumchar55
	.addr tinyNumchar56
	.addr tinyNumchar57
	.addr tinyNumchar58

; Chroma Key is $0

tinyNumchar48:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar49:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar50:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar51:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar52:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar53:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar54:
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar55:
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
	; Line 2, Pixel values: 0ea0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00e
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
	jmp renderCharJumpReturn_tinyNum

tinyNumchar56:
	tya
	tcs
	; Line 4, Pixel values: aea0 
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$0f00
	ora #$a0ae
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
	; Line 2, Pixel values: aea0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$a0ae
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
	; Line 0, Pixel values: aea0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$a0ae
	sta 1,S
	jmp renderCharJumpReturn_tinyNum

tinyNumchar57:
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
	; Line 2, Pixel values: aee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ae
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
	; Line 0, Pixel values: aee0 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0f00
	ora #$e0ae
	sta 1,S
	jmp renderCharJumpReturn_tinyNum

tinyNumchar58:
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
	jmp renderCharJumpReturn_tinyNum



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString_font8
;
; Draws a Pascal string for font "font8"
;
; PARAML0 = Pointer to string
; Y = VRAM position of lower left corner of string at which to draw
;
; Trashes SCRATCHL,X,Y,A
;
renderString_font8:
	sty SCRATCHL	; Cache VRAM position

	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8
	lda (PARAML0)
	tax
	BITS16
	phb

	; Advance VRAM pointer to end of string
	asl
	asl

	clc
	adc SCRATCHL
	dec
	sta SCRATCHL
	
renderStringLoop_font8:

	; Fetch and render next character in string
	txy
	lda #0
	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8A
	lda (PARAML0),y
	BITS16
	phb
	ldy SCRATCHL
	jsr renderChar_font8

	dex
	beq renderStringDone_font8

	; Calculate VRAM pointer for position of next character
	lda SCRATCHL
	sec
	sbc #8/2					; Width of one char in bytes
	sta SCRATCHL
	bra renderStringLoop_font8

renderStringDone_font8:
	jmp renderStringReturn

.export renderString_font8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderChar_font8
;
; Draws a single character
;
; A = ASCII code to draw
; Y = VRAM position of lower right corner at which to draw
;
renderChar_font8:
	SAVE_AXY

	sec
	sbc #32		; ASCII code of first char in font sheet
	asl
	tax
	FASTGRAPHICS

	jmp (font8characterJumpTable,x)

renderCharJumpReturn_font8:	; Compiled glyphs jump back here. Can't rts because stack is turboborked
	SLOWGRAPHICS

	RESTORE_AXY
	rts


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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

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
	jmp renderCharJumpReturn_font8

