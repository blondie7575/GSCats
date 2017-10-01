.include "macros.s"
.include "equates.s"

.org $800

NATIVE

.include "Sprites/cat_000.s"


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
