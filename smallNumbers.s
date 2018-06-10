; Mini font render dedicated to small numbers.
; Adapted from Dagen Brock's general purpose font
; engine, also in this project
;
; A= ptr to string preceded by length
; X= screen location
; Trashes zero page locations 6,7
;
F_LEN:		.word 0          ;length of string (only one byte currently used)
F_DIGITIDX:	.word 0          ;index of current character
F_CURRPOS:	.word 0          ;current top left char position
F_NUMPTR = $06                 ;pointer to string (including length byte) / DP


DrawNumber:
	SAVE_AXY

	sta F_NUMPTR
	stx F_CURRPOS
	stz F_DIGITIDX
	lda (F_NUMPTR)
	and #$00ff    ;strip off first char (len is only one byte)
	sta F_LEN ;get our length byte

nextDigit:
	lda F_DIGITIDX
	cmp F_LEN
	bne moreDigits

	RESTORE_AXY
	rts

moreDigits:
	inc F_DIGITIDX
	ldy F_DIGITIDX
	lda (F_NUMPTR),y   	;get next char!
	and #$00FF    		;mask high byte
	sec
	sbc #'0'      		;our table starts with space ' '
	asl
	tay
	ldx F_CURRPOS
	jsr drawDigit
	inc F_CURRPOS
	inc F_CURRPOS           ;update screen pos (1 word=4 pixels)
	bra nextDigit

;x = TopLeft screen pos
;y = char table offset
drawDigit:
	lda DigitTable,y       ;get real address of char data
	sec
	sbc #DigitData  	;pivot offset - now a is offset of fontdata
	tay           		;so we'll index with that

	lda DigitData,y
	sta $012000,x

	lda DigitData+2,y
	sta $012000+160,x

	lda DigitData+4,y
	sta $012000+160*2,x

	lda DigitData+6,y
	sta $012000+160*3,x

	lda DigitData+8,y
	sta $012000+160*4,x

	rts





DigitTable:
	.addr s_0
	.addr s_1
	.addr s_2
	.addr s_3
	.addr s_4
	.addr s_5
	.addr s_6
	.addr s_7
	.addr s_8
	.addr s_9

DigitData:

s_0:
	fontword $FFF0
	fontword $F0F0
	fontword $F0F0
	fontword $F0F0
	fontword $FFF0

s_1:
	fontword $0F00
	fontword $FF00
	fontword $0F00
	fontword $0F00
	fontword $0F00

s_2:
	fontword $FFF0
	fontword $00F0
	fontword $FFF0
	fontword $F000
	fontword $FFF0

s_3:
	fontword $FFF0
	fontword $00F0
	fontword $FFF0
	fontword $00F0
	fontword $FFF0

s_4:
	fontword $F0F0
	fontword $F0F0
	fontword $FFF0
	fontword $00F0
	fontword $00F0

s_5:
	fontword $FFF0
	fontword $F000
	fontword $FFF0
	fontword $00F0
	fontword $FFF0

s_6:
	fontword $FFF0
	fontword $F000
	fontword $FFF0
	fontword $F0F0
	fontword $FFF0

s_7:
	fontword $FFF0
	fontword $00F0
	fontword $00F0
	fontword $00F0
	fontword $00F0

s_8:
	fontword $FFF0
	fontword $F0F0
	fontword $FFF0
	fontword $F0F0
	fontword $FFF0

s_9:
	fontword $FFF0
	fontword $F0F0
	fontword $FFF0
	fontword $00F0
	fontword $00F0

