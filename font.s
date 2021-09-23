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
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000

s_Exclaim:
	qbyte $000FF000
	qbyte $000FF000
	qbyte $000FF000
	qbyte $000FF000
	qbyte $00000000
	qbyte $000FF000

s_Quote:
	qbyte $0FF00FF0
	qbyte $00F000F0
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000

s_Number:
	qbyte $00000000
	qbyte $00F00F00
	qbyte $0FFFFFF0
	qbyte $00F00F00
	qbyte $0FFFFFF0
	qbyte $00F00F00

s_Dollar:
	qbyte $00666600
	qbyte $06616660
	qbyte $06166660
	qbyte $06666660
	qbyte $00666600
	qbyte $00000000

s_Percent:
	qbyte $0FF000F0
	qbyte $00000F00
	qbyte $0000F000
	qbyte $000F0000
	qbyte $00F00000
	qbyte $0F000FF0

s_Amper:
	qbyte $000FF000
	qbyte $00F00F00
	qbyte $0F00F000
	qbyte $00F000F0
	qbyte $0F0FFF00
	qbyte $00F0F000

s_Single:
	qbyte $000FF000
	qbyte $0000F000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000

s_OpenParen:
	qbyte $000FF000
	qbyte $00FF0000
	qbyte $0FF00000
	qbyte $0FF00000
	qbyte $00FF0000
	qbyte $000FF000

s_CloseParen:			; Anger symbol
	qbyte $0F0000F0
	qbyte $00F00F00
	qbyte $00000000
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $F000000F


s_Asterix:
	qbyte $00000000		; Angle symbol
	qbyte $00000FF0
	qbyte $0000FF00
	qbyte $000FF000
	qbyte $00FFFFF0
	qbyte $00000000

s_Plus:					; Power symbol
	qbyte $000F0000
	qbyte $000F0000
	qbyte $0FFFFF00
	qbyte $000F0000
	qbyte $000F0000
	qbyte $00000000

s_Comma:
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $0000FF00
	qbyte $0000F000

s_Minus:
	qbyte $00000000
	qbyte $00000000
	qbyte $0FFFFF00
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000


s_Period:
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $0000FF00
	qbyte $0000FF00

s_Slash:
	qbyte $000000F0
	qbyte $00000F00
	qbyte $0000F000
	qbyte $000F0000
	qbyte $00F00000
	qbyte $0F000000

s_N0:
	qbyte $00FFFF00
	qbyte $0F000FF0
	qbyte $0F00F0F0
	qbyte $0F0F00F0
	qbyte $0FF000F0
	qbyte $00FFFF00

s_N1:
	qbyte $000F0000
	qbyte $00FF0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $00FFF000

s_N2:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $00000F00
	qbyte $000FF000
	qbyte $00F00000
	qbyte $0FFFFFF0

s_N3:
	qbyte $00FFFF00
	qbyte $000000F0
	qbyte $000FFF00
	qbyte $000000F0
	qbyte $000000F0
	qbyte $00FFFF00

s_N4:
	qbyte $0000FF00
	qbyte $000F0F00
	qbyte $00F00F00
	qbyte $0FFFFFF0
	qbyte $00000F00
	qbyte $00000F00

s_N5:
	qbyte $0FFFFFF0
	qbyte $0F000000
	qbyte $0FFFFF00
	qbyte $000000F0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_N6:
	qbyte $000FFF00
	qbyte $00F00000
	qbyte $0F000000
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $00FFFFF0

s_N7:
	qbyte $0FFFFFF0
	qbyte $000000F0
	qbyte $00000F00
	qbyte $0000F000
	qbyte $000F0000
	qbyte $000F0000

s_N8:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_N9:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $00FFFF00
	qbyte $0000F000
	qbyte $000F0000
	qbyte $00F00000

s_Colon:
	qbyte $000FF000
	qbyte $000FF000
	qbyte $00000000
	qbyte $000FF000
	qbyte $000FF000
	qbyte $00000000

s_Semi:
	qbyte $00000000
	qbyte $000FF000
	qbyte $000FF000
	qbyte $00000000
	qbyte $000FF000
	qbyte $000F0000

s_LAngle:
	qbyte $0000F000
	qbyte $000F0000
	qbyte $00F00000
	qbyte $000F0000
	qbyte $0000F000
	qbyte $00000000

s_Equal:
	qbyte $00000000
	qbyte $00000000
	qbyte $0FFFFF00
	qbyte $00000000
	qbyte $0FFFFF00
	qbyte $00000000

s_RAngle:
	qbyte $0000F000
	qbyte $00000F00
	qbyte $000000F0
	qbyte $00000F00
	qbyte $0000F000
	qbyte $00000000

s_Question:
	qbyte $00FFF000
	qbyte $0F000F00
	qbyte $00000F00
	qbyte $000FF000
	qbyte $00000000
	qbyte $000FF000

s_At:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $0F00F0F0
	qbyte $0FFFF0F0
	qbyte $000000F0
	qbyte $0FFFFF00

s_A:
	qbyte $000FF000
	qbyte $00F00F00
	qbyte $0F0000F0
	qbyte $0FFFFFF0
	qbyte $0F0000F0
	qbyte $0F0000F0

s_B:
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0FFFFF00

s_C:
	qbyte $00FFFFF0
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $00FFFFF0

s_D:
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0FFFFF00

s_E:
	qbyte $0FFFFFF0
	qbyte $0F000000
	qbyte $0FFFF000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0FFFFFF0

s_F:
	qbyte $0FFFFFF0
	qbyte $0F000000
	qbyte $0FFFF000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000

s_G:
	qbyte $00FFFFF0
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F00FFF0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_H:
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0FFFFFF0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0

s_I:
	qbyte $0FFFFF00
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $0FFFFF00

s_J:
	qbyte $000000F0
	qbyte $000000F0
	qbyte $000000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_K:
	qbyte $0F000F00
	qbyte $0F00F000
	qbyte $0FFF0000
	qbyte $0F00F000
	qbyte $0F000F00
	qbyte $0F000F00

s_L:
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0FFFFFF0

s_M:
	qbyte $0F0000F0
	qbyte $0FF00FF0
	qbyte $0F0FF0F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0

s_N:
	qbyte $0F0000F0
	qbyte $0FF000F0
	qbyte $0F0F00F0
	qbyte $0F00F0F0
	qbyte $0F000FF0
	qbyte $0F0000F0

s_O:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_P:
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $0FFFFF00
	qbyte $0F000000
	qbyte $0F000000
	qbyte $0F000000

s_Q:
	qbyte $00FFFF00
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F00F0F0
	qbyte $0F000FF0
	qbyte $00FFFFF0

s_R:
	qbyte $0FFFFF00
	qbyte $0F0000F0
	qbyte $0FFFFF00
	qbyte $0F000F00
	qbyte $0F0000F0
	qbyte $0F0000F0

s_S:
	qbyte $00FFFFF0
	qbyte $0F000000
	qbyte $00FFFF00
	qbyte $000000F0
	qbyte $000000F0
	qbyte $0FFFFF00

s_T:
	qbyte $0FFFFF00
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000

s_U:
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $00FFFF00

s_V:
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $00F00F00
	qbyte $000FF000

s_W:
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0000F0
	qbyte $0F0FF0F0
	qbyte $0FF00FF0
	qbyte $0F0000F0

s_X:
	qbyte $0F0000F0
	qbyte $00F00F00
	qbyte $000FF000
	qbyte $000FF000
	qbyte $00F00F00
	qbyte $0F0000F0

s_Y:
	qbyte $F00000F0
	qbyte $0F000F00
	qbyte $00F0F000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000

s_Z:
	qbyte $0FFFFFF0
	qbyte $00000F00
	qbyte $0000F000
	qbyte $000F0000
	qbyte $00F00000
	qbyte $0FFFFFF0

s_LBracket:
	qbyte $000FFF00
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000F0000
	qbyte $000FFF00

s_BackSlash:
	qbyte $0F000000
	qbyte $00F00000
	qbyte $000F0000
	qbyte $0000F000
	qbyte $00000F00
	qbyte $000000F0

s_RBracket:
	qbyte $00FFF000
	qbyte $0000F000
	qbyte $0000F000
	qbyte $0000F000
	qbyte $0000F000
	qbyte $00FFF000

s_Caret:
	qbyte $0000F000
	qbyte $000F0F00
	qbyte $00F000F0
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000

s_UnderLine:
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $FFFFFFF0

s_Template:
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000
	qbyte $00000000

