; Autogenerated by Mr. Sprite. Do not modify


DrawSpriteBank :
 	 ASL 	  	 ; A=Sprite Number ($0000-$0003)
	  	 TAX 	  	 ; Y=Target Screen Address ($2000-$9D00)
	  	 LDA 	 SpriteBankNum,X 	 ; Relative Sprite Number Table
	  	 JMP 	 (SpriteBankBank,X) 	 ; Bank Number Table
	  	  	  	 
SpriteBankNum :
 	 .dbyt 	 $0000,$0300,$0200,$0100 	 
	  	  	  	 
SpriteBankBank :
 	 .addr 	 SpriteBankBank00,SpriteBankBank00,SpriteBankBank00,SpriteBankBank00 	 
	  	  	  	 
SpriteBankBank00 :
 	 JSL 	 $AA0000 	 
	  	 PHK 	  	 
	  	 PLB 	  	 
	  	 RTS 	  	 
	  	  	  	 
;---------- 	  	  	 