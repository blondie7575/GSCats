;
;  projectile
;  Code and data structures related to the projectiles
;
;  Created by Quinn Dunki on 8/13/17
;


projectileData:
	; Gameobject data (we're a subclass, effectively)
	.word -1	; Pos X in pixels (from left terrain edge)
	.word 0		; Pos Y in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.word 0		; Pos X (12.4 fixed point)
	.word 0		; Pos Y (12.4 fixed point)
	.word 0		; Velocity X (8.8 fixed point)
	.word 0		; Velocity Y (8.8 fixed point)
	.word 0		; Type
	.word 1		; New?

	.repeat 112
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

; Byte offsets for that ^ data structure can be found in equates.s


GRAVITY = $ffff	; 8.8 fixed point

projectileTypes:
	PT_SPIT = 0
	PT_BOMB = 1
	PT_FAN = 2

	; Spit
	.word 3			; Damage
	.word 3 		; Crater radius
	.word 4			; Frame 0
	.word 6			; Frame 1
	.word 8			; Frame 2
	.addr 0			; Deploy
	.addr 0			; Update
	.addr 0			; Render

	;.word 		; Padding to 16-byte boundary (none needed)

	; Bomb
	.word 50		; Damage
	.word 10		; Crater radius
	.word 3			; Frame 0
	.word 3			; Frame 1
	.word 3			; Frame 2
	.addr 0			; Deploy
	.addr 0			; Update
	.addr 0			; Render

	;.word 		; Padding to 16-byte boundary (none needed)

	; Fan
	.word 3			; Damage
	.word 3			; Crater radius
	.word 12		; Frame 0
	.word 12		; Frame 1
	.word 12		; Frame 2
	.addr deployFan ; Deploy
	.addr updateFan	; Update
	.addr 0			; Render

	;.word 		; Padding to 16-byte boundary (none needed)


PT_DAMAGE = 0		; Byte offsets into projectile type data structure
PT_RADIUS = 2
PT_FRAME0 = 4
PT_FRAME1 = 6
PT_FRAME2 = 8
PT_DEPLOY = 10
PT_UPDATE = 12
PT_RENDER = 14

.macro PROJECTILEPTR_Y
	tya		; Pointer to projectile structure from index
	asl
	asl
	asl
	asl
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
	asl
	asl
	tay
.endmacro



projectileParams:
	.word 0		; Starting pos X
	.word 0		; Starting pos Y
	.word 0		; Initial angle
	.word 0		; Initial power
	.word 0		; Type


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fireProjectile
;
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

	lda projectileParams+8		; Type
	sta projectileData+JD_TYPE,y

	; Check for special deployment code
	phy
	tay							; Find projectile type data
	PROJECTILETYPEPTR_Y

	lda projectileTypes+PT_DEPLOY,y
	beq fireProjectileStandardDeploy
	ply
	JSRA
	bra fireProjectileFinish

fireProjectileStandardDeploy:
	ply

	; Standard physics setup
	jsr prepareProjectilePhysics

fireProjectileFinish:
	lda #1
	sta projectileData+JD_NEW,y
	stz projectileActive

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prepareProjectilePhysics
;
; Y: Index to projectile structure
;
prepareProjectilePhysics:
	SAVE_AXY

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

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectilePhysics
;
; Trashes SCRATCHL
;
updateProjectilePhysics:
	SAVE_AY

	lda projectileData+GO_POSX
	bpl updateProjectilePhysicsActive
	jmp updateProjectilePhysicsDone

updateProjectilePhysicsActive:
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

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSX
	bmi updateProjectilePhysicsDelete
	cmp #TERRAINWIDTH-GAMEOBJECTWIDTH-1
	bpl updateProjectilePhysicsDelete

updateProjectilePhysicsContinue:
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

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSY
	cmp #GAMEOBJECTHEIGHT
	bmi updateProjectilePhysicsDelete

	; Check for special update code
	ldy #0
	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y
	lda projectileTypes+PT_UPDATE,y
	beq updateProjectilePhysicsDone
	JSRA

updateProjectilePhysicsDone:
	RESTORE_AY
	rts

updateProjectilePhysicsDelete:
	jsr endProjectile
	bra updateProjectilePhysicsDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectileCollisions
;
; Trashes SCRATCHL
;
updateProjectileCollisions:
	SAVE_AY

	; Check for player collisions
	ldy #0
	lda projectileData+GO_POSX
	bmi updateProjectileCollisionsDone	; Projectile not active
	sta rectParams
	lda projectileData+GO_POSY
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6

updateProjectileCollisionsPlayerLoop:
	cpy currentPlayer
	beq updateProjectileCollisionsPlayerNext

	jsr playerIntersectRect
	cmp #0
	bne updateProjectileCollisionsPlayerHit

updateProjectileCollisionsPlayerNext:
	iny
	cpy #NUMPLAYERS
	bne updateProjectileCollisionsPlayerLoop

	; Check for terrain collisions
	lda projectileData+GO_POSX
	inc
	inc
	sta rectParams
	lda projectileData+GO_POSY
	clc
	inc
	inc
	sta rectParams+2
	lda #GAMEOBJECTWIDTH-4
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT-4
	sta rectParams+6

	jsr intersectRectTerrain
	cmp #0
	bne updateProjectileCollisionsTerrainHit

updateProjectileCollisionsDone:
	RESTORE_AY
	rts

updateProjectileCollisionsPlayerHit:
	jsr processPlayerImpact
	jsr endProjectile
	bra updateProjectileCollisionsDone

updateProjectileCollisionsTerrainHit:
	jsr processTerrainImpact
	jsr endProjectile
	bra updateProjectileCollisionsDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; endProjectile
;
; Trashes A and Y
;
endProjectile:
	lda #projectileData
	sta PARAML0
	jsr unrenderGameObject
	ldy #0
	jsr deleteProjectile
	lda #1
	sta turnRequested
	lda #-1
	sta projectileActive
	rts


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
; protectProjectiles
;
;
protectProjectiles:
	SAVE_AXY

	lda projectileData
	bmi protectProjectilesDone

	lda #projectileData
	sta PARAML0
	jsr vramPtr
	cpx #0
	bmi protectProjectilesDone

	lda #projectileData+GO_BACKGROUND
	jsr protectGameObject

protectProjectilesDone:
	RESTORE_AXY
	rts


UPANGLE = $00af
DNANGLE = $ffaf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderProjectiles
;
;
renderProjectiles:
	SAVE_AY

	lda projectileData
	bpl renderProjectilesDoIt
	jmp renderProjectilesDone

renderProjectilesDoIt:

	lda projectileData+JD_TYPE
	tay
	PROJECTILETYPEPTR_Y

	lda #projectileData
	sta PARAML0

	; Determine which sprite to use
	lda projectileData+JD_VX
	bmi renderProjectilesNegX

	lda projectileData+JD_VY

	bmi renderProjectilesNegYPosX
	cmp #UPANGLE
	bmi renderProjectilesFlat

renderProjectilesUpAngle:
	lda projectileTypes+PT_FRAME0,y		; Up angle
	bra renderProjectilesGoSprite

renderProjectilesNegYPosX:
	cmp #DNANGLE
	bpl renderProjectilesFlat

renderProjectilesDownAngle:
	lda projectileTypes+PT_FRAME2,y		; Down angle
	bra renderProjectilesGoSprite

renderProjectilesNegX:
	lda projectileData+JD_VY

	bmi renderProjectilesNegYNegX

	cmp #UPANGLE
	bmi renderProjectilesFlat
	bra renderProjectilesDownAngle

renderProjectilesNegYNegX:
	cmp #DNANGLE
	bpl renderProjectilesFlat
	bra renderProjectilesUpAngle

renderProjectilesFlat:
	lda projectileTypes+PT_FRAME1,y		; Flat

renderProjectilesGoSprite:
	jsr renderGameObject
	
renderProjectilesDone:
	RESTORE_AY
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
	lda #projectileData
	sta PARAML0
	jsr unrenderGameObject

unrenderProjectilesDone:
	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processPlayerImpact
;
; Y = Index of player that was hit
;
processPlayerImpact:
	PLAYERPTR_Y
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processTerrainImpact
;
; Trashes A,Y
;
processTerrainImpact:
	ldy #0		; Assume projectile 0
	PROJECTILEPTR_Y
	lda projectileData+GO_POSX,y
	clc
	adc #GAMEOBJECTWIDTH/2
	sta PARAML0
	lda projectileData+GO_POSY,y
	sec
	sbc #GAMEOBJECTHEIGHT
	sta PARAML1

	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y

	lda projectileTypes+PT_RADIUS,y
	tay

	jsr craterTerrain
	jsr compileTerrain
	jsr clipTerrain

	rts
