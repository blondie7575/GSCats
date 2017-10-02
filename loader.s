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
MAINENTRY = $020800

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
	.addr fileReadCode
	bne ioError

	; Close the file
	jsr PRODOS
	.byte $cc
	.addr fileCloseCode

	NATIVE

	; Copy code into bank 2
mainCopyStart:
	ldx #0

mainCopyLoop:
	lda LOADBUFFER,x

mainCopyDest:
	sta MAINENTRY,x
	inx
	inx
	cpx #LOADBUFFER+BUFFERSIZE
	bne mainCopyLoop

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

ioError:
	brk

fileOpenCode:
	.byte 3
	.addr codePath
	.addr $9200				; 1k below BASIC.SYSTEM
	.byte 0					; Result (file handle)
	.byte 0					; Padding

fileReadCode:
	.byte 4
	.byte 1					; File handle (we know it's gonna be 1)
	.addr LOADBUFFER
	.word BUFFERSIZE
	.word 0					; Result (bytes read)

fileCloseCode:
	.byte 1
	.byte 1					; File handle (we know it's gonna be 1)

codePath:
	pstring "/GSAPP/CODEBANK"
