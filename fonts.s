

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

