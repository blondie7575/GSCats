;
;  gameobject
;  Code and data structures related to the game objects
;
;  Created by Quinn Dunki on 8/13/17
;

GAMEOBJECTWIDTH = 16
GAMEOBJECTHEIGHT = 16
MAXGAMEOBJECTS = 6		; Size of general purpose object pool

; Base class sample:
;gameobjectData:
;	.word 40	; X pos in pixels (from right terrain edge)
;	.word 38	; Y pos in pixels (from bottom terrain edge)
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

GO_POSX = 0		; Byte offsets into gameobject data structure
GO_POSY = 2
GO_BACKGROUND = 4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; terrainHeightAtGameObjectPos
;
; A = GameObject position (left-edge relative)
; A -> Terrain height at that position
;
; Trashes SCRATCHL
;
terrainHeightAtGameObjectPos:
	phy
	clc					; Map into reversed terrain X space
	adc #GAMEOBJECTWIDTH
	sta SCRATCHL
	lda #TERRAINWIDTH
	sec
	sbc SCRATCHL

	and #$fffe				; Force even
	tay
	lda terrainData,y
	ply
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; placeGameObjectOnTerrainDefault
;
; PARAML0 = Pointer to gameobject data
;
; Trashes SCRATCHL,SCRATCHL2
;
placeGameObjectOnTerrainDefault:
	stz placeGameObjectRightOffset
	pha
	lda #GAMEOBJECTWIDTH
	sta placeGameObjectLeftOffset
	pla
	jmp placeGameObjectOnTerrain


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; placeGameObjectOnTerrain
;
; PARAML0 = Pointer to gameobject data
; placeGameObjectLeftOffset = Left edge of height to check (default=GAMEOBJECTWIDTH)
; placeGameObjectRightOffset = Right edge of height to check (default=0)
;
; Trashes SCRATCHL,SCRATCHL2
;
placeGameObjectOnTerrain:
	SAVE_AY

	; Check forwardmost position
	ldy #GO_POSX
	lda (PARAML0),y
	clc
	adc placeGameObjectRightOffset

	jsr terrainHeightAtGameObjectPos
	sta SCRATCHL2

	; Check rearmost position
	ldy #GO_POSX
	lda (PARAML0),y
	sec
	sbc placeGameObjectLeftOffset

	jsr terrainHeightAtGameObjectPos
	cmp SCRATCHL2			; Take higher value
	bcc placeGameObjectOnTerrainRear

placeGameObjectOnTerrainDone:
	clc
	adc #GAMEOBJECTHEIGHT
	ldy #GO_POSY
	sta (PARAML0),y

	RESTORE_AY
	rts

placeGameObjectOnTerrainRear:
	lda SCRATCHL2
	bra placeGameObjectOnTerrainDone
	

placeGameObjectLeftOffset:
	.word GAMEOBJECTWIDTH
placeGameObjectRightOffset:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; moveGameObjectOnTerrain
;
; PARAML0 = Pointer to gameobject data
; X = Delta in pixels
;
; Trashes SCRATCHL,SCRATCHL2
;
moveGameObjectOnTerrain:
	SAVE_AY

	stx SCRATCHL2

	ldy #GO_POSX
	lda (PARAML0),y
	clc
	adc SCRATCHL2		; Apply X delta
	pha

	; Check for impassable gaps
	sec
	sbc #GAMEOBJECTWIDTH/2

moveGameObjectOnTerrainCheckHeight:
	jsr terrainHeightAtGameObjectPos
	cmp #0
	beq moveGameObjectOnTerrainTooFar

moveGameObjectOnTerrainStore:
	ldy #GO_POSX
	pla
	sta (PARAML0),y
	jsr placeGameObjectOnTerrain

moveGameObjectOnTerrainTooDone:
	RESTORE_AY
	rts

moveGameObjectOnTerrainTooFar:
	pla
	bra moveGameObjectOnTerrainTooDone

moveGameObjectLeftOffset:
	.word 0
moveGameObjectRightOffset:
	.word GAMEOBJECTWIDTH


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; vramPtr
;
; PARAML0 = Pointer to X,Y (16 bits each, Y is bottom relative)
; X => Offset to upper left corner of VRAM, or $ffff if offscreen
;
; Trashes SCRATCHL
;
vramPtr:
	SAVE_AY

	; X
	ldy #GO_POSX
	lda (PARAML0),y

	lsr
	cmp leftScreenEdge
	bmi vramPtrSkip	; Gameobject is off left edge of screen
	cmp rightScreenEdge
	bpl vramPtrSkip	; Gameobject is off right edge of screen

	sec							; Convert byte x-pos to screenspace
	sbc leftScreenEdge
	sta SCRATCHL

	; Y
	sec
	lda #200
	ldy #GO_POSY
	sbc (PARAML0),y

	bmi vramPtrSkip	; Gameobject is off top edge of screen
	cmp #200 - GAMEOBJECTHEIGHT
	bpl vramPtrSkip	; Gameobject is off bottom edge of screen

	asl
	tax
	lda vramYOffset,x
	clc
	adc SCRATCHL
	adc #$2000
	tax		; X now contains the bank address of the upper left corner
	bra vramPtrDone

vramPtrSkip:
	ldx #$ffff

vramPtrDone:
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderGameObject
;
; PARAML0 = Pointer to gameobject data
; A = Sprite index
;
; Trashes SCRATCHL
;
renderGameObject:
	SAVE_XY

	; Find gameobject location in video memory
	jsr vramPtr
	cpx #$ffff
	beq renderGameobjectDone

	; Call compiled sprite code
	txy
;	SAVE_AXY				; DEBUG BOUNDS RENDER
	clc
	jsr DrawSpriteBank

;	RESTORE_AXY				; DEBUG BOUNDS RENDER
;	lda #11					; DEBUG BOUNDS RENDER
;	clc						; DEBUG BOUNDS RENDER
;	jsr DrawSpriteBank		; DEBUG BOUNDS RENDER

renderGameobjectDone:
	RESTORE_XY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectGameObject
;
; Saves background behind this game object
; PARAML0 = Pointer to gameobject background data
; X = VRAM position of upper left of game object
;
; Trashes PARAML0
;
protectGameObject:
	phy
	ldy #0

	lda SHADOWVRAMBANK,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*3,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*5,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*6,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*7,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*8,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*9,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*10,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*11,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*12,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*13,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*14,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+6,x
	sta (PARAML0),y
	iny
	iny

	lda SHADOWVRAMBANK+160*15,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+2,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+4,x
	sta (PARAML0),y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+6,x
	sta (PARAML0),y

	ply
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderGameObject
;
; PARAML0 = Pointer to gameobject data
; Trashes SCRATCHL
;
unrenderGameObject:
	SAVE_AXY

	; Find gameobject location in video memory
	jsr vramPtr
	cpx #$ffff
	beq unrenderGameobjectSkip
	bra unrenderGameobjectBackground

unrenderGameobjectSkip:
	jmp unrenderGameobjectDone

unrenderGameobjectBackground:
	ldy #GO_BACKGROUND

	lda (PARAML0),y
	sta SHADOWVRAMBANK,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*2+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*2+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*2+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*3,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*3+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*3+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*3+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*4+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*4+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*4+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*5,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*5+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*5+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*5+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*6,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*6+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*6+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*6+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*7,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*7+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*7+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*7+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*8,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*8+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*8+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*8+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*9,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*9+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*9+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*9+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*10,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*10+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*10+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*10+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*11,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*11+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*11+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*11+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*12,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*12+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*12+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*12+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*13,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*13+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*13+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*13+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*14,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*14+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*14+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*14+6,x
	iny
	iny

	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*15,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*15+2,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*15+4,x
	iny
	iny
	lda (PARAML0),y
	sta SHADOWVRAMBANK+160*15+6,x

unrenderGameobjectDone:
	RESTORE_AXY
	rts


.macro GAMEOBJECTPTR_X
	txa		; Pointer to game object type structure from index
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	tax
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; allocGameObject
;
; Returns offset of gameobject structure in X, or -1 if none available
;
allocGameObject:
	SAVE_AY
	ldy #0

allocGameObjectLoop:
	tyx
	GAMEOBJECTPTR_X
	lda gameObjectPool+GO_POSX,x
	bmi allocGameObjectDone
	iny
	cpy #MAXGAMEOBJECTS
	bne allocGameObjectLoop
	ldx #-1

allocGameObjectDone:
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteGameObject
;
; Deletes the game object at offset X
;
deleteGameObject:
	pha
	lda #-1
	sta gameObjectPool+GO_POSX,x
	pla
	rts


; A general purpose pool allocator for game objects. Useful
; for those times you need an object, but not a full fledged
; Player, Projectile, or other subclass.
gameObjectPool:
	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


	.word -1	; X pos in pixels (from right terrain edge)
	.word 0		; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 64 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.repeat 124
	.byte 0		; Padding to 256-byte boundary
	.endrepeat



