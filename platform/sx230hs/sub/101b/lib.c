#include "platform.h"

/*
SX230HS
note sensor size for camera.h is from  //ASM1989 08.20.2010
@ FFB2FC6C
0x14D2400  = 21832704

21832704 / 12 * 8 = 14555136
---
                              |
@ FFB2F7C0                    |
0x1140 by 0xCE0 =             |
44416 * 3296  = 14555136  ---


SX220
Calculated same as above from camera.c
full 19131120
0x1048 *  BF4   =  C29CA0
4168 * 3060 = 12754080 

*/

char *hook_raw_image_addr()   
{
	if (*((int*)(0x3F58 + 0xc)) != 0)		//0x3F58 ( @FF07B02C ) +0xC (@FF07B0A4 )	
	{
		return (char*) 0x46000000;	//@FF066A14
	}
	else
	{
		return (char*) 0x413591F0;  //@FF37FB7C 
	}
}

char *hook_alt_raw_image_addr() 
{
	if (*((int*)(0x3F58 + 0xc)) == 0)	
		return (char*) 0x46000000;
	else
		return (char*) 0x413591F0;
}

long hook_raw_size()
{
	//SX230
	//dword_FF37FBD8  DCD 0x123EAF0 	@FF37FBD8 
	return 0x123EAF0; 
	
}

//TODO
void *vid_get_viewport_live_fb()
{
	if ((mode_get()&MODE_MASK) == MODE_REC)
		return (void*)((void*)(*(int*)(0x225C))-vid_get_viewport_xoffset()*3);
	
	return (void*)(void*)(*(int*)(0x225C));
	
  	// Found by searching RAM locations that referenced 0x405D7980 (viewport buffer)
	// and also changed to the other buffer addresses over time. Then used each here
	// and selected value that gave the fastest Motion Detect response using http://dataghost.com/chdk/md_meter.html
}



// OSD buffer
void *vid_get_bitmap_fb()
{	
	//SX230
	//LDR     R0, =0x40471000			@FF0514D0
	return (void*)0x40471000; 
}	                           



// Live picture buffer (shoot half-pressed)
void *vid_get_viewport_fb()
{	
	//SX230 	
	//LDR     R1, =0x405D7980       @FF37C5E0
	if ((mode_get()&MODE_MASK) == MODE_REC)
		return (void*)(0x405D7980-vid_get_viewport_xoffset()*3);  

	return (void*)0x405D7980;                 
}


void *vid_get_viewport_fb_d()
{
	//SX230
	//dword_FF06DB3C  DCD 0x3CD0   	@FF06DB3C
	//STR     R12, [R5,#0x58]		@FF06E8BC
	return (void*)(*(int*)(0x3CD0+0x58));                  

}

char *camera_jpeg_count_str()
{
	//sx230
	//LDR     R0, =0xCE488			@FF2399D4
	 return (void*)0xCE488;                                      
}
