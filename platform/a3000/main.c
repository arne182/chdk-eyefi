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
static const struct {
	int zp, fl;
} fl_tbl[] = {
  {   0,   6200},
  {   1,   7780},
  {   2,   9410},
  {   3,   11370},
  {   4,   13790},
  {   5,   16770},
  {   6,   20180},
  {   7,   24800},
};

#define NUM_FL (sizeof(fl_tbl)/sizeof(fl_tbl[0]))
// A3000IS focal lenght range 6.2 - 24.8 mm (35 mm equivalent: 34.8 - 139.4 mm)(1/2.3" (7.7mm, crop 5.62) Type CCD, Scale Factor To 35 mm Equivalent: 4.6)
// 34.8/6.2*10000=56129
// 139.4/24.8*10000=56210

#define CF_EFL 56200

const int zoom_points = NUM_FL;

int get_effective_focal_length(int zp) {
    return (CF_EFL*get_focal_length(zp))/10000;
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
    return 3000;
}

long get_vbatt_max()
{
    return 4100;
}

