#include "platform.h"
#include "lolevel.h"

#define LED_DP      0xC02200CC    // direct-print (blue)
#define LED_FLASH   0xC02200D8    // Triggers flash
#define LED_AF      0xC02200DC    // Auto-focus LED

void vid_bitmap_refresh()
{
 extern int enabled_refresh_physical_screen;
 enabled_refresh_physical_screen=1;
 _RefreshPhysicalScreen(1);
}


void shutdown()
{
    volatile long *p = (void*)0xC022001C;    
    
    asm(
        "MRS     R1, CPSR\n"
        "AND     R0, R1, #0x80\n"
        "ORR     R1, R1, #0x80\n"
        "MSR     CPSR_cf, R1\n"
        :::"r1","r0");

    *p = 0x44;  // power off.

    while(1);
}


void debug_led(int state)
{
 *(int*)LED_DP=state ? 0x46 : 0x44;
}

void camera_set_led(int led, int state, int bright) {
 static char led_table[]={7,9};
 _LEDDrive(led_table[led%sizeof(led_table)], state<=1 ? !state : state);
}

int get_flash_params_count(void){
 return 122; 
}
