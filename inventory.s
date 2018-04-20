;
;  inventory
;  Code and data structures related to the weapons inventory and store
;
;  Created by Quinn Dunki on 8/13/17
;


INVENTORY_ITEMS = 6
ITEM_WIDTH = 16		; In pixels
ICON_WIDTH = 8		; In pixels
ICON_ORIGIN = (ITEM_WIDTH-ICON_WIDTH)/4	; In bytes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderInventory
;
;
renderInventory:
	SAVE_AXY

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
;
renderInventoryItem:
	SAVE_AXY

	phy
	phx
	lda #1
	clc
	jsr DrawSpriteBank

	plx
	ply
	txa
	clc
	jsr DrawSpriteBank

RESTORE_AXY
	rts

renderInventoryItemParam:
	.word 0,20

