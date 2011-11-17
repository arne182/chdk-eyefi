#include "platform.h"
#include "keyboard.h"

void *hook_raw_fptr()
{
    return (void*)0x37334; // found in taskcreate_ImageSensorTask
}

void *hook_raw_ret_addr()
{
    return (void*)0xFFCAE220; //
}

char *hook_raw_image_addr()
{
    return (char*)0x10570FF0;  // @ffca81cc, 0x10400000+0x17000+0xff0
}

long hook_raw_size()
{
    return 0x3FCB40;   //@ffca81d8, 0x3fc000+0xb40
}

/*
void *vid_get_viewport_live_fb()
{
    return (void*)0;
}
*/

void *vid_get_viewport_live_fb() // from a540
{
       void **fb=(void **)0x4FF4; //@ffc90d90
       unsigned char buff = *((unsigned char*)0x5004); //@ffc90d64
       if (buff == 0) {
           buff = 2;
       }
       else {
           buff--;
       }
       return fb[buff];
}

void *vid_get_bitmap_fb()
{
    return (void*)0x103C79A0; // same as in a430, a420
}

void *vid_get_viewport_fb()//
{
    return (void*)0x105EAF80; // @ffd08f18
}

void *vid_get_viewport_fb_d()
{
    return (void*)(*(int*)0x73280); // @ffd0c96c
}

long vid_get_bitmap_screen_width()
{
    return 360;
}

long vid_get_bitmap_screen_height()
{
    return 240;
}

long vid_get_viewport_height()
{
    // return ((mode_get()&MODE_MASK) == MODE_PLAY) ? 240 : 230;
    return 240;
}

char *camera_jpeg_count_str()
{
    return (char*)0x7F9F0; // @ffdd479c
} 

long vid_get_bitmap_buffer_width() { return 360; }

long vid_get_bitmap_buffer_height() { return 240; }

