;
;  projectile
;  Code and data structures related to the projectiles
;
;  Created by Quinn Dunki on 8/13/17
;


projectileData:
	; gameobject data
	.word -1	; Pos X in pixels (from left terrain edge)
	.word 0		; Pos Y in pixels (from bottom terrain edge)

	.word 0		; Pos X (8.8 fixed point)
	.word 0		; Pos Y (8.8 fixed point)
	.word 0		; Velocity X (8.8 fixed point)
	.word 0		; Velocity Y (8.8 fixed point)

JD_POSX = 0		; Byte offsets into projectile data structure
JD_POSY = 2
JD_PRECISEX = 4
JD_PRECISEY = 6
JD_VX = 8
JD_VY = 10


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

	lda projectileParams		; Fixed point version of X pos
	xba
	sta (SCRATCHL),y
	iny
	iny

	lda projectileParams+2		; Fixed point version of Y pos
	xba
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

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectiles
;
; Trashes SCRATCHL
;
updateProjectiles:
	SAVE_AXY
	lda projectileData+JD_POSX
	bmi updateProjectilesDone

	; Integrate X velocity over position
	lda projectileData+JD_PRECISEX
	clc
	adc projectileData+JD_VX
	sta projectileData+JD_PRECISEX

	; Convert to integral for rendering
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sta projectileData+JD_POSX

	; Integrate Y velocity over position
	lda projectileData+JD_PRECISEY
	clc
	adc projectileData+JD_VY
	sta projectileData+JD_PRECISEY

	; Convert to integral for rendering
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sta projectileData+JD_POSY
brk
updateProjectilesDone:
	RESTORE_AXY
	rts
