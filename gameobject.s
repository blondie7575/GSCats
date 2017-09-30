;
;  gameobject
;  Code and data structures related to the game objects
;
;  Created by Quinn Dunki on 8/13/17
;

GAMEOBJECTWIDTH = 16
GAMEOBJECTHEIGHT = 16

; Base class sample:
;gameobjectData:
;	.word 40	; X pos in pixels (from right terrain edge)
;	.word 38	; Y pos in pixels (from bottom terrain edge)
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 64 bytes
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

GO_POSX = 0		; Byte offsets into gameobject data structure
GO_POSY = 2
GO_BACKGROUND = 4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; placeGameObjectOnTerrain
;
; PARAML0 = Pointer to gameobject data
; Trashes SCRATCHL
;
placeGameObjectOnTerrain:
	SAVE_AY

	ldy #GO_POSX
	lda (PARAML0),y
	clc					; Map into reversed terrain X space
	adc #GAMEOBJECTWIDTH
	sta SCRATCHL
	lda #TERRAINWIDTH
	sec
	sbc SCRATCHL

	and #$fffe				; Force even
	tay
	lda terrainData,y

	clc
	adc #GAMEOBJECTHEIGHT
	ldy #GO_POSY
	sta (PARAML0),y

	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RENDER_GAMEOBJECT
;
; ptr = Pointer to gameobject data
; Trashes SCRATCHL
;
.macro RENDER_GAMEOBJECT ptr,compiledSprite
.scope
	SAVE_AXY

	; Find gameobject location in video memory
	ldy #0

	; X
	lda ptr+GO_POSX,y

	lsr
	cmp leftScreenEdge
	bmi renderGameobjectSkip	; Gameobject is off left edge of screen
	cmp rightScreenEdge
	bpl renderGameobjectSkip	; Gameobject is off right edge of screen

	sec							; Convert byte x-pos to screenspace
	sbc leftScreenEdge
	sta SCRATCHL

	; Y
	sec
	lda #200
	sbc ptr+GO_POSY,y

	bmi renderGameobjectSkip	; Gameobject is off top edge of screen
	cmp #200 - GAMEOBJECTHEIGHT
	bpl renderGameobjectSkip	; Gameobject is off bottom edge of screen

	asl
	tax
	lda vramYOffset,x
	clc
	adc SCRATCHL
	adc #$2000
	tax		; X now contains the bank address of the upper left corner

	phx
	bra renderGameobjectBackground

renderGameobjectSkip:
	jmp renderGameobjectDone

renderGameobjectBackground:
	; Save background
	lda VRAMBANK,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*2+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*2+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*2+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*3,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*3+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*3+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*3+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*4+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*4+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*4+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*5,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*5+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*5+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*5+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*6+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*6+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*6+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*7,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*7+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*7+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*7+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*8,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*8+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*8+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*8+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*9,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*9+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*9+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*9+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*10,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*10+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*10+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*10+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*11,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*11+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*11+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*11+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*12,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*12+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*12+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*12+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*13,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*13+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*13+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*13+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*14,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*14+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*14+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*14+6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny

	lda VRAMBANK+160*15,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*15+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*15+4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAMBANK+160*15+6,x
	sta ptr+GO_BACKGROUND,y

	; Draw sprite
	ply
	jsr compiledSprite

renderGameobjectDone:
	RESTORE_AXY
.endscope
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UNRENDER_GAMEOBJECT
;
; ptr = Pointer to gameobject data
; Trashes SCRATCHL
;
.macro UNRENDER_GAMEOBJECT ptr
.scope
	SAVE_AXY

	; Find gameobject location in video memory
	ldy #0

	; X
	lda ptr+GO_POSX,y
	lsr
	cmp leftScreenEdge
	bmi unrenderGameobjectSkip	; Gameobject is off left edge of screen
	cmp rightScreenEdge
	bpl unrenderGameobjectSkip	; Gameobject is off right edge of screen

	sec
	sbc leftScreenEdge
	sta SCRATCHL

	; Y
	sec
	lda #200
	sbc ptr+GO_POSY,y
	bmi unrenderGameobjectSkip	; Gameobject is off top edge of screen
	cmp #200 - GAMEOBJECTHEIGHT
	bpl unrenderGameobjectSkip	; Gameobject is off bottom edge of screen

	asl
	tax
	lda vramYOffset,x
	clc
	adc SCRATCHL
	adc #$2000
	tax			; X now contains the VRAM offset of the upper left corner

	bra unrenderGameobjectBackground

unrenderGameobjectSkip:
	jmp unrenderGameobjectDone

unrenderGameobjectBackground:
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*2+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*2+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*2+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*3,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*3+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*3+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*3+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*4+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*4+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*4+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*5,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*5+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*5+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*5+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*6,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*6+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*6+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*6+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*7,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*7+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*7+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*7+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*8,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*8+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*8+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*8+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*9,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*9+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*9+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*9+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*10,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*10+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*10+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*10+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*11,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*11+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*11+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*11+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*12,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*12+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*12+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*12+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*13,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*13+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*13+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*13+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*14,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*14+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*14+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*14+6,x
	iny
	iny

	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*15,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*15+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*15+4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAMBANK+160*15+6,x

unrenderGameobjectDone:
	RESTORE_AXY
.endscope
.endmacro
