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
; Y = Player index to render for
; Trashes SCRATCHL, PARAML0, PARAML1
;
updateCrosshair:
	SAVE_AX

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
	lda playerData+GO_POSX
	adc SCRATCHL
	sta crosshairGameObject+GO_POSX
	bra updateCrosshairCalcY

updateCrosshairNegX:
	eor #$FFFF
	inc
	
	; Compute screenspace X
	sta SCRATCHL
	sec
	lda playerData+GO_POSX
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
	lda playerData+GO_POSY
	adc SCRATCHL
	sta crosshairGameObject+GO_POSY

updateCrosshairDone:

	RESTORE_AX
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderCrosshair
;
;
renderCrosshair:
	SAVE_AXY

	lda #crosshairGameObject
	sta PARAML0
	lda #15
	jsr renderGameObject

renderCrosshairDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderCrosshair
;
;
unrenderCrosshair:
	pha

	lda #crosshairGameObject
	sta PARAML0
	jsr unrenderGameObject

unrenderCrosshairDone:
	pla
	rts
