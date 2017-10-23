;****************************************
;* FONT ENGINE (v3?)                    *
;*                                      *
;*  Dagen Brock <dagenbrock@gmail.com>  *
;*  2013-07-20                          *
;*  Converted to ca65 by Quinn Dunki    *
;*  2017-08-13                          *
;****************************************
;* A= ptr to string preceded by length  *
;* X= screen location                   *
;* Preserves all registers              *
;* Trashes zero page locations 6,7      *
;****************************************
; each char:
;  draw char at loc
;  update loc
;  see if length hit - no? back to draw char
              
F_Length:     .word 0          ;length of string (only one byte currently used)
F_CharIdx:    .word 0          ;index of current character
F_CurrentPos: .word 0          ;current top left char position
F_StrPtr = $06                 ;pointer to string (including length byte) / DP


DrawString:
              pha
              phx
              phy
              sta F_StrPtr ;store at dp 0 ($00) for indirect loads
              stx F_CurrentPos
              stz F_CharIdx
              lda (F_StrPtr)
              and #$00ff    ;strip off first char (len is only one byte)
              sta F_Length ;get our length byte
              
NextChar:     lda F_CharIdx
              cmp F_Length
              bne notDone
              ply
              plx
              pla
              rts           ;DONE! Return to caller
              
notDone:      inc F_CharIdx
              ldy F_CharIdx
              lda (F_StrPtr),y   ;get next char!
              and #$00FF    ;mask high byte
              sec
              sbc #' '      ;our table starts with space ' '
              asl           ;*2
              tay
              ldx F_CurrentPos
              jsr drawChar
              inc F_CurrentPos           ;compare to addition time (?)
              inc F_CurrentPos
              inc F_CurrentPos
              inc F_CurrentPos           ;update screen pos (2 words=8 pixels)
              bra NextChar

;x = TopLeft screen pos
;y = char table offset
drawChar:     lda FontTable,y             ;get real address of char data
              sec 
              sbc #FontData  ;pivot offset - now a is offset of fontdata
              tay           ;so we'll index with that

              lda FontData,y
              sta $012000,x
              lda FontData+2,y
              sta $012000+2,x

              lda FontData+4,y
              sta $012000+160,x
              lda FontData+6,y
              sta $012000+160+2,x

              lda FontData+8,y
              sta $012000+160*2,x
              lda FontData+10,y
              sta $012000+160*2+2,x
              lda FontData+12,y
              sta $012000+160*3,x
              lda FontData+14,y
              sta $012000+160*3+2,x
              lda FontData+16,y
              sta $012000+160*4,x
              lda FontData+18,y
              sta $012000+160*4+2,x
              lda FontData+20,y
              sta $012000+160*5,x
              lda FontData+22,y
              sta $012000+160*5+2,x
              rts





FontTable:
          .addr s_Space
          .addr s_Exclaim
          .addr s_Quote
          .addr s_Number
          .addr s_Dollar
          .addr s_Percent
          .addr s_Amper
          .addr s_Single
          .addr s_OpenParen
          .addr s_CloseParen
          .addr s_Asterix
          .addr s_Plus
          .addr s_Comma
          .addr s_Minus
          .addr s_Period
          .addr s_Slash
          .addr s_N0
          .addr s_N1
          .addr s_N2
          .addr s_N3
          .addr s_N4
          .addr s_N5
          .addr s_N6
          .addr s_N7
          .addr s_N8
          .addr s_N9
          .addr s_Colon
          .addr s_Semi
          .addr s_LAngle
          .addr s_Equal
          .addr s_RAngle
          .addr s_Question
          .addr s_At
          .addr s_A
          .addr s_B
          .addr s_C
          .addr s_D
          .addr s_E
          .addr s_F
          .addr s_G
          .addr s_H
          .addr s_I
          .addr s_J
          .addr s_K
          .addr s_L
          .addr s_M
          .addr s_N
          .addr s_O
          .addr s_P
          .addr s_Q
          .addr s_R
          .addr s_S
          .addr s_T
          .addr s_U
          .addr s_V
          .addr s_W
          .addr s_X
          .addr s_Y
          .addr s_Z
          .addr s_LBracket
          .addr s_BackSlash
          .addr s_RBracket
          .addr s_Caret
          .addr s_UnderLine

FontData:
s_Space:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000

s_Exclaim:
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $00000000
	qbyte7 $000FF000

s_Quote:
	qbyte7 $0FF00FF0
	qbyte7 $00F000F0
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000

s_Number:
	qbyte7 $00000000
	qbyte7 $00F00F00
	qbyte7 $0FFFFFF0
	qbyte7 $00F00F00
	qbyte7 $0FFFFFF0
	qbyte7 $00F00F00

s_Dollar:
	qbyte7 $000F0F00
	qbyte7 $00FFFFF0
	qbyte7 $0F0F0F00
	qbyte7 $00FFFF00
	qbyte7 $000F0FF0
	qbyte7 $0FFFFF00

s_Percent:
	qbyte7 $0FF000F0
	qbyte7 $00000F00
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $00F00000
	qbyte7 $0F000FF0

s_Amper:
	qbyte7 $000FF000
	qbyte7 $00F00F00
	qbyte7 $0F00F000
	qbyte7 $00F000F0
	qbyte7 $0F0FFF00
	qbyte7 $00F0F000

s_Single:
	qbyte7 $000FF000
	qbyte7 $0000F000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000

s_OpenParen:
	qbyte7 $000FF000
	qbyte7 $00FF0000
	qbyte7 $0FF00000
	qbyte7 $0FF00000
	qbyte7 $00FF0000
	qbyte7 $000FF000

s_CloseParen:			; Anger symbol
	qbyte7 $0F0000F0
	qbyte7 $00F00F00
	qbyte7 $00000000
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $F000000F


s_Asterix:
	qbyte7 $00000000		; Angle symbol
	qbyte7 $00000FF0
	qbyte7 $0000FF00
	qbyte7 $000FF000
	qbyte7 $00FFFFF0
	qbyte7 $00000000

s_Plus:					; Power symbol
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $0FFFFF00
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $00000000

s_Comma:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $0000FF00
	qbyte7 $0000F000

s_Minus:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $0FFFFF00
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000


s_Period:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $0000FF00
	qbyte7 $0000FF00

s_Slash:
	qbyte7 $000000F0
	qbyte7 $00000F00
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $00F00000
	qbyte7 $0F000000

s_N0:
	qbyte7 $00FFFF00
	qbyte7 $0F000FF0
	qbyte7 $0F00F0F0
	qbyte7 $0F0F00F0
	qbyte7 $0FF000F0
	qbyte7 $00FFFF00

s_N1:
	qbyte7 $000F0000
	qbyte7 $00FF0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $00FFF000

s_N2:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $00000F00
	qbyte7 $000FF000
	qbyte7 $00F00000
	qbyte7 $0FFFFFF0

s_N3:
	qbyte7 $00FFFF00
	qbyte7 $000000F0
	qbyte7 $000FFF00
	qbyte7 $000000F0
	qbyte7 $000000F0
	qbyte7 $00FFFF00

s_N4:
	qbyte7 $0000FF00
	qbyte7 $000F0F00
	qbyte7 $00F00F00
	qbyte7 $0FFFFFF0
	qbyte7 $00000F00
	qbyte7 $00000F00

s_N5:
	qbyte7 $0FFFFFF0
	qbyte7 $0F000000
	qbyte7 $0FFFFF00
	qbyte7 $000000F0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_N6:
	qbyte7 $000FFF00
	qbyte7 $00F00000
	qbyte7 $0F000000
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $00FFFFF0

s_N7:
	qbyte7 $0FFFFFF0
	qbyte7 $000000F0
	qbyte7 $00000F00
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $000F0000

s_N8:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_N9:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $00F00000

s_Colon:
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $00000000
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $00000000

s_Semi:
	qbyte7 $00000000
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $00000000
	qbyte7 $000FF000
	qbyte7 $000F0000

s_LAngle:
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $00F00000
	qbyte7 $000F0000
	qbyte7 $0000F000
	qbyte7 $00000000

s_Equal:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $0FFFFF00
	qbyte7 $00000000
	qbyte7 $0FFFFF00
	qbyte7 $00000000

s_RAngle:
	qbyte7 $0000F000
	qbyte7 $00000F00
	qbyte7 $000000F0
	qbyte7 $00000F00
	qbyte7 $0000F000
	qbyte7 $00000000

s_Question:
	qbyte7 $00FFF000
	qbyte7 $0F000F00
	qbyte7 $00000F00
	qbyte7 $000FF000
	qbyte7 $00000000
	qbyte7 $000FF000

s_At:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F00F0F0
	qbyte7 $0FFFF0F0
	qbyte7 $000000F0
	qbyte7 $0FFFFF00

s_A:
	qbyte7 $000FF000
	qbyte7 $00F00F00
	qbyte7 $0F0000F0
	qbyte7 $0FFFFFF0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0

s_B:
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0FFFFF00

s_C:
	qbyte7 $00FFFFF0
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $00FFFFF0

s_D:
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0FFFFF00

s_E:
	qbyte7 $0FFFFFF0
	qbyte7 $0F000000
	qbyte7 $0FFFF000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0FFFFFF0

s_F:
	qbyte7 $0FFFFFF0
	qbyte7 $0F000000
	qbyte7 $0FFFF000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000

s_G:
	qbyte7 $00FFFFF0
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F00FFF0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_H:
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0FFFFFF0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0

s_I:
	qbyte7 $0FFFFF00
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $0FFFFF00

s_J:
	qbyte7 $000000F0
	qbyte7 $000000F0
	qbyte7 $000000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_K:
	qbyte7 $0F000F00
	qbyte7 $0F00F000
	qbyte7 $0FFF0000
	qbyte7 $0F00F000
	qbyte7 $0F000F00
	qbyte7 $0F000F00

s_L:
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0FFFFFF0

s_M:
	qbyte7 $0F0000F0
	qbyte7 $0FF00FF0
	qbyte7 $0F0FF0F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0

s_N:
	qbyte7 $0F0000F0
	qbyte7 $0FF000F0
	qbyte7 $0F0F00F0
	qbyte7 $0F00F0F0
	qbyte7 $0F000FF0
	qbyte7 $0F0000F0

s_O:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_P:
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $0FFFFF00
	qbyte7 $0F000000
	qbyte7 $0F000000
	qbyte7 $0F000000

s_Q:
	qbyte7 $00FFFF00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F00F0F0
	qbyte7 $0F000FF0
	qbyte7 $00FFFFF0

s_R:
	qbyte7 $0FFFFF00
	qbyte7 $0F0000F0
	qbyte7 $0FFFFF00
	qbyte7 $0F000F00
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0

s_S:
	qbyte7 $00FFFFF0
	qbyte7 $0F000000
	qbyte7 $00FFFF00
	qbyte7 $000000F0
	qbyte7 $000000F0
	qbyte7 $0FFFFF00

s_T:
	qbyte7 $0FFFFF00
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000

s_U:
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $00FFFF00

s_V:
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $00F00F00
	qbyte7 $000FF000

s_W:
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0000F0
	qbyte7 $0F0FF0F0
	qbyte7 $0FF00FF0
	qbyte7 $0F0000F0

s_X:
	qbyte7 $0F0000F0
	qbyte7 $00F00F00
	qbyte7 $000FF000
	qbyte7 $000FF000
	qbyte7 $00F00F00
	qbyte7 $0F0000F0

s_Y:
	qbyte7 $F00000F0
	qbyte7 $0F000F00
	qbyte7 $00F0F000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000

s_Z:
	qbyte7 $0FFFFFF0
	qbyte7 $00000F00
	qbyte7 $0000F000
	qbyte7 $000F0000
	qbyte7 $00F00000
	qbyte7 $0FFFFFF0

s_LBracket:
	qbyte7 $000FFF00
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000F0000
	qbyte7 $000FFF00

s_BackSlash:
	qbyte7 $0F000000
	qbyte7 $00F00000
	qbyte7 $000F0000
	qbyte7 $0000F000
	qbyte7 $00000F00
	qbyte7 $000000F0

s_RBracket:
	qbyte7 $00FFF000
	qbyte7 $0000F000
	qbyte7 $0000F000
	qbyte7 $0000F000
	qbyte7 $0000F000
	qbyte7 $00FFF000

s_Caret:
	qbyte7 $0000F000
	qbyte7 $000F0F00
	qbyte7 $00F000F0
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000

s_UnderLine:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $FFFFFFF0

s_Template:
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000
	qbyte7 $00000000

