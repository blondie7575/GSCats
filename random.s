;
;  random.s
;  GSCats
;
;  Created by Quinn Dunki on 12/29/19.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; random
; A => Random 8 bits
; Y => Less random 8 bits
;
; Taken from https://codebase64.org/doku.php?id=base:16bit_xorshift_random_generator
; This routine is not very fast, but it'll do for now. It's intended
; for 6502 so we're making due with it.
;
rng_zp_low = RANDOML
rng_zp_high = RANDOMH

random:
	SAVE_AXY
	EMULATION
	LDA rng_zp_high
	LSR
	LDA rng_zp_low
	ROR
	EOR rng_zp_high
	STA rng_zp_high ; high part of x ^= x << 7 done
	ROR             ; A has now x >> 9 and high bit comes from low byte
	EOR rng_zp_low
	STA rng_zp_low  ; x ^= x >> 9 and the low part of x ^= x << 7 done
	EOR rng_zp_high
	STA rng_zp_high ; x ^= x << 8 done
	NATIVE
	RESTORE_AXY
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; seedRandom
; A = Seed
;
; Taken from https://codebase64.org/doku.php?id=base:16bit_xorshift_random_generator
;
seedRandom:
	SAVE_AXY
	EMULATION
	STA rng_zp_low
	LDA #0
	STA rng_zp_high
	NATIVE
	RESTORE_AXY
	rts
