#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "keyboard.h"


extern long link_bss_start;
extern long link_bss_end;
extern void boot();


void startup()
{
	long *bss = &link_bss_start;
	long *ptr;

	// sanity check
	if ((long)&link_bss_end > (MEMISOSTART + MEMISOSIZE)){
		started();
		shutdown();
	}

	// initialize .bss senment
	while (bss<&link_bss_end)
		*bss++ = 0;

	boot();
}

// Focus length table in firmware @ 0xFFF4A30C
#define NUM_FL 64		// 0 - 63, entries in firmware (3 words each entry, first is FL)
extern int focus_len_table[NUM_FL*3];

// Conversion factor lens FL --> 35mm equiv
// lens      35mm     CF
// ----      ----     --
// 4.3       24       (24/4.3) * 430 = 2400  (min FL)
// 18.8      105      (105/18.8) * 430 = 2401.6  (max FL)
#define CF_EFL 2402     // rounded up
#define	CF_EFL_DIV 430

const int zoom_points = NUM_FL;  // OK

int get_effective_focal_length(int zp) {
	return (CF_EFL*get_focal_length(zp))/CF_EFL_DIV;
}

int get_focal_length(int zp) {
	if (zp < 0) zp = 0;
	else if (zp >= NUM_FL) zp = NUM_FL-1;
	return focus_len_table[zp*3];
}

int get_zoom_x(int zp) {
	return get_focal_length(zp)*10/focus_len_table[0];
}

long get_vbatt_min()
{
	return 3300;
}

long get_vbatt_max()
{
	return 4020;
}

