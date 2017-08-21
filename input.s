;
;  input
;  Code related to handling input
;
;  Created by Quinn Dunki on 8/15/17
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdScan
; Processes keyboard input
;
; Trashes A
;

kbdScan:
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
	cmp #(' ' + $80)
	beq kbdScanSpace

kbdScanDone:
	BITS16
	rts

kbdScanRightArrow:
	BITS16
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq kbdScanDone
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
	sta mapScrollRequested
	rts

kbdScanQ:
	BITS16

	lda #1
	sta quitRequested
	rts

kbdScanA:
	BITS16
	lda #1
	sta angleDeltaRequested
	rts

kbdScanZ:
	BITS16
	lda #-1
	sta angleDeltaRequested
	rts

kbdScanSpace:
	BITS16
	lda #1
	sta fireRequested
	rts

