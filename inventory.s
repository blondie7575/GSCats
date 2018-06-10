;
;  inventory
;  Code and data structures related to the weapons inventory and store
;
;  Created by Quinn Dunki on 8/13/17
;


INVENTORY_ITEMS = 2
ITEM_WIDTH = 16		; In pixels
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
	lda playerData+PD_INVENTORY,y
	sta PARAML0

	; Compute initial VRAM position
	ldy #(8192 + (160*10 + (160*ICON_ORIGIN + ICON_ORIGIN)))
	ldx #0


renderInventoryLoop:
	jsr renderInventoryItem

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
; Y = VRAM pos
; PARAML0 = Inventory state
;
renderInventoryItem:
	SAVE_AXY

	phy
	phx
	lda #2	; Frame
	clc
	jsr DrawSpriteBank
	plx

	; Find projectile type data
	txy
	PROJECTILETYPEPTR_Y

	; Render projectile
	lda projectileTypes+PT_FRAME1,y
	ply
	clc
	jsr DrawSpriteBank

RESTORE_AXY
	rts

renderInventoryItemParam:
	.word 0,20

