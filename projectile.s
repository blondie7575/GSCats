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
	.word 0		; Type
	.word 1		; New?

JD_PRECISEX = 36		; Byte offsets into projectile data structure
JD_PRECISEY = 38
JD_VX = 40
JD_VY = 42
JD_TYPE = 44
JD_NEW = 46

GRAVITY = $ffff	; 8.8 fixed point

projectileTypes:		; Byte offsets into projectile type data structure
	.word 50		; Damage
	.word 0,0,0	; Padding

PT_DAMAGE = 0



.macro PROJECTILEPTR_Y
	tya		; Pointer to projectile structure from index
	asl
	asl
	asl
	asl
	tay
.endmacro

.macro PROJECTILETYPEPTR_Y
	tya		; Pointer to projectile type structure from index
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

	lda projectileParams+6		; Convert power to 8.8
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	sta projectileParams+6

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorX,x		; Velocity X (unit vector)

	sta PARAML1
	lda projectileParams+6		; Scale by power
	sta PARAML0
	jsr mult88
	sta projectileData+JD_VX,y

	lda projectileParams+4		; Convert angle to vector
	asl
	tax
	lda angleToVectorY,x		; Velocity Y (unit vector)
	sta PARAML1
	lda projectileParams+6		; Scale by power
	sta PARAML0
	jsr mult88
	sta projectileData+JD_VY,y

	lda #1
	sta projectileData+JD_NEW,y
	stz projectileActive

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
	bpl updateProjectilesActive
	jmp updateProjectilesDone

updateProjectilesActive:
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
	bmi updateProjectilesOffWorld
	cmp #TERRAINWIDTH-GAMEOBJECTWIDTH-1
	bpl updateProjectilesOffWorld
	bra updateProjectilesContinue

updateProjectilesOffWorld:
	jmp updateProjectilesDelete

updateProjectilesContinue:
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

	; Check for player collisions
	ldy #0
	lda projectileData+GO_POSX
	sta rectParams
	lda projectileData+GO_POSY
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

updateProjectilesPlayerLoop:
	iny
	cpy #NUMPLAYERS
	beq updateProjectilesPlayerDone
	cpy currentPlayer
	beq updateProjectilesPlayerLoop
	jsr playerIntersectRect
	cmp #0
	bne updateProjectilesPlayerHit

updateProjectilesPlayerDone:

	; Check for terrain collisions
	lda projectileData+GO_POSX
	sta rectParams
	lda projectileData+GO_POSY
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

	jsr intersectRectTerrain
	cmp #0
	bne updateProjectilesTerrainHit

updateProjectilesDone:
	RESTORE_AY
	rts

updateProjectilesDelete:
	ldy #0
	jsr deleteProjectile
	lda #1
	sta turnRequested
	lda #-1
	sta projectileActive
	bra updateProjectilesDone

updateProjectilesPlayerHit:
	jsr processPlayerImpact
	bra updateProjectilesDelete

updateProjectilesTerrainHit:
	bra updateProjectilesDelete


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
	bpl unrenderProjectilesActive
	jmp unrenderProjectilesDone

unrenderProjectilesActive:
	lda projectileData+JD_NEW
	beq unrenderProjectilesDoIt
	stz projectileData+JD_NEW
	jmp unrenderProjectilesDone

unrenderProjectilesDoIt:
	UNRENDER_GAMEOBJECT projectileData

unrenderProjectilesDone:
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processPlayerImpact
;
; Y = Byte offset of player that was hit
;
processPlayerImpact:
	tyx

	ldy #0		; Assume projectile 0
	PROJECTILEPTR_Y
	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y

	; Apply damage
	lda playerData+PD_ANGER,x
	sec
	sbc projectileTypes+PT_DAMAGE,y

	; Check for death
	beq processPlayerImpactDeath
	bmi processPlayerImpactDeath
	sta playerData+PD_ANGER,x
	rts

processPlayerImpactDeath:
	lda currentPlayer
	sta gameOver
	rts
