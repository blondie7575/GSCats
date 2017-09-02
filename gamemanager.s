;
;  gamemanager
;  The manager for overall game logic
;
;  Created by Quinn Dunki on 8/15/17
;


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
	lda #600
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

	; Check for keys down
	jsr kbdScan

	; Scroll map if needed
	lda mapScrollRequested
	bmi gameplayLoopAngle
	jsr scrollMap

gameplayLoopAngle:

	; Update aim angle if needed
	lda angleDeltaRequested
	beq gameplayLoopFire
	jsr changeAngle

gameplayLoopFire:

	lda fireRequested
	beq gameplayLoopProjectiles
	jsr fire

gameplayLoopProjectiles:
	jsr unrenderProjectiles
	jsr updateProjectiles
	jsr renderProjectiles

gameplayLoopEndFrame:

	lda quitRequested
	beq gameplayLoop
	jmp quitGame


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
	adc #160-GAMEOBJECTWIDTH/4
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
	ldy #0
	tax
	jsr playerDeltaAngle

	ldy #0
	jsr renderPlayerHeader

	stz angleDeltaRequested
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fire
;
; Handles firing a player's weapon
;
fire:
	stz fireRequested
	ldy #0
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
fireRequested:
	.word $0000
terrainDirty:
	.word 1
activePlayer:
	.word 0

; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Byte-distance from left edge of logical terrain to left edge of visible screen
; c) Byte-distance from left edge of logical terrain to right edge of visible screen minus game object width in words
mapScrollPos:
	.word 0
leftScreenEdge:
	.word 0
rightScreenEdge:
	.word 160-GAMEOBJECTWIDTH/4
