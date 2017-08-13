;
;  gameobject
;  Code and data structures related to the game objects
;
;  Created by Quinn Dunki on 8/13/17
;

GAMEOBJECTWIDTH = 8
GAMEOBJECTHEIGHT = 8


gameobjectData:
	.word 40	; X pos in pixels (from left terrain edge)
	.word 38	; Y pos in pixels (from bottom terrain edge)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderGameobject
;
; PARAML0 = Pointer to gameobject data
;
renderGameobject:
	SAVE_AXY

	; Find gameobject location in video memory
	ldy #0

	; X
	lda (PARAML0),y
	lsr
	sec
	sbc leftScreenEdge
	bmi renderGameobjectDone	; Gameobject is off left edge of screen
	cmp #320 - GAMEOBJECTWIDTH
	bpl renderGameobjectDone	; Gameobject is off right edge of screen
	sta SCRATCHL

	; Y
	iny
	iny
	sec
	lda #200
	sbc (PARAML0),y
	bmi renderGameobjectDone	; Gameobject is off top edge of screen
	cmp #200 - GAMEOBJECTHEIGHT
	bpl renderGameobjectDone	; Gameobject is off bottom edge of screen

	asl
	tax
	lda vramYOffset,x
	clc
	adc SCRATCHL
	tax

	; X now contains the VRAM offset of the upper left corner
	lda #$FFFF
	sta VRAM,x
	sta VRAM+2,x
	sta VRAM+160,x
	sta VRAM+160+2,x
	sta VRAM+160*2,x
	sta VRAM+160*2+2,x
	sta VRAM+160*3,x
	sta VRAM+160*3+2,x
	sta VRAM+160*4,x
	sta VRAM+160*4+2,x
	sta VRAM+160*5,x
	sta VRAM+160*5+2,x
	sta VRAM+160*6,x
	sta VRAM+160*6+2,x
	sta VRAM+160*7,x
	sta VRAM+160*7+2,x

renderGameobjectDone:
	RESTORE_AXY
	rts
