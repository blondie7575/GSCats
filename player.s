;
;  players
;  Code and data structures related to the players
;
;  Created by Quinn Dunki on 8/13/17
;


playerData:
	; gameobject data
	.word 0	; X pos in pixels (from left terrain edge)
	.word 0	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.word 25			; Angle in degrees from +X
	.word 2				; Power
	.word 100			; Anger
	.byte 8,"SPROCKET "	; Name

	.repeat 108
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

	; gameobject data
	.word 0	; X pos in pixels (from left terrain edge)
	.word 0	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.word 155		; Angle in degrees from +X
	.word 2	; Power
	.word 100		; Anger
	.byte 8,"TINKER   "	; Name

	.repeat 108
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

PD_ANGLE = 132
PD_POWER = 134
PD_ANGER = 136
PD_NAME = 138
PD_SIZE = 256

.macro PLAYERPTR_Y
	tya		; Pointer to player structure from index
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	tay
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerCreate
;
; A = Player X pos
; Y = Index
; Trashes SCRATCHL
;
playerCreate:
	pha
	PLAYERPTR_Y
	sty SCRATCHL
	pla

	sta playerData+GO_POSX,y
	lda #playerData
	clc
	adc SCRATCHL
	sta PARAML0
	jsr placeGameObjectOnTerrain
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerDeltaAngle
;
; Y = Player index
; X = Delta
;
playerDeltaAngle:
	SAVE_AXY
	PLAYERPTR_Y

	txa
	clc
	adc playerData+PD_ANGLE,y
	bmi playerDeltaAngleClampLow
	cmp #180
	bpl playerDeltaAngleClampHigh

playerDeltaAngleStore:
	sta playerData+PD_ANGLE,y
	RESTORE_AXY
	rts

playerDeltaAngleClampLow:
	lda #0
	bra playerDeltaAngleStore

playerDeltaAngleClampHigh:
	lda #180
	bra playerDeltaAngleStore


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerDeltaPower
;
; Y = Player index
; X = Delta
;
playerDeltaPower:
	SAVE_AXY
	PLAYERPTR_Y

	txa
	clc
	adc playerData+PD_POWER,y
	beq playerDeltaPowerClampLow
	cmp #15
	bpl playerDeltaPowerClampHigh

playerDeltaPowerStore:
	sta playerData+PD_POWER,y
	RESTORE_AXY
	rts

playerDeltaPowerClampLow:
	lda #1
	bra playerDeltaPowerStore

playerDeltaPowerClampHigh:
	lda #15
	bra playerDeltaPowerStore


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerFire
;
; Y = Player index
;
playerFire:
	pha
	PLAYERPTR_Y

	lda playerData+GO_POSX,y
	sta projectileParams
	lda playerData+GO_POSY,y
	clc
	adc #GAMEOBJECTHEIGHT
	sta projectileParams+2
	lda playerData+PD_ANGLE,y
	sta projectileParams+4
	lda playerData+PD_POWER,y
	sta projectileParams+6
	jsr fireProjectile

	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerIntersectRect
;
; Y = Player index
; rectParams = Rectangle to intersect with us
; A => non zero if rectangle is intersecting player
;
playerIntersectRect:
	phy
	PLAYERPTR_Y

	lda playerData+GO_POSX,y
	sta rectParams2+0
	lda playerData+GO_POSY,y
	sta rectParams2+2
	lda #GAMEOBJECTWIDTH
	sta rectParams2+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams2+6

	jsr intersectRectRect
	ply
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayers
;
;
renderPlayers:
	SAVE_AXY
	RENDER_GAMEOBJECT playerData,0
	RENDER_GAMEOBJECT playerData+PD_SIZE,0
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectPlayers
;
;
protectPlayers:
	SAVE_AXY

	VRAM_PTR playerData
	lda #playerData+GO_BACKGROUND
	jsr protectGameObject

	VRAM_PTR playerData+PD_SIZE
	lda #playerData+GO_BACKGROUND+PD_SIZE
	jsr protectGameObject

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderPlayers
;
;
unrenderPlayers:
	SAVE_AXY
	UNRENDER_GAMEOBJECT playerData
	UNRENDER_GAMEOBJECT playerData+PD_SIZE
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayerHeader
;
; Y = Player index to render
;
renderPlayerHeader:
	SAVE_AXY
	PLAYERPTR_Y

	ldx #0
	tya
	clc
	adc #playerData
	adc #PD_NAME
	jsr DrawString

	ldx #48
	lda #angleStr
	jsr DrawString

	lda playerData+PD_ANGLE,y
	ldx #56
	jsr drawNumber

	ldx #68
	lda #powerStr
	jsr DrawString

	lda playerData+PD_POWER,y
	ldx #76
	jsr drawNumber

	ldx #88
	lda #angerStr
	jsr DrawString

	lda playerData+PD_ANGER,y
	ldx #96
	jsr drawNumber

	RESTORE_AXY
	rts

angleStr:
	pstring "*:   "
powerStr:
	pstring "+:   "
angerStr:
	pstring "):   "


