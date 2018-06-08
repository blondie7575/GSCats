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
	.word 1				; Base Sprite

	.repeat 106
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
	.word 0				; Base Sprite

	.repeat 106
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

PD_ANGLE = 132
PD_POWER = 134
PD_ANGER = 136
PD_NAME = 138
PD_BASESPRITE = 148
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

	lda #playerData
	sta PARAML0
	lda playerData+PD_BASESPRITE
	jsr renderGameObject

	lda #playerData+PD_SIZE
	sta PARAML0
	lda playerData+PD_SIZE+PD_BASESPRITE
	jsr renderGameObject

RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectPlayers
;
;
protectPlayers:
	SAVE_AXY

	lda #playerData
	sta PARAML0
	jsr vramPtr
	cpx #0
	bmi protectPlayerNext

	lda #playerData+GO_BACKGROUND
	jsr protectGameObject

protectPlayerNext:
	lda #playerData+PD_SIZE
	sta PARAML0
	jsr vramPtr
	cpx #0
	bmi protectPlayerDone

	lda #playerData+GO_BACKGROUND+PD_SIZE
	jsr protectGameObject

protectPlayerDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderPlayers
;
;
unrenderPlayers:
	SAVE_AXY
	lda #playerData
	sta PARAML0
	jsr unrenderGameObject

	lda #playerData+PD_SIZE
	sta PARAML0
	jsr unrenderGameObject
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

	ldx #0 + 321
	tya
	clc
	adc #playerData
	adc #PD_NAME
	jsr DrawString

	ldx #48 + 321
	lda #angleStr
	jsr DrawString

	lda playerData+PD_ANGLE,y
	ldx #56 + 321
	jsr drawNumber

	ldx #68 + 321
	lda #powerStr
	jsr DrawString

	lda playerData+PD_POWER,y
	ldx #76 + 321
	jsr drawNumber

	ldx #88 + 321
	lda #angerStr
	jsr DrawString

	lda playerData+PD_ANGER,y
	ldx #96 + 321
	jsr drawNumber

	RESTORE_AXY
	rts

angleStr:
	pstring "*:   "
powerStr:
	pstring "+:   "
angerStr:
	pstring "):   "


