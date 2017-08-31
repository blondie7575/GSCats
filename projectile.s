;
;  projectile
;  Code and data structures related to the projectiles
;
;  Created by Quinn Dunki on 8/13/17
;


projectileData:
	; gameobject data (we're a subclass, effectively)
	.word -1	; Pos X in pixels (from left terrain edge)
	.word 0		; Pos Y in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background

	.word 0		; Pos X (12.4 fixed point)
	.word 0		; Pos Y (12.4 fixed point)
	.word 0		; Velocity X (8.8 fixed point)
	.word 0		; Velocity Y (8.8 fixed point)

JD_PRECISEX = 36		; Byte offsets into projectile data structure
JD_PRECISEY = 38
JD_VX = 40
JD_VY = 42

GRAVITY = $ffff	; 8.8 fixed point


.macro PROJECTILEPTR_Y
	tya		; Pointer to projectile structure from index
	asl
	asl
	asl
	asl
	tay
.endmacro



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
	ldy #0							; Only one active at a time for now
	PROJECTILEPTR_Y

	lda projectileParams		; X pos
	sta projectileData+GO_POSX,y
	lda projectileParams+2		; Y pos
	sta projectileData+GO_POSY,y

	lda projectileParams		; Fixed point version of X pos
	asl
	asl
	asl
	asl
	sta projectileData+JD_PRECISEX,y

	lda projectileParams+2		; Fixed point version of Y pos
	asl
	asl
	asl
	asl
	sta projectileData+JD_PRECISEY,y

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorX,x		; Velocity X
	sta projectileData+JD_VX,y

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorY,x		; Velocity Y
	sta projectileData+JD_VY,y

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectiles
;
; Trashes SCRATCHL
;
updateProjectiles:
	SAVE_AY
	lda projectileData+GO_POSX
	bmi updateProjectilesDone

	; Integrate gravity over velocity
	lda projectileData+JD_VY
	clc
	adc #GRAVITY
	sta projectileData+JD_VY

	; Integrate X velocity over position
	lda projectileData+JD_VX
	; Convert 8.8 to 12.4
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	clc
	adc projectileData+JD_PRECISEX
	sta projectileData+JD_PRECISEX

	; Convert to integral for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSX
	bmi updateProjectilesDelete
	cmp #TERRAINWIDTH-GAMEOBJECTWIDTH-1
	bpl updateProjectilesDelete

	; Integrate Y velocity over position
	lda projectileData+JD_VY
	; Convert 8.8 to 12.4
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	clc
	adc projectileData+JD_PRECISEY
	sta projectileData+JD_PRECISEY

	; Convert to integral for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSY
	cmp #GAMEOBJECTHEIGHT
	bmi updateProjectilesDelete
	cmp #201
	bpl updateProjectilesDelete

	; Check for terrain collisions
	lda projectileData+GO_POSX
	sta rectParams
	lda projectileData+GO_POSY
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

	jsr intersectRect
	cmp #0
	bne updateProjectilesDelete

updateProjectilesDone:
	RESTORE_AY
	rts

updateProjectilesDelete:
	ldy #0
	jsr deleteProjectile
	bra updateProjectilesDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteProjectile
;
; Y = Projectile index
; Trashes A
;
deleteProjectile:
	PROJECTILEPTR_Y
	lda #-1
	sta projectileData+GO_POSX,y
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderProjectiles
;
;
renderProjectiles:
	pha
	lda projectileData
	bpl renderProjectilesDoIt
	jmp renderProjectilesDone

renderProjectilesDoIt:
	RENDER_GAMEOBJECT projectileData

renderProjectilesDone:
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderProjectiles
;
;
unrenderProjectiles:
	pha
	lda projectileData
	bpl unrenderProjectilesDoIt
	jmp unrenderProjectilesDone

unrenderProjectilesDoIt:
	UNRENDER_GAMEOBJECT projectileData

unrenderProjectilesDone:
	pla
	rts
