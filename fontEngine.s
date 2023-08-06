.include "equates.s"
.include "macros.s"

.org $0000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderString (Far entry point at $050000)
;
; Draws a Pascal string in any font
;
; PARAML0 = Pointer to string
; Y = VRAM position of lower right corner of string at which to draw
; A = Font index
;
; Trashes SCRATCHL,X,Y,A
;
renderString:
	NATIVE
	SAVE_DBR

	asl
	tax
	jmp (fontJumpTable,x)		; Can't JSR here because we need the stack in a particular state (with DBR cached on top)

renderStringReturn:
	RESTORE_DBR
	rtl

fontJumpTable:
	.addr renderString_tinyNum
	.addr renderString_font8
	.addr renderString_font16


.include "fonts.s"


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"

