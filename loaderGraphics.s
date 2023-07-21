loaderPalette:
	.word $0aef,$06af,$0800,$0861,$0c93,$0eb4,$0d66,$0f9a,$0777,$0f00,$0bbb,$0ddd,$007b,$0a5b,$0000,$0fff


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; showLoadingScreen
;
;
showLoadingScreen:
	lda #$0000
	jsr slowColorFill
	SHRVIDEO
	SHADOWMEMORY
	lda #loaderPalette
	sta PARAML0
	lda #0
	jsr setPalette
	BORDER_COLOR #$7
	lda #$1111
	jsr slowColorFill
	jsr renderLoadingBar
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; slowColorFill
; Fills the screen with a color (or two). Slow because it has to run from
; bank 0 on the slow graphics path
;
; A = 4:4:4:4 = Palette entries to fill
;
; Trashes X,Y

slowColorFill:
	ldy #200
	ldx #$2000
	
slowColorFillLoop:
	; 80 STAs, for 1 line
	; sta VRAMBANK,x	inx		inx
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8
	.byte $9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8,$9F,$00,$00,$E1,$e8,$e8

	dey
	beq slowColorFillLoopDone
	jmp slowColorFillLoop

slowColorFillLoopDone:
	rts
