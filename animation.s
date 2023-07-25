;
;  animation
;  Code and data structures for animating sprites
;
;  Created by Quinn Dunki on 6/28/23
;

ANIMATION_SIZE_16x16=0
ANIMATION_SIZE_16x32=2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderAnimation
;
; Y = Base sprite index
; X = Number of frames
; A = Animation size (use constants above)
; PARAML0 = Pointer to X,Y (16 bits each, Y is bottom relative)
;
; Trashes A,X,Y,PARAML0,PARAML1,PARAML2,SCRATCHL2
;
renderAnimation:
	sta PARAML2
	sty PARAML1

	phx				; Calculate VRAM position
	jsr vramPtr
BREAK
	cpx #$ffff
	beq renderAnimationSkip
	stx SCRATCHL2
	plx

	stx PARAML0

	ldx #1

renderAnimationLoop:
	
	; Preserve background
	phx
	ldy SCRATCHL2
	ldx PARAML2
	jsr (protectionRoutines,x)
	plx

	; Render animation frame
	ldy SCRATCHL2
	lda PARAML1
	jsr drawSpriteBankSafe

	jsr delayMedium

	; Restore background
	phx
	ldy SCRATCHL2
	ldx PARAML2
	jsr (unrenderRoutines,x)
	plx

	; Next frame
	inc PARAML1
	inx
	cpx PARAML0
	bne renderAnimationLoop

renderAnimationDone:
	rts

renderAnimationSkip:
	plx
	bra renderAnimationDone


; Jump tables for various animation sizes
protectionRoutines:
	.word protectAnimation16x16,protectAnimation16x32
unrenderRoutines:
	.word unrenderAnimation16x16,unrenderAnimation16x32


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectAnimation16x16
;
; Saves background behind this sprite
; Y = VRAM position of upper left of sprite
; Trashes A
;
; Brace for large unrolled loop in 3..2..1...
;
protectAnimation16x16:
	phx
	tyx
	ldy #0

	lda SHADOWVRAMBANK,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*3,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*5,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*6,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*7,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*8,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*9,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*10,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*11,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*12,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*13,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*14,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*15,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+6,x
	sta savedBackground,y

	plx
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectAnimation16x32
;
; Saves background behind this sprite
; Y = VRAM position of upper left of sprite
; Trashes A
;
; Brace for large unrolled loop in 3..2..1...
;
protectAnimation16x32:
	phx
	tyx
	ldy #0

	lda SHADOWVRAMBANK,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*2+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*3,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*3+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*4+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*5,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*5+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*6,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*6+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*7,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*7+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*8,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*8+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*9,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*9+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*10,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*10+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*11,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*11+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*12,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*12+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*13,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*13+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*14,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*14+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*15,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*15+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*16,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*16+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*16+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*16+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*17,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*17+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*17+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*17+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*18,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*18+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*18+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*18+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*19,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*19+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*19+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*19+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*20,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*20+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*20+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*20+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*21,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*21+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*21+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*21+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*22,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*22+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*22+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*22+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*23,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*23+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*23+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*23+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*24,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*24+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*24+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*24+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*25,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*25+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*25+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*25+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*26,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*26+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*26+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*26+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*27,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*27+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*27+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*27+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*28,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*28+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*28+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*28+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*29,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*29+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*29+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*29+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*30,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*30+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*30+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*30+6,x
	sta savedBackground,y
	iny
	iny

	lda SHADOWVRAMBANK+160*31,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*31+2,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*31+4,x
	sta savedBackground,y
	iny
	iny
	lda SHADOWVRAMBANK+160*31+6,x
	sta savedBackground,y

	plx
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderAnimation16x16
;
; Y = VRAM position of upper left of sprite
;
; Brace for large unrolled loop in 3..2..1...
;
unrenderAnimation16x16:
	SAVE_AXY

	tyx
	ldy #0

	lda savedBackground,y
	sta SHADOWVRAMBANK,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+6,x

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderAnimation16x32
;
; Y = VRAM position of upper left of sprite
;
; Brace for large unrolled loop in 3..2..1...
;
unrenderAnimation16x32:
	SAVE_AXY

	tyx
	ldy #0

	lda savedBackground,y
	sta SHADOWVRAMBANK,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*2+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*3+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*4+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*5+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*6+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*7+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*8+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*9+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*10+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*11+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*12+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*13+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*14+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*15+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*16,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*16+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*16+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*16+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*17,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*17+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*17+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*17+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*18,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*18+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*18+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*18+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*19,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*19+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*19+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*19+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*20,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*20+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*20+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*20+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*21,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*21+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*21+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*21+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*22,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*22+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*22+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*22+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*23,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*23+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*23+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*23+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*24,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*24+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*24+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*24+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*25,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*25+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*25+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*25+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*26,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*26+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*26+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*26+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*27,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*27+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*27+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*27+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*28,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*28+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*28+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*28+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*29,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*29+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*29+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*29+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*30,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*30+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*30+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*30+6,x
	iny
	iny

	lda savedBackground,y
	sta SHADOWVRAMBANK+160*31,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*31+2,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*31+4,x
	iny
	iny
	lda savedBackground,y
	sta SHADOWVRAMBANK+160*31+6,x

	RESTORE_AXY
	rts


savedBackground:		; Up to 32x32
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
