;
;  gamemanager
;  The manager for overall game logic
;
;  Created by Quinn Dunki on 8/15/17
;

NUMPLAYERS = 2


beginGameplay:

	; Set up palette for terrain and players
	lda #basePalette
	sta PARAML0
	lda #0
	jsr setPalette

	; Set up palette for status bar
	lda #statusBarPalette
	sta PARAML0
	lda #1
	jsr setPalette

	lda #1
	sta PARAML0
	ldx #0
	ldy #10
	jsr setScanlinePalette

	; Set up sprite rendering
	BITS8
	lda #3
	sta SpriteBankBank00+3		; Tell compiled sprites what bank they are in
	BITS16
	
	; Erase the screen
	ldx #$0000
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

	ldy #0
	jsr renderPlayerHeader

	jsr protectPlayers
	jsr protectProjectiles
	jsr prepareRowRendering

	jsr compileTerrain
	jsr clipTerrain
	jsl renderTerrainSpans

	jsr renderInventory

gameplayLoop:
	jsr syncVBL
	BORDER_COLOR #$0

	;;;;;;;;;;;
	; Update
	;
	lda #1
	sta projectilesDirty
	lda projectileActive
	bpl gameplayLoopShotTracking	; Skip input during shots

	; Check for keys down
	jsr kbdScan

	; Check for pause
;	lda paused
;	bne gameplayLoopEndFrame

	bra gameplayLoopScroll

gameplayLoopShotTracking:
	jsr trackActiveShot

gameplayLoopScroll:

	; Scroll map if needed
	lda mapScrollRequested
	bmi gameplayLoopAngle
	jsr scrollMap

gameplayLoopAngle:
	; Update aim angle if needed
	lda angleDeltaRequested
	beq gameplayLoopPower
	jsr changeAngle

gameplayLoopPower:
	; Update power if needed
	lda powerDeltaRequested
	beq gameplayLoopFire
	jsr changePower

gameplayLoopFire:
	lda fireRequested
	beq gameplayLoopRender
	jsr fire

gameplayLoopRender:
	sta KBDSTROBE

	;;;;;;;;;;;
	; Render
	;

	; Render the terrain if needed
	lda terrainDirty
	beq gameplayLoopProjectiles
	BORDER_COLOR #$3
	jsl renderTerrainSpans
	jsr renderTerrain

	stz terrainDirty
	BORDER_COLOR #$1

	; Render players
	jsr renderPlayers

gameplayLoopProjectiles:
	lda projectilesDirty
	beq gameplayLoopProjectilesSkip

	jsr unrenderProjectiles
	jsr updateProjectilePhysics
	jsr protectProjectiles
	jsr renderProjectiles

gameplayLoopProjectilesSkip:
	jsr updateProjectileCollisions

;	lda turnRequested
;	beq gameplayLoopVictoryCondition
;	jsr endTurn

gameplayLoopVictoryCondition:
	lda gameOver
	bmi gameplayLoopEndFrame
	jsr endGame

gameplayLoopEndFrame:
	lda quitRequested
	beq gameplayLoopContinue
	jmp quitGame
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
	lda projectileData+JD_PRECISEX
	lsr		; Convert to integer and divide by two for byte distance
	lsr
	lsr
	lsr
	lsr
	sta SCRATCHL		; Save this for later

	lda projectileData+JD_VX
	bmi trackActiveShotNeg

	; Left-to-right
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq trackActiveShotDone	; Logical-right edge clamp

	lda SCRATCHL
	sec
	sbc #80			; Check for moving past center
	cmp leftScreenEdge
	bpl trackActiveShotCameraMove
	bra trackActiveShotDone

trackActiveShotNeg:

	; Right-to-left
	lda mapScrollPos
	beq trackActiveShotDone	; Logical-left edge clamp

	lda SCRATCHL
	clc
	adc #80			; Check for moving past center
	cmp rightScreenEdge
	bpl trackActiveShotDone

trackActiveShotCameraMove:
	lda SCRATCHL
	sbc #80
	lsr
	and #$fffe			; Force even
	sta mapScrollRequested

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
	ldy currentPlayer
	jsr renderPlayerHeader
	stz turnRequested
	rts

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
	jsl unrenderTerrainSpans
	jsr unrenderPlayers
	jsr unrenderProjectiles

	jsr updateProjectilePhysics	; Good idea?

	sta mapScrollPos
	asl
	sta leftScreenEdge
	clc
	adc #160-GAMEOBJECTWIDTH/4-1
	sta rightScreenEdge

	jsr clipTerrain
	lda #$ffff
	sta mapScrollRequested

	jsr protectPlayers
	jsr protectProjectiles
	jsr renderPlayers
	jsr renderProjectiles		; Prevents flicker, but ads jitter to shot tracking
	lda #1
	sta terrainDirty
	stz projectilesDirty
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

	ldy currentPlayer
	jsr renderPlayerHeader

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

	ldy currentPlayer
	jsr renderPlayerHeader

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
	rts


basePalette:
	.word $0aef,$0aef,$0080,$0861,$0c93,$0eb4,$0d66,$0f9a,$00f0,$0fff,$0bbb,$ddd,$007b,$0000,$0ff0,$0fff
statusBarPalette:
	.word $0888,$0aef,$0F00,$0861,$0c93,$0eb4,$0d66,$0f9a,$00f0,$0fff,$0bbb,$ddd,$007b,$0000,$0ff0,$0fff



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
terrainDirty:
	.word 1
projectilesDirty:
	.word 1
activePlayer:
	.word 0
currentPlayer:
	.word 0
gameOver:
	.word -1			; Player index of winner
projectileActive:
	.word -1
paused:
	.word 0


; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Byte-distance from left edge of logical terrain to left edge of visible screen
; c) Byte-distance from left edge of logical terrain to right edge of visible screen minus game object width in words
mapScrollPos:
	.word 0
;leftScreenEdge = $6E		; Moved to zero page for speed and cross-bank convenience
;	.word 0
rightScreenEdge:
	.word 160-GAMEOBJECTWIDTH/4-1
