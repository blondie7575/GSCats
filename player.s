;
;  players
;  Code and data structures related to the players
;
;  Created by Quinn Dunki on 8/13/17
;


playerData:
	; gameobject data
	.word 40	; X pos in pixels (from left terrain edge)
	.word 38	; Y pos in pixels (from bottom terrain edge)

	.word 45		; Angle in degrees from +X
	.word 50		; Power

PD_POSX = 0	; Byte offsets into player data structure
PD_POSY = 2
PD_ANGLE = 4
PD_POWER = 6

.macro PLAYERPTR_Y
	tya		; Pointer to player structure from index
	asl
	asl
	asl
	tay
.endmacro


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

	lda playerData+PD_POSX,y
	sta projectileParams
	lda playerData+PD_POSY,y
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
	lda #playerData
	sta PARAML0
	jsr renderGameobject
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
	lda #angleStr
	jsr DrawString

	lda playerData+PD_ANGLE,y
	ldx #24
	jsr drawNumber

	ldx #48
	lda #powerStr
	jsr DrawString

	lda playerData+PD_POWER,y
	ldx #72
	jsr drawNumber

	RESTORE_AXY
	rts

angleStr:
	pstring "ANGLE:   "
powerStr:
	pstring "POWER:   "


