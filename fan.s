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
;
updateFan:
	SAVE_AY

	; Wait for fan to collide with us as it falls from the sky
	ldy #0
	lda projectileData+GO_POSX,y
	sta rectParams
	lda projectileData+GO_POSY,y
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

	jsr playerIntersectRect
	cmp #0
	beq updateFanDone

updateFanDone:
	RESTORE_AY

	rts


