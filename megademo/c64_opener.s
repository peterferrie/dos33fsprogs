; C64 Opener
; all good demos start with the C64 boot screen, right?

; Apple II has a lot of trouble making clear text with bluish background
; it looks a lot cleaner in black+white

; Zero page addresses

c64_opener:

	;===================
	; init vars
	;===================
	lda	#0
	sta	FRAME
	sta	FRAMEH

	;===================
	; setup graphics
	;===================

	; We assume that the c64 image was put in $2000 by the loader

	;===================
	; setup text
	;===================

	lda	#8
	sta	DRAW_PAGE

	lda	#$A0			; regular spaces
	jsr	clear_gr

	lda	#<apple2_text
	sta	OUTL
	lda	#>apple2_text
	sta	OUTH

	jsr	move_and_print

	;==============================
	; setup graphics for vapor lock
	;==============================

	jsr	vapor_lock						; 6

	bit	PAGE0                   ; first graphics page		; 4
	bit	FULLGR			; full screen graphics		; 4
	bit	HIRES			; hires mode !!!		; 4
	bit	SET_GR			; graphics mode			; 4

	; vapor lock returns with us at beginning of hsync in line
	; 114 (7410 cycles), so with 5070 + 4550 lines to go (9620)
	; - 16 = 9604, -3 for jmp = 9601

	;	5070+4550 = 9620
	;                    -16
	;		      -3
	;                  -9298
	;                 =======
	;		     303

	jsr	gr_copy_to_current	; 6+ 9292

	; Try X=29 Y=2 cycles=303

	; Try X=18 Y=100 cycles=9601

	ldy	#2							; 2
loopcoA:ldx	#29							; 2
loopcoB:dex								; 2
	bne	loopcoB							; 2nt/3
	dey								; 2
	bne	loopcoA							; 2nt/3

        beq	c64_split
;.align  $100


	;================================================
	; c64_split
	;================================================
	; We want to:
	;	Wait 3s, just flashing cursor@1Hz
	;	Then slowly open to text page0

	;===========================
	; do one or the other
	;  -- nothing = 8+3 = 11
	;  -- split = 8+2 = 10



c64_split:

	; Put smc here to jmp to kill_time until we hit state2?

c64_mixed:
        nop		;kill 6 cycles (room for rts)		; 2
        ldx     #8	; width of opening in table		; 2
        ldy     #24	; height?				; 2

c64_mixed_loop:
c64_smc2:
	lda	c64_multiples+15,x ; lookup split size	; 4    \
	sta	c64_smc+1	; modify code		; 4    |
c64_smc:						;      |-- 65
        jsr     split_4                                 ; 6+46 |
        dey                                             ; 2    |
        bne     c64_mixed_loop				; 3    /

							; -1
        nop						; 2
        ldy     #24					; 2
        dex						; 2
        bne     c64_smc					; 3

                                                        ; -1

           ; need to kill
						; -6 from offset
						; +1 fall through
						; -9 from check
						; +1 from other fallthrough
					;================
					;        -13








;	lda	FRAMEH						; 3
;	cmp	#10						; 2
;	bcc	c64_nothing					; 3

;c64_do_split:							; -1
;	jmp	c64_split_screen				; 3

;c64_nothing:
;	jmp	c64_kill_time					; 3


c64_done_screen:

	;======================================================
	; We have 4550 cycles in the vblank, use them wisely
	;======================================================
	; do_nothing should be      4550
	;			     -13 from screen drawing
	;			     -10 keyboard handling
	;			     -15
	;			     -12
	;			      -7 check if past time
	;			     -46
	;==================================
	;			 =  4447


	; run the 2Hz counter, overflow at 30 60Hz frames
	clc								; 2
	lda	FRAME							; 3
	adc	#1							; 2
	sta	FRAME							; 3

	cmp	#30							; 2
	bne	not_thirty						; 3
								;===========
								;	15
thirty:
									; -1
	lda	#0							; 2
	sta	FRAME							; 3
	inc	FRAMEH							; 5
	jmp	done_thirty						; 3
								;===========
								;	 12

not_thirty:
	lda	$0	; nop						; 3
	lda	$0	; nop						; 3
	lda	$0	; nop						; 3
	lda	$0	; nop						; 3
								;===========
								;	 12

done_thirty:


c64_window_adjust:

;	dec	c64_smc2+1						; 5


	;=======================
	; see if done
	;=======================

	lda	FRAMEH							; 3
	cmp	#20							; 2
	beq	done_c64						; 3
									; -1
								;============
								;	  7

c64_blink_cursor:
	; handle the cursor
	; FIXME: not aligned well.  Do we care?

	lda	FRAMEH							; 3
	and	#$1							; 2
	beq	cursor_off						; 3
								;============
								;         8
cursor_on:
									; -1
	; it's lSB first
	; blue is 6
	; 1 1111110
	lda	#$fE	; blue						; 2
	sta	$3300	; 52						; 4
	sta	$3B00	; 54						; 4
	sta	$2380	; 56						; 4
	sta	$2B80	; 58						; 4
	; purple is 2
	; 0 1111110
	lda	#$7E	; purple					; 2
	sta	$3700	; 53						; 4
	sta	$3F00	; 55						; 4
	sta	$2780	; 57						; 4
	sta	$2F80	; 59						; 4

	jmp	cursor_done						; 3
								;============
								;	 38
cursor_off:
	; blue is 6
	; 1 1010101
	lda	#$d5	; blue						; 2
	sta	$3300	; 52						; 4
	sta	$3B00	; 54						; 4
	sta	$2380	; 56						; 4
	sta	$2B80	; 58						; 4
	; purple is 2
	; 0 1010101
	lda	#$55	; purple					; 2
	sta	$3700	; 53						; 4
	sta	$3F00	; 55						; 4
	sta	$2780	; 57						; 4
	sta	$2F80	; 59						; 4
	nop								; 2
								;============
								;	 38


cursor_done:
	; Try X=33 Y=26 cycles=4447
	; Try X=88 Y=10 cycles=4461

	ldy     #26							; 2
loopcoE:ldx	#33							; 2
loopcoF:dex								; 2
	bne	loopcoF							; 2nt/3
	dey								; 2
	bne	loopcoE							; 2nt/3


	lda	KEYPRESS				; 4
	bpl	no_c64_keypress				; 3
	jmp	done_c64
no_c64_keypress:

	jmp	c64_split				; 3

done_c64:
	bit	KEYRESET
	rts						; 6




	;===================
	; c64 graphic, load at $2000-$4000 to start with
	;===================
;c64:
;.incbin "c64.img"
;c64_end:


;=========================================================
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNn	Nothing
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnNnNnNnNnTtttGgggNnNnNnNnNnNnNnNn	16= 4W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnNnNnNnNnNnTtttNnGgggNnNnNnNnNnNnLll	15= 6W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnNnNnNnTtttNnNnGgggNnNnNnNnNnNnNn	14= 8W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnNnNnNnNnTtttNnNnNnGgggNnNnNnNnNnLll	13=10W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnNnNnTtttNnNnNnNnGgggNnNnNnNnNnNn	12=12W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnNnNnNnTtttNnNnNnNnNnGgggNnNnNnNnLll	11=14W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnNnTtttNnNnNnNnNnNnGgggNnNnNnNnNn	10=16W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnNnNnTtttNnNnNnNnNnNnNnGgggNnNnNnLll	 9=18W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnNnTtttNnNnNnNnNnNnNnNnGgggNnNnNnNn	 8=20W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnNnTtttNnNnNnNnNnNnNnNnNnGgggNnNnLll	 7=22W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnNnTtttNnNnNnNnNnNnNnNnNnNnGgggNnNnNn	 6=24W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnNnTtttNnNnNnNnNnNnNnNnNnNnNnGgggNnLll	 5=26W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnNnTtttNnNnNnNnNnNnNnNnNnNnNnNnGgggNnNn	 4=28W
; DdBbbNnNnNnNnNnNnNnNnNnLl lNnTtttNnNnNnNnNnNnNnNnNnNnNnNnNnGgggLll	 3=30W
; DdBbbNnNnNnNnNnNnNnNnNnNn NnTtttNnNnNnNnNnNnNnNnNnNnNnNnNnNnGgggNn	 2=32W

; nLllDdBbbNnNnNnNnNnNnLllN nTtttNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnGgggN     NOPE
; DdBbbNnNnNnNnNnNnNnNnNnNn TtttNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnNnGggg	 0=36W



	;===========================================
	; c64_kill_time
	;===========================================
	; do nothing but blink cursor
	; 192 * 65 = 12480 cycles
	;              -11 jsr in
	;		-3 jmp back
	;           ========
	;            12466
c64_kill_time:

	; Try X=165 Y=15 cycles=12466

	ldy     #15							; 2
loopc6a:ldx	#165							; 2
loopc6b:dex								; 2
	bne	loopc6b							; 2nt/3
	dey								; 2
	bne	loopc6a							; 2nt/3


	jmp	c64_done_screen						; 3



c64_multiples:
	.byte	184,184,184,184,184,184,184,184
        .byte   161,138,115, 92, 69 ,46,23,   0
	.byte	0,0,0,0,0,0,0,0
	; end is c64_multiples+24

apple2_text:
.byte 16,0
.asciiz "APPLE ]["
.byte 4,20
.asciiz "NONE OF THIS SHOULD BE POSSIBLE,"
.byte 5,21
.asciiz "RACING THE BEAM TO THE EXTREME"
