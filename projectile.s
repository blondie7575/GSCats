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
	.word 0		; Static?
	.word 0		; Owner (player index)
	.word 0		; Facing (0,1) = (+X,-X)
	.word 0		; Scratch space for subclasses
	.word 0		; Age (in turns)
	.word 0		; Deployment delay needed?

	.repeat 100
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


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
	.word 0		; Static?
	.word 0		; Owner (player index)
	.word 0		; Facing (0,1) = (+X,-X)
	.word 0		; Scratch space for subclasses
	.word 0		; Age (in turns)

	.repeat 102
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


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
	.word 0		; Static?
	.word 0		; Owner (player index)
	.word 0		; Facing (0,1) = (+X,-X)
	.word 0		; Scratch space for subclasses
	.word 0		; Age (in turns)

	.repeat 102
	.byte 0		; Padding to 256-byte boundary
	.endrepeat


; Byte offsets for that-^ data structure can be found in equates.s


GRAVITY = $fffa	; 8.8 fixed point

projectileTypes:
	PT_SPIT = 0
	PT_BOMB = 1
	PT_FAN = 2
	PT_MOVELEFT = 3
	PT_MOVERIGHT = 4

	; Spit
	.word 4			; Damage
	.word 3 		; Crater radius
	.word 4			; Frame 0
	.word 6			; Frame 1
	.word 8			; Frame 2
	.addr 0			; Deploy
	.addr 0			; Update
	.addr 0			; Render
	.addr 0			; Unrender
	.addr 0			; Protect
	.addr 0			; Cleanup
	.word 1			; Directional
	.word 1			; Mining

	.repeat 6
	.byte 0 		; Padding to 32-byte boundary
	.endrepeat

	; Bomb
	.word 50		; Damage
	.word 10		; Crater radius
	.word 3			; Frame 0
	.word 3			; Frame 1
	.word 3			; Frame 2
	.addr 0			; Deploy
	.addr 0			; Update
	.addr 0			; Render
	.addr 0			; Unrender
	.addr 0			; Protect
	.addr 0			; Cleanup
	.word 0			; Directional
	.word 0			; Mining

	.repeat 6
	.byte 0 		; Padding to 32-byte boundary
	.endrepeat

	; Fan
	.word 0			; Damage
	.word 3			; Crater radius
	.word 12		; Frame 0
	.word 12		; Frame 1
	.word 12		; Frame 2
	.addr deployFan ; Deploy
	.addr updateFan	; Update
	.addr renderFan	; Render
	.addr unrenderFan ; Unrender
	.addr protectFan ; Protect
	.addr deleteFan	; Cleanup
	.word 1			; Directional
	.word 0			; Mining

	.repeat 6
	
	.byte 0 		; Padding to 32-byte boundary
	.endrepeat

	; Move Left
	.word 0			; Damage
	.word 0			; Crater radius
	.word 0			; Frame 0
	.word 38		; Frame 1
	.word 0			; Frame 2
	.addr 0 		; Deploy
	.addr 0			; Update
	.addr 0			; Render
	.addr 0 		; Unrender
	.addr 0 		; Protect
	.addr 0			; Cleanup
	.word 0			; Directional
	.word 0			; Mining

	.repeat 6
	
	.byte 0 		; Padding to 32-byte boundary
	.endrepeat

	; Move Right
	.word 0			; Damage
	.word 0			; Crater radius
	.word 0			; Frame 0
	.word 39		; Frame 1
	.word 0			; Frame 2
	.addr 0 		; Deploy
	.addr 0			; Update
	.addr 0			; Render
	.addr 0 		; Unrender
	.addr 0 		; Protect
	.addr 0			; Cleanup
	.word 0			; Directional
	.word 0			; Mining

	.repeat 6
	
	.byte 0 		; Padding to 32-byte boundary
	.endrepeat


PT_DAMAGE = 0		; Byte offsets into projectile type data structure
PT_RADIUS = 2
PT_FRAME0 = 4
PT_FRAME1 = 6
PT_FRAME2 = 8
PT_DEPLOY = 10
PT_UPDATE = 12
PT_RENDER = 14
PT_UNRENDER = 16
PT_PROTECT = 18
PT_CLEANUP = 20
PT_DIRECTIONAL = 22
PT_MINING = 24

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
	asl
	tay
.endmacro

.macro PROJECTILETYPEPTR_X
	txa		; Pointer to projectile type structure from index
	asl
	asl
	asl
	asl
	asl
	tax
.endmacro

projectileParams:
	.word 0		; Starting pos X
	.word 0		; Starting pos Y
	.word 0		; Initial angle
	.word 0		; Initial power
	.word 0		; Type


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; allocProjectile
;
; Returns offset of projectile structure in Y, or -1 if none available
;
allocProjectile:
	SAVE_AX
	ldx #0

allocProjectileLoop:
	txy
	PROJECTILEPTR_Y
	lda projectileData+GO_POSX,y
	bmi allocProjectileDone
	inx
	cpx #MAXPROJECTILES
	bne allocProjectileLoop
	ldy #-1

allocProjectileDone:
	RESTORE_AX
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fireProjectile
;
;
fireProjectile:
	SAVE_AXY

	; Allocate a projectile
	jsr allocProjectile
	cpy #-1
	beq fireProjectileDone

	; Set up projectile structure
	lda projectileParams		; X pos
	sta projectileData+GO_POSX,y
	lda projectileParams+2		; Y pos
	sta projectileData+GO_POSY,y
	lda #0
	sta projectileData+JD_STATIC,y
	sta projectileData+JD_AGE,y
	sty projectileActive
	lda currentPlayer
	sta projectileData+JD_OWNER,y

	; Set facing. For now assume player orientations are constant
	beq fireProjectilePosX
	lda #1
	sta projectileData+JD_FACING,y
	bra fireProjectileSetup
fireProjectilePosX:
	lda #0
	sta projectileData+JD_FACING,y

fireProjectileSetup:
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

fireProjectileDone:
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
; updateProjectilesPhysics
;
;
updateProjectilesPhysics:
	SAVE_AXY
	ldx #0

updateProjectilesPhysicsLoop:
	txy
	PROJECTILEPTR_Y
	jsr updateProjectilePhysics

updateProjectilesPhysicsSkip:
	inx
	cpx #MAXPROJECTILES
	bne updateProjectilesPhysicsLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectilePhysics
;
; Y = Offset to projectile structure
;
updateProjectilePhysics:
	SAVE_AXY

	lda projectileData+GO_POSX,y
	bmi updateProjectilePhysicsDone		; Not allocated
	lda projectileData+JD_STATIC,y
	bne updateProjectilePhysicsSpecial		; Static

updateProjectilePhysicsActive:
	; Integrate gravity over velocity
	lda projectileData+JD_VY,y
	clc
	adc #GRAVITY
	sta projectileData+JD_VY,y

	; Integrate X velocity over position
	lda projectileData+JD_VX,y
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
	adc projectileData+JD_PRECISEX,y
	adc globalWind						; Add wind
	sta projectileData+JD_PRECISEX,y

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSX,y
	bmi updateProjectilePhysicsDelete
	cmp #TERRAINWIDTH-GAMEOBJECTWIDTH-1
	bpl updateProjectilePhysicsDelete

updateProjectilePhysicsContinue:
	; Integrate Y velocity over position
	lda projectileData+JD_VY,y
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
	adc projectileData+JD_PRECISEY,y
	sta projectileData+JD_PRECISEY,y

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta projectileData+GO_POSY,y
	cmp #GAMEOBJECTHEIGHT
	bmi updateProjectilePhysicsDelete

updateProjectilePhysicsSpecial:
	; Check for special update code
	phy
	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y
	lda projectileTypes+PT_UPDATE,y
	beq updateProjectilePhysicsNormalUpdate
	ply
	JSRA

updateProjectilePhysicsDone:
	RESTORE_AXY
	rts

updateProjectilePhysicsDelete:
	jsr endDeleteCurrProjectile
	bra updateProjectilePhysicsDone

updateProjectilePhysicsNormalUpdate:
	ply
	bra updateProjectilePhysicsDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectilesCollisions
;
;
updateProjectilesCollisions:
	SAVE_AXY
	ldx #0

updateProjectilesCollisionsLoop:
	txy
	PROJECTILEPTR_Y
	jsr updateProjectileCollisions

updateProjectilesCollisionsSkip:
	inx
	cpx #MAXPROJECTILES
	bne updateProjectilesCollisionsLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateProjectileCollisions
;
; Y = Offset to projectile structure
;
updateProjectileCollisions:
	SAVE_AXY

	; Check for player collisions
	lda projectileData+JD_STATIC,y
	bne updateProjectileCollisionsDone	; Static
	lda projectileData+GO_POSX,y
	bmi updateProjectileCollisionsDone	; Not allocated
	sta rectParams
	lda projectileData+GO_POSY,y
	sta rectParams+2
	lda #GAMEOBJECTWIDTH
	sta rectParams+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams+6
	ldx #0

updateProjectileCollisionsPlayerLoop:
	cpx currentPlayer
	beq updateProjectileCollisionsPlayerNext

	jsr playerIntersectRect
	cmp #0
	bne updateProjectileCollisionsPlayerHit

updateProjectileCollisionsPlayerNext:
	inx
	cpx #NUMPLAYERS
	bne updateProjectileCollisionsPlayerLoop

	; Check for terrain collisions
	lda projectileData+GO_POSX,y
	inc
	inc
	sta rectParams
	lda projectileData+GO_POSY,y
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
	RESTORE_AXY
	rts

updateProjectileCollisionsPlayerHit:
	jsr processPlayerImpact
	jsr endDeleteCurrProjectile
	bra updateProjectileCollisionsDone

updateProjectileCollisionsTerrainHit:
	jsr processTerrainImpact
	jsr endDeleteCurrProjectile
	bra updateProjectileCollisionsDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processTurnForProjectiles
;
;
processTurnForProjectiles:
	SAVE_AXY
	ldx #0

processTurnForProjectilesLoop:
	txy
	PROJECTILEPTR_Y

	lda projectileData+JD_AGE,y
	inc
	sta projectileData+JD_AGE,y

processTurnForProjectilesSkip:
	inx
	cpx #MAXPROJECTILES
	bne processTurnForProjectilesLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; endDeleteCurrProjectile
;
; Trashes A and Y
;
endDeleteCurrProjectile:
	lda #projectileData
	clc
	adc projectileActive
	sta PARAML0
	jsr unrenderGameObject
	ldy projectileActive
	jsr deleteProjectile
	bra endProjectile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteVisibleProjectile
;
; Y = Projectile offset
; Trashes A
;
deleteVisibleProjectile:
	lda #projectileData
	sta PARAML0
	tya
	clc
	adc PARAML0
	sta PARAML0
	jsr unrenderGameObject
	bra deleteProjectile


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; endProjectile
;
; Trashes A
;
endProjectile:
	lda #1
	sta turnRequested
	lda #-1
	sta projectileActive
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteProjectile
;
; Y = Projectile offset
; Trashes A
;
deleteProjectile:
	phx
	lda projectileData+GO_POSX,y
	bmi deleteProjectileDone	; Already deleted

	lda #-1
	sta projectileData+GO_POSX,y

	; Check for special cleanup code
	lda projectileData+JD_TYPE,y
	tax							; Find projectile type data
	PROJECTILETYPEPTR_X

	lda projectileTypes+PT_CLEANUP,x
	beq deleteProjectileDone
	JSRA

deleteProjectileDone:
	plx
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; deleteAllProjectiles
;
deleteAllProjectiles:
	SAVE_AXY

	ldx #0
deleteAllProjectilesLoop:
	txy
	PROJECTILEPTR_Y
	jsr deleteProjectile
	inx
	cpx #3
	bne deleteAllProjectilesLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectProjectiles
;
;
protectProjectiles:
	SAVE_AXY

	ldx #0

protectProjectilesLoop:
	txy
	PROJECTILEPTR_Y
	lda projectileData+GO_POSX,y
	bpl protectProjectilesGotOne

protectProjectilesContinue:
	inx
	cpx #MAXPROJECTILES
	beq protectProjectilesDone
	bra protectProjectilesLoop

protectProjectilesGotOne:
	lda #projectileData+GO_POSX
	sta PARAML0
	clc
	tya
	adc PARAML0
	sta PARAML0
	phx
	jsr vramPtr
	cpx #$ffff
	beq protectProjectilesOffscreen

	lda #projectileData+GO_BACKGROUND
	sta PARAML0
	clc
	tya
	adc PARAML0
	sta PARAML0
	jsr protectGameObject

	; Check for special deployment code
	lda projectileData+JD_TYPE,y
	tax
	PROJECTILETYPEPTR_X
	lda projectileTypes+PT_PROTECT,x
	beq protectProjectilesNotSpecial
	JSRA

protectProjectilesNotSpecial:
	plx
	bra protectProjectilesContinue

protectProjectilesDone:
	RESTORE_AXY
	rts

protectProjectilesOffscreen:
	plx
	bra protectProjectilesContinue

UPANGLE = $00af
DNANGLE = $ffaf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderProjectiles
;
;
renderProjectiles:
	SAVE_AXY
	ldx #0

renderProjectilesLoop:
	txy
	PROJECTILEPTR_Y
	jsr renderProjectile

renderProjectilesSkip:
	inx
	cpx #MAXPROJECTILES
	bne renderProjectilesLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderProjectile
;
; Y = Offset to projectile structure
; Trashes SCRATCHL
;
renderProjectile:
	SAVE_AXY

	lda projectileData+GO_POSX,y
	bpl renderProjectileDoIt
	jmp renderProjectileDone

renderProjectileDoIt:
	lda projectileData+JD_TYPE,y
	tax
	PROJECTILETYPEPTR_X

	lda #projectileData		; Calculate pointer for game object render
	sta PARAML0
	clc
	tya
	adc PARAML0
	sta PARAML0

	; Determine which sprite to use
	lda projectileData+JD_VY,y

	bmi renderProjectileNegYPosX
	cmp #UPANGLE
	bmi renderProjectileFlat

renderProjectileUpAngle:
	lda projectileTypes+PT_FRAME0,x		; Up angle
	bra renderProjectileGoSprite

renderProjectileNegYPosX:
	cmp #DNANGLE
	bpl renderProjectileFlat

renderProjectileDownAngle:
	lda projectileTypes+PT_FRAME2,x		; Down angle
	bra renderProjectileGoSprite

renderProjectileFlat:
	lda projectileTypes+PT_FRAME1,x		; Flat

renderProjectileGoSprite:
	sta SCRATCHL
	lda projectileTypes+PT_DIRECTIONAL,x
	beq renderProjectileGoSpriteNormal
	lda projectileData+JD_FACING,y		; Projectile is directional, so flip sprite if needed
	beq renderProjectileGoSpriteNormal
	lda SCRATCHL
	inc									; Flip it!
	bra renderProjectileGoSpriteFlipped

renderProjectileGoSpriteNormal:
	lda SCRATCHL

renderProjectileGoSpriteFlipped:
	jsr renderGameObject

	; Check for special deployment code
	lda projectileTypes+PT_RENDER,x
	beq renderProjectileDone
	JSRA

renderProjectileDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderProjectiles
;
;
unrenderProjectiles:
	SAVE_AXY
	ldx #0

unrenderProjectilesLoop:
	txy
	PROJECTILEPTR_Y
	jsr unrenderProjectile

unrenderProjectilesSkip:
	inx
	cpx #MAXPROJECTILES
	bne unrenderProjectilesLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderProjectile
;
; Y = Offset to projectile structure
;
unrenderProjectile:
	SAVE_AX

	lda projectileData+GO_POSX,y
	bpl unrenderProjectileActive
	jmp unrenderProjectileDone

unrenderProjectileActive:
	lda projectileData+JD_NEW,y
	beq unrenderProjectileDoIt
	lda #0
	sta projectileData+JD_NEW,y
	jmp unrenderProjectileDone

unrenderProjectileDoIt:
	lda #projectileData
	sta PARAML0
	clc
	tya
	adc PARAML0
	sta PARAML0
	jsr unrenderGameObject

	; Check for special deployment code
	lda projectileData+JD_TYPE,y
	tax
	PROJECTILETYPEPTR_X
	lda projectileTypes+PT_UNRENDER,x
	beq unrenderProjectileDone
	JSRA

unrenderProjectileDone:
	RESTORE_AX
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processPlayerImpact
;
; X = Index of player that was hit
; Y = Offset to projectile structure
;
processPlayerImpact:
	phy

	; Do hit animation
	txy
	jsr renderHitAnimation
	
	PLAYERPTR_X

	; Find projectile data structure
	ply
	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y

	; Apply damage
	lda playerData+PD_ANGER,x
	clc
	adc projectileTypes+PT_DAMAGE,y

	; Check for death
	cmp #MAX_ANGER
	bcs processPlayerImpactDeath
	sta playerData+PD_ANGER,x
	rts

processPlayerImpactDeath:
	lda currentPlayer
	sta gameOver
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; processTerrainImpact
;
; Trashes A,Y, SCRATCHL, PARAML0, PARAML1
;
processTerrainImpact:
	ldy projectileActive

	; Shift impact point to forward bottom corner according to V
	lda projectileData+JD_VX,y
	bmi processTerrainImpactNegative

	lda projectileData+GO_POSX,y
	clc
	adc #GAMEOBJECTWIDTH/2+1			; A fudge that makes crater location look better in this direction, and tunneling work better
	bra processTerrainImpactStoreContinue

processTerrainImpactNegative:
	lda projectileData+GO_POSX,y
	clc
	adc #GAMEOBJECTWIDTH/4-1			; A fudge that makes crater location look better in this direction, and tunneling work better

processTerrainImpactStoreContinue:
	sta PARAML0
	pha						; Dirt explosion will need this
	sta compileTerrainRowStart	; Terrain chunk compiler will need this
	sta compileTerrainRowEnd

	lda projectileData+GO_POSY,y
	sec
	sbc #GAMEOBJECTHEIGHT	; This fudge makes tunneling work better
	sta PARAML1
	pha						; Dirt explosion will need this

	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y

	sec						; Quick sidebar to calculate crater compiling extents while we have the pointers
	lda #TERRAINWIDTH
	sbc compileTerrainRowStart
	sbc projectileTypes+PT_RADIUS,y
	sbc projectileTypes+PT_RADIUS,y
	sta compileTerrainRowStart
	sec
	lda #TERRAINWIDTH
	sbc compileTerrainRowEnd
	clc
	adc projectileTypes+PT_RADIUS,y
	adc #GAMEOBJECTWIDTH
	sta compileTerrainRowEnd

	lda projectileTypes+PT_RADIUS,y
	tay
	phy					; We'll need the radius in a moment

	jsr craterTerrain
	
	jsr unclipTerrain

	; Recompile the rows affected by the crater
	clc
	lda PARAML1			; Impact point is top row to recompile
	adc #GAMEOBJECTHEIGHT	; Expand recompile area upwards because of tunneling fudge
	tax

	clc
	pla
	adc #GAMEOBJECTHEIGHT	; Expand "vertical" radius area because of tunneling fudge
	sta SCRATCHL		; Need radius in a memory location for this math
	txa
	sec
	sbc SCRATCHL		; Need to subtract diameter to ensure enough terrain is recompiled. Not 100% sure why?
	sbc SCRATCHL
	tay
	jsr compileTerrainChunk

	jsr clipTerrain

	pla
	sta PARAML1
	pla
	sta PARAML0
	jsr createDirtExplosion

	; Cash in the dirt if needed
	ldy projectileActive
	lda projectileData+JD_TYPE,y
	tay
	PROJECTILETYPEPTR_Y

	lda projectileTypes+PT_MINING,y
	beq processTerrainImpactDone
	lda craterTerrainAccumulator
	lsr				; Dirt to treats conversion rate
	lsr
	lsr
	inc				; Ensure minimum one treat
	sta PARAML0
	jsr awardTreats
	
processTerrainImpactDone:
	rts

