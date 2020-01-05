;
;  dirt
;
;  Created by Quinn Dunki on 12/29/19
;

MAXPARTICLES = 64

.macro PARTICLEPTR_XY
	txa		; Pointer to particle structure from index
	asl
	asl
	asl
	asl
	tay
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; createDirtExplosion
;
; Simulate a bunch of dirt flying everywhere
;
; PARAML0 = X pos of circle left edge
; PARAML1 = Y pos of circle center
; PARAML2 = Radius (16 bits)
;
; Trashes SCRATCHL,SCRATCHL2,CACHEDATA
;
createDirtExplosion:
	SAVE_AXY

	lda #1
	sta dirtExplosionActive

	lda #3			; Radius hard-coded for now
	sta PARAML2
	asl
	sta CACHEDATA	; Cache diameter

	ldx #0
	ldy #0
createDirtExplosionLoop:
	jsr createDirtExplosionColumn
	inc PARAML0
	inc PARAML0
	iny
	cpy CACHEDATA
	bne createDirtExplosionLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; createDirtExplosionColumn
;
; Create one column of a starting dirt explosion circle
; X = Particle index to start filling from
; Y = Local X index of column
; PARAML0 = X pos of column
; PARAML1 = Y pos of circle center
; PARAML2 = Radius (16 bits)
;
; X=> Last particle index we filled in +1
; Trashse SCRATCHL,SCRATCHL2
;
createDirtExplosionColumn:
	SAVE_AY
	lda PARAML2
	pha

	stx SCRATCHL2 ; Cache particle index

	phy				; Look up circle table for our radius
	lda PARAML2
	asl
	tay
	lda circleTable,y
	sta SCRATCHL

	; Find starting Y from circle table
	pla
	asl
	tay
	lda (SCRATCHL),y
	tax			; Row counter
	pha
	eor #$ffff
	inc
	sta PARAML2	; Row counter end

	pla
	clc
	adc PARAML1
	sta SCRATCHL ; Current Y position
	
createDirtExplosionColumnLoop:
	phx				; Find pointer to next particle to fill out
	ldx SCRATCHL2
	PARTICLEPTR_XY
	plx

	; X position - Always the same
	lda PARAML0
	sta dirtParticles+DP_POSX,y
	asl		; Convert to 12.4
	asl
	asl
	asl
	sta dirtParticles+DP_PRECISEX,y

	; Y position - Iterates from computed cache
	lda SCRATCHL
	sta dirtParticles+DP_POSY,y
	asl		; Convert to 12.4
	asl
	asl
	asl
	sta dirtParticles+DP_PRECISEY,y

	; X velocity. Need half to be negative. I feel like there
	; should be a clever branchless way to do this, but I couldn't
	; come up with it.
	jsr random
	lda RANDOM
	bmi createDirtExplosionColumnLoopNegX
	and #$00ff
	bra createDirtExplosionColumnLoopNowY

createDirtExplosionColumnLoopNegX:
	ora #$ff00

createDirtExplosionColumnLoopNowY:
	sta dirtParticles+DP_VX,y

	; Y velocity
	jsr random
	lda RANDOM
	and #$00ff
	ora #$0100
	sta dirtParticles+DP_VY,y

	; Advance to next particle
	inc SCRATCHL2
	inc SCRATCHL
	inx
	cpx PARAML2
	bmi createDirtExplosionColumnLoop

	; Gather return values
	ldx SCRATCHL2

	pla
	sta PARAML2
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderDirtExplosion
;
; Update and render the current dirt explosion
;
renderDirtExplosion:
	SAVE_AXY

	lda dirtExplosionActive
	beq renderDirtExplosionDone

	ldx #0
	stz dirtExplosionActive		; Assume we're done unless a particle says otherwise

renderDirtExplosionLoop:
	PARTICLEPTR_XY
	jsr updateDirtParticle
	inx			; Advance array pointer to next particle
	cpx #MAXPARTICLES
	bne renderDirtExplosionLoop

renderDirtExplosionDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; updateDirtParticle
;
; Y = Offset to particle in array
; Update and render the current dirt explosion
;
; Trashes SCRATCHL,PARAML0

updateDirtParticle:
	SAVE_AXY

	lda dirtParticles+DP_POSX,y
	bmi updateDirtParticleDone	; Particle is dead

	; Erase old position
	lda #dirtParticles		; Calculate pointer to struct
	sta PARAML0
	clc
	tya
	adc PARAML0
	sta PARAML0
	jsr vramPtr
	lda #00
	sta SHADOWVRAMBANK,x

	; Integrate gravity over velocity
	lda dirtParticles+DP_VY,y
	clc
	adc #GRAVITY
	sta dirtParticles+DP_VY,y

	; Integrate X velocity over position
	lda dirtParticles+DP_VX,y
	; Convert 8.8 to 12.4
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	clc
	adc dirtParticles+DP_PRECISEX,y
	sta dirtParticles+DP_PRECISEX,y

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta dirtParticles+DP_POSX,y

	; Integrate Y velocity over position
	lda dirtParticles+DP_VY,y
	; Convert 8.8 to 12.4
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	clc
	adc dirtParticles+DP_PRECISEY,y
	sta dirtParticles+DP_PRECISEY,y

	; Convert to integer for rendering
	lsr
	lsr
	lsr
	lsr
	sta dirtParticles+DP_POSY,y

	; Draw new position
	jsr vramPtr		; PARAML0 still holds struct pointer
	cpx #$ffff
	beq updateDirtParticleKill
	lda #$11
	sta SHADOWVRAMBANK,x

	; Let everyone know we did work
	lda #1
	sta dirtExplosionActive
	
updateDirtParticleDone:
	RESTORE_AXY
updateDirtParticleDoneRTS:
	rts

updateDirtParticleKill:
	lda #-1
	sta dirtParticles+DP_POSX,y
	bra updateDirtParticleDone

dirtExplosionActive:
	.word 0

dirtParticles:
.repeat MAXPARTICLES
	.word -1	; Pos X in pixels
	.word 100	; Pos Y in pixels
	.word $a00	; Pos X (12.4 fixed point)
	.word $640	; Pos Y (12.4 fixed point)
	.word $ff00	; Velocity X (8.8 fixed point)
	.word $100	; Velocity Y (8.8 fixed point)
	.word 0,0	; Pad to 16 bytes
.endrepeat


DP_POSX = 0		; Byte offsets into dirtParticles data structure
DP_POSY = 2
DP_PRECISEX = 4
DP_PRECISEY = 6
DP_VX = 8
DP_VY = 10
