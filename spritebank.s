; Autogenerated by Mr. Sprite. Do not modify


DrawSpriteBank :
 	 ASL 	  	 ; A=Sprite Number ($0000-$0006)
	  	 TAX 	  	 ; Y=Target Screen Address ($2000-$9D00)
	  	 LDA 	 SpriteBankNum,X 	 ; Relative Sprite Number Table
	  	 JMP 	 (SpriteBankBank,X) 	 ; Bank Number Table
	  	  	  	 
SpriteBankNum :
 	 .dbyt 	 $0100,$0000,$0500,$0200,$0300,$0600,$0400 	 
	  	  	  	 
SpriteBankBank :
 	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	  	  	 
SpriteBankBank00 :
 	 JSL 	 $AA0000 	 
	  	 PHK 	  	 
	  	 PLB 	  	 
	  	 RTS 	  	 
	  	  	  	 
;---------- 	  	  	 
