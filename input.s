;
;  input
;  Code related to handling input
;
;  Created by Quinn Dunki on 8/15/17
;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdScanTitle
; Processes keyboard input for title screen
;
; Trashes A
;

kbdScanTitle:
	BITS8
	lda KBD
	bpl kbdScanTitleDone
	sta KBDSTROBE

	cmp #(11 + $80)
	beq kbdScanUpArrowTitle
	cmp #(10 + $80)
	beq kbdScanDownArrowTitle
	cmp #(13 + $80)
	beq kbdScanEnterTitle
	cmp #(32 + $80)
	beq kbdScanSpaceTitle

kbdScanTitleDone:
	BITS16
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Title Screen Key Handlers
;

kbdScanUpArrowTitle:
	BITS16
	lda #-1
	sta menuActionRequested
	rts

kbdScanDownArrowTitle:
	BITS16
	lda #1
	sta menuActionRequested
	rts

kbdScanEnterTitle:
	BITS16
	lda #2
	sta menuActionRequested
	rts

kbdScanSpaceTitle:
	BITS16
	lda #2
	sta menuActionRequested
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdScanGameplay/Debug
; Processes keyboard input for gameplay
;
; Trashes A
;

kbdScanGameplay:
	BITS8
	lda KBD
	bpl kbdScanDone
	sta KBDSTROBE

	cmp #(8 + $80)
	beq kbdScanLeftArrow
	cmp #(21 + $80)
	beq kbdScanRightArrow
	cmp #('q' + $80)
	beq kbdScanQ
	cmp #('a' + $80)
	beq kbdScanA
	cmp #('z' + $80)
	beq kbdScanZ
	cmp #('s' + $80)
	beq kbdScanS
	cmp #('x' + $80)
	beq kbdScanX
	cmp #(' ' + $80)
	beq kbdScanSpace
	cmp #(9 + $80)
	bne kbdScanDebugPiggyback
	jmp kbdScanTab

kbdScanDone:
	BITS16
	rts

kbdScanDebug:
	BITS8
	lda KBD
	bpl kbdScanDone
	sta KBDSTROBE

kbdScanDebugPiggyback:
	cmp #(27 + $80)
	beq kbdScanESC
	cmp #(127 + $80)
	beq kbdScanDEL
	cmp #('=' + $80)
	beq kbdScanEquals
	bra kbdScanDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Gameplay Key Handlers
;

kbdScanRightArrow:
	BITS16
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq kbdScanDone
	inc
	inc
	inc
	inc
	sta mapScrollRequested
	rts

kbdScanLeftArrow:
	BITS16

	lda mapScrollPos
	beq kbdScanDone
	dec
	dec
	dec
	dec
	sta mapScrollRequested
	rts

kbdScanQ:
	BITS16

	lda #1
	sta quitRequested
	rts

kbdScanA:
	BITS16
	lda #2
	sta angleDeltaRequested
	rts

kbdScanZ:
	BITS16
	lda #-2
	sta angleDeltaRequested
	rts

kbdScanS:
	BITS16
	lda #1
	sta powerDeltaRequested
	rts

kbdScanX:
	BITS16
	lda #-1
	sta powerDeltaRequested
	rts

kbdScanSpace:
	BITS16
	lda #1
	sta fireRequested
	rts

kbdScanESC:
	BITS16
	lda #1
	sta breakpoint
	rts

kbdScanDEL:
	BITS16
	lda paused
	eor #1
	sta paused
	rts

kbdScanEquals:
	BITS16
	lda #1
	sta singleStep
	stz paused
	rts

kbdScanTab:
	BITS16
	ldy currentPlayer
	PLAYERPTR_Y
	lda playerData+PD_CURRWEAPON,y
	inc
	cmp #INVENTORY_ITEMS
	bne kbdScanTab_store
	lda #0

kbdScanTab_store:
	sta playerData+PD_CURRWEAPON,y
	inc inventoryDirty
	rts


breakpoint:
	.word 0

