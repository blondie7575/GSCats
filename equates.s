TEXTCOLOR		= $e0c022
NEWVIDEO		= $e0c029
BORDERCOLOR		= $e0c034
CLOCKCTL		= $e0c034
SHADOW			= $e0c035
STACKCTL		= $e0c068
KBD				= $e0c000
KBDSTROBE		= $e0c010
COUT			= $fded
VRAM			= $e12000
SHADOWVRAM		= $012000
VRAMBANK		= $e10000
SHADOWVRAMBANK	= $010000
PRODOS			= $bf00		; MLI entry point
PRODOSRETURN	= $300		; Indirect jump to get back to ProDOS from any bank

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
SCRATCHL2		= $67		; Second 16-bit scratch
PARAM24			= $67		; 24-bit param (This is almost certainly messing up AppleSoft, but meh)
STACKPTR		= $70		; Cache for stack pointer in fast graphics
SHADOWREGISTER	= $72		; Cache for shadow register in fast graphics
STACKREGISTER	= $73		; Cache for stack register in fast graphics
