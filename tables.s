sineTable:
	.byte $80, $83, $86, $89, $8C, $90, $93, $96
	.byte $99, $9C, $9F, $A2, $A5, $A8, $AB, $AE
	.byte $B1, $B3, $B6, $B9, $BC, $BF, $C1, $C4
	.byte $C7, $C9, $CC, $CE, $D1, $D3, $D5, $D8
	.byte $DA, $DC, $DE, $E0, $E2, $E4, $E6, $E8
	.byte $EA, $EB, $ED, $EF, $F0, $F1, $F3, $F4
	.byte $F5, $F6, $F8, $F9, $FA, $FA, $FB, $FC
	.byte $FD, $FD, $FE, $FE, $FE, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FD
	.byte $FD, $FC, $FB, $FA, $FA, $F9, $F8, $F6
	.byte $F5, $F4, $F3, $F1, $F0, $EF, $ED, $EB
	.byte $EA, $E8, $E6, $E4, $E2, $E0, $DE, $DC
	.byte $DA, $D8, $D5, $D3, $D1, $CE, $CC, $C9
	.byte $C7, $C4, $C1, $BF, $BC, $B9, $B6, $B3
	.byte $B1, $AE, $AB, $A8, $A5, $A2, $9F, $9C
	.byte $99, $96, $93, $90, $8C, $89, $86, $83
	.byte $80, $7D, $7A, $77, $74, $70, $6D, $6A
	.byte $67, $64, $61, $5E, $5B, $58, $55, $52
	.byte $4F, $4D, $4A, $47, $44, $41, $3F, $3C
	.byte $39, $37, $34, $32, $2F, $2D, $2B, $28
	.byte $26, $24, $22, $20, $1E, $1C, $1A, $18
	.byte $16, $15, $13, $11, $10, $0F, $0D, $0C
	.byte $0B, $0A, $08, $07, $06, $06, $05, $04
	.byte $03, $03, $02, $02, $02, $01, $01, $01
	.byte $01, $01, $01, $01, $02, $02, $02, $03
	.byte $03, $04, $05, $06, $06, $07, $08, $0A
	.byte $0B, $0C, $0D, $0F, $10, $11, $13, $15
	.byte $16, $18, $1A, $1C, $1E, $20, $22, $24
	.byte $26, $28, $2B, $2D, $2F, $32, $34, $37
	.byte $39, $3C, $3F, $41, $44, $47, $4A, $4D
	.byte $4F, $52, $55, $58, $5B, $5E, $61, $64
	.byte $67, $6A, $6D, $70, $74, $77, $7A, $7D, $80 ; One byte wrap for easier 16-byte sampling

vramRowEndsMinusOne:
	.word $209f,$213f,$21df,$227f,$231f,$23bf,$245f,$24ff,$259f,$263f,$26df,$277f,$281f,$28bf,$295f,$29ff,$2a9f,$2b3f,$2bdf,$2c7f
	.word $2d1f,$2dbf,$2e5f,$2eff,$2f9f,$303f,$30df,$317f,$321f,$32bf,$335f,$33ff,$349f,$353f,$35df,$367f,$371f,$37bf,$385f,$38ff
	.word $399f,$3a3f,$3adf,$3b7f,$3c1f,$3cbf,$3d5f,$3dff,$3e9f,$3f3f,$3fdf,$407f,$411f,$41bf,$425f,$42ff,$439f,$443f,$44df,$457f
	.word $461f,$46bf,$475f,$47ff,$489f,$493f,$49df,$4a7f,$4b1f,$4bbf,$4c5f,$4cff,$4d9f,$4e3f,$4edf,$4f7f,$501f,$50bf,$515f,$51ff
	.word $529f,$533f,$53df,$547f,$551f,$55bf,$565f,$56ff,$579f,$583f,$58df,$597f,$5a1f,$5abf,$5b5f,$5bff,$5c9f,$5d3f,$5ddf,$5e7f
	.word $5f1f,$5fbf,$605f,$60ff,$619f,$623f,$62df,$637f,$641f,$64bf,$655f,$65ff,$669f,$673f,$67df,$687f,$691f,$69bf,$6a5f,$6aff
	.word $6b9f,$6c3f,$6cdf,$6d7f,$6e1f,$6ebf,$6f5f,$6fff,$709f,$713f,$71df,$727f,$731f,$73bf,$745f,$74ff,$759f,$763f,$76df,$777f
	.word $781f,$78bf,$795f,$79ff,$7a9f,$7b3f,$7bdf,$7c7f,$7d1f,$7dbf,$7e5f,$7eff,$7f9f,$803f,$80df,$817f,$821f,$82bf,$835f,$83ff
	.word $849f,$853f,$85df,$867f,$871f,$87bf,$885f,$88ff,$899f,$8a3f,$8adf,$8b7f,$8c1f,$8cbf,$8d5f,$8dff,$8e9f,$8f3f,$8fdf,$907f
	.word $911f,$91bf,$925f,$92ff,$939f,$943f,$94df,$957f,$961f,$96bf,$975f,$97ff,$989f,$993f,$99df,$9a7f,$9b1f,$9bbf,$9c5f,$9cff
