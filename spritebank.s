DrawSpriteBank:
  ASL		; A=Sprite Number ($0000-$0002)
	TAX		; Y=Target Screen Address ($2000-$9D00)
	LDA	spritebankNum,X	; Relative Sprite Number Table
	JMP	(spritebankBank,X)	; Bank Number Table

spritebankNum:
  .word $0000,$0200,$0100

spritebankBank:
  .addr spritebankBank00,spritebankBank00,spritebankBank00

spritebankBank00:
  JSL	$AA0000
	PHK
	PLB
	RTS
