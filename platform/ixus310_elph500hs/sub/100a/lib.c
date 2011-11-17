#include "platform.h"

void *vid_get_bitmap_fb()     { return (void*)0x40471000; } // Found @0xff04f54c
void *vid_get_viewport_fb()   { return (void*)(0x405d7980-vid_get_viewport_xoffset()*3); } // Found @0xff38b5c8
char *camera_jpeg_count_str() { return (char*)0x000c75f4; } // Found @0xff236e4c
long hook_raw_size()          { return 0x0123eaf0; }        // Found @0xff38eadc

char *hook_raw_image_addr()
{
	// Appears to be two raw buffers (this returns active buffer)
	// Addresses below found in table at FF3D1BA4 used in sub_FF0770FC
	// checks [0x2F80 + 0xc] --> defines which buffer is active

	if (*((int*)0x2F8C) != 0)
		return (char*) 0x46000000;
	else
		return (char*) 0x413591F0;	// found at (FF38EA84) [search CRAW BUF]
}

char *hook_alt_raw_image_addr()
{
	// Appears to be two raw buffers (this returns active buffer)
	// Addresses below found in table at FF3D1BA4 used in sub_FF0770FC
	// checks [0x2F80 + 0xc] --> defines which buffer is active

	if (*((int*)0x2F8C) == 0)
		return (char*) 0x46000000;
	else
		return (char*) 0x413591F0;	// found at (FF38EA84) [search CRAW BUF]
}


void *vid_get_viewport_live_fb()
{
    // Found by searching RAM locations that referenced 0x405d7980 (viewport buffer)
    // and also changed to the other buffer addresses over time. Then used each here
	// and selected value that gave the fastest Motion Detect response using http://dataghost.com/chdk/md_meter.html.
	return (void*)(*(int*)(0x2250)-vid_get_viewport_xoffset()*3);
}

void *vid_get_viewport_fb_d()
{
	return (void*)(*(int*)(0x2CE8+0x58)); // @FF06A728 & FF06A760
}
