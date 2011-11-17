#include "platform.h"

char *hook_raw_image_addr()   
{
	if (*((int*)0x3F64) != 0)
	{
		return (char*) 0x46000000;
	}
	else
	{
		return (char*) 0x413591F0;
	}
}

char *hook_alt_raw_image_addr() 
{
	if (*((int*)0x3F64) == 0)	
		return (char*) 0x46000000;
	else
		return (char*) 0x413591F0;
}

long hook_raw_size()
{
	return 0x123EAF0; 
}

void *vid_get_viewport_live_fb()
{
	if ((mode_get()&MODE_MASK) == MODE_REC)
		return (void*)((void*)(*(int*)(0x225C))-vid_get_viewport_xoffset()*3);
	
	return (void*)(void*)(*(int*)(0x225C));
}

void *vid_get_bitmap_fb()
{	
	return (void*)0x40471000; 
}	                           

void *vid_get_viewport_fb()
{	
	if ((mode_get()&MODE_MASK) == MODE_REC)
		return (void*)(0x405D7980-vid_get_viewport_xoffset()*3);  

	return (void*)0x405D7980;                 
}

void *vid_get_viewport_fb_d()
{
	return (void*)(*(int*)(0x3CD0+0x58));                  
}

char *camera_jpeg_count_str()
{
	 return (void*)0xCE488;                                      
}
