Spr_002:
	FASTGRAPHICS		; 16x16, 214 bytes, 433 cycles
	clc	
	tya		; Y = Sprite Target Screen Address (upper left corner)
	tcs		; New Stack address
	ldx	#$6666	; Pattern #1 : 112
;--		
	tsc	
	adc	#$0007
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 1
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 2
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 3
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 4
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 5
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 6
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 7
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 8
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 9
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 10
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 11
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 12
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 13
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 14
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
	tsc		; Line 15
	adc	#$00A8
	tcs	
	phx	
	phx	
	phx	
	phx	
;--		
SLOWGRAPHICS		
	rts	
		
;------------------------------		
