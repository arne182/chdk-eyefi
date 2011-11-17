#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "keyboard.h"

typedef struct {
	short grp;
	short hackkey;
	long canonkey;
} KeyMap;

static long kbd_new_state[3] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
static long kbd_prev_state[3] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
static long kbd_mod_state[3] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };

static long last_kbd_key = 0;
static int usb_power=0;
static int remote_key, remote_count;
static int shoot_counter=0;
extern void _GetKbdState(long*);

#define DELAY_TIMEOUT 10000

//void my_blinkk(void) {
//	int i;
////	while(1) {
//		*((volatile int *) 0xC0220134) = 0x46; // Turn on LED
//		for (i=0; i<0x200000; i++) { asm volatile ( "nop\n" ); }
//
//		*((volatile int *) 0xC0220134) = 0x44; // Turn off LED
//		for (i=0; i<0x200000; i++) { asm volatile ( "nop\n" ); }
//
//		*((volatile int *) 0xC0220134) = 0x46; // Turn on LED
//		for (i=0; i<0x200000; i++) { asm volatile ( "nop\n" ); }
//
//		*((volatile int *) 0xC0220134) = 0x44; // Turn off LED
//		for (i=0; i<0x900000; i++) { asm volatile ( "nop\n" ); }
////	}
//}

#define KEYS_MASK0 (0x00CFFDE0)
#define KEYS_MASK1 (0x00000000)
#define KEYS_MASK2 (0x0000C000) 

#define SD_READONLY_FLAG    0x00000002 // Found @0xff434b6c, levent 0x20a
#define SD_READONLY_IDX     1
#define USB_MASK            0x40000000 // Found @0xff434be4, levent 0x202
#define USB_IDX             2

static KeyMap keymap[] = {

	{ 0, KEY_ZOOM_IN	     ,0x00000020 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_IN1	     ,0x00000020 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_IN	     ,0x00000040 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_IN2	     ,0x00000040 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_IN	     ,0x00000060 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_IN3	     ,0x00000060 }, // 2 bits used, 4 values (0x00000060)
	{ 0, KEY_ZOOM_OUT	     ,0x00000080 }, // 2 bits used, 4 values (0x00000180)
	{ 0, KEY_ZOOM_OUT1	     ,0x00000080 }, // 2 bits used, 4 values (0x00000180)
	{ 0, KEY_ZOOM_OUT	     ,0x00000100 }, // 2 bits used, 4 values (0x00000180)
	{ 0, KEY_ZOOM_OUT2	     ,0x00000100 }, // 2 bits used, 4 values (0x00000180)
	{ 0, KEY_ZOOM_OUT	     ,0x00000180 }, // 2 bits used, 4 values (0x00000180)
	{ 0, KEY_ZOOM_OUT3	     ,0x00000180 }, // 2 bits used, 4 values (0x00000180)
    { 0, KEY_UP              ,0x00000400 }, // Found @0xff434aec, levent 0x04
    { 0, KEY_DOWN            ,0x00000800 }, // Found @0xff434af4, levent 0x05
    { 0, KEY_LEFT            ,0x00001000 }, // Found @0xff434afc, levent 0x06
    { 0, KEY_RIGHT           ,0x00002000 }, // Found @0xff434b04, levent 0x07
    { 0, KEY_SET             ,0x00004000 }, // Found @0xff434b0c, levent 0x08
	{ 0, KEY_VIDEO           ,0x00008000 },
	{ 0, KEY_ZOOM_ASSIST     ,0x00010000 },
    { 0, KEY_DISPLAY         ,0x00020000 }, // Found @0xff434b24, levent 0x0a
    { 0, KEY_MENU            ,0x00040000 }, // Found @0xff434b2c, levent 0x09
	{ 0, KEY_ERASE		     ,0x00080000 },
	{ 0, KEY_FLASH           ,0x00400000 },
	{ 0, KEY_PRINT		     ,0x00800000 },

    { 2, KEY_SHOOT_FULL      ,0x0000c000 }, // Found @0xff434bac, levent 0x01
    { 2, KEY_SHOOT_FULL_ONLY ,0x00008000 }, // Found @0xff434bac, levent 0x01
    { 2, KEY_SHOOT_HALF      ,0x00004000 }, // Found @0xff434ba4, levent 0x00

	{ 0, 0, 0 } 
};


long __attribute__((naked)) wrap_kbd_p1_f() ;

void wait_until_remote_button_is_released(void)
{

long x[3];
int count1;
int count2;
int tick,tick2,tick3;
int nSW;
int prev_usb_power,cur_usb_power;
 // ------ add by Masuji SUTO (start) --------------
    static int nMode;
 // ------ add by Masuji SUTO (end)   --------------

asm volatile ("STMFD SP!, {R0-R11,LR}\n"); // store R0-R11 and LR in stack
//debug_led(1);
tick = get_tick_count();
tick2 = tick;
static long usb_physw[3];
if (conf.synch_enable && conf.ricoh_ca1_mode && conf.remote_enable && (!shooting_get_drive_mode()|| ((shooting_get_drive_mode()==2) && state_shooting_progress != SHOOTING_PROGRESS_PROCESSING)))  // synch mode enable so wait for USB to disconnect
  {
// ------ add by Masuji SUTO (start) --------------
        nMode=0;
        usb_physw[2] = 0;                                             // makes sure USB bit is cleared.
        _kbd_read_keys_r2(usb_physw);
        if((usb_physw[2] & USB_MASK)==USB_MASK) nMode=1;
// ------ add by Masuji SUTO (end)   --------------
     if(conf.ricoh_ca1_mode && conf.remote_enable)
     {
	if(shooting_get_drive_mode()==1 && state_shooting_progress == SHOOTING_PROGRESS_PROCESSING){			//continuous-shooting mode
		if(conf.bracket_type>2){
			if(shoot_counter<2) shutter_int=3;
			shoot_counter--;
			}
		else{
			prev_usb_power=0;
			nSW = 0;
			do
				{
				usb_physw[2] = 0;                                             // makes sure USB bit is cleared.
				_kbd_read_keys_r2(usb_physw);
				cur_usb_power = (usb_physw[2] & USB_MASK)==USB_MASK;
				if(cur_usb_power){
					if(!prev_usb_power){
						tick2 = get_tick_count();
						prev_usb_power=cur_usb_power;
						}
					else{
						if((int)get_tick_count()-tick2>1000) {/*debug_led(0);*/}
						}
					}
				else{
					if(prev_usb_power){
						tick3 = (int)get_tick_count()-tick2;
						if(nSW==10) {
							if(tick3>50) shutter_int=1;
							nSW=20;
							}
						if(nSW==0 && tick3>0) {
							if(tick3<50) {
							nSW=10;
							}
						else{
							if(tick3>1000) shutter_int=1;
								nSW=20;
							}
						}
						prev_usb_power=cur_usb_power;
						}
					}
				if((int)get_tick_count()-tick >= DELAY_TIMEOUT) {nSW=20;shutter_int=2;}
				}
			 while(nSW<20);
			 }
		} 		//continuous-shooting mode
		else{		// normal mode
			shoot_counter=0;
			if(conf.bracket_type>2){
				shoot_counter=(conf.bracket_type-2)*2;
				}
        do
           {
         //  _platformsub_kbd_fetch_data(x);
           usb_physw[2] = 0;
          _kbd_read_keys_r2(usb_physw);
           }

// ------ modif by Masuji SUTO (start) --------------
    while(((((usb_physw[2] & USB_MASK)!=USB_MASK) && (nMode==0)) || (((usb_physw[2] & USB_MASK)==USB_MASK) && (nMode==1))) && ((int)get_tick_count()-tick < DELAY_TIMEOUT));
// ------ modif by Masuji SUTO (end)   --------------
	}
       } // ricoh ca-1 mode

else

       {
         do
          {
         //  _platformsub_kbd_fetch_data(x);
           usb_physw[2] = 0;
          _kbd_read_keys_r2(usb_physw);
           }
        while((usb_physw[2]&USB_MASK) &&  ((int)get_tick_count()-tick < DELAY_TIMEOUT));

        }

  } // synch enable


if (conf.synch_delay_enable && conf.synch_delay_value>0)       // if delay is switched on and greater than 0
  {
    for (count1=0;count1<conf.synch_delay_value+(conf.synch_delay_coarse_value*1000);count1++) // wait delay_value * 0.1ms
    {
      for (count2=0;count2<1400;count2++)            // delay approx. 0.1ms
        {
        }
     }
  }

//debug_led(0);
asm volatile ("LDMFD SP!, {R0-R11,LR}\n"); // restore R0-R11 and LR from stack
}

static void __attribute__((noinline)) mykbd_task_proceed()
{
	while (physw_run){
		_SleepTask(*((int*)0x1c18)); //10);

		if (wrap_kbd_p1_f() == 1){ // autorepeat ?
			_kbd_p2_f();
		}
	}
}

// no stack manipulation needed here, since we create the task directly
void __attribute__((naked,noinline))
mykbd_task()
{
    mykbd_task_proceed();

    _ExitTask();
}

long __attribute__((naked,noinline)) wrap_kbd_p1_f()
{
	asm volatile(
		"STMFD   SP!, {R1-R7,LR}\n"
		"MOV     R5, #0\n"
		//"BL      _kbd_read_keys \n"
		"BL		my_kbd_read_keys\n"
		"B       _kbd_p1_f_cont\n"
	);
	return 0; // shut up the compiler
}

// Set to 1 to disable jogdial events from being processed in firmware
volatile int jogdial_stopped=0;

// Pointer to stack location where jogdial task records previous and current
// jogdial positions
extern short* jog_position;
extern short rear_dial_position;

void jogdial_control(int n)
{
    if (jogdial_stopped && !n)
    {
        // If re-enabling jogdial set the task code current & previous positions to the actual
        // dial positions so that the change won't get processed by the firmware
        jog_position[0] = jog_position[2] = rear_dial_position;   // Rear dial
    }
    jogdial_stopped = n;
}

void my_kbd_read_keys()
{
	kbd_prev_state[0] = kbd_new_state[0];
	kbd_prev_state[1] = kbd_new_state[1];
	kbd_prev_state[2] = kbd_new_state[2];

	_GetKbdState(kbd_new_state);
	_kbd_read_keys_r2(kbd_new_state);

	if (kbd_process() == 0){
		// leave it alone...
          physw_status[0] = kbd_new_state[0];
          physw_status[1] = kbd_new_state[1];
          physw_status[2] = kbd_new_state[2];
          jogdial_control(0);

	} else {
		// override keys
	 	physw_status[0] = (kbd_new_state[0] & (~KEYS_MASK0)) | (kbd_mod_state[0] & KEYS_MASK0);
		physw_status[1] = (kbd_new_state[1] & (~KEYS_MASK1)) | (kbd_mod_state[1] & KEYS_MASK1);
		physw_status[2] = (kbd_new_state[2] & (~KEYS_MASK2)) | (kbd_mod_state[2] & KEYS_MASK2);

		if ((jogdial_stopped==0) && !state_kbd_script_run)
		{
			jogdial_control(1);
			get_jogdial_direction();
		}
		else if (jogdial_stopped && state_kbd_script_run) jogdial_control(0);
	}

	//_kbd_read_keys_r2(physw_status);

	remote_key = (physw_status[2] & USB_MASK)==USB_MASK;
		if (remote_key)
			remote_count += 1;
		else if (remote_count) {
			usb_power = remote_count;
			remote_count = 0;
		}
	physw_status[SD_READONLY_IDX] = physw_status[SD_READONLY_IDX] & ~SD_READONLY_FLAG;
	if (conf.remote_enable) {
		physw_status[USB_IDX] = physw_status[USB_IDX] & ~USB_MASK;
	}
}


/****************/

void kbd_set_alt_mode_key_mask(long key)
{
}

void kbd_key_press(long key)
{
	int i;

	for (i=0;keymap[i].hackkey;i++){
		if (keymap[i].hackkey == key)
		{
			kbd_mod_state[keymap[i].grp] &= ~keymap[i].canonkey;
			return;
		}
	}
}

void kbd_key_release(long key)
{
	int i;
	for (i=0;keymap[i].hackkey;i++){
		if (keymap[i].hackkey == key){
			kbd_mod_state[keymap[i].grp] |= keymap[i].canonkey;
			return;
		}
	}
}

void kbd_key_release_all()
{
	kbd_mod_state[0] |= KEYS_MASK0;
	kbd_mod_state[1] |= KEYS_MASK1;
	kbd_mod_state[2] |= KEYS_MASK2;
}

long kbd_is_key_pressed(long key)
{
	int i;
	for (i=0;keymap[i].hackkey;i++){
		if (keymap[i].hackkey == key){
			return ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0) ? 1:0;
		}
	}
	return 0;
}

long kbd_is_key_clicked(long key)
{
	int i;
	for (i=0;keymap[i].hackkey;i++){
		if (keymap[i].hackkey == key){
			return ((kbd_prev_state[keymap[i].grp] & keymap[i].canonkey) != 0) &&
			       ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0);
		}
	}
	return 0;
}

long kbd_get_pressed_key()
{
	int i;
	for (i=0;keymap[i].hackkey;i++){
		if ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0){
			return keymap[i].hackkey;
		}
	}
	return 0;
}

long kbd_get_clicked_key()
{
	int i;
	for (i=0;keymap[i].hackkey;i++){
		if (((kbd_prev_state[keymap[i].grp] & keymap[i].canonkey) != 0) &&
		    ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0)) {
			return keymap[i].hackkey;
		}
	}
	return 0;
}

void kbd_reset_autoclicked_key() {
	last_kbd_key = 0;
}

long kbd_get_autoclicked_key() {
	static long last_kbd_time = 0, press_count = 0;
	register long key, t;

	key=kbd_get_clicked_key();
	if (key) {
		last_kbd_key = key;
		press_count = 0;
		last_kbd_time = get_tick_count();
		return key;
	} else {
		if (last_kbd_key && kbd_is_key_pressed(last_kbd_key)) {
			t = get_tick_count();
			if (t-last_kbd_time>((press_count)?175:500)) {
				++press_count;
				last_kbd_time = t;
				return last_kbd_key;
			} else {
				return 0;
			}
		} else {
			last_kbd_key = 0;
			return 0;
		}
	}
}

int get_usb_power(int edge)
{
	int x;

	if (edge) return remote_key;
	x = usb_power;
	usb_power = 0;
	return x;
}

long kbd_use_zoom_as_mf() {
 return 0;
}

static short new_jogdial=0, old_jogdial=0;

long get_jogdial_direction(void)
{
    old_jogdial = new_jogdial;
    new_jogdial = rear_dial_position;
    if (old_jogdial < new_jogdial) return JOGDIAL_LEFT;
    else if (old_jogdial > new_jogdial) return JOGDIAL_RIGHT;
    else return 0;
}
