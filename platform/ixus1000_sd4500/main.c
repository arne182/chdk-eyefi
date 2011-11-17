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


//zoom position is get_parameter_data(87)

// Ixus 1000 576 =1
static const struct {
	int zp, fl;
} fl_tbl[] = {
  {   0,   6300},
  {   5,  5*576+6300},
  {   10, 10*576+6300},
  {  20,  20*576+6300},
  {  30,  30*576+6300},
  {  40,  40*576+6300},
  {  50,  50*576+6300},
  {  60,  60*576+6300},
  {  70,  70*576+6300},
  {  80,  80*576+6300},
  {  90,  90*576+6300},
  { 100,  63000},
};
#define NUM_FL (sizeof(fl_tbl)/sizeof(fl_tbl[0]))

// Focal length range is 6.3 - 63,0 mm, 36.0 - 360 in 35-mm equivalent. for Ixus 1000 HS

// Focal length range is 6.0 - 70,0 mm, 27.3 - 392 in 35-mm equivalent. for Sx210
// So, CF_EFL = 27.3/5.0*10000=54600 or392/70*10000=56000
// diff = 54600 - 54566.6 = 1400, split it 1400 / 2 = 700
// add to base 56000 + 700 = 56700
// divide by 10 to avoid overflow in get_effective_focal_length()
#define CF_EFL  5714
const int zoom_points = 100;

int get_effective_focal_length(int zp) {
	return (CF_EFL*get_focal_length(zp))/1000;
}

int get_focal_length(int zp) {
	int i;

	if (zp<fl_tbl[0].zp)
		return fl_tbl[0].fl;
	else if (zp>fl_tbl[NUM_FL-1].zp)
		return fl_tbl[NUM_FL-1].fl;
	else
		for (i=1; i<NUM_FL; ++i) {
			if (zp==fl_tbl[i-1].zp)
				return fl_tbl[i-1].fl;
			else if (zp==fl_tbl[i].zp)
				return fl_tbl[i].fl;
			else if (zp<fl_tbl[i].zp)
				return fl_tbl[i-1].fl+(zp-fl_tbl[i-1].zp)*(fl_tbl[i].fl-fl_tbl[i-1].fl)/(fl_tbl[i].zp-fl_tbl[i-1].zp);
		}
	return fl_tbl[NUM_FL-1].fl;
}

int get_zoom_x(int zp) {
	return get_focal_length(zp)*10/fl_tbl[0].fl;
}


long get_vbatt_min()
{
	return 3180;  // min observed was 3.408, then it died
}

long get_vbatt_max()
{
	return 4057;  // fresh from change (actual was 4.127)
}
