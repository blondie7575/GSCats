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

ENSONIQ_CONTROL = $e1c03c		; Ensoniq-related registers/locations
ENSONIQ_DATA = $e1c03d
ENSONIQ_ADDRL = $e1c03e
ENSONIQ_ADDRH = $e1c03f
SYSTEM_VOLUME = $e100ca

; Zero page locations we use (unused by Monitor, Applesoft, or ProDOS)
PARAM0			= $06
PARAM1			= $07
PARAM2			= $08
PARAM3			= $09
PARAML0			= $06		; 16-bit versions of params
PARAML1			= $08
PARAML2			= $d0
SCRATCH0		= $19
SCRATCH1		= $1a
SCRATCHL		= $19		; 16-bit version of scratch
SCRATCHL2		= $67		; Second 16-bit scratch
PARAM24			= $67		; 24-bit param (This is almost certainly messing up AppleSoft, but meh)
CACHEPTR		= $6A		; General purpose cache pointer (This is almost certainly messing up AppleSoft, but meh)
CACHEDATA		= $6C		; General purpose cache data (This is almost certainly messing up AppleSoft, but meh)
leftScreenEdge	= $6E		; Reserved for leftScreenEdge  (This is almost certainly messing up AppleSoft, but meh)
STACKPTR		= $70		; Cache for stack pointer in fast graphics
SHADOWREGISTER	= $72		; Cache for shadow register in fast graphics
STACKREGISTER	= $73		; Cache for stack register in fast graphics
lastCompiledTerrainY = $75	; The highest Y value that the compiled renderer must handle
RANDOM			= $ce		; 16 bit random number
RANDOML			= $ce		; Low byte of random number generator
RANDOMH			= $cf		; High byte of random number generator

; Terrain constants
TERRAINWIDTH = 640		; In pixels
MAXTERRAINHEIGHT = 100	; In pixels
COMPILEDTERRAINROW = TERRAINWIDTH/4+4	; In words, +4 to make room for clipping jump at end of row
VISIBLETERRAINWIDTH = TERRAINWIDTH/4	; In words- width minus jump return padding
VISIBLETERRAINWINDOW = 80				; In words
MAXSPANSPERROW = 15
SPANROWBYTES = MAXSPANSPERROW*2 + 2		; In bytes
CLIPPEDTERRAINSTACK = $3fff				; Location of stack where clipped terrain data lives

; Terrain data, stored as height values 2 pixels wide (bytes)
terrainDataFar = $02f500
terrainData = $f500
;	.repeat TERRAINWIDTH/2
;	.word 0
;	.endrepeat
terrainDataEnd = terrainData + (TERRAINWIDTH/2 * 2)

; Far symbols
renderStringFar = $050000			; Main entry for font rendering engine

; Stash the size of the sound bank at the end of sound memory so loader can pass it to sound system
soundBankSize=$04fffe

; projectileData struct offsets
JD_PRECISEX = 132
JD_PRECISEY = 134
JD_VX = 136
JD_VY = 138
JD_TYPE = 140
JD_NEW = 142
JD_STATIC = 144
JD_OWNER = 146
JD_FACING = 148
JD_SCRATCH = 150
JD_AGE = 152
JD_DEPLOYDELAY = 154

MAXPROJECTILES = 3

