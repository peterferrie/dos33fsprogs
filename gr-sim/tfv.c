#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "gr-sim.h"

static unsigned char title_rle[]=
	{ 0x28,0x28,
	0x01,0x00,0x19,0x20,
	0x0F,0x00,0x01,0x22,0x03,0x66,0x01,0x22,0x01,0x62,0x01,0x66,0x01,0x62,0x01,0x22,0x01,0x66,0x03,0x22,0x01,0x66,0x01,0x26,0x01,0x62,0x01,0x22,0x01,0x62,0x01,0x26,0x01,0x62,0x01,0x22,0x03,0x66,0x01,0x22,0x01,0x55,0x01,0x00,0x03,0x11,0x01,0x44,0x03,0x22,0x01,0x44,0x03,0x22,
	0x02,0x00,0x02,0x22,0x01,0x66,0x02,0x22,0x01,0x66,0x01,0x62,0x01,0x66,0x01,0x22,0x01,0x66,0x03,0x22,0x01,0x66,0x01,0x26,0x01,0x62,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x02,0x22,0x01,0x66,0x02,0x22,0x01,0x55,0x01,0x00,0x01,0x01,0x01,0x11,0x01,0x41,0x01,0x44,0x01,0x42,0x01,0x22,0x01,0x42,0x01,0x44,0x01,0x42,0x01,0x22,0x01,0x02,
	0x02,0x00,0x02,0x22,0x01,0x66,0x02,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x01,0x22,0x03,0x66,0x01,0x22,0x01,0x66,0x01,0x62,0x01,0x26,0x01,0x22,0x01,0x26,0x01,0x62,0x01,0x26,0x02,0x22,0x01,0x66,0x02,0x22,0x01,0x55,0x02,0x00,0x01,0x11,0x03,0x44,0x01,0x22,0x03,0x44,0x01,0x22,
	0x03,0x00,0x01,0x02,0x18,0x52,0x01,0x55,
	0x0E,0x00,0x1E,0x60,
	0x0A,0x00,0x01,0x66,0x03,0x22,0x01,0x66,0x01,0x26,0x01,0x22,0x01,0x26,0x01,0x66,0x01,0x22,0x01,0x26,0x01,0x66,0x01,0x22,0x01,0x66,0x03,0x22,0x01,0x66,0x01,0x26,0x01,0x22,0x01,0x26,0x01,0x66,0x01,0x26,0x02,0x62,0x01,0x66,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x01,0x55,
	0x09,0x00,0x01,0x66,0x01,0x22,0x01,0x26,0x02,0x66,0x01,0x22,0x01,0x26,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x62,0x01,0x26,0x01,0x22,0x02,0x66,0x01,0x22,0x02,0x66,0x01,0x22,0x01,0x26,0x01,0x22,0x01,0x66,0x01,0x22,0x02,0x26,0x01,0x66,0x01,0x62,0x01,0x26,0x01,0x62,0x01,0x66,0x01,0x55,
	0x09,0x00,0x01,0x66,0x01,0x22,0x03,0x66,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x01,0x62,0x01,0x22,0x02,0x66,0x01,0x22,0x02,0x66,0x01,0x22,0x01,0x66,0x01,0x22,0x01,0x66,0x02,0x26,0x01,0x22,0x02,0x66,0x01,0x22,0x02,0x66,0x01,0x55,
	0x09,0x00,0x01,0x06,0x1D,0x56,0x01,0x55,0x03,0x00,0x01,0x10,
	0x24,0x00,0x01,0x10,0x01,0x00,0x01,0x10,0x01,0x11,0x01,0x01,
	0x05,0x00,0x08,0xCC,0x01,0x40,0x09,0x00,0x01,0xD0,0x01,0x0D,0x01,0x00,0x01,0xD0,0x01,0x0D,0x01,0x00,0x01,0xD0,0x05,0x00,0x01,0x11,
	0x0A,0x00,0x01,0x04,0x04,0x54,0x02,0xCC,0x01,0x44,0x01,0x55,0x06,0x00,0x01,0xD0,0x01,0xDD,0x02,0xD0,0x01,0xDD,0x02,0xD0,0x01,0xDD,0x01,0xD0,0x03,0x00,0x02,0x01,0x01,0x11,0x02,0x01,
	0x0C,0x00,0x02,0xCC,0x01,0x44,0x01,0x54,0x01,0x55,0x06,0x00,0x01,0xDD,0x07,0xBB,0x01,0xDD,0x04,0x00,0x01,0x10,0x01,0x11,0x01,0x10,
	0x0C,0x00,0x02,0xCC,0x01,0x44,0x01,0x54,0x01,0x55,0x07,0x00,0x01,0xDD,0x01,0xBB,0x01,0xBF,0x01,0xB0,0x01,0xBB,0x01,0xBF,0x01,0xB0,0x01,0xBB,0x01,0xDD,0x03,0x00,0x01,0x10,0x03,0x11,0x01,0x10,
	0x0A,0x00,0x02,0xCC,0x01,0x44,0x01,0x54,0x01,0x55,0x08,0x00,0x01,0xDD,0x01,0xDB,0x01,0xBB,0x01,0x3B,0x01,0x33,0x02,0xBB,0x01,0xDB,0x01,0xDD,0x03,0x00,0x02,0x01,0x01,0x11,0x02,0x01,
	0x0A,0x00,0x02,0xCC,0x01,0x44,0x01,0x55,0x09,0x00,0x02,0xDD,0x05,0xBB,0x02,0xDD,0x05,0x00,0x01,0x11,
	0x0C,0x00,0x02,0xCC,0x01,0x44,0x01,0x55,0x09,0x00,0x01,0x0D,0x01,0x00,0x01,0xBB,0x03,0xB1,0x01,0xBB,0x01,0x00,0x01,0x0D,0x04,0x00,0x02,0xBB,
	0x0C,0x00,0x01,0x0C,0x01,0x4C,0x01,0x44,0x01,0x55,0x0C,0x00,0x02,0xBB,0x06,0x00,0x01,0x20,0x01,0x22,0x01,0x2B,0x01,0x0B,
	0x0E,0x00, 0x02,0x05, 0x09,0x00, 0x01,0x20, 0x06,0x22, 0x03,0x20,
        0x02,0x22, 0x01,0x02, 0x09,0x00,
	0xff,0xff
//       "              55         2222222222222"

	};

static unsigned char test_sprite[]={
	0x8,0x4,
	0x55,0x50,0x00,0x00,0x00,0x00,0x00,0x00,
	0x55,0x55,0x55,0x00,0x00,0x00,0x00,0x00,
	0xff,0x1f,0x4f,0x2f,0xff,0x22,0x20,0x00,
	0x5f,0x5f,0x5f,0x5f,0xff,0xf2,0xf2,0xf2,
};

static unsigned char ship_forward[]={
	0x5,0x3,
	0x00,0x00,0x77,0x00,0x00,
	0x50,0x55,0x77,0x55,0x50,
	0x01,0x00,0x07,0x00,0x01,
};

static unsigned char ship_right[]={
	0x5,0x3,
	0x50,0x00,0x70,0x77,0x00,
	0x01,0x55,0x77,0x55,0x50,
	0x00,0x77,0x07,0x00,0x15,
};

static unsigned char ship_left[]={
	0x5,0x3,
	0x00,0x77,0x70,0x00,0x50,
	0x50,0x55,0x77,0x55,0x01,
	0x15,0x00,0x07,0x77,0x00,
};

#define COLOR1	0x00
#define COLOR2	0x01
#define MATCH	0x02
#define XX	0x03
#define YY	0x04
#define YADD	0x05
#define LOOP	0x06

static void draw_segment(void) {

	for(ram[LOOP]=0;ram[LOOP]<4;ram[LOOP]++) {
		ram[YY]=ram[YY]+ram[YADD];
		if (ram[XX]==ram[MATCH]) color_equals(ram[COLOR1]*3);
		else color_equals(ram[COLOR1]);
		basic_vlin(10,ram[YY],9+ram[XX]);
		if (ram[XX]==ram[MATCH]) color_equals(ram[COLOR2]*3);
		else color_equals(ram[COLOR2]);
		if (ram[YY]!=34) basic_vlin(ram[YY],34,9+ram[XX]);
		ram[XX]++;
	}
	ram[YADD]=-ram[YADD];
}

static void draw_logo(void) {

	ram[XX]=0;
	ram[YY]=10;
	ram[YADD]=6;
	ram[COLOR1]=1;
	ram[COLOR2]=0;
	draw_segment();
	ram[COLOR2]=4;
	draw_segment();
	ram[COLOR1]=2;
	draw_segment();
	draw_segment();
	draw_segment();
	ram[COLOR2]=0;
	draw_segment();

	grsim_update();
}

int main(int argc, char **argv) {

	int ch;
	int x,y;
	char tempst[BUFSIZ];
	char nameo[9];
	int i;

	int name_x=0;
	int cursor_x=0,cursor_y=0;

	grsim_init();

	home();
	gr();

	/* VMW splash */

	ram[MATCH]=100;
	draw_logo();

	usleep(100000);

	for(ram[MATCH]=0;ram[MATCH]<30;ram[MATCH]++) {
		draw_logo();
		grsim_update();

		usleep(20000);
	}

	basic_vtab(21);
	basic_htab(9);
	basic_print("A VMW SOFTWARE PRODUCTION");
	grsim_update();

	while(1) {
		ch=grsim_input();
		if (ch!=0) break;

		usleep(10000);
	}



	/* Title Screen */
	grsim_unrle(title_rle,0x800);
	gr_copy(0x800,0x400);

	grsim_update();

	while(1) {
		ch=grsim_input();
		if (ch!=0) break;

		usleep(10000);
	}

	text();
	home();

	/* Enter your name */
//            1         2         3
//  0123456789012345678901234567890123456789
//00PLEASE ENTER A NAME:
// 1
// 2
// 3            _ _ _ _ _ _ _ _
// 4
// 5            @ A B C D E F G
// 6
// 7            H I J K L M N O
// 8
// 9            P Q R S T U V W
//10
//11            X Y Z [ \ ] ^ _
//12
//13              ! " # $ % & '
//14
//15            ( ) * + , - . /
//16
//17            0 1 2 3 4 5 6 7
//18
//19            8 9 : ' < = > ?
//20
//21               FINISHED
//22
//23
//24
	basic_print("PLEASE ENTER A NAME:");

	for(x=0;x<9;x++) nameo[x]=0;

	grsim_update();

	while(1) {

		basic_normal();
		basic_htab(12);
		basic_vtab(3);

		for(x=0;x<8;x++) {
			if (x==name_x) {
				basic_inverse();
				basic_print("+");
				basic_normal();
				basic_print(" ");
			}
			else if (nameo[x]==0) {
				basic_print("_ ");
			}
			else {
				sprintf(tempst,"%c ",nameo[x]);
				basic_print(tempst);
			}
		}

		for(y=0;y<8;y++) {
			basic_htab(12);
			basic_vtab(y*2+6);
			for(x=0;x<8;x++) {
				if (y<4) sprintf(tempst,"%c ",(y*8)+x+64);
				else  sprintf(tempst,"%c ",(y*8)+x);

				if ((x==cursor_x) && (y==cursor_y)) basic_inverse();
				else basic_normal();

				basic_print(tempst);
			}
		}

		basic_htab(12);
		basic_vtab(22);
		basic_normal();

		if ((cursor_y==8) && (cursor_x<4)) basic_inverse();
		basic_print(" DONE ");
		basic_normal();
		basic_print("   ");
		if ((cursor_y==8) && (cursor_x>=4)) basic_inverse();
		basic_print(" BACK ");

		while(1) {
			ch=grsim_input();

			if (ch==APPLE_UP) { // up
				cursor_y--;
			}

			else if (ch==APPLE_DOWN) { // down
				cursor_y++;
			}

			else if (ch==APPLE_LEFT) { // left
				if (cursor_y==8) cursor_x-=4;
				else cursor_x--;
			}

			else if (ch==APPLE_RIGHT) { // right
				if (cursor_y==8) cursor_x+=4;
				cursor_x++;
			}

			else if (ch=='\r') {
				if (cursor_y==8) {
					if (cursor_x<4) {
						ch=27;
						break;
					}
					else {
						nameo[name_x]=0;
						name_x--;
						if (name_x<0) name_x=0;
						break;
					}
				}

				if (cursor_y<4) nameo[name_x]=(cursor_y*8)+
							cursor_x+64;
				else nameo[name_x]=(cursor_y*8)+cursor_x;
//				printf("Set to %d\n",nameo[name_x]);
				name_x++;
			}

			else if ((ch>32) && (ch<128)) {
				nameo[name_x]=ch;
				name_x++;

			}

			if (name_x>7) name_x=7;

			if (cursor_x<0) {
				cursor_x=7;
				cursor_y--;
			}
			if (cursor_x>7) {
				cursor_x=0;
				cursor_y++;
			}

			if (cursor_y<0) cursor_y=8;
			if (cursor_y>8) cursor_y=0;

			if ((cursor_y==8) && (cursor_x<4)) cursor_x=0;
			else if ((cursor_y==8) && (cursor_x>=4)) cursor_x=4;

			if (ch!=0) break;

			grsim_update();

			usleep(10000);
		}

		if (ch==27) break;
	}


	/************************************************/
	/* Flying					*/
	/************************************************/

	gr();
	x=17;	y=30;
	color_equals(0);

	int direction=0;

	color_equals(6);

	for(i=0;i<20;i++) {
		hlin(1, 0, 40, i);
	}

	color_equals(2);
	for(i=20;i<48;i++) {
		hlin(1, 0, 40, i);
	}

	while(1) {
		ch=grsim_input();

		if ((ch=='q') || (ch==27))  break;
		if ((ch=='i') || (ch==APPLE_UP)) if (y>20) y-=2;
		if ((ch=='m') || (ch==APPLE_DOWN)) if (y<39) y+=2;
		if ((ch=='j') || (ch==APPLE_LEFT)) {
			direction--;
			if (direction<-1) direction=-1;
		}
		if ((ch=='k') || (ch==APPLE_RIGHT)) {
			direction++;
			if (direction>1) direction=1;
		}

		gr_copy(0x800,0x400);

		if (direction==0) grsim_put_sprite(ship_forward,x,y);
		if (direction==-1) grsim_put_sprite(ship_left,x,y);
		if (direction==1) grsim_put_sprite(ship_right,x,y);

		grsim_update();

		usleep(10000);
	}

	return 0;
}
