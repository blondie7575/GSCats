;
;  gamemanager
;  The manager for overall game logic
;
;  Created by Quinn Dunki on 8/15/17
;

NUMPLAYERS = 2


beginGameplay:
	; Initialize random numbers
	lda #1
	jsr seedRandom
	
	; Erase the screen
	ldx #$0000
	ldy #200
	jsr colorFill

	; Generate, compile, and clip terrain
	stz leftScreenEdge
	jsr generateTerrain

	; Create players
	lda #56
	ldy #0
	jsr playerCreate

	lda #568
	ldy #1
	jsr playerCreate

	jsr syncPlayerHeader
	ldy #0
	jsr renderPlayerHeader

	jsr prepareRowRendering

	jsr compileTerrain
	jsr clipTerrain
	jsr renderTerrain

	jsr renderInventory
	jsr protectPlayers
	jsr renderPlayers

	; Fade in from menu
	lda #basePalette
	sta PARAML2
	jsr paletteFade

gameplayLoop:
	lda projectileActive
	bpl gameplayLoopKeyboardSkip
	jsr kbdScanGameplay

gameplayLoopKeyboardSkip:
	jsr kbdScanDebug

;	BORDER_COLOR #$F
	jsr nextVBL

;	BORDER_COLOR #$0

	; Check for pause
	lda paused
	beq gameplayLoopBeginUpdate
	jmp gameplayLoopEndFrame

gameplayLoopBeginUpdate:

	;;;;;;;;;;;
	; Update
	;
	lda #1
	sta projectilesDirty
	lda projectileActive			; Skip interactivity during shots, but still allow map scrolling
	bpl gameplayLoopShotTracking
	lda dirtExplosionActive
	bne gameplayLoopRenderJump			; Skip interactivity during dirt explosions
	bra gameplayLoopScroll

gameplayLoopRenderJump:
	jmp gameplayLoopRender

gameplayLoopShotTracking:
	jsr trackActiveShot

;	BORDER_COLOR #$1

gameplayLoopScroll:
	; Scroll map if needed
	lda mapScrollRequested
	bmi gameplayLoopAngleCheck

	jsr scrollMap
	jsr updateCrosshair

gameplayLoopAngleCheck:
	lda projectileActive			; Skip interactivity during shots
	bpl gameplayLoopRenderJmp
	bra gameplayLoopAngle
gameplayLoopRenderJmp:
	jmp gameplayLoopRender

gameplayLoopAngle:
	; Update aim angle if needed
	lda angleDeltaRequested
	beq gameplayLoopAim
	jsr changeAngle

gameplayLoopAim:
	jsr unrenderCrosshair
	ldy currentPlayer
	jsr updateCrosshair
	jsr protectCrosshair
	jsr renderCrosshair

gameplayLoopPower:
	; Update power if needed
	lda powerDeltaRequested
	beq gameplayLoopFire
	jsr changePower

gameplayLoopFire:
	lda fireRequested
	beq gameplayLoopMove
	jsr unrenderCrosshair
	jsr fire
	
gameplayLoopMove:
	lda playerMoveRequested
	beq gameplayLoopRender
	jsr move

;	BORDER_COLOR #$2

gameplayLoopRender:
;	sta KBDSTROBE

	;;;;;;;;;;;
	; Render
	;

	; Render the terrain if needed
	lda terrainDirty
	beq gameplayLoopExplosions
;	jsl renderTerrainSpans	; Part of the now disabled fill-mode renderer
	jsr renderTerrain
	stz terrainDirty

	; Render players
	lda playersDirty		; Check if terrain moved since last protect
	beq gameplayLoopRenderPlayersAnyway
	jsr unrenderPlayers
	jsr protectPlayers
	jsr unrenderCrosshair
	jsr protectCrosshair

gameplayLoopRenderPlayersAnyway:
	jsr renderPlayers

gameplayLoopExplosions:
	; Render explosions
	jsr renderDirtExplosion

gameplayLoopProjectiles:

;	BORDER_COLOR #$3

	lda projectilesDirty
	beq gameplayLoopProjectilesSkip

	jsr unrenderProjectiles
	jsr updateProjectilesPhysics
	jsr protectProjectiles
	jsr renderProjectiles

gameplayLoopProjectilesSkip:
	jsr updateProjectilesCollisions

	lda inventoryDirty
	beq gameplayLoopVictoryCondition
	stz inventoryDirty
	jsr renderInventory

;	BORDER_COLOR #$4

gameplayLoopVictoryCondition:
	lda gameOver
	bmi gameplayEndTurnCondition
	jsr endGame

gameplayEndTurnCondition:
	lda turnRequested
	beq gameplayLoopEndFrame
	lda dirtExplosionActive
	bne gameplayLoopEndFrame
	jsr endTurn

gameplayLoopEndFrame:
	lda singleStep
	beq gameplayLoopEndFrameCont
	lda #1
	sta paused

gameplayLoopEndFrameCont:
	lda quitRequested
	beq gameplayLoopContinue

	; Transition back to menu
	stz quitRequested
	lda #skyPalette
	sta PARAML2
	jsr paletteFade
	jmp titleScreen

gameplayLoopContinue:
	jmp gameplayLoop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; trackActiveShot
;
; Handles tracking the projectile with the camera
;
; Trashes SCRATCHL
;
trackActiveShot:
	ldy projectileActive
	lda projectileData+JD_PRECISEX,y
	lsr		; Convert to integer and divide by two for byte distance
	lsr
	lsr
	lsr
	lsr
	sta SCRATCHL		; Save this for later

	lda projectileData+JD_VX,y
	bmi trackActiveShotNeg

	; Left-to-right
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq trackActiveShotDone	; Logical-right edge clamp

	lda SCRATCHL
	sec
	sbc #150			; Check for moving close to right edge
	cmp leftScreenEdge
	bmi trackActiveShotDone

	lda #80				; Move screen right to see shot land
	sta mapScrollRequested

trackActiveShotNeg:

	; Right-to-left
	lda mapScrollPos
	beq trackActiveShotDone	; Logical-left edge clamp

	lda SCRATCHL
	clc
	adc #150			; Check for moving close to left edge
	cmp rightScreenEdge
	bpl trackActiveShotDone
	stz mapScrollRequested	; Move screen left to see shot land

trackActiveShotDone:
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; endTurn
;
; Handles changing the active player
;
endTurn:
	lda currentPlayer
	inc
	cmp #NUMPLAYERS
	beq endTurnWrap
	sta currentPlayer

endTurnRefresh:
	jsr processTurnForProjectiles

	ldy currentPlayer
	beq endTurnFocusPlayer0

	lda #VISIBLETERRAINWINDOW
	sta mapScrollRequested

endTurnHeader:
	jsr syncPlayerHeader
	jsr renderPlayerHeader
	jsr renderInventory
	stz turnRequested

	jsr protectCrosshair
	rts

endTurnFocusPlayer0:
	stz mapScrollRequested
	bra endTurnHeader

endTurnWrap:
	stz currentPlayer
	bra endTurnRefresh


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; endGame
;
; Handles someone winning
;
endGame:
	lda #1
	sta quitRequested
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; scrollMap
;
; Handles updating the state of the terrain in response to scrolling
;
; A = New map scroll position
;
scrollMap:
	jsr unclipTerrain
;	jsl unrenderTerrainSpans	; Part of the now disabled fill-mode renderer
	jsr unrenderPlayers
	jsr unrenderProjectiles

	pha
	lda projectileActive		; Crosshair is visible if projectile isn't
	beq scrollMapApplyScrolling
	jsr unrenderCrosshair

scrollMapApplyScrolling:
	pla
;	jsr updateProjectilePhysics	; Good idea?

	sta mapScrollPos
	asl
	sta leftScreenEdge
	clc
	adc #160-GAMEOBJECTWIDTH/4-2
	sta rightScreenEdge

	jsr clipTerrain
	lda #$ffff
	sta mapScrollRequested

	lda #1
	sta playersDirty
	sta projectilesDirty
	sta terrainDirty
	sta crosshairDirty
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; changeAngle
;
; Handles changing a player's aim
;
changeAngle:
	ldy currentPlayer
	tax
	jsr playerDeltaAngle

;	ldy currentPlayer
;	jsr renderPlayerHeader

	stz angleDeltaRequested
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; changePower
;
; Handles changing a player's power
;
changePower:
	ldy currentPlayer
	tax
	jsr playerDeltaPower

;	ldy currentPlayer
;	jsr renderPlayerHeader

	stz powerDeltaRequested
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fire
;
; Handles firing a player's weapon
;
fire:
	stz fireRequested
	ldy currentPlayer
	jsr playerFire
	jsr renderPlayerHeader
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; move
;
; Handles moving a player
;
move:
	SAVE_AY

	; Unrender everything
	jsr unrenderCrosshair
	jsr unrenderPlayers

	; Find active player game object data
	ldy currentPlayer
	PLAYERPTR_Y
	tya
	clc
	adc #playerData
	sta PARAML0

	; Prepare parameters of move
	ldx playerMoveRequested
	lda currentPlayer
	beq moveParamsPlayer0
	lda #-1
	sta placeGameObjectRightOffset
	lda #GAMEOBJECTWIDTH-(GAMEOBJECTWIDTH/2-1)
	sta placeGameObjectLeftOffset

movePerformMove:
	jsr moveGameObjectOnTerrain
	bra moveCleanup

moveParamsPlayer0:
	lda #-(GAMEOBJECTWIDTH/2-2)
	sta placeGameObjectRightOffset
	lda #GAMEOBJECTWIDTH-2
	sta placeGameObjectLeftOffset
	bra movePerformMove

moveCleanup:
	; Handle side effects caused by move
	stz playerMoveRequested
	ldy currentPlayer
	jsr updateCrosshair

	; Re-render everything
	jsr protectPlayers
	jsr renderPlayers
	jsr protectCrosshair
	jsr renderCrosshair

	RESTORE_AY
	rts


basePalette:
	.word $06af,$0072,$0072,$0861,$0c93,$0eb4,$0d66,$0f9a,$0777,$0d00,$0bbb,$ddd,$007b,$0a5b,$0000,$0fff


quitRequested:
	.word $0000
mapScrollRequested:
	.word $FFFF
angleDeltaRequested:
	.word $0000
powerDeltaRequested:
	.word $0000
fireRequested:
	.word $0000
turnRequested:
	.word $0000
playerMoveRequested:
	.word $0000
terrainDirty:
	.word 1
playersDirty:
	.word 0
crosshairDirty:
	.word 0
projectilesDirty:
	.word 1
inventoryDirty:
	.word 1
currentPlayer:
	.word 0
gameOver:
	.word -1			; Player index of winner
projectileActive:
	.word -1			; Y offset of active shot
paused:
	.word 0
singleStep:
	.word 0
globalWind:
	.word 0				; 12.4 velocity

; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Byte-distance from left edge of logical terrain to left edge of visible screen
; c) Byte-distance from left edge of logical terrain to right edge of visible screen minus game object width in words
mapScrollPos:
	.word 0
;leftScreenEdge = $6E		; Moved to zero page for speed and cross-bank convenience
;	.word 0
rightScreenEdge:			; Right edge minus one game object width, for easy render clipping
	.word 160-GAMEOBJECTWIDTH/4-2

