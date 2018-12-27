;
;  fan
;  Code and data structures related to the special fan weapon
;
;  Created by Quinn Dunki on 8/15/18
;

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

	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateFan
;
; Y = Offset to projectile structure
;
updateFan:
	SAVE_AXY

	lda projectileData+JD_STATIC,y
	bne updateFanDone		; We're already static, so no work to do

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
	lda #1
	sta projectileData+JD_STATIC,y
	jsr endProjectile

	; Now set up the stand
	lda projectileData+GO_POSX,y
	sta standGameObjectData+GO_POSX
	lda projectileData+GO_POSY,y
	sec
	sbc #GAMEOBJECTHEIGHT
	sta standGameObjectData+GO_POSY,y

updateFanDone:
	RESTORE_AXY
	rts


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
	lda #standGameObjectData
	sta PARAML0
	lda #14
	jsr renderGameObject

renderFanDone:
	RESTORE_AXY
	rts


; Fake game object for rendering the stand
standGameObjectData:
	.word 40	; X pos in pixels (from right terrain edge)
	.word 38	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 64 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
