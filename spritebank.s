; Autogenerated by Mr. Sprite. Do not modify


DrawSpriteBank :
 	 ASL 	  	 ; A=Sprite Number ($0000-$001F)
	  	 TAX 	  	 ; Y=Target Screen Address ($2000-$9D00)
	  	 LDA 	 SpriteBankNum,X 	 ; Relative Sprite Number Table
	  	 JMP 	 (SpriteBankBank,X) 	 ; Bank Number Table
	  	  	  	 
SpriteBankNum :
 	 .dbyt 	 $0B00,$0A00,$1800,$1100,$1200,$1700,$1E00,$1C00 	 
	  	 .dbyt 	 $1500,$1600,$1B00,$1F00,$0D00,$0F00,$1000,$1D00 	 
	  	 .dbyt 	 $1A00,$1900,$1400,$1300,$0C00,$0E00,$0600,$0000 	 
	  	 .dbyt 	 $0300,$0400,$0800,$0900,$0700,$0200,$0100,$0500 	 
	  	  	  	 
SpriteBankBank :
 	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	  	  	 
SpriteBankBank00 :
 	 JSL 	 $AA0000 	 
	  	 PHK 	  	 
	  	 PLB 	  	 
	  	 RTS 	  	 
	  	  	  	 
;---------- 	  	  	 
