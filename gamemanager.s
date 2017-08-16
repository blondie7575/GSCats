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
	bmi gameplayLoopPlayers
	jsr scrollMap

gameplayLoopPlayers:

	; Update active player state if needed
	lda angleDeltaRequested
	beq gameplayLoopEndFrame
	jsr changeAngle

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdScan
; Processes keyboard input
;
; Trashes A
;

kbdScan:
	EMULATION

kbdScanLoop:
	lda KBD
	bpl kbdScanDone
	sta KBDSTROBE

	cmp #(8 + $80)
	beq kbdScanLeftArrow
	cmp #(21 + $80)
	beq kbdScanRightArrow
	cmp #(' ' + $80)
	beq kbdScanSpace
	cmp #('a' + $80)
	beq kbdScanA
	cmp #('z' + $80)
	beq kbdScanZ

kbdScanDone:
	NATIVE
	rts

kbdScanRightArrow:
	NATIVE
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq kbdScanDone
	inc
	inc
	sta mapScrollRequested
	rts

kbdScanLeftArrow:
	NATIVE
	lda mapScrollPos
	beq kbdScanDone
	dec
	dec
	sta mapScrollRequested
	rts

kbdScanSpace:
	NATIVE
	lda #1
	sta quitRequested
	rts

kbdScanA:
	NATIVE
	lda #1
	sta angleDeltaRequested
	rts

kbdScanZ:
	NATIVE
	lda #-1
	sta angleDeltaRequested
	rts



basePalette:
	.word $0000,$0080,$0000,$000F,$0FFF,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0FFF
quitRequested:
	.word $0000
mapScrollRequested:
	.word $FFFF
angleDeltaRequested:
	.word $0000
terrainDirty:
	.word 1

; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Word-distance from left edge of logical terrain to left edge of visible screen
mapScrollPos:
	.word 0
leftScreenEdge:
	.word 0		; In pixels
