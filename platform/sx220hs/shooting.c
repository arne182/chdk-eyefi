#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "keyboard.h"
#include "stdlib.h"
#include "platform.h"

#define PARAM_FILE_COUNTER      0x3B       //sx220 changed
#define PARAM_EXPOSURE_COUNTER  0x02

//No zoom 3.1 3.5 4.0 4.5 5.0 5.6 6.3 7.1 8.0
//maz zoom 5.9 7.1 8.0

const ApertureSize aperture_sizes_table[] = {
	{  9, 322, "3.1" },
    { 10, 352, "3.5" },
	{ 11, 384, "4.0" },
	{ 12, 416, "4.5" },
	{ 13, 448, "5.0" },
	{ 14, 480, "5.6" },
	{ 15, 512, "6.3" },
	{ 16, 544, "7.1" },
	{ 17, 576, "8.0" }
};

const ShutterSpeed shutter_speeds_table[] = {
	{ -12, -384, "15", 15000000 },
	{ -11, -352, "13", 13000000 },
	{ -10, -320, "10", 10000000 },
	{  -9, -288, "8",   8000000 },
	{  -8, -256, "6",   6000000 },
	{  -7, -224, "5",   5000000 },
	{  -6, -192, "4",   4000000 },
	{  -5, -160, "3.2", 3200000 },
	{  -4, -128, "2.5", 2500000 },
	{  -3,  -96, "2",   2000000 },
	{  -2,  -64, "1.6", 1600000 },
	{  -1,  -32, "1.3", 1300000 },
	{   0,    0, "1",   1000000 },
	{   1,   32, "0.8",  800000 },
	{   2,   64, "0.6",  600000 },
	{   3,   96, "0.5",  500000 },
	{   4,  128, "0.4",  400000 },
	{   5,  160, "0.3",  300000 },
	{   6,  192, "1/4",  250000 },
	{   7,  224, "1/5",  200000 },
	{   8,  256, "1/6",  166667 },
	{   9,  288, "1/8",  125000 },
	{  10,  320, "1/10", 100000 },
	{  11,  352, "1/13",  76923 },
	{  12,  384, "1/15",  66667 },
	{  13,  416, "1/20",  50000 },
	{  14,  448, "1/25",  40000 },
	{  15,  480, "1/30",  33333 },
	{  16,  512, "1/40",  25000 },
	{  17,  544, "1/50",  20000 },
	{  18,  576, "1/60",  16667 },
	{  19,  608, "1/80",  12500 },
	{  20,  640, "1/100", 10000 },
	{  21,  672, "1/125",  8000 },
	{  22,  704, "1/160",  6250 },
	{  23,  736, "1/200",  5000 },
	{  24,  768, "1/250",  4000 },
	{  25,  800, "1/320",  3125 },
	{  26,  832, "1/400",  2500 },
	{  27,  864, "1/500",  2000 },
	{  28,  896, "1/640",  1563 },
	{  29,  928, "1/800",  1250 },
	{  30,  960, "1/1000", 1000 },
	{  31,  992, "1/1250",  800 },
	{  32, 1024, "1/1600",  625 },
	{  33, 1056, "1/2000",  500 },
	{  34, 1088, "1/2500",  400 },
	{  35, 1120, "1/3200",  313 },
};

const ISOTable iso_table[] = {
	{  0,    0, "Auto", -1},
	{  1,  100,  "100", -1},
	{  2,  200,  "200", -1},
	{  3,  400,  "400", -1},
	{  4,  800,  "800", -1},
	{  5, 1600, "1600", -1},
	{  6, 3200, "3200", -1},
};

static const CapturemodeMap modemap[] = {
	{ MODE_AUTO,           	        32768  },
	{ MODE_P,               	    32772  },
	{ MODE_TV,                 		32771  },
	{ MODE_AV,                 		32770  },
	{ MODE_M,                  		32769  },
	{ MODE_EASY,               		33314  },
	{ MODE_PORTRAIT,           		32783  },
	{ MODE_LANDSCAPE,          		32782  },
	{ MODE_VIDEO_SPEED, 			 2626  },	//MODE_VIDEO_SUPER_SLOW_MOTION
	{ MODE_VIDEO_STD,          		 2621  },
	{ MODE_KIDS_PETS,          		32786  },
	{ MODE_SCN_UNDERWATER,       	16409  },
	{ MODE_SCN_LOWLIGHT, 	      	16417  },
	{ MODE_SCN_BEACH,       		16407  },
	{ MODE_SCN_FOLIAGE,       		16405  },
	{ MODE_SCN_SNOW,       			16406  },	
	{ MODE_SCN_FIREWORK,      	 	16408  },	
	{ MODE_SCN_COLOR_ACCENT,    	 8733  },
	{ MODE_SCN_COLOR_SWAP,    		 8734  },	
	{ MODE_STITCH,				    16908  },	//MODE_SCN_STITCH_ASSIST	
	{ MODE_SCN_SMART_SHUTTER,       16937  },
	{ MODE_SCN_POSTER_EFFECT,   	 8743  },
	{ MODE_SCN_FISHEYE,  	     	 8747  },
	{ MODE_SCN_MINIATURE,   	  	 8748  },
	{ MODE_SCN_SUPER_VIVID,   	 	 8742  },
	{ MODE_SCN_NIGHT_SCENE, 		16941  },	//MODE_SCN_HANDHELD_NIGHTSCENE
	{ MODE_VIDEO_IFRAME_MOVIE, 		 2628  },
	{ MODE_VIDEO_MOVIE_DIGEST,     	33333  },
	{ MODE_SCN_HIGHSPEED_BURST,     16904  },
	{ MODE_SCN_BEST_IMAGE,       	16905  },
	{ MODE_SCN_TOY_CAMERA,  	  	 8751  },
	{ MODE_SCN_MONOCHROME,  	  	 8754  },
	{ MODE_SCN_WINK_SELF_TIMER,		16938  },
    { MODE_SCN_FACE_SELF_TIMER,		16936  },
};

#include "../generic/shooting.c"

// Override ISO settings (need to do this before exposure calc for ISO as well as after)
void __attribute__((naked,noinline)) shooting_expo_iso_override(void){
 asm volatile("STMFD   SP!, {R0-R12,LR}\n");

    if ((state_kbd_script_run) && (photo_param_put_off.sv96))
    {
        shooting_set_sv96(photo_param_put_off.sv96, SET_NOW);
        // photo_param_put_off.sv96 is not reset here, it will be reset in next call to shooting_expo_param_override
    }
    else if ((conf.iso_override_value) && (conf.iso_override_koef) && !(conf.override_disable==1))
        shooting_set_iso_real(shooting_get_iso_override_value(), SET_NOW);
    else if (conf.autoiso_enable && shooting_get_flash_mode()/*NOT FOR FLASH AUTO MODE*/ && !(conf.override_disable==1 && conf.override_disable_all))
        shooting_set_autoiso(shooting_get_iso_mode());

 asm volatile("LDMFD   SP!, {R0-R12,PC}\n");
}

long get_file_next_counter() {
	return get_file_counter();
}

long get_target_file_num() {
	long n;


	n = get_file_next_counter();

    n = (n>>4)&0x3FFF;

    return n;
}

void get_target_dir_name(char *out)
{	
	extern void _GetImageFolder(char*,int,int,int);
	_GetImageFolder(out,get_file_next_counter(),0x400,time(NULL));
}

long get_target_dir_num() {
	long n;

	n = get_file_next_counter();
	n = (n>>18)&0x3FF;
	return n;
}

int circle_of_confusion = 5;

