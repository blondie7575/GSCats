TEXTCOLOR		= $e0c022
NEWVIDEO		= $e0c029
BORDERCOLOR		= $e0c034
CLOCKCTL		= $e0c034
SHADOW			= $e0c035
STACKCTL		= $e0c068
KBD				= $e0c000
KBDSTROBE		= $e0c010
COUT			= $fded


; Zero page locations we use (unused by Monitor, Applesoft, or ProDOS)
PARAM0			= $06
PARAM1			= $07
PARAM2			= $08
PARAM3			= $09
PARAML0			= $06		; 16-bit versions of params
PARAML1			= $08
SCRATCH0		= $19
SCRATCH1		= $1a
SCRATCHL		= $19		; 16-bit version of scratch
PARAM24			= $67		; 24-bit param (This is almost certainly messing up AppleSoft, but meh)
