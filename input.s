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
	bra kbdScanDebugPiggyback

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
	cmp #(11 + $80)
	beq kbdScanUpArrow
	cmp #(10 + $80)
	beq kbdScanDownArrow
	cmp #(27 + $80)
	beq kbdScanESC
	cmp #(',' + $80)
	beq kbdScanComma
	cmp #('.' + $80)
	beq kbdScanPeriod
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
	cmp #('`' + $80)
	beq kbdScanBackQuote
	cmp #(127 + $80)
	beq kbdScanDEL
	cmp #('=' + $80)
	beq kbdScanEquals
	bra kbdScanDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Gameplay Key Handlers
;

kbdScanPeriod:
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

kbdScanComma:
	BITS16

	lda mapScrollPos
	beq kbdScanDone
	dec
	dec
	dec
	dec
	sta mapScrollRequested
	rts

kbdScanESC:
	BITS16

	lda #1
	sta quitRequested
	rts

kbdScanLeftArrow:
	BITS16
	lda #2
	sta angleDeltaRequested
	rts

kbdScanRightArrow:
	BITS16
	lda #-2
	sta angleDeltaRequested
	rts

kbdScanUpArrow:
	BITS16
	lda #1
	sta powerDeltaRequested
	rts

kbdScanDownArrow:
	BITS16
	lda #-1
	sta powerDeltaRequested
	rts

kbdScanSpace:
	BITS16
	lda #1
	sta fireRequested
	rts

kbdScanBackQuote:
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

