;
;  loader
;  A very simplistic code loader designed to manage
;  GS code under ProDOS 8 (if it's good enough for Will Harvey...)
;
;  Created by Quinn Dunki on 7/29/17
;

.include "equates.s"
.include "macros.s"

LOADBUFFER = $1000		; Clear of this loader code
BUFFERSIZE = $8200		; About max size we can fit between buffer and this loader code
MAINENTRY = $020000

.org $800

main:
	OP8		; We launch in emulation. Stay there for now

	; Open the main code file
	jsr PRODOS
	.byte $c8
	.addr fileOpenCode
	bne ioError

	; Load the code into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE

	; Copy code into bank 2
	ldx fileReadLen
	lda #2
	ldy #0
	jsr copyBytes

	EMULATION

;;;;;;;;;;;;;;;;;;;;;

	; Open the E1 code file
	jsr PRODOS
	.byte $c8
	.addr fileOpenCodeE1
	bne ioError

	; Load the code into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE

	; Copy code into bank E1
	ldx fileReadLen
	lda #$E1
	ldy #$800		; Must match terrain_e1 .org
	jsr copyBytes

	; Copy vram table into bank E1
	phb
	lda #vramRowInvertedSpanLookupEnd-vramRowInvertedSpanLookup-1
	ldx #vramRowInvertedSpanLookupEnd-1
	ldy #$16C0 + vramRowInvertedSpanLookupEnd-vramRowInvertedSpanLookup-1 		; Must match terrain_e1 vramRowInvertedSpanLookup
	mvp $e1,$00		; Note that ca65 reverses src,dest. Grrr.
	plb

	EMULATION

	jmp loadData

	; Mystery jump table at 1680 - 16BB

ioError:
	brk

;;;;;;;;;;;;;;;;;;;;;
loadData:

	; Open the sprite bank file
	jsr PRODOS
	.byte $c8
	.addr fileOpenSprites
	bne ioError

	; Load the compiled sprites into bank 0
	jsr PRODOS
	.byte $ca
	.addr fileRead
	bne ioError

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileClose

	NATIVE

	; Copy sprites into bank 3
	ldx fileReadLen
	lda #3
	ldy #0
	jsr copyBytes

	; Set up a long jump into bank 2, and
	; a way for game code to get back here to exit
	; properly to ProDOS 8
	lda #returnToProDOS
	sta PRODOSRETURN

	jml MAINENTRY

returnToProDOS:
	SYNCDBR
	EMULATION
	rts


; This table lives here in the loader because we need to copy
; it to a specific free hole in bank E1
vramRowInvertedSpanLookup:
	.word $9d00,$9c60,$9bc0,$9b20,$9a80,$99e0,$9940,$98a0,$9800,$9760,$96c0,$9620,$9580,$94e0,$9440,$93a0,$9300,$9260,$91c0,$9120
	.word $9080,$8fe0,$8f40,$8ea0,$8e00,$8d60,$8cc0,$8c20,$8b80,$8ae0,$8a40,$89a0,$8900,$8860,$87c0,$8720,$8680,$85e0,$8540,$84a0
	.word $8400,$8360,$82c0,$8220,$8180,$80e0,$8040,$7fa0,$7f00,$7e60,$7dc0,$7d20,$7c80,$7be0,$7b40,$7aa0,$7a00,$7960,$78c0,$7820
	.word $7780,$76e0,$7640,$75a0,$7500,$7460,$73c0,$7320,$7280,$71e0,$7140,$70a0,$7000,$6f60,$6ec0,$6e20,$6d80,$6ce0,$6c40,$6ba0
	.word $6b00,$6a60,$69c0,$6920,$6880,$67e0,$6740,$66a0,$6600,$6560,$64c0,$6420,$6380,$62e0,$6240,$61a0,$6100,$6060,$5fc0,$5f20
	.word $5e80,$5de0,$5d40,$5ca0,$5c00,$5b60,$5ac0,$5a20,$5980,$58e0,$5840,$57a0,$5700,$5660,$55c0,$5520,$5480,$53e0,$5340,$52a0
	.word $5200,$5160,$50c0,$5020,$4f80,$4ee0,$4e40,$4da0,$4d00,$4c60,$4bc0,$4b20,$4a80,$49e0,$4940,$48a0,$4800,$4760,$46c0,$4620
	.word $4580,$44e0,$4440,$43a0,$4300,$4260,$41c0,$4120,$4080,$3fe0,$3f40,$3ea0,$3e00,$3d60,$3cc0,$3c20,$3b80,$3ae0,$3a40,$39a0
	.word $3900,$3860,$37c0,$3720,$3680,$35e0,$3540,$34a0,$3400,$3360,$32c0,$3220,$3180,$30e0,$3040,$2fa0,$2f00,$2e60,$2dc0,$2d20
	.word $2c80,$2be0,$2b40,$2aa0,$2a00,$2960,$28c0,$2820,$2780,$26e0,$2640,$25a0,$2500,$2460,$23c0,$2320,$2280,$21e0,$2140,$20a0
vramRowInvertedSpanLookupEnd:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copyBytes
; Copy data from read buffer in bank 0 to
; bottom of any other bank. Must be in native mode.
;
; X = Length of data in bytes
; Y = Origin within bank
; A = Bank number of destination
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
	bpl copyBytesLoop
	rts

copyBytesOdd:
	dex
	BITS8A
	lda LOADBUFFER,x
copyBytesDest2:
	sta $010000,x
	BITS16
	bra copyBytesEven

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fileOpenCode:
	.byte 3
	.addr codePath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileOpenCodeE1:
	.byte 3
	.addr codePathE1
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

codePath:
	pstring "/GSAPP/CODEBANK"
codePathE1:
	pstring "/GSAPP/CODEBANKE1"
spritePath:
	pstring "/GSAPP/SPRITEBANK00"
