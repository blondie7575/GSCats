sineTable:		; 8.8 fixed point
	.word $0080,$0083,$0086,$0089,$008c,$008f,$0092,$0095
	.word $0098,$009c,$009f,$00a2,$00a5,$00a8,$00ab,$00ae
	.word $00b0,$00b3,$00b6,$00b9,$00bc,$00bf,$00c1,$00c4
	.word $00c7,$00c9,$00cc,$00ce,$00d1,$00d3,$00d5,$00d8
	.word $00da,$00dc,$00de,$00e0,$00e2,$00e4,$00e6,$00e8
	.word $00ea,$00ec,$00ed,$00ef,$00f0,$00f2,$00f3,$00f5
	.word $00f6,$00f7,$00f8,$00f9,$00fa,$00fb,$00fc,$00fc
	.word $00fd,$00fe,$00fe,$00ff,$00ff,$00ff,$00ff,$00ff
	.word $00ff,$00ff,$00ff,$00ff,$00ff,$00ff,$00fe,$00fe
	.word $00fd,$00fc,$00fc,$00fb,$00fa,$00f9,$00f8,$00f7
	.word $00f6,$00f5,$00f3,$00f2,$00f0,$00ef,$00ed,$00ec
	.word $00ea,$00e8,$00e6,$00e4,$00e2,$00e0,$00de,$00dc
	.word $00da,$00d8,$00d5,$00d3,$00d1,$00ce,$00cc,$00c9
	.word $00c7,$00c4,$00c1,$00bf,$00bc,$00b9,$00b6,$00b3
	.word $00b0,$00ae,$00ab,$00a8,$00a5,$00a2,$009f,$009c
	.word $0098,$0095,$0092,$008f,$008c,$0089,$0086,$0083
	.word $0080,$007c,$0079,$0076,$0073,$0070,$006d,$006a
	.word $0067,$0063,$0060,$005d,$005a,$0057,$0054,$0051
	.word $004f,$004c,$0049,$0046,$0043,$0040,$003e,$003b
	.word $0038,$0036,$0033,$0031,$002e,$002c,$002a,$0027
	.word $0025,$0023,$0021,$001f,$001d,$001b,$0019,$0017
	.word $0015,$0013,$0012,$0010,$000f,$000d,$000c,$000a
	.word $0009,$0008,$0007,$0006,$0005,$0004,$0003,$0003
	.word $0002,$0001,$0001,$0000,$0000,$0000,$0000,$0000
	.word $0000,$0000,$0000,$0000,$0000,$0000,$0001,$0001
	.word $0002,$0003,$0003,$0004,$0005,$0006,$0007,$0008
	.word $0009,$000a,$000c,$000d,$000f,$0010,$0012,$0013
	.word $0015,$0017,$0019,$001b,$001d,$001f,$0021,$0023
	.word $0025,$0027,$002a,$002c,$002e,$0031,$0033,$0036
	.word $0038,$003b,$003e,$0040,$0043,$0046,$0049,$004c
	.word $004f,$0051,$0054,$0057,$005a,$005d,$0060,$0063
	.word $0067,$006a,$006d,$0070,$0073,$0076,$0079,$007c
	.word $007f,$0083,$0086,$0089,$008c,$008f,$0092,$0095
	.word $0098,$009c,$009f,$00a2,$00a5,$00a8,$00ab,$00ae
	.word $00b0,$00b3,$00b6,$00b9,$00bc,$00bf,$00c1,$00c4
	.word $00c7,$00c9,$00cc,$00ce,$00d1,$00d3,$00d5,$00d8
	.word $00da,$00dc,$00de,$00e0,$00e2,$00e4,$00e6,$00e8
	.word $00ea,$00ec,$00ed,$00ef,$00f0,$00f2,$00f3,$00f5
	.word $00f6,$00f7,$00f8,$00f9,$00fa,$00fb,$00fc,$00fc
	.word $00fd,$00fe,$00fe,$00ff,$00ff,$00ff,$00ff,$00ff
	.word $00ff,$00ff,$00ff,$00ff,$00ff,$00ff,$00fe,$00fe
	.word $00fd,$00fc,$00fc,$00fb,$00fa,$00f9,$00f8,$00f7
	.word $00f6,$00f5,$00f3,$00f2,$00f0,$00ef,$00ed,$00ec
	.word $00ea,$00e8,$00e6,$00e4,$00e2,$00e0,$00de,$00dc
	.word $00da,$00d8,$00d5,$00d3,$00d1,$00ce,$00cc,$00c9
	.word $00c7,$00c4,$00c1,$00bf,$00bc,$00b9,$00b6,$00b3
	.word $00b0,$00ae,$00ab,$00a8,$00a5,$00a2,$009f,$009c
	.word $0098,$0095,$0092,$008f,$008c,$0089,$0086,$0083
	.word $0080,$007c,$0079,$0076,$0073,$0070,$006d,$006a
	.word $0067,$0063,$0060,$005d,$005a,$0057,$0054,$0051
	.word $004f,$004c,$0049,$0046,$0043,$0040,$003e,$003b
	.word $0038,$0036,$0033,$0031,$002e,$002c,$002a,$0027
	.word $0025,$0023,$0021,$001f,$001d,$001b,$0019,$0017
	.word $0015,$0013,$0012,$0010,$000f,$000d,$000c,$000a
	.word $0009,$0008,$0007,$0006,$0005,$0004,$0003,$0003
	.word $0002,$0001,$0001,$0000,$0000,$0000,$0000,$0000
	.word $0000,$0000,$0000,$0000,$0000,$0000,$0001,$0001
	.word $0002,$0003,$0003,$0004,$0005,$0006,$0007,$0008
	.word $0009,$000a,$000c,$000d,$000f,$0010,$0012,$0013
	.word $0015,$0017,$0019,$001b,$001d,$001f,$0021,$0023
	.word $0025,$0027,$002a,$002c,$002e,$0031,$0033,$0036
	.word $0038,$003b,$003e,$0040,$0043,$0046,$0049,$004c
	.word $004f,$0051,$0054,$0057,$005a,$005d,$0060,$0063
	.word $0067,$006a,$006d,$0070,$0073,$0076,$0079,$007c

angleToVectorX:		; 8.8 fixed point, counterclockwise angle, +x=(1,0)
	.word $0100,$00ff,$00ff,$00ff,$00ff,$00ff,$00fe,$00fe,$00fd,$00fc,$00fc,$00fb
	.word $00fa,$00f9,$00f8,$00f7,$00f6,$00f4,$00f3,$00f2,$00f0,$00ee,$00ed,$00eb
	.word $00e9,$00e8,$00e6,$00e4,$00e2,$00df,$00dd,$00db,$00d9,$00d6,$00d4,$00d1
	.word $00cf,$00cc,$00c9,$00c6,$00c4,$00c1,$00be,$00bb,$00b8,$00b5,$00b1,$00ae
	.word $00ab,$00a7,$00a4,$00a1,$009d,$009a,$0096,$0092,$008f,$008b,$0087,$0083
	.word $0080,$007c,$0078,$0074,$0070,$006c,$0068,$0064,$005f,$005b,$0057,$0053
	.word $004f,$004a,$0046,$0042,$003d,$0039,$0035,$0030,$002c,$0028,$0023,$001f
	.word $001a,$0016,$0011,$000d,$0008,$0004,$0000,$fffc,$fff8,$fff3,$ffef,$ffea
	.word $ffe6,$ffe1,$ffdd,$ffd8,$ffd4,$ffd0,$ffcb,$ffc7,$ffc3,$ffbe,$ffba,$ffb6
	.word $ffb1,$ffad,$ffa9,$ffa5,$ffa1,$ff9c,$ff98,$ff94,$ff90,$ff8c,$ff88,$ff84
	.word $ff81,$ff7d,$ff79,$ff75,$ff71,$ff6e,$ff6a,$ff66,$ff63,$ff5f,$ff5c,$ff59
	.word $ff55,$ff52,$ff4f,$ff4b,$ff48,$ff45,$ff42,$ff3f,$ff3c,$ff3a,$ff37,$ff34
	.word $ff31,$ff2f,$ff2c,$ff2a,$ff27,$ff25,$ff23,$ff21,$ff1e,$ff1c,$ff1a,$ff18
	.word $ff17,$ff15,$ff13,$ff12,$ff10,$ff0e,$ff0d,$ff0c,$ff0a,$ff09,$ff08,$ff07
	.word $ff06,$ff05,$ff04,$ff04,$ff03,$ff02,$ff02,$ff01,$ff01,$ff01,$ff01,$ff01
	.word $ff00,$ff01,$ff01,$ff01,$ff01,$ff01,$ff02,$ff02,$ff03,$ff04,$ff04,$ff05
	.word $ff06,$ff07,$ff08,$ff09,$ff0a,$ff0c,$ff0d,$ff0e,$ff10,$ff12,$ff13,$ff15
	.word $ff17,$ff18,$ff1a,$ff1c,$ff1e,$ff21,$ff23,$ff25,$ff27,$ff2a,$ff2c,$ff2f
	.word $ff31,$ff34,$ff37,$ff3a,$ff3c,$ff3f,$ff42,$ff45,$ff48,$ff4b,$ff4f,$ff52
	.word $ff55,$ff59,$ff5c,$ff5f,$ff63,$ff66,$ff6a,$ff6e,$ff71,$ff75,$ff79,$ff7d
	.word $ff80,$ff84,$ff88,$ff8c,$ff90,$ff94,$ff98,$ff9c,$ffa1,$ffa5,$ffa9,$ffad
	.word $ffb1,$ffb6,$ffba,$ffbe,$ffc3,$ffc7,$ffcb,$ffd0,$ffd4,$ffd8,$ffdd,$ffe1
	.word $ffe6,$ffea,$ffef,$fff3,$fff8,$fffc,$0000,$0004,$0008,$000d,$0011,$0016
	.word $001a,$001f,$0023,$0028,$002c,$0030,$0035,$0039,$003d,$0042,$0046,$004a
	.word $004f,$0053,$0057,$005b,$005f,$0064,$0068,$006c,$0070,$0074,$0078,$007c
	.word $0080,$0083,$0087,$008b,$008f,$0092,$0096,$009a,$009d,$00a1,$00a4,$00a7
	.word $00ab,$00ae,$00b1,$00b5,$00b8,$00bb,$00be,$00c1,$00c4,$00c6,$00c9,$00cc
	.word $00cf,$00d1,$00d4,$00d6,$00d9,$00db,$00dd,$00df,$00e2,$00e4,$00e6,$00e8
	.word $00e9,$00eb,$00ed,$00ee,$00f0,$00f2,$00f3,$00f4,$00f6,$00f7,$00f8,$00f9
	.word $00fa,$00fb,$00fc,$00fc,$00fd,$00fe,$00fe,$00ff,$00ff,$00ff,$00ff,$00ff

angleToVectorY:		; 8.8 fixed point, counterclockwise angle, +x=(1,0)
	.word $0000,$0004,$0008,$000d,$0011,$0016,$001a,$001f,$0023,$0028,$002c,$0030
	.word $0035,$0039,$003d,$0042,$0046,$004a,$004f,$0053,$0057,$005b,$005f,$0064
	.word $0068,$006c,$0070,$0074,$0078,$007c,$007f,$0083,$0087,$008b,$008f,$0092
	.word $0096,$009a,$009d,$00a1,$00a4,$00a7,$00ab,$00ae,$00b1,$00b5,$00b8,$00bb
	.word $00be,$00c1,$00c4,$00c6,$00c9,$00cc,$00cf,$00d1,$00d4,$00d6,$00d9,$00db
	.word $00dd,$00df,$00e2,$00e4,$00e6,$00e8,$00e9,$00eb,$00ed,$00ee,$00f0,$00f2
	.word $00f3,$00f4,$00f6,$00f7,$00f8,$00f9,$00fa,$00fb,$00fc,$00fc,$00fd,$00fe
	.word $00fe,$00ff,$00ff,$00ff,$00ff,$00ff,$0100,$00ff,$00ff,$00ff,$00ff,$00ff
	.word $00fe,$00fe,$00fd,$00fc,$00fc,$00fb,$00fa,$00f9,$00f8,$00f7,$00f6,$00f4
	.word $00f3,$00f2,$00f0,$00ee,$00ed,$00eb,$00e9,$00e8,$00e6,$00e4,$00e2,$00df
	.word $00dd,$00db,$00d9,$00d6,$00d4,$00d1,$00cf,$00cc,$00c9,$00c6,$00c4,$00c1
	.word $00be,$00bb,$00b8,$00b5,$00b1,$00ae,$00ab,$00a7,$00a4,$00a1,$009d,$009a
	.word $0096,$0092,$008f,$008b,$0087,$0083,$007f,$007c,$0078,$0074,$0070,$006c
	.word $0068,$0064,$005f,$005b,$0057,$0053,$004f,$004a,$0046,$0042,$003d,$0039
	.word $0035,$0030,$002c,$0028,$0023,$001f,$001a,$0016,$0011,$000d,$0008,$0004
	.word $0000,$fffc,$fff8,$fff3,$ffef,$ffea,$ffe6,$ffe1,$ffdd,$ffd8,$ffd4,$ffd0
	.word $ffcb,$ffc7,$ffc3,$ffbe,$ffba,$ffb6,$ffb1,$ffad,$ffa9,$ffa5,$ffa1,$ff9c
	.word $ff98,$ff94,$ff90,$ff8c,$ff88,$ff84,$ff80,$ff7d,$ff79,$ff75,$ff71,$ff6e
	.word $ff6a,$ff66,$ff63,$ff5f,$ff5c,$ff59,$ff55,$ff52,$ff4f,$ff4b,$ff48,$ff45
	.word $ff42,$ff3f,$ff3c,$ff3a,$ff37,$ff34,$ff31,$ff2f,$ff2c,$ff2a,$ff27,$ff25
	.word $ff23,$ff21,$ff1e,$ff1c,$ff1a,$ff18,$ff17,$ff15,$ff13,$ff12,$ff10,$ff0e
	.word $ff0d,$ff0c,$ff0a,$ff09,$ff08,$ff07,$ff06,$ff05,$ff04,$ff04,$ff03,$ff02
	.word $ff02,$ff01,$ff01,$ff01,$ff01,$ff01,$ff00,$ff01,$ff01,$ff01,$ff01,$ff01
	.word $ff02,$ff02,$ff03,$ff04,$ff04,$ff05,$ff06,$ff07,$ff08,$ff09,$ff0a,$ff0c
	.word $ff0d,$ff0e,$ff10,$ff12,$ff13,$ff15,$ff17,$ff18,$ff1a,$ff1c,$ff1e,$ff21
	.word $ff23,$ff25,$ff27,$ff2a,$ff2c,$ff2f,$ff31,$ff34,$ff37,$ff3a,$ff3c,$ff3f
	.word $ff42,$ff45,$ff48,$ff4b,$ff4f,$ff52,$ff55,$ff59,$ff5c,$ff5f,$ff63,$ff66
	.word $ff6a,$ff6e,$ff71,$ff75,$ff79,$ff7d,$ff80,$ff84,$ff88,$ff8c,$ff90,$ff94
	.word $ff98,$ff9c,$ffa1,$ffa5,$ffa9,$ffad,$ffb1,$ffb6,$ffba,$ffbe,$ffc3,$ffc7
	.word $ffcb,$ffd0,$ffd4,$ffd8,$ffdd,$ffe1,$ffe6,$ffea,$ffef,$fff3,$fff8,$fffc

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

vramYOffset:
	.word $0000,$00a0,$0140,$01e0,$0280,$0320,$03c0,$0460,$0500,$05a0,$0640,$06e0,$0780,$0820,$08c0,$0960,$0a00,$0aa0,$0b40,$0be0
	.word $0c80,$0d20,$0dc0,$0e60,$0f00,$0fa0,$1040,$10e0,$1180,$1220,$12c0,$1360,$1400,$14a0,$1540,$15e0,$1680,$1720,$17c0,$1860
	.word $1900,$19a0,$1a40,$1ae0,$1b80,$1c20,$1cc0,$1d60,$1e00,$1ea0,$1f40,$1fe0,$2080,$2120,$21c0,$2260,$2300,$23a0,$2440,$24e0
	.word $2580,$2620,$26c0,$2760,$2800,$28a0,$2940,$29e0,$2a80,$2b20,$2bc0,$2c60,$2d00,$2da0,$2e40,$2ee0,$2f80,$3020,$30c0,$3160
	.word $3200,$32a0,$3340,$33e0,$3480,$3520,$35c0,$3660,$3700,$37a0,$3840,$38e0,$3980,$3a20,$3ac0,$3b60,$3c00,$3ca0,$3d40,$3de0
	.word $3e80,$3f20,$3fc0,$4060,$4100,$41a0,$4240,$42e0,$4380,$4420,$44c0,$4560,$4600,$46a0,$4740,$47e0,$4880,$4920,$49c0,$4a60
	.word $4b00,$4ba0,$4c40,$4ce0,$4d80,$4e20,$4ec0,$4f60,$5000,$50a0,$5140,$51e0,$5280,$5320,$53c0,$5460,$5500,$55a0,$5640,$56e0
	.word $5780,$5820,$58c0,$5960,$5a00,$5aa0,$5b40,$5be0,$5c80,$5d20,$5dc0,$5e60,$5f00,$5fa0,$6040,$60e0,$6180,$6220,$62c0,$6360
	.word $6400,$64a0,$6540,$65e0,$6680,$6720,$67c0,$6860,$6900,$69a0,$6a40,$6ae0,$6b80,$6c20,$6cc0,$6d60,$6e00,$6ea0,$6f40,$6fe0
	.word $7080,$7120,$71c0,$7260,$7300,$73a0,$7440,$74e0,$7580,$7620,$76c0,$7760,$7800,$78a0,$7940,$79e0,$7a80,$7b20,$7bc0,$7c60


pixelCircle45X:		; X values of half a 45 pixel-radius circle, indexed by angle
	.word 45,44,44,44,44,44,44,44,44,44
	.word 44,44,44,43,43,43,43,43,42,42
	.word 42,42,41,41,41,40,40,40,39,39
	.word 38,38,38,37,37,36,36,35,35,34
	.word 34,33,33,32,32,31,31,30,30,29
	.word 28,28,27,27,26,25,25,24,23,23
	.word 22,21,21,20,19,19,18,17,16,16
	.word 15,14,13,13,12,11,10,10,9,8
	.word 7,7,6,5,4,3,3,2,1,0
	.word 0,0,-1,-2,-3,-3,-4,-5,-6,-7
	.word -7,-8,-9,-10,-10,-11,-12,-13,-13,-14
	.word -15,-16,-16,-17,-18,-19,-19,-20,-21,-21
	.word -22,-23,-23,-24,-25,-25,-26,-27,-27,-28
	.word -28,-29,-30,-30,-31,-31,-32,-32,-33,-33
	.word -34,-34,-35,-35,-36,-36,-37,-37,-38,-38
	.word -38,-39,-39,-40,-40,-40,-41,-41,-41,-42
	.word -42,-42,-42,-43,-43,-43,-43,-43,-44,-44
	.word -44,-44,-44,-44,-44,-44,-44,-44,-44,-44
	.word -45

pixelCircle45Y:		; Y values of half a 45 pixel-radius circle, indexed by angle
	.word 0,0,1,2,3,3,4,5,6,7
	.word 7,8,9,10,10,11,12,13,13,14
	.word 15,16,16,17,18,19,19,20,21,21
	.word 22,23,23,24,25,25,26,27,27,28
	.word 28,29,30,30,31,31,32,32,33,33
	.word 34,34,35,35,36,36,37,37,38,38
	.word 38,39,39,40,40,40,41,41,41,42
	.word 42,42,42,43,43,43,43,43,44,44
	.word 44,44,44,44,44,44,44,44,44,44
	.word 45,44,44,44,44,44,44,44,44,44
	.word 44,44,44,43,43,43,43,43,42,42
	.word 42,42,41,41,41,40,40,40,39,39
	.word 38,38,38,37,37,36,36,35,35,34
	.word 34,33,33,32,32,31,31,30,30,29
	.word 28,28,27,27,26,25,25,24,23,23
	.word 22,21,21,20,19,19,18,17,16,16
	.word 15,14,13,13,12,11,10,10,9,8
	.word 7,7,6,5,4,3,3,2,1,0
	.word 0




.include "circleTable.s"
