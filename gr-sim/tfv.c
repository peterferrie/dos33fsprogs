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


int main(int argc, char **argv) {

	int ch;

	grsim_init();

	/* Title Screen */
	grsim_unrle(title_rle,0x400);

	grsim_update();

	while(1) {

		ch=grsim_input();

		if (ch=='q') break;

		usleep(100000);
	}

	return 0;
}

