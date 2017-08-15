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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayerHeader
;
; Y = Player index to render
;
renderPlayerHeader:
	SAVE_AXY

	tya		; Index to player structure
	asl
	asl
	asl
	tay

	ldx #0
	lda #angleStr
	jsr DrawString

	lda playerData+4,y
	ldx #24
	jsr drawNumber

	RESTORE_AXY
	rts

angleStr:
	pstring "ANGLE:"
