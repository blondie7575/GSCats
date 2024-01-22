;
;  players
;  Code and data structures related to the players
;
;  Created by Quinn Dunki on 8/13/17
;

MAX_ANGER = 100
START_POWER = 2
START_TREATS = 7

playerData:
	;;;;;;;;;;;; PLAYER 1 ;;;;;;;;;;;;;;
	; gameobject data
	.word 0	; X pos in pixels (from left terrain edge)
	.word 0	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.word 0				; Angle in degrees from +X
	.word 0				; Power
	.word 0				; Anger
	.byte 8,"SPROCKET "	; Name
	.word 29			; Base Sprite
	.word 0,5,7,1,1,0,0,0	; Prices
	.word 0				; Current weapon
	.word 0				; Treats
	.repeat 86
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

	;;;;;;;;;;;; PLAYER 2 ;;;;;;;;;;;;;;
	; gameobject data
	.word 0	; X pos in pixels (from left terrain edge)
	.word 0	; Y pos in pixels (from bottom terrain edge)
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	; Saved background
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.word 0				; Angle in degrees from +X
	.word 0				; Power
	.word 0				; Anger
	.byte 8,"TINKER   "	; Name
	.word 20			; Base Sprite
	.word 0,5,7,1,1,0,0,0	; Prices
	.word 0				; Current weapon
	.word 0				; Treats

	.repeat 86
	.byte 0		; Padding to 256-byte boundary
	.endrepeat

PD_ANGLE = 132
PD_POWER = 134
PD_ANGER = 136
PD_NAME = 138
PD_BASESPRITE = 148
PD_PRICES = 150
PD_CURRWEAPON = 166
PD_TREATS = 168
PD_SIZE = 256

MAX_POWER = 5
MAX_ANGLE = 180

.macro PLAYERPTR_Y
	tya		; Pointer to player structure from index
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	tay
.endmacro


.macro PLAYERPTR_X
	txa		; Pointer to player structure from index
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	tax
.endmacro


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerCreate
;
; A = Player X pos
; Y = Index
; Trashes SCRATCHL
;
playerCreate:
	pha
	PLAYERPTR_Y
	sty SCRATCHL
	pla

	; Starting position
	sta playerData+GO_POSX,y
	lda #playerData
	clc
	adc SCRATCHL
	sta PARAML0
	jsr placeGameObjectOnTerrainDefault

	; Starting aim
	lda playerData+GO_POSX,y
	cmp #TERRAINWIDTH/2
	bcc playerCreateLeft
	lda #154
	bra playerCreateInit
playerCreateLeft:
	lda #24

playerCreateInit:
	sta playerData+PD_ANGLE,y

	; Initialize standard values
	lda #START_POWER
	sta playerData+PD_POWER,y
	lda #START_TREATS
	sta playerData+PD_TREATS,y
	lda #0
	sta playerData+PD_ANGER,y
	lda #0
	sta playerData+PD_CURRWEAPON,y
	lda #1
	sta playersDirty
	sta terrainDirty
	sta projectilesDirty
	sta inventoryDirty

	lda #-1
	sta gameOver
	sta projectileActive

	stz currentPlayer

	jsr createProgressBar
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerDeltaAngle
;
; Y = Player index
; X = Delta
;
playerDeltaAngle:
	SAVE_AXY
	PLAYERPTR_Y

	txa
	clc
	adc playerData+PD_ANGLE,y
	bmi playerDeltaAngleClampLow
	cmp #MAX_ANGLE
	bpl playerDeltaAngleClampHigh

playerDeltaAngleStore:
	sta playerData+PD_ANGLE,y
	RESTORE_AXY
	rts

playerDeltaAngleClampLow:
	lda #0
	bra playerDeltaAngleStore

playerDeltaAngleClampHigh:
	lda #MAX_ANGLE
	bra playerDeltaAngleStore


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerDeltaPower
;
; Y = Player index
; X = Delta
;
playerDeltaPower:
	SAVE_AXY
	PLAYERPTR_Y

	txa
	clc
	adc playerData+PD_POWER,y
	beq playerDeltaPowerClampLow
	cmp #MAX_POWER
	bpl playerDeltaPowerClampHigh

playerDeltaPowerStore:
	sta playerData+PD_POWER,y
	RESTORE_AXY
	rts

playerDeltaPowerClampLow:
	lda #1
	bra playerDeltaPowerStore

playerDeltaPowerClampHigh:
	lda #MAX_POWER
	bra playerDeltaPowerStore


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerFire
;
; Y = Player index
; Trashes SCRATCHL,SCRATCHL2
;
playerFire:
	SAVE_AXY
	sty SCRATCHL2
	PLAYERPTR_Y

	; Check that we can afford it
	lda playerData+PD_CURRWEAPON,y
	pha
	asl
	tax
	stx SCRATCHL
	lda #playerData+PD_PRICES
	clc
	adc SCRATCHL
	sta SCRATCHL
	lda (SCRATCHL),y
	sta SCRATCHL

	lda playerData+PD_TREATS,y
	cmp SCRATCHL
	bmi playerFire_abort

	sec				; Spend money
	sbc SCRATCHL
	sta playerData+PD_TREATS,y

	; Check for movement
	lda playerData+PD_CURRWEAPON,y
	cmp #PT_MOVELEFT
	beq playerFireMoveLeft
	cmp #PT_MOVERIGHT
	beq playerFireMoveRight

	; Animate the shooting
	phy
	ldy SCRATCHL2
	jsr renderShootAnimation
	ply

	; Prepare projectile parameters
	pla
	sta projectileParams+8
	lda playerData+GO_POSX,y
	sta projectileParams
	lda playerData+GO_POSY,y
	sta projectileParams+2
	lda playerData+PD_ANGLE,y
	sta projectileParams+4
	lda playerData+PD_POWER,y
	sta projectileParams+6
	jsr fireProjectile

playerFire_done:
	RESTORE_AXY
	rts

playerFire_abort:
	pla		; Balance stack
	jsr renderCrosshair		; Keep crosshair from disappearing on abort. Kinda hacky
	bra playerFire_done

playerFireMoveLeft:
	lda #-2
	sta playerMoveRequested
	bra playerFire_abort

playerFireMoveRight:
	lda #2
	sta playerMoveRequested
	bra playerFire_abort


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playerIntersectRect
;
; X = Player index
; rectParams = Rectangle to intersect with us
; A => non zero if rectangle is intersecting player
;
playerIntersectRect:
	phx
	PLAYERPTR_X

	lda playerData+GO_POSX,x
	sta rectParams2+0
	lda playerData+GO_POSY,x
	sta rectParams2+2
	lda #GAMEOBJECTWIDTH
	sta rectParams2+4
	lda #GAMEOBJECTHEIGHT
	sta rectParams2+6

	jsr intersectRectRect
	plx
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayers
;
;
renderPlayers:
	SAVE_AXY

	lda #playerData
	sta PARAML0
	lda playerData+PD_BASESPRITE
	jsr renderGameObject

	lda #playerData+PD_SIZE
	sta PARAML0
	lda playerData+PD_SIZE+PD_BASESPRITE
	jsr renderGameObject

RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; protectPlayers
;
; Trashes PARAML0
;
protectPlayers:
	SAVE_AXY

	lda #playerData
	sta PARAML0
	jsr vramPtr
	cpx #$ffff
	beq protectPlayerNext

	lda #playerData+GO_BACKGROUND
	sta PARAML0
	jsr protectGameObject

protectPlayerNext:
	lda #playerData+PD_SIZE
	sta PARAML0
	jsr vramPtr
	cpx #$ffff
	beq protectPlayerDone

	lda #playerData+GO_BACKGROUND+PD_SIZE
	sta PARAML0
	jsr protectGameObject

protectPlayerDone:
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unrenderPlayers
;
;
unrenderPlayers:
	SAVE_AXY
	lda #playerData
	sta PARAML0
	jsr unrenderGameObject

	lda #playerData+PD_SIZE
	sta PARAML0
	jsr unrenderGameObject
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderHitAnimation
;
; Y = Player index to render
; Trashes PARAML0,SCRATCHL
;
renderHitAnimation:
	SAVE_AXY

	; Play hit sound
	phy
	ldy #SOUND_HOWL
	jsr playSound
	ply

	PLAYERPTR_Y

	jsr unrenderPlayers
	jsr unrenderCrosshair

	lda playerData+GO_POSX,y
	sta renderAnimationPos
	lda playerData+GO_POSY,y
	clc
	adc #GAMEOBJECTHEIGHT
	sta renderAnimationPos+2
	lda #renderAnimationPos
	sta PARAML0
	ldx #5

	lda playerData+PD_BASESPRITE,y
	inc		; Hit animation starts right above base sprite
	tay
	lda #ANIMATION_SIZE_16x32
	jsr renderAnimation

	jsr renderPlayers

	RESTORE_AXY
	rts

renderAnimationPos:
	.word 0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderShootAnimation
;
; Y = Player index to render
; Trashes PARAML0,SCRATCHL
;
renderShootAnimation:
	SAVE_AXY

	jsr playIterativeMeowSound

	PLAYERPTR_Y

	jsr unrenderPlayers
	jsr unrenderCrosshair

	lda playerData+GO_POSX,y
	sta renderAnimationPos
	lda playerData+GO_POSY,y
	sta renderAnimationPos+2
	lda #renderAnimationPos
	sta PARAML0

	ldx #3

	lda playerData+PD_BASESPRITE,y
	clc
	adc #6	; Shoot animation starts 6 above base sprite
	tay
	lda #ANIMATION_SIZE_16x16
	jsr renderAnimation

	jsr renderPlayers

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderPlayerHeader
;
; Y = Player index to render
;
renderPlayerHeader:
	SAVE_AXY
	PLAYERPTR_Y

	; Erase header
	phy
	ldx #0000
	ldy #10
	jsr colorFill
	ply

	; Redraw header
	tya
	clc
	adc #playerData
	adc #PD_NAME
	sta PARAML0

	phy
	ldy #$25a1
	lda #1
	jsl renderStringFar
	ply

;	lda playerData+PD_ANGLE,y
;	ldx #56 + $2500
;	jsr drawNumber

;	lda playerData+PD_POWER,y
;	ldx #76 + $2500
;	jsr drawNumber

	lda playerData+PD_TREATS,y
	ldx #$25f0
	jsr drawNumber

	lda #treatsStr
	sta PARAML0
	ldy #$25d0
	lda #1
	jsl renderStringFar

	lda #angerStr
	sta PARAML0
	ldy #$25ff
	lda #1
	jsl renderStringFar
	jsr renderProgressBar

	RESTORE_AXY
	rts

treatsStr:
	pstring "TREATS:$"
angerStr:
	pstring "ANGER:"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; syncPlayerHeader
;
syncPlayerHeader:
	SAVE_AY
	ldy currentPlayer
	PLAYERPTR_Y

	; Convert anger to progress bar value
	lda playerData+PD_ANGER,y
	lsr
	lsr
	jsr setProgressBar
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; playIterativeMeowSound
;
playIterativeMeowSound:
	phy

	ldy meowDex
	jsr playSound
	iny
	iny
	cpy #SOUND_MEOW4
	bcc playIterativeMeowSoundDone
	beq playIterativeMeowSoundDone
	ldy #SOUND_MEOW1

playIterativeMeowSoundDone:
	sty meowDex
	
	ply
	rts

meowDex:
	.word SOUND_MEOW1

