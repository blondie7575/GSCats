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

	.word 45		; Angle in degrees from +X
	.word 50		; Power
	.byte 8,"SPROCKET "	; Name
	.word 0,0,0,0,0,0,0 ;Padding

	; gameobject data
	.word 0	; X pos in pixels (from left terrain edge)
	.word 0	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background

	.word 45		; Angle in degrees from +X
	.word 50		; Power
	.byte 8,"TINKER   "	; Name
	.word 0,0,0,0,0,0,0 ;Padding

PD_ANGLE = 36
PD_POWER = 38
PD_NAME = 40
PD_SIZE = 64

.macro PLAYERPTR_Y
	tya		; Pointer to player structure from index
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
; playerFire
;
; Y = Player index
;
playerFire:
	SAVE_AY
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

	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayers
;
;
renderPlayers:
	RENDER_GAMEOBJECT playerData
	RENDER_GAMEOBJECT playerData+PD_SIZE
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
	ldx #72
	jsr drawNumber

	ldx #96
	lda #powerStr
	jsr DrawString

	lda playerData+PD_POWER,y
	ldx #120
	jsr drawNumber

	RESTORE_AXY
	rts

angleStr:
	pstring "ANGLE:   "
powerStr:
	pstring "POWER:   "


