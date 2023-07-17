;
;  inventory
;  Code and data structures related to the weapons inventory and store
;
;  Created by Quinn Dunki on 8/13/17
;


INVENTORY_ITEMS = 3
ITEM_WIDTH = 16		; In pixels
ITEM_HEIGHT = 16	; In pixels
ICON_WIDTH = 8		; In pixels
ICON_ORIGIN = (ITEM_WIDTH-ICON_WIDTH)/4	; In bytes


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderInventory
;
; Renders inventory for current player
;
; Trashes PARAML0
;
renderInventory:
	SAVE_AXY

	; Find inventory we need to render
	ldy currentPlayer
	PLAYERPTR_Y
	tya
	clc
	adc #playerData
	adc #PD_PRICES
	sta PARAML1

	; Compute initial VRAM position ($E1-relative)
	ldy #(8192 + (160*10 + (160*ICON_ORIGIN + ICON_ORIGIN)))
	ldx #0


renderInventoryLoop:
	lda PARAML1		; renderInventory item trashes this so we need to preserve it
	pha
	jsr renderInventoryItem
	pla
	sta PARAML1

	tya		; Advance VRAM pointer
	clc
	adc #ITEM_WIDTH/2
	tay

	inx
	cpx #INVENTORY_ITEMS
	bne renderInventoryLoop

RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderInventoryItem
;
; X = Item index
; Y = VRAM pos ($E1-relative)
; PARAML1 = Inventory state
;
renderInventoryItem:
	SAVE_AXY
	stx renderInventoryItemIndex

	phy
	lda #2	; Frame
	clc
	jsr DrawSpriteBank

	; Find projectile type data
	ldy renderInventoryItemIndex
	PROJECTILETYPEPTR_Y

	; Render projectile
	lda projectileTypes+PT_FRAME1,y
	ply
	phy

	clc
	jsr DrawSpriteBank

	; Render selection
	ldy currentPlayer
	PLAYERPTR_Y
	lda playerData+PD_CURRWEAPON,y
	cmp renderInventoryItemIndex
	bne renderInventoryItem_unselected

	ply
	phy
	lda #11
	clc
	jsr DrawSpriteBank

renderInventoryItem_unselected:
	lda renderInventoryItemIndex
	beq renderInventoryItem_abort	; First item shows no counter

	; Render counter background
	clc
	pla
	adc #ITEM_HEIGHT*160
	pha
	tay
	lda #10
	jsr DrawSpriteBank

	; Render counter
	lda renderInventoryItemIndex
	asl
	tay
	lda (PARAML1),y
	sta PARAML0
	jsr intToString
	
	; Prepend currency prefix to counter string
	BITS8A
	lda intToStringResult
	inc
	sta intToStringPrefix
	lda #':'	; Colon maps to dollar sign in tiny number font
	sta intToStringResult
	BITS16

	; Render tiny numbers
	pla
	clc
	adc #6*160+2
	tay
	lda #intToStringPrefix
	sta PARAML0
	lda #0
	jsl renderStringFar

renderInventoryItem_done:
	RESTORE_AXY
	rts

renderInventoryItem_abort:
	ply		; Balance stack
	bra renderInventoryItem_done

renderInventoryItemIndex:
	.word 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; awardTreats
;
; PARAML0 = Amount to award
;
awardTreats:
	SAVE_AY

	ldy currentPlayer
	PLAYERPTR_Y

	clc
	lda playerData+PD_TREATS,y
	adc PARAML0
	cmp #999
	bmi awardTreatsStore
	lda #999	; Clamp treats at 3 digits

awardTreatsStore:
	sta playerData+PD_TREATS,y

	ldy currentPlayer
	jsr renderPlayerHeader

	RESTORE_AY
	rts
