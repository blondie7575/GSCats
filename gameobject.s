;
;  gameobject
;  Code and data structures related to the game objects
;
;  Created by Quinn Dunki on 8/13/17
;

GAMEOBJECTWIDTH = 8
GAMEOBJECTHEIGHT = 8

; Base class sample:
;gameobjectData:
;	.word 40	; X pos in pixels (from right terrain edge)
;	.word 38	; Y pos in pixels (from bottom terrain edge)
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background

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
.macro RENDER_GAMEOBJECT ptr
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
	tax		; X now contains the VRAM offset of the upper left corner
	phx
	bra renderGameobjectBackground

renderGameobjectSkip:
	jmp renderGameobjectDone

renderGameobjectBackground:
	; Save background
	lda VRAM,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*2+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*3,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*3+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*4,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*4+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*5,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*5+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*6,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*6+2,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*7,x
	sta ptr+GO_BACKGROUND,y
	iny
	iny
	lda VRAM+160*7+2,x
	sta ptr+GO_BACKGROUND,y
	plx

	; Draw sprite
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
	tax			; X now contains the VRAM offset of the upper left corner

	bra unrenderGameobjectBackground

unrenderGameobjectSkip:
	jmp unrenderGameobjectDone

unrenderGameobjectBackground:
	lda ptr+GO_BACKGROUND,y
	sta VRAM,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*2+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*3,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*3+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*4,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*4+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*5,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*5+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*6,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*6+2,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*7,x
	iny
	iny
	lda ptr+GO_BACKGROUND,y
	sta VRAM+160*7+2,x

unrenderGameobjectDone:
	RESTORE_AXY
.endscope
.endmacro
