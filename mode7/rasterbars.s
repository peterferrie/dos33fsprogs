; Not quite a raster-bar, but why not

.include "zp.inc"

;===========
; CONSTANTS
;===========

ELEMENTS	EQU	64


	;=====================
	; Rasterbars
	;=====================

	;================================
	; Clear screen and setup graphics
	;================================

	jsr	clear_screens		 ; clear top/bottom of page 0/1
	jsr     set_gr_page0


	;===============
	; Init Variables
	;===============
	lda	#0							; 2
	sta	DRAW_PAGE						; 3
	sta	SCREEN_Y

	;===========================
	;===========================
	; Main Loop
	;===========================
	;===========================
raster_loop:
	; clear rows

	ldy	#19						; 2
	lda	#0
init_rows:
	sta	row_color,Y
	dey
	bpl	init_rows

	jsr	clear_top

	;================
	; set colors

	lda	#COLOR_BOTH_AQUA	; aqua
	sta	COLOR
	ldy	SCREEN_Y
	jsr	set_row_color

	lda	#COLOR_BOTH_MEDIUMBLUE	; medium blue
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_LIGHTGREEN	; light green
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_DARKGREEN	; green
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_YELLOW	; yellow
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_ORANGE	; orange
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_PINK	; pink
	sta	COLOR
	iny
	jsr	set_row_color

	lda	#COLOR_BOTH_RED		; red
	sta	COLOR
	iny
	jsr	set_row_color

	;=================
	; draw rows

	ldy	#19
draw_rows_loop:
	lda	row_color,Y
	sta	COLOR

	tya
	pha
	asl

	ldy	#39							; 2
        sty	V2							; 3
        ldy	#0							; 2
        jsr	hlin_double		; hlin y,V2 at A	; 63+(X*16)
        pla								; 4
	tay
	dey
	bpl	draw_rows_loop


	;==================
	; flip pages
	;==================

	jsr	page_flip						; 6


	;==================
	; delay?
	;==================


	;==================
	; update y pointer
	;==================
	ldy	SCREEN_Y
	iny
	cpy	#ELEMENTS
	bne	not_there
	ldy	#0
not_there:
	sty	SCREEN_Y


	;==================
	; loop forever
	;==================

	jmp	raster_loop						; 3


	;===================
	; set_row_color
	;===================
	; color in COLOR
	; Y=offset
	; Y preserved?
set_row_color:

	tya				; wrap y offset
	and	#(ELEMENTS-1)
	tax

	lda	fine_sine,X		; lookup sign value
	cpx	#33			; check if > pi and
	bpl	sin_negative		; need to make negative

sin_positive:
	clc			; shift right by 4, zero-extend
	ror
	clc
	ror
	clc
	ror
	clc
	ror
	clc
	adc	#18		; add in 18 to center on screen
;	lsr			; shift once more

	jmp	sin_no_more

	; FIXME: precalculate as we shift same each time
sin_negative:

	sec
	ror
	sec
	ror
	sec
	ror
	sec
	ror
	clc

	adc	#18
;	lsr

sin_no_more:
	pha
	lsr
	tax
	pla
	pha

	jsr	put_color

	pla
	tax

	cpy	32
	beq	no_inc
	bmi	yes_inc

	dex
	dex
yes_inc:
	inx
no_inc:
	txa		; horrific
	pha
	lsr
	tax
	pla
	jsr	put_color

	rts

put_color:
	and	#$1		; see if even or odd
	beq	even_line

	lda	COLOR
	and	#$f0
	sta	COLOR2

	lda	row_color,X
	and	#$0f

	jmp	done_line
even_line:
	lda	COLOR
	and	#$0f
	sta	COLOR2

	lda	row_color,X
	and	#$f0

done_line:
	ora	COLOR2
	sta	row_color,X

	rts

;===============================================
; External modules
;===============================================

.include "../asm_routines/pageflip.s"
.include "../asm_routines/gr_setpage.s"
;.include "../asm_routines/keypress.s"
.include "../asm_routines/gr_offsets.s"
.include "../asm_routines/gr_fast_clear.s"
.include "../asm_routines/gr_hlin.s"

;======================
; some arrays
;======================

row_color:
.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00, $00,$00,$00,$00,$00

fine_sine:
.byte $00 ; 0.000000
.byte $19 ; 0.098017
.byte $31 ; 0.195090
.byte $4A ; 0.290285
.byte $61 ; 0.382683
.byte $78 ; 0.471397
.byte $8E ; 0.555570
.byte $A2 ; 0.634393
.byte $B5 ; 0.707107
.byte $C5 ; 0.773010
.byte $D4 ; 0.831470
.byte $E1 ; 0.881921
.byte $EC ; 0.923880
.byte $F4 ; 0.956940
.byte $FB ; 0.980785
.byte $FE ; 0.995185
.byte $FF ; 1.000000
.byte $FE ; 0.995185
.byte $FB ; 0.980785
.byte $F4 ; 0.956940
.byte $EC ; 0.923880
.byte $E1 ; 0.881921
.byte $D4 ; 0.831470
.byte $C5 ; 0.773010
.byte $B5 ; 0.707107
.byte $A2 ; 0.634393
.byte $8E ; 0.555570
.byte $78 ; 0.471397
.byte $61 ; 0.382683
.byte $4A ; 0.290285
.byte $31 ; 0.195090
.byte $19 ; 0.098017
.byte $00 ; 0.000000
.byte $E7 ; -0.098017
.byte $CF ; -0.195090
.byte $B6 ; -0.290285
.byte $9F ; -0.382683
.byte $88 ; -0.471397
.byte $72 ; -0.555570
.byte $5E ; -0.634393
.byte $4B ; -0.707107
.byte $3B ; -0.773010
.byte $2C ; -0.831470
.byte $1F ; -0.881921
.byte $14 ; -0.923880
.byte $0C ; -0.956940
.byte $05 ; -0.980785
.byte $02 ; -0.995185
.byte $00 ; -1.000000
.byte $02 ; -0.995185
.byte $05 ; -0.980785
.byte $0C ; -0.956940
.byte $14 ; -0.923880
.byte $1F ; -0.881921
.byte $2C ; -0.831470
.byte $3B ; -0.773010
.byte $4B ; -0.707107
.byte $5E ; -0.634393
.byte $72 ; -0.555570
.byte $88 ; -0.471397
.byte $9F ; -0.382683
.byte $B6 ; -0.290285
.byte $CF ; -0.195090
.byte $E7 ; -0.098017
