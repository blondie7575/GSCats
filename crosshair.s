;
;  crosshair
;  Code and data structures related to the aiming crosshair
;
;  Created by Quinn Dunki on 2/13/21
;


crosshairGameObject:
	.word 100	; X pos in pixels (from right terrain edge)
	.word 100	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background 128 bytes
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateCrosshair
;
; Y = Player index to update for
; Trashes SCRATCHL, PARAML0, PARAML1
;
updateCrosshair:
	SAVE_AXY

	PLAYERPTR_Y

	; Calculate X offset
	lda playerData+PD_ANGLE,y
	asl
	tax
	lda pixelCircle45X,x
	bmi updateCrosshairNegX

	; Compute screenspace X
	sta SCRATCHL
	clc
	lda playerData+GO_POSX,y
	adc SCRATCHL
	sta crosshairGameObject+GO_POSX
	bra updateCrosshairCalcY

updateCrosshairNegX:
	eor #$FFFF
	inc
	
	; Compute screenspace X
	sta SCRATCHL
	sec
	lda playerData+GO_POSX,y
	sbc SCRATCHL
	sta crosshairGameObject+GO_POSX

updateCrosshairCalcY:
	; Calculate Y offset
	lda playerData+PD_ANGLE,y
	asl
	tax
	lda pixelCircle45Y,x
	sta SCRATCHL

	; Compute screenspace Y
	clc
	lda playerData+GO_POSY,y
	adc SCRATCHL
	sta crosshairGameObject+GO_POSY

updateCrosshairDone:

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderCrosshair
;
; Y = Player index to render for
; Trashes Y,PARAML0,SCRATCHL
;
renderCrosshair:
	pha
	PLAYERPTR_Y

	lda #crosshairGameObject
	sta PARAML0

	lda playerData+PD_POWER,y		; Choose reticle size for power level
	sta SCRATCHL
	lda #14
	clc
	adc SCRATCHL
	jsr renderGameObject

renderCrosshairDone:
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectCrosshair
;
; Trashes PARAML0
;
protectCrosshair:
	pha

	lda #crosshairGameObject
	sta PARAML0
	jsr vramPtr
	cpx #$ffff
	beq protectCrosshairDone

	lda #crosshairGameObject+GO_BACKGROUND
	sta PARAML0
	jsr protectGameObject

protectCrosshairDone:
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderCrosshair
;
; Trashes PARAML0
;
unrenderCrosshair:
	pha

	lda #crosshairGameObject
	sta PARAML0
	jsr unrenderGameObject

unrenderCrosshairDone:
	pla
	rts
