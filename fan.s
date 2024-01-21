;
;  fan
;  Code and data structures related to the special fan weapon
;
;  Created by Quinn Dunki on 8/15/18
;

FANRANGE = 100	; In pixels
FANMAGNITUDE = $20		; 12.4 fixed point speed delta, in pixels
FAN_AGE = 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deployFan
;
; Y: Index to projectile structure
;
deployFan:
	SAVE_AY

	lda #200					; Drop in from the top of the view
	sta projectileData+GO_POSY,y

	lda #$c80
	sta projectileData+JD_PRECISEY,y

	lda #0
	sta projectileData+JD_VX,y
	sta projectileData+JD_VY,y

	lda #1
	sta projectileData+JD_DEPLOYDELAY,y	; Let player admire new fan

	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateFan
;
; Y = Offset to projectile structure
;
updateFan:
	SAVE_AXY

	lda projectileData+JD_AGE,y
	cmp #FAN_AGE
	bcs updateFanWornOut

	lda projectileData+JD_STATIC,y
	bne updateFanWind		; We're set up, so apply our wind

	; Wait for fan to collide with us as it falls from the sky
	lda projectileData+GO_POSX,y
	sta rectParams
	lda projectileData+GO_POSY,y
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

	ldx currentPlayer
	jsr playerIntersectRect
	cmp #0
	beq updateFanDone

	; Once fan is in place, make it static
	lda projectileData+GO_POSY,y
	inc
	inc
	sta projectileData+GO_POSY,y
	lda #1
	sta projectileData+JD_STATIC,y
	jsr endProjectile

	; Now set up the stand
	jsr allocGameObject
	cpx #-1
	beq updateFanDone
	txa
	sta projectileData+JD_SCRATCH,y		; Remember where our stand is
	lda projectileData+GO_POSX,y
	sta gameObjectPool+GO_POSX,x
	lda projectileData+GO_POSY,y
	sec
	sbc #GAMEOBJECTHEIGHT
	sta gameObjectPool+GO_POSY,x
	
updateFanDone:
	RESTORE_AXY
	rts

updateFanWornOut:
	jsr deleteVisibleProjectile
	bra updateFanDone

updateFanWind:
	lda projectileData+JD_OWNER,y
	cmp currentPlayer		; We're not affected by our own fan
	beq updateFanDone

	tyx
	ldy projectileActive
	bmi updateFanDone		; No active projectile

	; Calculate distance to fan
	lda projectileData+GO_POSX,y
	sta SCRATCHL
	lda projectileData+GO_POSX,x
	sec
	sbc SCRATCHL
	ABSA
	cmp #FANRANGE			; Check if we're within range
	bcs updateFanDone

	; Apply wind
	lda projectileData+JD_FACING,y
	bne updateFanWindNeg

	sec
	lda projectileData+JD_PRECISEX,y
	sbc #FANMAGNITUDE
	sta projectileData+JD_PRECISEX,y
	bra updateFanDone

updateFanWindNeg:
	clc
	lda projectileData+JD_PRECISEX,y
	adc #FANMAGNITUDE
	sta projectileData+JD_PRECISEX,y
	bra updateFanDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderFan
;
; Y = Offset to projectile structure
;
renderFan:
	SAVE_AXY

	lda projectileData+JD_STATIC,y
	beq renderFanDone		; Don't render the stand until we're static

	; Render the stand under the fan
	lda projectileData+JD_SCRATCH,y
	sta PARAML0
	clc
	lda #gameObjectPool
	adc PARAML0
	sta PARAML0
	lda #14
	jsr renderGameObject

	; Do deployment delay after first render
	lda projectileData+JD_DEPLOYDELAY,y
	beq renderFanDone
	jsr delayLong
	lda #0
	sta projectileData+JD_DEPLOYDELAY,y

renderFanDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderFan
;
; Y = Offset to projectile structure
;
unrenderFan:
	SAVE_AXY

	; Unrender the stand under the fan
	lda projectileData+JD_SCRATCH,y
	sta PARAML0
	clc
	lda #gameObjectPool
	adc PARAML0
	sta PARAML0
	jsr unrenderGameObject

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectFan
;
; Y = Offset to projectile structure
;
protectFan:
	SAVE_AXY

	; Protect the stand under the fan
	lda projectileData+JD_SCRATCH,y
	sta PARAML0
	clc
	lda #gameObjectPool
	adc PARAML0
	sta PARAML0
	jsr vramPtr
	cpx #$ffff
	beq protectFanDone

	lda PARAML0
	clc
	adc #GO_BACKGROUND
	sta PARAML0
	jsr protectGameObject

protectFanDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteFan
;
; Y = Offset to projectile structure
;
deleteFan:
	SAVE_AX

	lda projectileData+JD_SCRATCH,y
	tax

	; Unrender the stand
	lda #gameObjectPool
	sta PARAML0
	txa
	clc
	adc PARAML0
	sta PARAML0
	jsr unrenderGameObject

	jsr deleteGameObject
	jsr renderPlayers

	RESTORE_AX
	rts
