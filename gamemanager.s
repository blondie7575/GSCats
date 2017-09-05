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

	; Erase the screen
	ldx #$2222
	jsr colorFill

	; Generate, compile, and clip terrain
	jsr generateTerrain
	jsr compileTerrain
	jsr clipTerrain

	; Create players
	lda #40
	ldy #0
	jsr playerCreate

	lda #190
	ldy #1
	jsr playerCreate

	ldy #0
	jsr renderPlayerHeader


gameplayLoop:

	jsr syncVBL

	; Render the terrain if needed
	lda terrainDirty
	beq gameplayLoopKbd
	jsr renderTerrain
	stz terrainDirty

	; Render players
	jsr renderPlayers

gameplayLoopKbd:
	lda projectileActive
	bpl gameplayLoopProjectiles	; Skip input during shots

	; Check for keys down
	jsr kbdScan

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
	beq gameplayLoopProjectiles
	jsr fire

gameplayLoopProjectiles:
	sta KBDSTROBE
	jsr unrenderProjectiles
	jsr updateProjectiles
	jsr renderProjectiles

	lda turnRequested
	beq gameplayLoopVictoryCondition
	jsr endTurn

gameplayLoopVictoryCondition:
	lda gameOver
	bmi gameplayLoopEndFrame
	jsr endGame

gameplayLoopEndFrame:
	lda quitRequested
	beq gameplayLoop
	jmp quitGame


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
scrollMap:
	jsr unclipTerrain

	sta mapScrollPos
	asl
	sta leftScreenEdge
	clc
	adc #160-GAMEOBJECTWIDTH/4-1
	sta rightScreenEdge

	jsr clipTerrain
	lda #$ffff
	sta mapScrollRequested

	lda #1
	sta terrainDirty

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
	.word $0000,$0080,$0000,$000F,$0FFF,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0FFF
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
activePlayer:
	.word 0
currentPlayer:
	.word 0
gameOver:
	.word -1			; Player index of winner
projectileActive:
	.word -1


; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Byte-distance from left edge of logical terrain to left edge of visible screen
; c) Byte-distance from left edge of logical terrain to right edge of visible screen minus game object width in words
mapScrollPos:
	.word 0
leftScreenEdge:
	.word 0
rightScreenEdge:
	.word 160-GAMEOBJECTWIDTH/4-1
