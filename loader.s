;
;  loader
;  A very simplistic code loader designed to manage
;  GS code under ProDOS 8 (if it's good enough for Will Harvey...)
;
;  Created by Quinn Dunki on 7/29/17
;

.a16
.i16

.include "equates.s"
.include "macros.s"

LOADBUFFER = $1100		; Clear of this loader code
BUFFERSIZE = $8000		; About max size we can fit between buffer and this loader code
MAINENTRY = $020000

.org $800

LOADSTEP = 3

.macro addProgress amount
	jsr nextVBL
	lda #amount
	jsr advanceLoadingBar
	jsr renderLoadingBar
.endmacro

main:
	BITS16
	NATIVE
	
	; Cache system colors
	BITS8
	lda BORDERCOLOR
	sta BORDERCOLORCACHE
	lda TEXTCOLOR
	sta TEXTCOLORCACHE
	BITS16

	; Throw up a loading screen
	jsr showLoadingScreen
	
	EMULATION

	; Open the main code file
	jsr PRODOS
	.byte $c8
	.addr fileOpenCode
	bne ioError

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Load first half of code into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError
	NATIVE

	addProgress LOADSTEP

	; Copy code into bank 2
	ldx fileReadLen
	lda #2
	ldy #0
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Load rest of code into bank 0	(needed if code size exceeds BUFFERSIZE)
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	bra mainContinue
ioError:
	brk

mainContinue:
	NATIVE

	addProgress LOADSTEP

	; Copy rest of code into bank 2 (needed if code size exceeds BUFFERSIZE)
	ldx fileReadLen
	lda #2
	ldy #BUFFERSIZE
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Open the sprite bank file
	jsr PRODOS
	.byte $c8
	.addr fileOpenSprites
	bne ioError

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Load the compiled sprites into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE
	addProgress LOADSTEP

	; Copy sprites into bank 3
	ldx fileReadLen
	lda #3
	ldy #0
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Open the sound file
	jsr PRODOS
	.byte $c8
	.addr fileOpenSound
	bne ioErrorJmp2

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Load the sound data into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioErrorJmp2

	NATIVE
	addProgress LOADSTEP

	; Copy sound data into bank 4
	ldx fileReadLen
	txa
	sta soundBankSize	; Note size of sound bank for later copying to Ensoniq RAM
	lda #4
	ldy #0
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Load rest of sound data into bank 4	(needed if sound size exceeds BUFFERSIZE)
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioErrorJmp2

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE
	bra mainContinue2

ioErrorJmp2:
	jmp ioError

mainContinue2:
	addProgress LOADSTEP

	; Copy rest of sound data into bank 4 (needed if sound size exceeds BUFFERSIZE)
	ldx fileReadLen
	txa
	clc
	adc soundBankSize	; Accumulate size of sound bank for later copying to Ensoniq RAM
	sta soundBankSize
	lda #4
	ldy #BUFFERSIZE
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Open the font file
	jsr PRODOS
	.byte $c8
	.addr fileOpenFonts
	bne ioErrorJmp

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Load the font data into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioErrorJmp

	NATIVE
	addProgress LOADSTEP

	; Copy font data into bank 5
	ldx fileReadLen
	lda #5
	ldy #0
	jsr copyBytes

	addProgress LOADSTEP

	EMULATION

	; Load rest of font data into bank 0	(needed if font size exceeds BUFFERSIZE)
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioErrorJmp

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE

	; Copy rest of font data into bank 5 (needed if font size exceeds BUFFERSIZE)
	ldx fileReadLen
	lda #5
	ldy #BUFFERSIZE
	jsr copyBytes

	bra mainContinue3

ioErrorJmp:
	jmp ioError

mainContinue3:
	
	EMULATION

	; Open the title screen file
	jsr PRODOS
	.byte $c8
	.addr fileOpenTitle
	bne ioErrorJmp

	NATIVE
	addProgress LOADSTEP
	EMULATION

	; Load the title screen data into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioErrorJmp

	NATIVE
	addProgress LOADSTEP

	; Copy title screen data into bank 6
	ldx fileReadLen
	lda #6
	ldy #0
	jsr copyBytes

	EMULATION

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE
	addProgress LOADSTEP

	; Set up a long jump into bank 2, and
	; a way for game code to get back here to exit
	; properly to ProDOS 8
	lda #returnToProDOS
	sta PRODOSRETURN

	lda #skyPalette
	sta PARAML2
	jsr paletteFade

	jml MAINENTRY
	
returnToProDOS:
	SYNCDBR
	EMULATION

	; Restore system colors
	lda BORDERCOLOR
	and #$f0
	ora BORDERCOLORCACHE
	sta BORDERCOLOR
	lda TEXTCOLORCACHE
	sta TEXTCOLOR
	rts



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copyBytes
; Copy data from read buffer in bank 0 to
; offset any other bank. Must be in native mode.
;
; X = Length of data in bytes
; Y = Origin within bank
; A = Bank number of destination
; loadOffet : offset to start of copy destination
;
copyBytes:
	sty copyBytesDest+1
	sty copyBytesDest2+1

	phx
	BITS8
	sta copyBytesDest+3
	sta copyBytesDest2+3
	BITS16
	plx

	txa
	and #1
	bne copyBytesOdd

copyBytesEven:
	dex
	dex

copyBytesLoop:
	lda LOADBUFFER,x
copyBytesDest:
	sta $010000,x
	dex
	dex
	cpx #$fffe		; X will wrap when we're done
	bne copyBytesLoop
	rts

copyBytesOdd:
	dex
	BITS8A
	lda LOADBUFFER,x
copyBytesDest2:
	sta $010000,x
	BITS16
	bra copyBytesEven

loadOffet:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fileOpenCode:
	.byte 3
	.addr codePath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileRead:
	.byte 4
	.byte 1					; File handle (we know it's gonna be 1)
	.addr LOADBUFFER
	.word BUFFERSIZE
fileReadLen:
	.word 0					; Result (bytes read)

fileClose:
	.byte 1
	.byte 1					; File handle (we know it's gonna be 1)

fileOpenSprites:
	.byte 3
	.addr spritePath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileOpenSound:
	.byte 3
	.addr soundPath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileOpenFonts:
	.byte 3
	.addr fontPath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileOpenTitle:
	.byte 3
	.addr titlePath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

codePath:
	pstring "/CATFIGHT/CODEBANK"
spritePath:
	pstring "/CATFIGHT/SPRITEBANK"
soundPath:
	pstring "/CATFIGHT/SOUNDBANK"
fontPath:
	pstring "/CATFIGHT/FONTBANK"
titlePath:
	pstring "/CATFIGHT/TITLE"

.include "sharedGraphics.s"
.include "loaderGraphics.s"
.include "loadingBar.s"
