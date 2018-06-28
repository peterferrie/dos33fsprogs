#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "gr-sim.h"
#include "tfv_utils.h"
#include "tfv_zp.h"

#include "tfv_sprites.h"
#include "tfv_backgrounds.h"


/* Do Battle */


/* Metrocat Easter Egg (summon?) */

/* Environment: grass, beach, forest, ice */

/* Enemies:          HP		ATTACK          WEAKNESS	RESIST */
/*   Killer Crab    RND-32	PINCH		MALAISE		FIRE
     Plain Fish                 BUBBLE          FIRE            ICE

     Evil Tree      RND-16	LEAVE		FIRE		ICE
     Wood Elf                   SING            MALAISE         FIRE

     Giant Bee	    RND-64	BUZZSAW		ICE		NONE
     Procrastinon   RND-32	PUTOFF		NONE		MALAISE

     Ice Fish       RND-32	AUGER		FIRE		ICE
     EvilPenguin                WADDLE          FIRE            ICE

*/

/* Battle.
Forest? Grassland? Artic? Ocean?
                       ATTACK    REST
                       MAGIC     LIMIT
		       SUMMON    RUN

		SUMMONS -> METROCAT
		MAGIC   ->  HEAL    FIRE
                            ICE     MALAISE
		LIMIT	->  SLICE   ZAP
                            DROP    

          1         2         3
0123456789012345678901234567890123456789|
----------------------------------------|
            |            HP      LIMIT  |  -> FIGHT/LIMIT       21
KILLER CRAB | DEATER   128/255    128   |     ZAP               22
            |                           |     REST              23
            |                           |     RUN AWAY          24

Sound effects?

List hits

******    **    ****    ****    **  **  ******    ****  ******  ******  ******
**  **  ****        **      **  **  **  **      **          **  **  **  **  **
**  **    **      ****  ****    ******  ****    ******    **    ******  ******
**  **    **    **          **      **      **  **  **    **    **  **      **
******  ******  ******  ****        **  ****    ******    **    ******      **

*/



/* Background depend on map location? */
/* Room for guinea pig in party? */

/* Attacks -> HIT, ZAP, HEAL, RUNAWAY */
#define MAGIC_NONE	0
#define MAGIC_FIRE	1
#define	MAGIC_ICE	2
#define MAGIC_MALAISE	4

struct enemy_type {
	char *name;
	int hp_base,hp_mask;
	char *attack_name;
	int weakness,resist;
	unsigned char *sprite;
};

static struct enemy_type enemies[8]={
	[0]= {
		.name="Killer Crab",
		.hp_base=10,
		.hp_mask=0x1f,
		.attack_name="Pinch",
		.weakness=MAGIC_MALAISE,
		.resist=MAGIC_FIRE,
		.sprite=killer_crab,
	},
};


static int attack(int enemy_x,int enemy_type) {

	int ax=34;

	while(ax>10) {

		gr_copy_to_current(0xc00);

		if (ax&1) {
			grsim_put_sprite(tfv_stand_left,ax,20);
		}
		else {
			grsim_put_sprite(tfv_walk_left,ax,20);
		}
		grsim_put_sprite(tfv_led_sword,ax-5,20);

		grsim_put_sprite(enemies[enemy_type].sprite,enemy_x,20);

		page_flip();

		ax-=1;

		usleep(20000);
	}

	return 10;
}



static int victory_dance(void) {

	int ax=34;
	int i;
	int saved_drawpage;

	saved_drawpage=ram[DRAW_PAGE];

	ram[DRAW_PAGE]=PAGE2;	// 0xc00

	clear_bottom();

	vtab(21);
	htab(10);
	move_cursor();
	print("EXPERIENCE +2");
	experience+=2;

	vtab(22);
	htab(10);
	move_cursor();
	print("MONEY +1");
	money+=1;

	ram[DRAW_PAGE]=saved_drawpage;

	for(i=0;i<50;i++) {

		gr_copy_to_current(0xc00);

		if (i&1) {
			grsim_put_sprite(tfv_stand_left,ax,20);
		}
		else {
			grsim_put_sprite(tfv_walk_left,ax,20);
		}

		page_flip();

		usleep(100000);
	}

	return 0;
}

int do_battle(void) {

	int i,ch;

	int enemy_x=2;
	int enemy_type=0;
	int saved_drawpage;
	int enemy_hp=0;

	int ax=34;

	/* Setup Enemy */
	// enemy_type=X
	// ranom, with weight toward proper terrain

	/* Setup Enemy HP */
	enemy_hp=enemies[enemy_type].hp_base+
			(rand()&enemies[enemy_type].hp_mask);

	saved_drawpage=ram[DRAW_PAGE];

	clear_bottom();

	ram[DRAW_PAGE]=PAGE2;	// 0xc00

	vtab(22);
	htab(1);
	move_cursor();
	print(enemies[enemy_type].name);

	vtab(21);
	htab(27);
	move_cursor();
	print("HP");

	vtab(21);
	htab(34);
	move_cursor();
	print("LIMIT");

	vtab(22);
	htab(15);
	move_cursor();
	print("DEATER");

	vtab(22);
	htab(24);
	move_cursor();
	print_byte(hp);
	print("/");
	print_byte(max_hp);

	/* Draw Limit break bargraph */
	ram[COLOR]=0x20;
	hlin_double(ram[DRAW_PAGE],33,33+limit,42);
	ram[COLOR]=0xa0;
	hlin_double_continue(5-limit);

	/* Draw inverse separator */
	ram[COLOR]=0x20;
	for(i=40;i<50;i+=2) {
		hlin_double(ram[DRAW_PAGE],12,12,i);
	}


	/* Draw background */

	/* Draw sky */
	color_equals(COLOR_MEDIUMBLUE);
	for(i=0;i<10;i++) {
		hlin_double(ram[DRAW_PAGE],0,39,i);
	}

	/* Draw ground */
	/* FIXME: base on map location */
	color_equals(COLOR_LIGHTGREEN);
	for(i=10;i<40;i++) {
		hlin_double(ram[DRAW_PAGE],0,39,i);
	}

	ram[DRAW_PAGE]=saved_drawpage;

	while(1) {

		gr_copy_to_current(0xc00);

		grsim_put_sprite(tfv_stand_left,ax,20);
		grsim_put_sprite(tfv_led_sword,ax-5,20);

		grsim_put_sprite(enemies[enemy_type].sprite,enemy_x,20);

		page_flip();

		ch=grsim_input();
		if (ch=='q') break;

		if (ch==' ') enemy_hp-=attack(enemy_x,enemy_type);

		usleep(100000);

		if (enemy_hp<0) {
			victory_dance();
			break;
		}
	}

	ram[DRAW_PAGE]=PAGE0;
	clear_bottom();
	ram[DRAW_PAGE]=PAGE1;
	clear_bottom();

	return 0;
}


