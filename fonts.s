

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
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 000a b000 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: 000a a000 
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
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 000f f000 
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
	jmp renderCharJumpReturn_font8

font8char34:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0000 0000 
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0ba0 0bb0 
	tsc
	sec
	sbc #804
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: 0bb0 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: 0ff0 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char35:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bb0 bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0ba0 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: 0ba0 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: 0ba0 ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0ff0 ff00 
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
	; Line 3, Pixel values: 7f66 6660 
	tsc
	sec
	sbc #158
	tcs
	pea $667f
	lda 3,S
	and #$0f00
	ora #$6066
	sta 3,S
	; Line 2, Pixel values: 76f6 6660 
	tsc
	sec
	sbc #158
	tcs
	pea $f676
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
	; Line 2, Pixel values: 000a a000 
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
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 000f f000 
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
	jmp renderCharJumpReturn_font8

font8char40:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 0ba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: 0ba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: 0ba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 0, Pixel values: 000f f000 
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
	jmp renderCharJumpReturn_font8

font8char41:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 3, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: 0000 ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 00ff 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char42:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0a0b 0b00 
	tsc
	sec
	sbc #324
	tcs
	lda 3,S
	and #$fff0
	ora #$000b
	sta 3,S
	lda 1,S
	and #$f0f0
	ora #$0b0a
	sta 1,S
	; Line 4, Pixel values: 00ab b000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 3, Pixel values: 0baa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: 00aa a000 
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
	; Line 1, Pixel values: 0b0b 0a00 
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
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char43:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 0bab bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ab0b
	sta 1,S
	; Line 3, Pixel values: 0baa bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: 000a a000 
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
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char44:
	tya
	tcs
	; Line 7, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #4
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 6, Pixel values: 000b b000 
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
	; Line 5, Pixel values: 000b b000 
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
	; Line 3, Pixel values: 0baa bbb0 
	tsc
	sec
	sbc #644
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: 0000 0000 
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char46:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 6, Pixel values: 0bb0 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 5, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 000b b000 
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
	; Line 3, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 1, Pixel values: 0000 00bb 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$00ff
	ora #$bb00
	sta 3,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char48:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char49:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 4, Pixel values: 00ab 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 3, Pixel values: 00aa 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: 00aa 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: 0bbb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: 00ff 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char50:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fbab 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $abfb
	; Line 3, Pixel values: 00aa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: 0000 abb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char51:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 3, Pixel values: 0baa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char52:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fbab bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $abfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: fb00 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char53:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0000 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char54:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ffa0 
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
	jmp renderCharJumpReturn_font8

font8char55:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 00bb b000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 00ab b000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 3, Pixel values: 000a bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: 0000 abb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char56:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: 0baa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char57:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 3, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char58:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #324
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 00ab 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 00aa 0000 
	tsc
	sec
	sbc #320
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char59:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 000b b000 
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
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 000a a000 
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
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char60:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 bbb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 00ab 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 3, Pixel values: 0ba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: 00aa 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 0000 ffa0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char61:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0000 0000 
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 0bab bbb0 
	tsc
	sec
	sbc #484
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ab0b
	sta 1,S
	; Line 3, Pixel values: 0000 0000 
	; Line 2, Pixel values: 0baa abb0 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 1, Pixel values: 0000 0000 
	; Line 0, Pixel values: 0000 0000 
	jmp renderCharJumpReturn_font8

font8char62:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 3, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 2, Pixel values: 0000 ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	; Line 1, Pixel values: 000b b000 
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
	; Line 0, Pixel values: 0fff 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char63:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 0000 0000 
	; Line 4, Pixel values: 000b b000 
	tsc
	sec
	sbc #320
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 3, Pixel values: 0000 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 1, Pixel values: 0bb0 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: 00ff ff00 
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
	jmp renderCharJumpReturn_font8

font8char64:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 0ab0 00b0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0fff
	ora #$b000
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00a
	sta 1,S
	; Line 4, Pixel values: 0ba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 3, Pixel values: 0ba0 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: 0ba0 abb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: 0bb0 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: 00ff ff00 
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
	jmp renderCharJumpReturn_font8

font8char65:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fbab bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $abfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: 0ba0 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 2, Pixel values: 0faa 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 1, Pixel values: 00fb bab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 0, Pixel values: 000f ff00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char66:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char67:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char68:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char69:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bbb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ffa0 
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
	jmp renderCharJumpReturn_font8

font8char70:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char71:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char72:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fb00 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char73:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bbb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: 0abb bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0a
	sta 1,S
	; Line 4, Pixel values: 000b b000 
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
	; Line 3, Pixel values: 000a b000 
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
	ora #$0a00
	sta 1,S
	; Line 2, Pixel values: 000a a000 
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
	; Line 1, Pixel values: 0bbb bab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: 0fff ffa0 
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
	jmp renderCharJumpReturn_font8

font8char74:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 4, Pixel values: fb00 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: 0000 ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	; Line 1, Pixel values: 0bbb bab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 0, Pixel values: 0fff ffa0 
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
	jmp renderCharJumpReturn_font8

font8char75:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb0b b000 
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
	; Line 3, Pixel values: fbaa 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	; Line 2, Pixel values: fbaa 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	; Line 1, Pixel values: fb0b b000 
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
	; Line 0, Pixel values: ff00 ff00 
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
	jmp renderCharJumpReturn_font8

font8char76:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bbb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00ff
	sta 1,S
	jmp renderCharJumpReturn_font8

font8char77:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb0b 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0bfb
	sta 1,S
	; Line 3, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: fbaa abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 1, Pixel values: fbb0 bab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char78:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb0b bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0bfb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fbaa ab00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	; Line 1, Pixel values: fbb0 ba00 
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
	; Line 0, Pixel values: ff00 ff00 
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
	jmp renderCharJumpReturn_font8

font8char79:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char80:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char81:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb b0bb 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$000f
	ora #$bbb0
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ff00 
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
	jmp renderCharJumpReturn_font8

font8char82:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fa00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fa
	sta 1,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fbaa bb00 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff f000 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char83:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bb00 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0000 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	; Line 3, Pixel values: 0baa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 2, Pixel values: fb00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: 0fff ffa0 
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
	jmp renderCharJumpReturn_font8

font8char84:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #164
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 3, Pixel values: 00bb 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 2, Pixel values: 00ab 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00ff
	ora #$ab00
	sta 1,S
	; Line 1, Pixel values: fbbb ba00 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char85:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 0bbb bb00 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fb00 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char86:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 00bb b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 0abb bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0a
	sta 1,S
	; Line 4, Pixel values: fba0 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$a0fb
	sta 1,S
	; Line 3, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 2, Pixel values: fb00 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 1, Pixel values: fb00 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char87:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fab0 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fa
	sta 1,S
	; Line 4, Pixel values: fbab bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $abfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: fb0a 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$f000
	ora #$0afb
	sta 1,S
	; Line 1, Pixel values: fb00 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char88:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: ab00 0bb0 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$ff00
	ora #$00ab
	sta 1,S
	; Line 5, Pixel values: fab0 bbb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fa
	sta 1,S
	; Line 4, Pixel values: 0bab bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ab0b
	sta 1,S
	; Line 3, Pixel values: 00aa b000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: 0baa ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$aa0b
	sta 1,S
	; Line 1, Pixel values: fbb0 bab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	lda 1,S
	and #$0f00
	ora #$b0fb
	sta 1,S
	; Line 0, Pixel values: ff00 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char89:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: 000b b000 
	tsc
	sec
	sbc #164
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 5, Pixel values: 000b b000 
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
	; Line 4, Pixel values: 000b b000 
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
	; Line 3, Pixel values: 00aa bb00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: 0ba0 0bb0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00b
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$a00b
	sta 1,S
	; Line 1, Pixel values: 0bb0 0ab0 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$0ff0
	ora #$b00a
	sta 3,S
	lda 1,S
	and #$0ff0
	ora #$b00b
	sta 1,S
	; Line 0, Pixel values: 0ff0 0fa0 
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
	jmp renderCharJumpReturn_font8

font8char90:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: 0bab 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$ab0b
	sta 1,S
	; Line 3, Pixel values: 00aa b000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	lda 1,S
	and #$00ff
	ora #$aa00
	sta 1,S
	; Line 2, Pixel values: 000a ab00 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$ff00
	ora #$00ab
	sta 3,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char91:
	tya
	tcs
	; Line 7, Pixel values: 3333 3333 
	pea $3333
	pea $3333
	; Line 6, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 5, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 4, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 3, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 2, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 1, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	; Line 0, Pixel values: 3333 3333 
	tsc
	sec
	sbc #156
	tcs
	pea $3333
	pea $3333
	jmp renderCharJumpReturn_font8

font8char92:
	tya
	tcs
	; Line 7, Pixel values: 2222 2222 
	pea $2222
	pea $2222
	; Line 6, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 5, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 4, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 3, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 2, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 1, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 0, Pixel values: 2222 2222 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	jmp renderCharJumpReturn_font8

font8char93:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: aaaa aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: aaaa aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 1, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 0, Pixel values: ffff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char94:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbba abf0 
	tsc
	sec
	sbc #162
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 4, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 3, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 2, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 1, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 0, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char95:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: aaaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: aaaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 1, Pixel values: bbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 0, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char96:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: bbba aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: bbba aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 1, Pixel values: bbba abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 0, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char97:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbba abf0 
	tsc
	sec
	sbc #162
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: bbba abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 4, Pixel values: bbba aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 3, Pixel values: bbba aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$a0aa
	sta 3,S
	; Line 2, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 1, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 0, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char98:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: bbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: aaaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: aaaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aaaa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 1, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 0, Pixel values: bbbb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char99:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: abbb bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $bbab
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: fabb bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfa
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 4, Pixel values: fbab bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $abfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 2, Pixel values: fbaa abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 1, Pixel values: fbbb bab0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0ba
	sta 3,S
	; Line 0, Pixel values: ffff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$0f00
	ora #$a0ff
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char100:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: afff fff0 
	tsc
	sec
	sbc #162
	tcs
	pea $ffaf
	lda 3,S
	and #$0f00
	ora #$f0ff
	sta 3,S
	; Line 5, Pixel values: babb bbf0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbba
	lda 3,S
	and #$0f00
	ora #$f0bb
	sta 3,S
	; Line 4, Pixel values: bbaa abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 3, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 2, Pixel values: bbbb abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 1, Pixel values: bbbb baf0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$f0ba
	sta 3,S
	; Line 0, Pixel values: bbbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbbb
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char101:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #162
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 5, Pixel values: bfba abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 4, Pixel values: abfb aab0 
	tsc
	sec
	sbc #158
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$b0aa
	sta 3,S
	; Line 3, Pixel values: aabf baa0 
	tsc
	sec
	sbc #158
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	; Line 2, Pixel values: baab fba0 
	tsc
	sec
	sbc #158
	tcs
	pea $abba
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	; Line 1, Pixel values: bbaa bfb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	; Line 0, Pixel values: bbba abf0 
	tsc
	sec
	sbc #158
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	jmp renderCharJumpReturn_font8

font8char102:
	tya
	tcs
	; Line 7, Pixel values: 0000 0000 
	; Line 6, Pixel values: bbba abf0 
	tsc
	sec
	sbc #162
	tcs
	pea $babb
	lda 3,S
	and #$0f00
	ora #$f0ab
	sta 3,S
	; Line 5, Pixel values: bbaa bfb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aabb
	lda 3,S
	and #$0f00
	ora #$b0bf
	sta 3,S
	; Line 4, Pixel values: baab fba0 
	tsc
	sec
	sbc #158
	tcs
	pea $abba
	lda 3,S
	and #$0f00
	ora #$a0fb
	sta 3,S
	; Line 3, Pixel values: aabf baa0 
	tsc
	sec
	sbc #158
	tcs
	pea $bfaa
	lda 3,S
	and #$0f00
	ora #$a0ba
	sta 3,S
	; Line 2, Pixel values: abfb aab0 
	tsc
	sec
	sbc #158
	tcs
	pea $fbab
	lda 3,S
	and #$0f00
	ora #$b0aa
	sta 3,S
	; Line 1, Pixel values: bfba abb0 
	tsc
	sec
	sbc #158
	tcs
	pea $babf
	lda 3,S
	and #$0f00
	ora #$b0ab
	sta 3,S
	; Line 0, Pixel values: fbaa bbb0 
	tsc
	sec
	sbc #158
	tcs
	pea $aafb
	lda 3,S
	and #$0f00
	ora #$b0bb
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString_font16
;
; Draws a Pascal string for font "font16"
;
; PARAML0 = Pointer to string
; Y = VRAM position of lower left corner of string at which to draw
;
; Trashes SCRATCHL,X,Y,A
;
renderString_font16:
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
	asl

	clc
	adc SCRATCHL
	dec
	sta SCRATCHL
	
renderStringLoop_font16:

	; Fetch and render next character in string
	txy
	lda #0
	plb				; Temporarily revert to caller's DBR to access their pointer
	BITS8A
	lda (PARAML0),y
	BITS16
	phb
	ldy SCRATCHL
	jsr renderChar_font16

	dex
	beq renderStringDone_font16

	; Calculate VRAM pointer for position of next character
	lda SCRATCHL
	sec
	sbc #16/2					; Width of one char in bytes
	sta SCRATCHL
	bra renderStringLoop_font16

renderStringDone_font16:
	jmp renderStringReturn

.export renderString_font16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderChar_font16
;
; Draws a single character
;
; A = ASCII code to draw
; Y = VRAM position of lower right corner at which to draw
;
renderChar_font16:
	SAVE_AXY

	sec
	sbc #32		; ASCII code of first char in font sheet
	asl
	tax
	FASTGRAPHICS

	jmp (font16characterJumpTable,x)

renderCharJumpReturn_font16:	; Compiled glyphs jump back here. Can't rts because stack is turboborked
	SLOWGRAPHICS

	RESTORE_AXY
	rts


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
	.addr font16char92
	.addr font16char93
	.addr font16char94
	.addr font16char95
	.addr font16char96
	.addr font16char97
	.addr font16char98
	.addr font16char99
	.addr font16char100
	.addr font16char101
	.addr font16char102
	.addr font16char103
	.addr font16char104
	.addr font16char105
	.addr font16char106
	.addr font16char107
	.addr font16char108
	.addr font16char109
	.addr font16char110
	.addr font16char111

; Chroma Key is $0

font16char32:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char33:
	tya
	tcs
	; Line 15, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #318
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 1, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 0, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char34:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 8882 2000 2222 2000 
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
	; Line 4, Pixel values: 8888 2200 2222 2200 
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
	; Line 3, Pixel values: 8888 8220 2222 2220 
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
	; Line 2, Pixel values: 0888 8820 0222 2220 
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
	; Line 1, Pixel values: 0088 8880 0022 2220 
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
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char35:
	tya
	tcs
	; Line 15, Pixel values: 0022 2220 0333 3400 
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
	; Line 14, Pixel values: 0022 2220 0233 4300 
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
	; Line 8, Pixel values: 0022 2220 0222 2200 
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
	; Line 7, Pixel values: 0022 2220 0222 2200 
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
	; Line 1, Pixel values: 0088 8880 0222 2200 
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
	; Line 0, Pixel values: 0088 8880 0222 2200 
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
	jmp renderCharJumpReturn_font16

font16char36:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0022 2000 0000 
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
	; Line 9, Pixel values: 0000 0200 0200 0000 
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
	; Line 8, Pixel values: 0000 0200 0000 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$0002
	sta 3,S
	; Line 7, Pixel values: 0000 0200 0000 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$fff0
	ora #$0002
	sta 3,S
	; Line 6, Pixel values: 0000 0020 0200 0000 
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
	; Line 5, Pixel values: 0000 0002 2000 0000 
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
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char37:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0002 0000 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 13, Pixel values: 0000 0002 0000 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 12, Pixel values: 0000 0022 2000 0000 
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
	; Line 11, Pixel values: 0000 2222 2220 0000 
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
	; Line 10, Pixel values: 0022 2200 0222 3000 
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
	; Line 9, Pixel values: 0222 2022 2022 2200 
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
	; Line 8, Pixel values: 2222 2022 2222 2230 
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
	; Line 7, Pixel values: 8222 2022 2222 2220 
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
	; Line 6, Pixel values: 8822 2202 2022 2220 
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
	; Line 5, Pixel values: 8882 2220 0222 2220 
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
	; Line 4, Pixel values: 0888 2222 2222 2200 
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
	; Line 3, Pixel values: 0888 8220 2222 2200 
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
	; Line 2, Pixel values: 0008 8800 0222 0000 
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
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char38:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char39:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 8882 2000 0000 0000 
	tsc
	sec
	sbc #1606
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 3, Pixel values: 8888 8220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$2082
	sta 3,S
	; Line 2, Pixel values: 0888 8820 0000 0000 
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
	; Line 1, Pixel values: 0088 8880 0000 0000 
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
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char40:
	tya
	tcs
	; Line 15, Pixel values: 0000 2222 2000 0000 
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
	; Line 14, Pixel values: 0022 2222 3000 0000 
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
	; Line 13, Pixel values: 0222 2222 2000 0000 
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
	; Line 12, Pixel values: 0222 2222 2000 0000 
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
	; Line 11, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 10, Pixel values: 2222 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 9, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 7, Pixel values: 8222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 4, Pixel values: 0888 2220 0000 0000 
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
	; Line 3, Pixel values: 0888 8222 2000 0000 
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
	; Line 2, Pixel values: 0088 8822 2000 0000 
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
	; Line 1, Pixel values: 0008 8882 2000 0000 
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
	; Line 0, Pixel values: 0000 0888 2000 0000 
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
	jmp renderCharJumpReturn_font16

font16char41:
	tya
	tcs
	; Line 15, Pixel values: 2220 0000 0000 0000 
	tsc
	sec
	sbc #8
	tcs
	lda 1,S
	and #$0f00
	ora #$2022
	sta 1,S
	; Line 14, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 12, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 11, Pixel values: 0222 2220 0000 0000 
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
	; Line 10, Pixel values: 0022 2222 0000 0000 
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
	; Line 9, Pixel values: 0002 2222 0000 0000 
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
	; Line 8, Pixel values: 0002 2222 0000 0000 
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
	; Line 7, Pixel values: 0002 2222 0000 0000 
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
	; Line 6, Pixel values: 0002 2222 0000 0000 
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
	; Line 5, Pixel values: 0002 2222 0000 0000 
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
	; Line 4, Pixel values: 0088 2222 0000 0000 
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
	; Line 3, Pixel values: 8888 8222 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $2282
	pea $8888
	; Line 2, Pixel values: 8888 8820 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$2088
	sta 3,S
	; Line 1, Pixel values: 8888 8880 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$0f00
	ora #$8088
	sta 3,S
	; Line 0, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char42:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0002 0000 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 13, Pixel values: 0000 0002 0000 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 3,S
	and #$f0ff
	ora #$0200
	sta 3,S
	; Line 12, Pixel values: 0000 0022 2000 0000 
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
	; Line 11, Pixel values: 0000 2222 2220 0000 
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
	; Line 10, Pixel values: 0022 2222 2222 3000 
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
	; Line 9, Pixel values: 0222 2222 2222 2200 
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
	; Line 8, Pixel values: 2222 2222 2222 2230 
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
	; Line 7, Pixel values: 8222 2222 2222 2220 
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
	; Line 6, Pixel values: 8822 2222 2222 2220 
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
	; Line 5, Pixel values: 8882 2222 2222 2220 
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
	; Line 4, Pixel values: 0888 2222 2222 2200 
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
	; Line 3, Pixel values: 0888 8220 2222 2200 
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
	; Line 2, Pixel values: 0008 8800 0222 0000 
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
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char43:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char44:
	tya
	tcs
	; Line 15, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 0222 2220 0000 0000 
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
	; Line 11, Pixel values: 0022 2220 0000 0000 
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
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char45:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 2222 2222 2222 0000 
	tsc
	sec
	sbc #962
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 8, Pixel values: 2222 2222 2222 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2222
	; Line 7, Pixel values: 8222 2222 2222 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2282
	; Line 6, Pixel values: 8822 2222 2222 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $2288
	; Line 5, Pixel values: 8882 2222 2222 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $2222
	pea $2222
	pea $8288
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char46:
	tya
	tcs
	; Line 15, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char47:
	tya
	tcs
	; Line 15, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #6
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 14, Pixel values: 2222 2200 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff00
	ora #$0022
	sta 3,S
	; Line 13, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 2222 2222 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $2222
	pea $2222
	; Line 11, Pixel values: 2222 2222 2000 0000 
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
	; Line 10, Pixel values: 0222 2222 2200 0000 
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
	; Line 9, Pixel values: 0022 2222 2220 0000 
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
	; Line 8, Pixel values: 0002 2222 2222 0000 
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
	; Line 7, Pixel values: 0000 2222 2222 2000 
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
	; Line 6, Pixel values: 0000 0222 2222 2200 
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
	; Line 5, Pixel values: 0000 0022 2222 2220 
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
	; Line 4, Pixel values: 0000 0002 2222 2220 
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
	; Line 3, Pixel values: 0000 0000 2222 2220 
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
	; Line 2, Pixel values: 0000 0000 0222 2220 
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
	; Line 1, Pixel values: 0000 0000 0022 2220 
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
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char48:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aa00 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 0000 bbbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	; Line 12, Pixel values: 000b bbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 11, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 10, Pixel values: 00bb bbbf bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bfbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 9, Pixel values: 0fbb bbb0 fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 8, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 7, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 6, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 5, Pixel values: 0fbb bba0 bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 4, Pixel values: 00fb bbba bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 3, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 2, Pixel values: 000f bbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 1, Pixel values: 0000 fbbb bbb0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$b0bb
	sta 5,S
	; Line 0, Pixel values: 0000 0fff ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char49:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 000f aaaa 0000 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 13, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 12, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 11, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 10, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 9, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 8, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 7, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 6, Pixel values: 0000 000f bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 5, Pixel values: 00fa aaaa bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$fa00
	sta 1,S
	; Line 4, Pixel values: 000f bbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 3, Pixel values: 0000 fbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbfb
	; Line 2, Pixel values: 0000 0fbb bbba 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 1, Pixel values: 0000 00fb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 0, Pixel values: 0000 000f ffff 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char50:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0aaa aaaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 13, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 12, Pixel values: 00fb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 11, Pixel values: 000f bbbb bfff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffbf
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 10, Pixel values: 0000 fbbb ba00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	; Line 9, Pixel values: 0000 0fbb bba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 8, Pixel values: 0000 00fb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 7, Pixel values: 0000 000f bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 6, Pixel values: 0000 0000 bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 5, Pixel values: 0000 000b bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0b00
	sta 3,S
	; Line 4, Pixel values: 0faa aaab bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $abaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0fbb bbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 0, Pixel values: 0fff ffff ff00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char51:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0faa aaaa aa00 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 13, Pixel values: 0fbb bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 12, Pixel values: 0fbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 11, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 10, Pixel values: 0fff ffff fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	; Line 9, Pixel values: 0000 0000 0bbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	; Line 8, Pixel values: 0faa aaaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 7, Pixel values: 0fbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 6, Pixel values: 0fff ffff fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	; Line 5, Pixel values: 0000 0000 0bbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	; Line 4, Pixel values: 0faa aaaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0fbb bbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 0, Pixel values: 0fff ffff ff00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char52:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0faa aa00 
	tsc
	sec
	sbc #168
	tcs
	lda 7,S
	and #$ff00
	ora #$00aa
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$aa0f
	sta 5,S
	; Line 13, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 12, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 11, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 10, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 9, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 8, Pixel values: 0000 0aaa aabb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbaa
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 7, Pixel values: 000b bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 6, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 4, Pixel values: 0fbb bbb0 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bb00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bb00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0fbb bb00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 0, Pixel values: 0fff ff00 0fff ff00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ff
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$ff0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char53:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0faa aaaa aa00 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 13, Pixel values: 0fbb bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 12, Pixel values: 0fbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 11, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 10, Pixel values: 0fff ffff fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	; Line 9, Pixel values: 0000 0000 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	; Line 8, Pixel values: 0faa aaaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 7, Pixel values: 0fbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 6, Pixel values: 0fbb ffff ffff 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 5, Pixel values: 0fba 0000 0000 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 1,S
	and #$00f0
	ora #$ba0f
	sta 1,S
	; Line 4, Pixel values: 0fbb aaaa aaaa aa00 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 0, Pixel values: 0fff ffff ffff ff00 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ff
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char54:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aa00 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 10, Pixel values: 0fbb bbff ffbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 9, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 8, Pixel values: 0fbb baaa abbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 7, Pixel values: 0fbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 6, Pixel values: 00fb bbbb fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 5, Pixel values: 00fb bbba 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 4, Pixel values: 000f bbbb a000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$00a0
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 3, Pixel values: 000f bbbb a000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$00a0
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 2, Pixel values: 0000 fbbb ba00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	; Line 1, Pixel values: 0000 fbbb ba00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	; Line 0, Pixel values: 0000 0fff fff0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char55:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 00fa aaaa 0000 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$fa00
	sta 1,S
	; Line 13, Pixel values: 00fb bbba 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 12, Pixel values: 00fb bbba 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 11, Pixel values: 00fb bbbb a000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff0f
	ora #$00a0
	sta 5,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 10, Pixel values: 000f bbbb ba00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 9, Pixel values: 0000 fbbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	; Line 8, Pixel values: 0000 0fbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 7, Pixel values: 0000 00fb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 6, Pixel values: 0000 000f bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 5, Pixel values: 0000 0000 fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 4, Pixel values: 0faa aaaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 0, Pixel values: 0fff ffff ffff ff00 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ff
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ff0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char56:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aa00 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 10, Pixel values: 0fbb bbff ffbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 9, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 8, Pixel values: 0fbb baaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 7, Pixel values: 00bb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 6, Pixel values: 0fbb bbff ffbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 5, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 4, Pixel values: 0fbb baaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char57:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 faaa aa00 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aafa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	; Line 13, Pixel values: 0000 0fbb bba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 12, Pixel values: 0000 0fbb bba0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 11, Pixel values: 0000 00fb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 10, Pixel values: 0000 00fb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	sec
	sbc #4
	tcs
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 9, Pixel values: 0000 000f bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 8, Pixel values: 0000 aaab bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $abaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 7, Pixel values: 00bb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 6, Pixel values: 00bb bbff ffbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 0fbb ba00 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 4, Pixel values: 0fbb baaa abbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char58:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #326
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 12, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 11, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 10, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 9, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 8222 2000 0000 0000 
	tsc
	sec
	sbc #318
	tcs
	pea $2282
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 6, Pixel values: 8822 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 5, Pixel values: 8882 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8288
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 4, Pixel values: 8888 2000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 3, Pixel values: 8888 8000 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $8888
	lda 3,S
	and #$ff0f
	ora #$0080
	sta 3,S
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char59:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 2222 2000 0000 0000 
	tsc
	sec
	sbc #166
	tcs
	pea $2222
	lda 3,S
	and #$ff0f
	ora #$0020
	sta 3,S
	; Line 13, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 12, Pixel values: 2222 2220 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $2222
	lda 3,S
	and #$0f00
	ora #$2022
	sta 3,S
	; Line 11, Pixel values: 0222 2220 0000 0000 
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
	; Line 10, Pixel values: 0022 2220 0000 0000 
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
	; Line 9, Pixel values: 0022 2220 0000 0000 
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
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0022 2220 0000 0000 
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
	; Line 6, Pixel values: 0022 2220 0000 0000 
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
	; Line 5, Pixel values: 0082 2220 0000 0000 
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
	; Line 4, Pixel values: 0088 2220 0000 0000 
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
	; Line 3, Pixel values: 0088 8220 0000 0000 
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
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char60:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char61:
	tya
	tcs
	; Line 15, Pixel values: 2222 2222 2333 3000 
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
	; Line 14, Pixel values: 2222 2222 3233 4000 
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
	; Line 13, Pixel values: 2222 2222 2223 3000 
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
	; Line 12, Pixel values: 2222 2222 2232 3000 
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
	; Line 11, Pixel values: 2222 2222 2222 2000 
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
	; Line 10, Pixel values: 2222 2222 2222 3000 
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
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 2222 2222 2222 2000 
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
	; Line 7, Pixel values: 8222 2222 2222 2000 
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
	; Line 6, Pixel values: 8822 2222 2222 2000 
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
	; Line 5, Pixel values: 8882 2222 2222 2000 
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
	; Line 4, Pixel values: 8888 2222 2222 2000 
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
	; Line 3, Pixel values: 8888 8222 2222 2000 
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
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char62:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char63:
	tya
	tcs
	; Line 15, Pixel values: 0000 2222 2000 0000 
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
	; Line 14, Pixel values: 0000 2222 3000 0000 
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
	; Line 13, Pixel values: 0000 2222 2000 0000 
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
	; Line 12, Pixel values: 0000 2222 2000 0000 
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
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 2222 2000 0000 
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
	; Line 9, Pixel values: 0000 2222 2000 0000 
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
	; Line 8, Pixel values: 0000 2222 2220 0000 
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
	; Line 7, Pixel values: 0000 0222 2222 2000 
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
	; Line 6, Pixel values: 0000 0222 2222 2200 
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
	; Line 5, Pixel values: 0000 0002 2222 2220 
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
	; Line 4, Pixel values: 8888 2000 0222 2220 
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
	; Line 3, Pixel values: 8888 8222 2222 2220 
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
	; Line 2, Pixel values: 0888 8822 2222 2200 
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
	; Line 1, Pixel values: 0888 8882 2222 2000 
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
	; Line 0, Pixel values: 0008 8888 2220 0000 
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
	jmp renderCharJumpReturn_font16

font16char64:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char65:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aa00 0aaa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$aa0a
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00aa
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 11, Pixel values: fbbb baaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 10, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbbb bbff ffbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb baaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaba
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char66:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aaaa aaa0 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	pea $aafa
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	; Line 13, Pixel values: fbbb bbbb bbba a000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 12, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 11, Pixel values: fbbb bfff ffbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbf
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 10, Pixel values: fbbb a000 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 9, Pixel values: fbbb aaaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: fbbb bfff ffbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbff
	pea $ffbf
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 5, Pixel values: fbbb a000 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 4, Pixel values: fbbb aaaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 0, Pixel values: ffff ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	pea $ffff
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char67:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 9, Pixel values: fbbb bbbb ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	pea $bbfb
	; Line 7, Pixel values: fbbb bbb0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 6, Pixel values: fbbb bbba 0000 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $babb
	pea $bbfb
	; Line 5, Pixel values: fbbb bbbb aaaa aaa0 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 4, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char68:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aaaa aa00 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	pea $aafa
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	; Line 13, Pixel values: fbbb bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	pea $bbfb
	; Line 12, Pixel values: fbbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 11, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 10, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb ffff fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffff
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbba 0000 fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bafb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: fbba aaaa bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $aaaa
	pea $bafb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 5, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 4, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	; Line 0, Pixel values: ffff ffff ff00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	pea $ffff
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char69:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: 0bbb bbbf ffff ffa0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $bfbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0ff
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 9, Pixel values: fbbb bba0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 8, Pixel values: fbbb bbba aaaa a000 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $babb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 7, Pixel values: fbbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 6, Pixel values: fbbb bbbf ffff a000 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $bfbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 5, Pixel values: fbbb bba0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 4, Pixel values: 0fbb bbba aaaa aaa0 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char70:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aa00 0000 0000 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 3,S
	and #$ff00
	ora #$00aa
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 11, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 10, Pixel values: fbbb bbaa aaaa a000 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $aabb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 7, Pixel values: fbbb bbff ffff f000 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00f0
	sta 7,S
	; Line 6, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb bba0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 4, Pixel values: 0fbb bbba aaaa aaa0 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char71:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aaa0 0aa0 
	tsc
	sec
	sbc #168
	tcs
	lda 7,S
	and #$0ff0
	ora #$a00a
	sta 7,S
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbba 0ba0 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0ff0
	ora #$a00b
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: 0bbb bbbf fffb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $fbff
	pea $bfbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 9, Pixel values: fbbb bbb0 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 8, Pixel values: fbbb ba00 0fff ffa0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0ff
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$ff0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 7, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 6, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb bba0 000a aaa0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0a00
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 4, Pixel values: 0fbb bbba aaab bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $abaa
	pea $babb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff fff0 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char72:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aa00 00aa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$aa00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00aa
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 11, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 10, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 9, Pixel values: fbbb baaa aaab bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $abaa
	pea $aaba
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 5, Pixel values: fbbb baff fffb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $fbff
	pea $ffba
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 3, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 2, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 1, Pixel values: fbbb ba00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 00ff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$ff00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char73:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aaaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	pea $aaaa
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 13, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 12, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 11, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 10, Pixel values: ffff ffbb baff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffba
	pea $bbff
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	; Line 9, Pixel values: 0000 0fbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 8, Pixel values: 0000 0fbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 7, Pixel values: 0000 0fbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 6, Pixel values: 0000 0fbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 5, Pixel values: 0000 0fbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 4, Pixel values: faaa aabb baaa aaa0 
	tsc
	sec
	sbc #154
	tcs
	pea $aaba
	pea $bbaa
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 0, Pixel values: ffff ffff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	jmp renderCharJumpReturn_font16

font16char74:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 aaaa aaa0 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	; Line 13, Pixel values: 00bb bbbb bbba a000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 12, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 9, Pixel values: fbbb bbb0 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 8, Pixel values: ffff ff00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	; Line 7, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 6, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 5, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 4, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 3, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 2, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 1, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 0, Pixel values: 0000 0000 00ff fff0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$ff00
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char75:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa a000 000a aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0a00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 13, Pixel values: fbbb a000 00bb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$bb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 12, Pixel values: fbbb a000 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 11, Pixel values: fbbb a000 bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 10, Pixel values: fbbb a00b bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0ba0
	sta 3,S
	; Line 9, Pixel values: fbbb a0bb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 3,S
	and #$000f
	ora #$bba0
	sta 3,S
	; Line 8, Pixel values: fbbb bbbb bbb0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	pea $bbfb
	lda 5,S
	and #$0f00
	ora #$b0bb
	sta 5,S
	; Line 7, Pixel values: fbbb bbbb ba00 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	pea $bbfb
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	; Line 6, Pixel values: fbbb bfbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbf
	pea $bbfb
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	; Line 5, Pixel values: fbbb b0fb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 3,S
	and #$000f
	ora #$fbb0
	sta 3,S
	; Line 4, Pixel values: fbbb b00f bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0fb0
	sta 3,S
	; Line 3, Pixel values: fbbb b000 fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	; Line 2, Pixel values: fbbb b000 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	; Line 1, Pixel values: fbbb b000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	; Line 0, Pixel values: ffff f000 000f fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0f00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char76:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 aaaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 13, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 12, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: fbbb bbbf ffff ffa0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $bfbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0ff
	sta 7,S
	; Line 9, Pixel values: fbbb bbb0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 8, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 7, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 6, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 4, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 3, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 2, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 1, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char77:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa a000 00fa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fa00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 13, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 12, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 11, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 10, Pixel values: fbbb a0fa a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$faa0
	sta 3,S
	; Line 9, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 8, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 7, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 6, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 5, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 00ff bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	; Line 0, Pixel values: 0000 ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char78:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa a000 00fa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fa00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 13, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 12, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 11, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 10, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 9, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 8, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 7, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 6, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 00ff bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	; Line 0, Pixel values: 0000 ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char79:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aa00 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 9, Pixel values: fbbb bbff fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb bb00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 7, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 6, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb bbaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aabb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 1, Pixel values: 000f fbbb bbbb 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbfb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 0, Pixel values: 0000 0fff ff00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ff
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$ff0f
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char80:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aa00 0000 0000 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 3,S
	and #$ff00
	ora #$00aa
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb ba00 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 11, Pixel values: fbbb baaa aaa0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $aaba
	pea $bbfb
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	; Line 10, Pixel values: fbbb bbbb bbba a000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 7, Pixel values: fbbb bbaa aabb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbaa
	pea $aabb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: fbbb bf00 0abb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0a
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bf
	sta 3,S
	; Line 5, Pixel values: fbbb bfff fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffbf
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 0, Pixel values: ffff ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	pea $ffff
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char81:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 aaaa aa00 aaa0 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	; Line 13, Pixel values: 00bb bbbb bbab bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $abbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 12, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: fbbb bbff fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 9, Pixel values: fbbb bb00 fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 8, Pixel values: fbbb a00f bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$f00f
	ora #$0fa0
	sta 3,S
	; Line 7, Pixel values: fbbb a00f f0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fbf0
	sta 5,S
	lda 3,S
	and #$f00f
	ora #$0fa0
	sta 3,S
	; Line 6, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 5, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 4, Pixel values: fbbb bbaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aabb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 2, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 00ff bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$ff00
	sta 1,S
	; Line 0, Pixel values: 0000 ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char82:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aa00 0aaa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$aa0a
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00aa
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb ba00 fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 11, Pixel values: fbbb ba00 fbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 10, Pixel values: fbbb baaa bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $aaba
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 8, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 7, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 6, Pixel values: fbbb bbaa aabb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbaa
	pea $aabb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 5, Pixel values: fbbb bf00 0abb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0a
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bf
	sta 3,S
	; Line 4, Pixel values: fbbb bfff fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffbf
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 0, Pixel values: ffff ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	pea $ffff
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char83:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aaaa aaaa 0000 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	pea $aaaa
	pea $aafa
	; Line 13, Pixel values: fbbb bbbb bbbb aa00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00aa
	sta 7,S
	; Line 12, Pixel values: fbbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	; Line 11, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 10, Pixel values: ffff ffff bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $ffff
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 9, Pixel values: 0000 0000 bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: 000a aaaa bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0a00
	sta 1,S
	; Line 7, Pixel values: 0bbb bbbb bbbb ff00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ff
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 6, Pixel values: 0bbb bbbf ffff 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $bfbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: fbbb bba0 0000 0000 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 4, Pixel values: fbbb bbba aaaa aaa0 
	tsc
	sec
	sbc #154
	tcs
	pea $aaaa
	pea $babb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 2, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 1, Pixel values: 0ffb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$fb0f
	sta 1,S
	; Line 0, Pixel values: 000f ffff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char84:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 00fa aaa0 
	tsc
	sec
	sbc #168
	tcs
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fa00
	sta 5,S
	; Line 13, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 12, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 11, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 10, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 9, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 8, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 7, Pixel values: 0000 0000 00fb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	; Line 6, Pixel values: 0000 0000 0bbb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	; Line 5, Pixel values: faaa aaaa abbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbab
	pea $aaaa
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 4, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	; Line 0, Pixel values: ffff ffff fff0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $ffff
	pea $ffff
	lda 5,S
	and #$0f00
	ora #$f0ff
	sta 5,S
	jmp renderCharJumpReturn_font16

font16char85:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0aaa aa00 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff00
	ora #$00aa
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$aa0a
	sta 3,S
	; Line 13, Pixel values: 000b bbbb bbaa 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $aabb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 12, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 9, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb bbbf bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bfbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbbb bba0 fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 6, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 5, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 4, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 3, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 2, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 1, Pixel values: fbbb ba00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 0, Pixel values: ffff ff00 0fff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$ff0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ff
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char86:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 00aa a000 0000 
	tsc
	sec
	sbc #168
	tcs
	lda 5,S
	and #$ff0f
	ora #$00a0
	sta 5,S
	lda 3,S
	and #$00ff
	ora #$aa00
	sta 3,S
	; Line 13, Pixel values: 0000 0bbb ba00 0000 
	tsc
	sec
	sbc #160
	tcs
	lda 5,S
	and #$ff00
	ora #$00ba
	sta 5,S
	lda 3,S
	and #$00f0
	ora #$bb0b
	sta 3,S
	; Line 12, Pixel values: 0000 bbbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	; Line 11, Pixel values: 0000 bbbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	; Line 10, Pixel values: 000b bbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 9, Pixel values: 000b bbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 8, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 7, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 6, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 5, Pixel values: 0bbb bbb0 0fbb ba00 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 4, Pixel values: fbbb bbb0 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 3, Pixel values: fbbb bb00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fbbb bb00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 1, Pixel values: fbbb b000 000f bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0f00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00b0
	sta 3,S
	; Line 0, Pixel values: ffff f000 000f fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$f0ff
	ora #$0f00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char87:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 aaaa aaa0 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	; Line 13, Pixel values: 00bb bbbb bbba a000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 12, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 11, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 9, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 8, Pixel values: fbbb affb fffb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $fbff
	pea $fbaf
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 7, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 6, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 5, Pixel values: fbbb a0fb a0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fba0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$fba0
	sta 3,S
	; Line 4, Pixel values: fbbb a0ff f0fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$000f
	ora #$fbf0
	sta 5,S
	lda 3,S
	and #$000f
	ora #$ffa0
	sta 3,S
	; Line 3, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 2, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 1, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 0, Pixel values: ffff f000 00ff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$ff00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char88:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa a000 00aa aaa0 
	tsc
	sec
	sbc #166
	tcs
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$aa00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 13, Pixel values: fbbb ba00 0bbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0b
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00ba
	sta 3,S
	; Line 12, Pixel values: fbbb bba0 bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$a0bb
	sta 3,S
	; Line 11, Pixel values: fbbb bbba bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $babb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 10, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 9, Pixel values: 0fbb bbbb bbbb bb00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 8, Pixel values: 00fb bbbb bbbb b000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00b0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 7, Pixel values: 000b bbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$f0ff
	ora #$0b00
	sta 1,S
	; Line 6, Pixel values: 00bb bbbb bbbb a000 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 4, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbf bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bfbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbb0 fbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	tsc
	dec
	dec
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$0f00
	ora #$b0bb
	sta 3,S
	; Line 1, Pixel values: fbbb bb00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 0, Pixel values: ffff f000 00ff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$ff00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char89:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 aaaa aaa0 0000 
	tsc
	sec
	sbc #164
	tcs
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0aa
	sta 5,S
	; Line 13, Pixel values: 00bb bbbb bbba a000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 12, Pixel values: 0bbb bbbb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 11, Pixel values: 0bbb bbff fbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbfb
	pea $ffbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 10, Pixel values: fbbb bb00 0fbb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00f0
	ora #$bb0f
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 9, Pixel values: ffff f000 00bb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$bb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	; Line 8, Pixel values: 0000 0000 00bb bba0 
	tsc
	sec
	sbc #160
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$bb00
	sta 5,S
	; Line 7, Pixel values: 0000 bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 6, Pixel values: 00bb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$bb00
	sta 1,S
	; Line 5, Pixel values: 0bbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0b
	sta 1,S
	; Line 4, Pixel values: fbbb bbff fffb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $fbff
	pea $ffbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bb00 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff00
	ora #$00bb
	sta 3,S
	; Line 2, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 1, Pixel values: fbbb a000 00fb bba0 
	tsc
	sec
	sbc #158
	tcs
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$fb00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00a0
	sta 3,S
	; Line 0, Pixel values: ffff f000 00ff fff0 
	tsc
	sec
	sbc #158
	tcs
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 5,S
	and #$00ff
	ora #$ff00
	sta 5,S
	lda 3,S
	and #$ff0f
	ora #$00f0
	sta 3,S
	jmp renderCharJumpReturn_font16

font16char90:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: faaa aaaa aaaa aaa0 
	tsc
	sec
	sbc #162
	tcs
	pea $aaaa
	pea $aaaa
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0aa
	sta 7,S
	; Line 13, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 12, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 11, Pixel values: 0fbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$bb0f
	sta 1,S
	; Line 10, Pixel values: 00fb bbbb bbff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffbb
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	lda 1,S
	and #$00ff
	ora #$fb00
	sta 1,S
	; Line 9, Pixel values: 000f bbbb bba0 0000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	dec
	dec
	tcs
	lda 5,S
	and #$0f00
	ora #$a0bb
	sta 5,S
	lda 1,S
	and #$f0ff
	ora #$0f00
	sta 1,S
	; Line 8, Pixel values: 0000 fbbb bbba 0000 
	tsc
	sec
	sbc #154
	tcs
	pea $babb
	pea $bbfb
	; Line 7, Pixel values: 0000 0fbb bbbb a000 
	tsc
	sec
	sbc #156
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff0f
	ora #$00a0
	sta 7,S
	lda 3,S
	and #$00f0
	ora #$bb0f
	sta 3,S
	; Line 6, Pixel values: 0000 00fb bbbb ba00 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$ff00
	ora #$00ba
	sta 7,S
	lda 3,S
	and #$00ff
	ora #$fb00
	sta 3,S
	; Line 5, Pixel values: 0000 000f bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	tsc
	sec
	sbc #4
	tcs
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	lda 3,S
	and #$f0ff
	ora #$0f00
	sta 3,S
	; Line 4, Pixel values: faaa aaaa bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $aaaa
	pea $aafa
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 3, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 2, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 1, Pixel values: fbbb bbbb bbbb bba0 
	tsc
	sec
	sbc #154
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbfb
	lda 7,S
	and #$0f00
	ora #$a0bb
	sta 7,S
	; Line 0, Pixel values: ffff ffff ffff fff0 
	tsc
	sec
	sbc #154
	tcs
	pea $ffff
	pea $ffff
	pea $ffff
	lda 7,S
	and #$0f00
	ora #$f0ff
	sta 7,S
	jmp renderCharJumpReturn_font16

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
	jmp renderCharJumpReturn_font16

font16char92:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 10, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 9, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 8, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 7, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 6, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 5, Pixel values: abbb beee eebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbee
	pea $eebe
	pea $bbab
	; Line 4, Pixel values: babb bbee ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $eebb
	pea $bbba
	; Line 3, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char93:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 10, Pixel values: babb bbee ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $eebb
	pea $bbba
	; Line 9, Pixel values: abbb beee eebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbee
	pea $eebe
	pea $bbab
	; Line 8, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 7, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 6, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 5, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 4, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 3, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char94:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bbbb bebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbe
	pea $bbbb
	pea $bbab
	; Line 8, Pixel values: babb bbbb beeb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $ebbe
	pea $bbbb
	pea $bbba
	; Line 7, Pixel values: abbe eeee eeee bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $eeee
	pea $eeee
	pea $beab
	; Line 6, Pixel values: babb bbbb beeb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $ebbe
	pea $bbbb
	pea $bbba
	; Line 5, Pixel values: abbb bbbb bebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbe
	pea $bbbb
	pea $bbab
	; Line 4, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char95:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bebb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbe
	pea $bbab
	; Line 8, Pixel values: babb eebb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbee
	pea $bbba
	; Line 7, Pixel values: abbe eeee eeee bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $eeee
	pea $eeee
	pea $beab
	; Line 6, Pixel values: babb eebb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbee
	pea $bbba
	; Line 5, Pixel values: abbb bebb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbe
	pea $bbab
	; Line 4, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char96:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aaaa 
	pea $aaaa
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aaaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 8, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 7, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 6, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 5, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 4, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abab 
	tsc
	sec
	sbc #152
	tcs
	pea $abab
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char97:
	tya
	tcs
	; Line 15, Pixel values: aaaa aaaa aaaa aaaa 
	pea $aaaa
	pea $aaaa
	pea $aaaa
	pea $aaaa
	; Line 14, Pixel values: aaaa aaaa aaaa aaaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aaaa
	pea $aaaa
	pea $aaaa
	pea $aaaa
	; Line 13, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 12, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 11, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 10, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 9, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 8, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 7, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 6, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 5, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 4, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 3, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 2, Pixel values: bbbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 1, Pixel values: baba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baba
	; Line 0, Pixel values: abab abab abab abab 
	tsc
	sec
	sbc #152
	tcs
	pea $abab
	pea $abab
	pea $abab
	pea $abab
	jmp renderCharJumpReturn_font16

font16char98:
	tya
	tcs
	; Line 15, Pixel values: aaaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	pea $aaaa
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	; Line 14, Pixel values: aaaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aaaa
	; Line 13, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 12, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 11, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 10, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 9, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 8, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 7, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 6, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 5, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 4, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 3, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 2, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 1, Pixel values: baba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baba
	; Line 0, Pixel values: abab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	pea $abab
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	jmp renderCharJumpReturn_font16

font16char99:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbe ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bebb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bbbb bebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbe
	pea $bbbb
	pea $bbab
	; Line 8, Pixel values: babb bbbb ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bbbb
	pea $bbba
	; Line 7, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 6, Pixel values: babb bbeb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $ebbb
	pea $bbba
	; Line 5, Pixel values: abbb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbab
	; Line 4, Pixel values: babb bbbb ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbe
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char100:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbe ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bebb
	pea $bbba
	; Line 11, Pixel values: abbb bbbe ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bebb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bbeb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $ebbb
	pea $bbab
	; Line 8, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 7, Pixel values: abbb bbbb ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bbbb
	pea $bbab
	; Line 6, Pixel values: babb bbbb bebb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbe
	pea $bbbb
	pea $bbba
	; Line 5, Pixel values: abbb bbbb ebbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbeb
	pea $bbbb
	pea $bbab
	; Line 4, Pixel values: babb bbbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bebb
	pea $bbba
	; Line 3, Pixel values: abbb bbeb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $ebbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char101:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aaaa 
	pea $aaaa
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aaaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbe ebbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbeb
	pea $bebb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb bbbb bbeb bebe 
	tsc
	sec
	sbc #152
	tcs
	pea $bebe
	pea $ebbb
	pea $bbbb
	pea $bbab
	; Line 8, Pixel values: babb bbbb bbeb bbbe 
	tsc
	sec
	sbc #152
	tcs
	pea $bebb
	pea $ebbb
	pea $bbbb
	pea $bbba
	; Line 7, Pixel values: abbb bbbb bbeb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $ebbb
	pea $bbbb
	pea $bbab
	; Line 6, Pixel values: babb bbbb bbee ebbe 
	tsc
	sec
	sbc #152
	tcs
	pea $beeb
	pea $eebb
	pea $bbbb
	pea $bbba
	; Line 5, Pixel values: abbb bbbb bbeb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $ebbb
	pea $bbbb
	pea $bbab
	; Line 4, Pixel values: babb bbbb bbeb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $ebbb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbbb 
	tsc
	sec
	sbc #152
	tcs
	pea $bbbb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abab 
	tsc
	sec
	sbc #152
	tcs
	pea $abab
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char102:
	tya
	tcs
	; Line 15, Pixel values: aaaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	pea $aaaa
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	; Line 14, Pixel values: aaaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aaaa
	; Line 13, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 12, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 11, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 10, Pixel values: eebb beeb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $ebbe
	pea $bbee
	; Line 9, Pixel values: bbeb ebbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $beeb
	pea $ebbb
	; Line 8, Pixel values: eeeb ebbe bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $beeb
	pea $ebee
	; Line 7, Pixel values: bbeb eeeb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $ebee
	pea $ebbb
	; Line 6, Pixel values: eebb ebbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbeb
	pea $bbee
	; Line 5, Pixel values: bbbb ebbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbeb
	pea $bbbb
	; Line 4, Pixel values: bbbb ebbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbeb
	pea $bbbb
	; Line 3, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 2, Pixel values: bbbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbbb
	; Line 1, Pixel values: baba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baba
	; Line 0, Pixel values: abab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	pea $abab
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	jmp renderCharJumpReturn_font16

font16char103:
	tya
	tcs
	; Line 15, Pixel values: 0aaa aaaa aaaa aae0 
	tsc
	dec
	dec
	tcs
	pea $aaaa
	pea $aaaa
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$e0aa
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$aa0a
	sta 1,S
	; Line 14, Pixel values: bbaa aaaa aaaa aaee 
	tsc
	sec
	sbc #152
	tcs
	pea $eeaa
	pea $aaaa
	pea $aaaa
	pea $aabb
	; Line 13, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 12, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 11, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 10, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 9, Pixel values: abbb ebee bbbe ebaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aaeb
	pea $bebb
	pea $eeeb
	pea $bbab
	; Line 8, Pixel values: babe bbbb ebeb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $ebeb
	pea $bbbb
	pea $beba
	; Line 7, Pixel values: abbe ebbe bbeb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $ebbb
	pea $beeb
	pea $beab
	; Line 6, Pixel values: babe bbeb bbeb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $ebbb
	pea $ebbb
	pea $beba
	; Line 5, Pixel values: abbb ebbe ebbe ebaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aaeb
	pea $beeb
	pea $beeb
	pea $bbab
	; Line 4, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 3, Pixel values: abbb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbab
	; Line 2, Pixel values: babb bbbb bbbb bbaa 
	tsc
	sec
	sbc #152
	tcs
	pea $aabb
	pea $bbbb
	pea $bbbb
	pea $bbba
	; Line 1, Pixel values: ffba baba baba baba 
	tsc
	sec
	sbc #152
	tcs
	pea $baba
	pea $baba
	pea $baba
	pea $baff
	; Line 0, Pixel values: 0fab abab abab abb0 
	tsc
	sec
	sbc #154
	tcs
	pea $abab
	pea $abab
	tsc
	dec
	dec
	tcs
	lda 7,S
	and #$0f00
	ora #$b0ab
	sta 7,S
	lda 1,S
	and #$00f0
	ora #$ab0f
	sta 1,S
	jmp renderCharJumpReturn_font16

font16char104:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char105:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char106:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char107:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char108:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char109:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char110:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

font16char111:
	tya
	tcs
	; Line 15, Pixel values: 0000 0000 0000 0000 
	; Line 14, Pixel values: 0000 0000 0000 0000 
	; Line 13, Pixel values: 0000 0000 0000 0000 
	; Line 12, Pixel values: 0000 0000 0000 0000 
	; Line 11, Pixel values: 0000 0000 0000 0000 
	; Line 10, Pixel values: 0000 0000 0000 0000 
	; Line 9, Pixel values: 0000 0000 0000 0000 
	; Line 8, Pixel values: 0000 0000 0000 0000 
	; Line 7, Pixel values: 0000 0000 0000 0000 
	; Line 6, Pixel values: 0000 0000 0000 0000 
	; Line 5, Pixel values: 0000 0000 0000 0000 
	; Line 4, Pixel values: 0000 0000 0000 0000 
	; Line 3, Pixel values: 0000 0000 0000 0000 
	; Line 2, Pixel values: 0000 0000 0000 0000 
	; Line 1, Pixel values: 0000 0000 0000 0000 
	; Line 0, Pixel values: 0000 0000 0000 0000 
	jmp renderCharJumpReturn_font16

