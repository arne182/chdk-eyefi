#include "platform.h"

char *hook_raw_image_addr()
{
	// Appears to be two raw buffers (this returns active buffer)
	// Addresses below found in table at FF445CFC used in sub_FF0ECCEC 
	// [0x3148 + 0xC] --> defines which buffer is active

	if (*((int*)0x3154) != 0)
		return (char*) 0x4ADB54A0;
	else
		return (char*) 0x44000000;	// found at (FF3E3930) [search CRAW BUF]
}

char *hook_alt_raw_image_addr()
{
	// Appears to be two raw buffers (this returns inactive buffer)
	// Addresses below found in table at FF445CFC used in sub_FF0ECCEC 
	// [0x3148 + 0xC] --> defines which buffer is active

	if (*((int*)0x3154) == 0)
		return (char*) 0x4ADB54A0;
	else
		return (char*) 0x44000000;	// found at (FF3E3930) [search CRAW BUF]
}


void *vid_get_bitmap_fb()        { return (void*)0x40685000; } // Found @0xff0515dc
void *vid_get_viewport_fb()      { return (void*)0x407dab80; } // Found @0xff3e0b38
char *camera_jpeg_count_str()    { return (char*)0x000df0e8; } // Found @0xff285438
long hook_raw_size()             { return 0x01247a60; }        // Found @0xff3e393c


void *vid_get_viewport_live_fb()
{
	return (void*)(*(int*)(0x217c));
}

void *vid_get_viewport_fb_d()
{
	return (void*)(*(int*)(0x2CA0+0x58)); // @FF06B08C & FF06B0C4
}
