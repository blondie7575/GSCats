;
;  projectile
;  Code and data structures related to the projectiles
;
;  Created by Quinn Dunki on 8/13/17
;


projectileData:
	; gameobject data
	.word 40	; X pos in pixels (from left terrain edge)
	.word 38	; Y pos in pixels (from bottom terrain edge)

	.word 0		; Velocity (8.8 fixed point)

JD_V = 4	; Byte offsets into projectile data structure


projectileParams:
	.word 0		; Starting pos X
	.word 0		; Starting pos Y
	.word 0		; Initial angle
	.word 0		; Initial power


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fireProjectile
;
; PARAML0 = Pointer to projectileParams
;
; Trashes SCRATCHL
;
fireProjectile:
	SAVE_AXY

	; Set up projectile structure
	ldy #0
	ldx #0
	lda #projectileData		; Only one active at a tiem for now
	sta SCRATCHL

;	lda (PARAML0),x		; X pos
;	sta (SCRATCHL),y
;	inx
;	inx
;	iny
;	iny
;	lda (PARAML0),x		; Y pos
;	sta (SCRATCHL),y
;	inx
;	inx
;	lda (PARAML0),x		;

fireProjectileLoop:


	RESTORE_AXY
	rts
