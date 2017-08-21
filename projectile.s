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

	.word 0		; Velocity X (8.8 fixed point)
	.word 0		; Velocity Y (8.8 fixed point)

JD_V = 4	; Byte offsets into projectile data structure


projectileParams:
	.word 0		; Starting pos X
	.word 0		; Starting pos Y
	.word 0		; Initial angle
	.word 0		; Initial power


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fireProjectile
;
; Trashes SCRATCHL
;
fireProjectile:
	SAVE_AXY

	; Set up projectile structure
	ldy #0
	lda #projectileData		; Only one active at a time for now
	sta SCRATCHL

	lda projectileParams		; X pos
	sta (SCRATCHL),y
	iny
	iny
	lda projectileParams+2		; Y pos
	sta (SCRATCHL),y
	iny
	iny

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorX,x		; Velocity X

	sta (SCRATCHL),y
	iny
	iny

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorY,x		; Velocity Y
	sta (SCRATCHL),y

	brk
fireProjectileLoop:


	RESTORE_AXY
	rts
