**************************************************************************
*											     *
*  video game project:	mortal kombat							*
* 											     *
*  game software:    	ed boon								     *
*  module: ram declarations								     *
* 											     *
*  copyright (c) 1993 Midway Manufacturing							*
*											     *
**************************************************************************
	.file	'ram.asm'
	.title	" <<< ram definitions >>>"

	.option	b,d,l
	.include	"mainequ.asm"

	.bss	rand,32,1		
	.bss	swstack,32,1		; switch stack	
	.bss	swtemp1,32,1
	.bss	swtemp2,32,1
	.bss	swtemp3,32,1
	.bss	swtemp4,32,1
	.bss	swstmn,256,1		; bottom of stack
	.bss	swstst,0,1		; start switch stack
	.bss	syscopy,16,1		; ram copy of sysctrl latch

	.bss	intsync1,16,1		; full screen interrupt synchro.
	.bss	palram,0,1		; palette allocator ram

	.bss	fpalram,palrsiz*nmfpal,1	
	.bss	bpalram,palrsiz*nmbpal,1	
	.bss	ptrram,ptrsiz*numptr,1

	.bss	nplayers,16,1		; max # of players allowed
	.bss	irqled,16,1
	.bss	pageaddr,32,1

*
* display system ram
*
	.bss	start_of_dram,0,1
	.bss	irqskye,16,1		; actual sky color (autoerase)
	.bss	page,16,1
	.bss	tick,16,1		; universal timer zeroed at round start
	.bss	noflip,16,1		; no page flipping needed
	.bss	displayon,16		; do display processing when != 0
	.bss	dlists,32,1		; display lists table
	.bss	call_every_tick,32,1	; call this routine every tick

	.bss	scrolly,32		; y scroll value
	.bss	worldtly,32		; top left y screen coord (world)
	.bss	scrollx8,32,1		; background #8 x scroll
	.bss	scrollx7,32,1		; background #7 x scroll
	.bss	scrollx6,32,1		; background #6 x scroll
	.bss	scrollx5,32,1		; background #5 x scroll
	.bss	scrollx4,32,1		; background #4 x scroll
	.bss	scrollx3,32,1		; background #3 x scroll
	.bss	scrollx2,32,1		; background #2 x scroll
	.bss	scrollx,32,1		; x scroll value
	.bss	scrollx0,32,1		; background #0 x scroll

	.bss	worldtlx8,32,1		; background #8 x world coord
	.bss	worldtlx7,32,1		; background #7 x world coord
  	.bss	worldtlx6,32,1		; background #6 x world coord
	.bss	worldtlx5,32,1		; background #5 x world coord
	.bss	worldtlx4,32,1		; background #4 x world coord
	.bss	worldtlx3,32,1		; background #3 x world coord
	.bss	worldtlx2,32,1		; background #2 x world coord
	.bss	worldtlx,32,1		; top left x screen coord (world)
	.bss	worldtlx0,32,1		; background #0 x world coord
*
* object lists
*
	.bss	baklst8,32,1		; background list #8
	.bss	baklst7,32,1		; background list #7
	.bss	baklst6,32,1		; background list #6
	.bss	baklst5,32,1		; background list #5
	.bss	baklst4,32,1		; background list #4
	.bss	baklst3,32,1		; background list #3
	.bss	baklst2,32,1		; background list #2
	.bss	baklst1,32,1		; background list #1
	.bss	objlst,32,1			; player object list
	.bss	objlst2,32,1		; object list #2
	.bss	objlst3,32,1		; object list #3
	.bss	last_objlst,0,1

	.bss	score_area_ram,sns*30,1	; score area dma ram
	.bss	score_ram_end,0,1		; end of it !
	.bss	score_1st,32,1			; 1st dma entry for score area
	.bss	p1_shadadj,16,1			; player 1 shadow y adjustment !
	.bss	p2_shadadj,16,1			; player 2 shadow y adjustment !
	.bss	clk_tens,16,1			; clock tens digit
	.bss	clk_ones,16,1			; clock ones digit
*
* skewing floor related ram
*
	.bss	f_shadows,16,1		; flag: do shadows
	.bss	f_skew,16,1		; flag: skew the ground
	.bss	skew_dx,32,1
	.bss	skew_oc,32,1		; how far off (and direction) center
	.bss	skew_y,16,1		; starting y position of floor
	.bss	skew_height,16,1	; floor height
	.bss	skew_stack,16,1		; # of times to stack floor
	.bss	skew_constpal,32,1	; skew: const:pal
	.bss	skew_calla,32,1		; skew calla
	.bss	skew_sag,32,1		; skew ground image pointer
	.bss	skew_scroll,32,1	; pointer to which scroller skew uses
*
* background related variables
*
	.bss	ground_y,16,1		; ground level y coordinate
	.bss	ceiling_y,16,1		; ceiling level y coordinate
	.bss	left_edge,16,1
	.bss	right_edge,16,1		; scroll limits
	.bss	scrtab,32,1		; scroll table

	.bss	p1_ram,32*40,1		; player 1 multipart ram
	.bss	p2_ram,32*40,1		; player 2 multipart ram
	.bss	p1proj_ram,32*40,1  	; player 1 projectile multipart ram
	.bss	p2proj_ram,32*40,1	; player 2 projectile multipart ram

	.bss	ofree,32		; pointer to free object block
	.bss	scrntl,32		; top left [y,x] screen (scrn coord.)
	.bss	scrnlr,32		; lower right [y,x] screen (scrn coord.)
	.bss	scrntl2,32		; top left [y,x] screen coord (objlst2)
	.bss	scrnlr2,32		; lower right [y,x] screen coord (objlst2)

	.bss	end_of_dram,0,1		; END OF MK DISPLAY RAM !!

**************************************************************************
*												*
*     mortal kombat game specific ram 							*
*												*
**************************************************************************
	.bss	gstate,16,1	  ; game state variable

	.bss	switch_escape,16,1 	;
*
* player ram
*
	.bss	p1_state,16,1		; player 1 state
	.bss	p1_shape,32,1
	.bss	p1_obj,32,1		; player 1 object
	.bss	p1_button,32,1		; player 1 button table pointer
	.bss	p1_proc,32,1		; player 1 process
	.bss	p1_char,16,1
	.bss	p1_score,8*8,1
	.bss	p1_xvel,32,1		; player 1 requested x velocity
	.bss	p1_bar,16,1		; player 1 strength bar
	.bss	p1_perfect,16,1
	.bss	p1_matchw,16,1		; player 1 wins this match
	.bss	p1_map,32,1		; player 1 map position

	.bss	p1_bcq,32*(sqs+1),1	; player 1 button close queue
	.bss	p1_jcq,32*(sqs+1),1	; player 1 joystick close queue
	.bss	p1_boq,32*(sqs+1),1	; player 1 button open queue
	.bss	p1_joq,32*(sqs+1),1	; player 1 joystick open queue

	.bss	p2_state,16,1		; player 2 state
	.bss	p2_shape,32,1
	.bss	p2_obj,32,1
	.bss	p2_button,32,1		; player 2 button table pointer
	.bss	p2_proc,32,1		; player 1 process
	.bss	p2_char,16,1
	.bss	p2_score,8*8,1
	.bss	p2_xvel,32,1		; player 2 requested x velocity
	.bss	p2_bar,16,1		; player 2 strength bar
	.bss	p2_perfect,16,1
	.bss	p2_matchw,16,1		; player 2 wins this match
	.bss	p2_map,32,1		; player 2 map position

	.bss	p2_bcq,32*(sqs+1),1	; player 2 button close queue
	.bss	p2_jcq,32*(sqs+1),1	; player 2 joystick close queue
	.bss	p2_boq,32*(sqs+1),1	; player 2 button open queue
	.bss	p2_joq,32*(sqs+1),1	; player 2 joystick open queue
*
* game variables & flags
*
	.bss	f_nosound,16,1
	.bss	f_timeout,16,1		; flag: round timedout
	.bss	f_doscore,16,1		; flag: display score/bars/timer
	.bss	f_death,16,1		; flag: death blow achieved
	.bss	f_norepell,16,1		; flag: don't repell players
	.bss	f_start,16,1		; flag: start a fightin'
	.bss	f_auto_erase,16,1	; flag: do auto erase
	.bss	f_novel,16,1		; flag: no velocities
	.bss	f_warnsound,16,1	; flag: warning sound has been made
	.bss	f_nopmsg,16,1		; flag: dont print player message
	.bss	f_start_pressed,16,1	; flag: a start button was pressed
	.bss	f_hey,16,1		; jon hey yell word
	.bss	f_no_violence,16,1	; flag: no violence
	.bss	f_no_blood,16,1		; flag: no blood
	.bss	f_fade,16,1		; flag: background is faded
	.bss	f_no_lb,16,1		; flag: no low blow
	.bss	f_thatsall,16,1		; flag: thats all, round iz over !

	.bss	pf_ram,32,1		; printf ram
	.bss	curback,16,1		; current background
	.bss	diff,16,1		; current game difficulty
	.bss	perform,16,1		; human performance vs. drone
	.bss	round_num,16,1		; round #
	.bss	winner_status,16,1	; 1 = player 1 ; 2 = 2 ; 3 = finish him
	.bss	map_start,32,1
	.bss	map_position,16,1
	.bss	battle_num,16,1		;
	.bss	p1_wiar,16,1		; player 1 wins in a row
	.bss	p2_wiar,16,1		; player 2 wins in a row
	.bss	p1_rwon,16,1		; player 1 total rounds won
	.bss	p2_rwon,16,1		; player 2 total rounds won
	.bss	p1_hitq,16*6,1		; player 1 hit queue
	.bss	p2_hitq,16*6,1		; player 2 hit queue
	.bss	cmos_diff,16,1		; adjustment: drone diff
	.bss	silhoette,16,1		; matches sans silhoette

	.bss	c_three,16,1		; counter: threes
	.bss	c_drone_kill,16,1	; count: drone kill count down
	.bss	c_amodeloop,16,1	; counter: attract mode looper
	.bss	c_amode_bio,16,1 	; counter: amode bio
	.bss	f_secret,16,1
	.bss	toasty,16,1	  	; tick state at last toasty
*
* time markers for special events
*
	.bss	l_slide,32,1		; p1:p2 last tick state of slide
	.bss	l_decoy,32,1		; p1:p2 last tick state of decoy
	.bss	l_spear,32,1		; p1:p2 last tick state of scorpion spear
	.bss	l_warp,32,1		; p1:p2 last tick state of raiden warp
	.bss	l_gslam,16,1		; tick state of last goro body slam
	.bss	l_gpounce,16,1		; tick state of last goro pounce
	.bss	l_gorofire,16,1		; tick state of last goro fire
	.bss	l_drone_fk,16,1		; tick state of last flip kick
	.bss	l_drone_zap,16,1	; tick state of last zap
	.bss	l_throw_fan,32,1	; p1:p2 last tick state fan throw
	.bss	l_morph,32,1		; p1:p2 last tick state shang morph
	.bss	l_spin,32,1		; p1:p2 last spin move
	.bss	l_pud,32,1		; p1:p2 last puddle
	.bss 	l_drone_slam,32,1
	.bss	l_hp,32,1		; p1:p2 last high punch
	.bss	l_lp,32,1		; p1:p2 last low punch
	.bss	l_block,32,1		; p1:p2 block
	.bss	l_hk,32,1		; p1:p2 high kick
	.bss	l_lk,32,1		; p1:p2 low kick
	.bss	l_kano,32,1		; p1:p2 last kano roll
	.bss	c_p1p2_fastblk,32,1	; p1:p2 fast block counter
	.bss	mkramend,16,1
	.bss	c_kahn_dummy,16,1	; kahn dummy counter
	.bss	c_goro_dummy,16,1	; goro dummy counter
	.bss	c_sk_taunt,16,1		; sk taunt counter
	.bss	f_death2,16,1		; flag: death blow achieved
	.bss	f_pit_fall,16,1		; flag
	.bss	c_1p_tries,16,1		; counter: 1 player tries


; range clear the "l_" variables (ejbpatch)

*
* debug ram
*
	.bss	counter_copy,16		; current copy of the coin counter latch
	.bss	f_do_psel,16,1		; debug flag: do player select code
	.bss	f_colbox,16,1		; flag: show collision box
	.bss	last_dma,32,1		; last dma this frame
	.bss	octpage,16,1
	.bss	f_fastrun,16,1
	.bss	debug1,16,1
	.bss	debug2,32,1		; debug ram #2 (for tests)
	.bss	debug3,32,1		; debug ram #3 (for tests)
	.bss	debug4,32,1		; debug ram #4 (for tests)
	.bss	debug5,32,1		; debug ram #5 (for tests)
	.bss	debug6,32,1		; debug ram #6 (for tests)

	.bss	f_sans_throws,16,1
	.bss	f_show_ranking,16,1	; flag: showing rankings

**************************************************************************
*											     *
*  a6 = control:offset									     *
*  a5 = sag										     *
*  a4 = y:x coordinate									     *
*  a3 = y:x size										     *
*  a2 = const:pal									     *
*  a1 = scale										     *
*											     *
**************************************************************************

p1_knotch1	.set	score_ram_end-(32*3)
p1_knotch2	.set	p1_knotch1-sns
p2_knotch1	.set	p1_knotch2-sns
p2_knotch2	.set	p2_knotch1-sns

entry_1		.set	score_ram_end-(sns*1)
entry_2		.set	score_ram_end-(sns*2)
entry_3		.set	score_ram_end-(sns*3)
entry_4		.set	score_ram_end-(sns*4)
entry_5		.set	score_ram_end-(sns*5)
entry_6		.set	score_ram_end-(sns*6)
entry_7		.set	score_ram_end-(sns*7)
entry_8		.set	score_ram_end-(sns*8)
entry_9		.set	score_ram_end-(sns*9)
entry_10		.set	score_ram_end-(sns*10)

entry_13		.set	score_ram_end-(sns*13)
entry_14		.set	score_ram_end-(sns*14)
entry_15		.set	score_ram_end-(sns*15)
entry_16		.set	score_ram_end-(sns*16)
entry_17		.set	score_ram_end-(sns*17)
entry_18		.set	score_ram_end-(sns*18)
entry_19		.set	score_ram_end-(sns*19)
entry_20		.set	score_ram_end-(sns*20)


p1_bar_view	.set	(entry_9+(32*3))
p2_bar_view	.set	(entry_10+(32*3))
p2_bar_xpos	.set	(entry_10+(32*2))

	.end
