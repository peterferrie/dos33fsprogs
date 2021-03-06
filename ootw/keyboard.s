
;======================================
; handle keypress
;======================================

; A or <-   : start moving left
; D or ->   : start moving right
; W or up   : jump
; S or down : crouch or pickup
; space     : action
; escape    : quit

; if left: if running right, walk right
;          if walk right, stand right
;          if stand right, stand left
;	   if stand left, walk left
;	   if walk left, run left



handle_keypress:

	lda	PHYSICIST_STATE
	cmp	#P_COLLAPSING		; ignore keypress if dying
	beq	no_keypress
	cmp	#P_JUMPING		; ignore keypress if jumping
	beq	no_keypress
	cmp	#P_SWINGING
	beq	no_keypress
	cmp	#P_FALLING
	beq	no_keypress

	lda	KEYPRESS						; 4
	bmi	keypress						; 3
no_keypress:
	bit	KEYRESET			; clear
						; avoid keeping old keys around
	rts	; nothing pressed, return

keypress:
									; -1

	and	#$7f		; clear high bit

	;======================
	; check escape

check_quit:
	cmp	#27		; quit if ESCAPE pressed
	bne	check_left

	;=====================
	; QUIT
	;=====================
quit:
	lda	#$ff		; could just dec
	sta	GAME_OVER
	rts

	;======================
	; check left
check_left:
	cmp	#'A'
	beq	left_pressed
	cmp	#$8		; left arrow
	bne	check_right


	;====================
	; Left Pressed
	;====================
left_pressed:
					; left==0
	lda	DIRECTION		; if facing right, turn to face left
	bne	left_going_right

left_going_left:
	lda	PHYSICIST_STATE
	cmp	#P_STANDING
	beq	walk_left
	cmp	#P_WALKING
	beq	run_left
	cmp	#P_CROUCHING
	beq	stand_left

	;=============================
	; already running, do nothing?
	rts

left_going_right:
	lda	PHYSICIST_STATE
	cmp	#P_RUNNING
	beq	walk_right
	cmp	#P_WALKING
	beq	stand_right
	cmp	#P_STANDING
	beq	stand_left
	cmp	#P_CROUCHING
	beq	stand_left

	;===========================
	; otherwise?
	rts

	;========================
	; check for right pressed

check_right:
	cmp	#'D'
	beq	right_pressed
	cmp	#$15
	bne	check_up


	;===================
	; Right Pressed
	;===================
right_pressed:

					; right==1
	lda	DIRECTION		; if facing right, turn to face left
	beq	right_going_left


right_going_right:
	lda	PHYSICIST_STATE
	cmp	#P_STANDING
	beq	walk_right
	cmp	#P_WALKING
	beq	run_right
	cmp	#P_CROUCHING
	beq	stand_right

	;=============================
	; already running, do nothing?
	rts

right_going_left:
	lda	PHYSICIST_STATE
	cmp	#P_RUNNING
	beq	walk_left
	cmp	#P_WALKING
	beq	stand_left
	cmp	#P_STANDING
	beq	stand_right
	cmp	#P_CROUCHING
	beq	stand_left

	;===========================
	; otherwise?
	rts


	;=====================
	; Left, direction=0
	; Right, direction=1

stand_left:
	lda	#0		; left
	sta	DIRECTION
	sta	GAIT
	lda	#P_STANDING
	beq	update_state

walk_left:
	lda	#P_WALKING
	bne	update_state

run_left:
	lda	#P_RUNNING
	bne	update_state


stand_right:
	lda	#0
	sta	GAIT
	lda	#1		 ; just inc DIRECTION?
	sta	DIRECTION
	lda	#P_STANDING
	beq	update_state

walk_right:
	lda	#P_WALKING
	bne	update_state

run_right:
	lda	#P_RUNNING
	bne	update_state

update_state:
	sta	PHYSICIST_STATE
	bit	KEYRESET
	rts




	;=====================
	; check up

check_up:
	cmp	#'W'
	beq	up
	cmp	#$0B
	bne	check_down
up:
	;========================
	; Jump -- Up Pressed
	;========================

	lda	#P_JUMPING
	sta	PHYSICIST_STATE
	lda	#0
	sta	GAIT

	jmp	done_keypress

check_down:
	cmp	#'S'
	beq	down
	cmp	#$0A
	bne	check_space

	;======================
	; Crouch
	;======================
down:
	lda	#P_CROUCHING
	sta	PHYSICIST_STATE
	lda	#0
	sta	GAIT

	jmp	done_keypress

check_space:
	cmp	#' '
	beq	space
	cmp	#$15
	bne	unknown

	;======================
	; Kick
	;======================
space:
	lda	#P_KICKING
	sta	PHYSICIST_STATE
	lda	#15
	sta	GAIT
unknown:
done_keypress:
	bit	KEYRESET	; clear the keyboard strobe		; 4

	rts								; 6
