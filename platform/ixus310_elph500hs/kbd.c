#include "stdlib.h"
#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "keyboard.h"
#include "../../core/gui_draw.h"

// Uncomment this line to enable 'PLAY' and 'OFF' buttons in the CHDK OSD
// Can be used to switch in/out of playback mode and power off the camera
// (For 'nekut' whose camera has a broken playback button - http://chdk.setepontos.com/index.php?topic=6634.msg75039#msg75039)
//#define   TS_PLAY_POWER_HACK  1

typedef struct {
	short grp;
	short hackkey;
	long canonkey;
    short   x1, y1, x2, y2;
    short   redraw;
    char    *nm, *nm2;
    int     min_gui_mode, max_gui_mode, cam_mode_mask;
    int     *conf_val;
    const char* (*chg_val)(int,int);
    int     *conf_disable;
} KeyMap;

static long kbd_new_state[4] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
static long kbd_prev_state[4] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
static long kbd_mod_state[4] = { 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF };
static long touch_panel_state;

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

#define KEYS_MASK0 (0x00000000)
#define KEYS_MASK1 (0x00009000)
#define KEYS_MASK2 (0x00000a00) 

#define SD_READONLY_FLAG (0x20000)
#define USB_MASK (0x4000000)
#define USB_REG 2

#define TS_KEY_TOGGLE_RAW   200
#define TS_KEY_TOGGLE_ZEBRA 201
#define TS_KEY_TOGGLE_HISTO 202
#define TS_KEY_TOGGLE_OSD   203
#define TS_KEY_TOGGLE_OVRD  204
#define TS_KEY_TOGGLE_EDGE  205
#define TS_KEY_TOGGLE_ND    206
#define TS_KEY_TOGGLE_EV    207
#define TS_KEY_TOGGLE_TV_DN 208
#define TS_KEY_TOGGLE_TV_UP 209
#define TS_KEY_TOGGLE_AV_DN 210
#define TS_KEY_TOGGLE_AV_UP 211
#define TS_KEY_TOGGLE_SV_DN 212
#define TS_KEY_TOGGLE_SV_UP 213
#define TS_KEY_PLAYBACK     214
#define TS_KEY_POWER        215

#define TS_UP_DN_BUTTON     300
#define TS_PG_DN            301
#define TS_PG_UP            302

#define TS_XL   70
#define TS_XR   870
#define TS_W    110
#define TS_YT   90
#define TS_H    178
#define LB(x,n) TS_XL+x*TS_W, TS_YT+n*TS_H, TS_XL+(x+1)*TS_W, TS_YT+n*TS_H+TS_H
#define RB(x,n) TS_XR-x*TS_W, TS_YT+n*TS_H, TS_XR+TS_W-x*TS_W, TS_YT+n*TS_H+TS_H
#define RBW(x,n) TS_XR-TS_W-x*TS_W, TS_YT+n*TS_H, TS_XR+TS_W-x*TS_W, TS_YT+n*TS_H+TS_H

extern const char* gui_on_off_enum(int change, int arg);
extern const char* gui_histo_show_enum(int change, int arg);
extern const char* gui_nd_filter_state_enum(int change, int arg);
extern const char* gui_override_disable_enum(int change, int arg);

#define MODE_VID    0x400

int video_ael;
int tv_video;
int av_video;
int sv_video;
int tv_min_video;
extern short cds_gain_value;

void set_tv_video(int x)
{
    if (video_ael)
    {
        if (x < tv_min_video) x = tv_min_video;
        if (x > 1152) x = 1152;
        if (tv_video != x)
        {
            tv_video = x;
            tv_video = _SetAE_ShutterSpeed((short*)&tv_video);
        }
    }
}

void set_av_video(int x)
{
    if (video_ael)
    {
        if (x < 200) x = 200;
        if (x > 576) x = 576;
        if (av_video != x)
        {
            av_video = x;
            shooting_set_av96_direct(av_video,1);
            extern int _MoveIrisWithAv(short*);
            _MoveIrisWithAv((short*)&av_video);
            _GetPropertyCase(PROPCASE_AV,&av_video,2);
        }
    }
}

void set_sv_video(int x)
{
    if (video_ael)
    {
        if (x < 0) x = 0;
        if (x > 768) x = 768;
        sv_video = x;

        extern int _SetCDSGain(short*);
        _SetCDSGain((short*)&sv_video);

        extern int _GetCdsGainValue();
        sv_video = _GetCdsGainValue();
    }
}

void set_ev_video_avail(int x)
{
    if (video_ael == x) return;
    video_ael = x;
    if (x)
    {
        av_video = tv_video = 0;

        _ExpCtrlTool_StopContiAE(0,0);

        _GetPropertyCase(PROPCASE_TV,&tv_video,2);
        _GetPropertyCase(PROPCASE_AV,&av_video,2);
        sv_video = cds_gain_value;

        if ((mode_get()&MODE_SHOOTING_MASK)==MODE_VIDEO_SPEED) tv_min_video=577;  // 1/60
        else tv_min_video=441;  //480; //1/30
    }
    else
        _ExpCtrlTool_StartContiAE(0,0);
}

const char* ts_video_nd(int change, int arg)
{
    const char *rv = gui_nd_filter_state_enum(change, arg);
    if (change && video_ael)
    {
        shooting_set_nd_filter_state(*(int*)arg,1);
    }
    return rv;
}

const char* ts_video_ev(int change, int arg)
{
    if (change)
    {
        set_ev_video_avail(!video_ael);
        // force ND off unless AEL enabled
        shooting_set_nd_filter_state((video_ael)?conf.nd_filter_state:2,1);
    }
    return gui_on_off_enum(0, arg);
}

static char ev_tv[15];

const char* ts_video_tv_dn(int change, int arg)
{
    if (change)
    {
        set_tv_video(tv_video - 32);
    }
    sprintf(ev_tv,"%4d",tv_video);
    return ev_tv;
}

const char* ts_video_tv_up(int change, int arg)
{
    if (change)
    {
        set_tv_video(tv_video + 32);
    }
    sprintf(ev_tv,"%4d",tv_video);
    return ev_tv;
}

static char ev_av[15];

const char* ts_video_av_dn(int change, int arg)
{
    if (change)
    {
        set_av_video(av_video - 32);
    }
    sprintf(ev_av,"%4d",av_video);
    return ev_av;
}

const char* ts_video_av_up(int change, int arg)
{
    if (change)
    {
        set_av_video(av_video + 32);
    }
    sprintf(ev_av,"%4d",av_video);
    return ev_av;
}

static char ev_sv[15];

const char* ts_video_sv_dn(int change, int arg)
{
    if (change)
    {
        set_sv_video(sv_video - 32);
    }
    sprintf(ev_sv,"%4d",sv_video);
    return ev_sv;
}

const char* ts_video_sv_up(int change, int arg)
{
    if (change)
    {
        set_sv_video(sv_video + 32);
    }
    sprintf(ev_sv,"%4d",sv_video);
    return ev_sv;
}

static char debug_pg[15];

const char* ts_pg_dn(int change, int arg)
{
    if (change)
    {
        if ((*(int*)arg) > 0) (*(int*)arg)--;
    }
    sprintf(debug_pg,"%4d",(*(int*)arg));
    return debug_pg;
}

const char* ts_pg_up(int change, int arg)
{
    if (change)
    {
        (*(int*)arg)++;
    }
    sprintf(debug_pg,"%4d",(*(int*)arg));
    return debug_pg;
}

#if defined(TS_PLAY_POWER_HACK)
static int playbutton_hack;
static const char* simulate_playback_press(int change, int arg)
{
    void levent_set_play(void);
    if (change) levent_set_play();
    return 0;
}

static const char* simulate_power_press(int change, int arg)
{
    void camera_shutdown_in_a_second(void);
    if (change) camera_shutdown_in_a_second();
    return 0;
}
#endif

static KeyMap keymap[] = {

//  { 1, TOUCH_SCREEN       , 0x00000008 },  // Touch screen panel
    { 1, KEY_ZOOM_IN        , 0x00001000 },  // Found @0xff3d144c, levent 0x02
    { 1, KEY_ZOOM_OUT       , 0x00008000 },  // Found @0xff3d1454, levent 0x03
    { 2, KEY_SHOOT_FULL     , 0x00000a00 },  // Found @0xff3d146c, levent 0x01
    { 2, KEY_SHOOT_FULL_ONLY, 0x00000800 },	 // http://chdk.setepontos.com/index.php?topic=1444.msg70223#msg70223
    { 2, KEY_SHOOT_HALF     , 0x00000200 },  // Found @0xff3d1464, levent 0x00

    { 3, KEY_PRINT          , 0x00000001, LB(0,1), 0, "CHDK",  0,    GUI_MODE_NONE,      100, MODE_REC|MODE_PLAY|MODE_VID }, // virtual touch screen key

    //{ 3, TS_PG_DN, 0x40000000, RB(2,0), 0, "Pg -", 2, GUI_MODE_NONE, GUI_MODE_ALT, MODE_REC|MODE_PLAY|MODE_VID, &conf.debug_propcase_page, ts_pg_dn },
    //{ 3, TS_PG_UP, 0x80000000, RB(1,0), 0, "Pg +", 2, GUI_MODE_NONE, GUI_MODE_ALT, MODE_REC|MODE_PLAY|MODE_VID, &conf.debug_propcase_page, ts_pg_up },

	{ 3, TS_KEY_TOGGLE_EV   , 0x00008000, RB(0,2), 2, "AEL",       0,GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &video_ael, ts_video_ev,   &conf.touchscreen_disable_video_controls },
	{ 3, TS_UP_DN_BUTTON    , 0,         RBW(0,4), 2, " - Tv %s +",0,GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &tv_video, ts_video_tv_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_TV_DN, 0x00010000, RB(1,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &tv_video, ts_video_tv_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_TV_UP, 0x00020000, RB(0,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &tv_video, ts_video_tv_up, &conf.touchscreen_disable_video_controls },
	{ 3, TS_UP_DN_BUTTON    , 0,         RBW(2,4), 2, " - Av %s +",0,GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &av_video, ts_video_av_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_AV_DN, 0x00040000, RB(3,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &av_video, ts_video_av_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_AV_UP, 0x00080000, RB(2,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &av_video, ts_video_av_up, &conf.touchscreen_disable_video_controls },
	{ 3, TS_UP_DN_BUTTON    , 0,         RBW(4,4), 2, " - Sv %s +",0,GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &sv_video, ts_video_sv_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_SV_DN, 0x00100000, RB(5,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &sv_video, ts_video_sv_dn, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_SV_UP, 0x00200000, RB(4,4), 2, 0,  0,         GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &sv_video, ts_video_sv_up, &conf.touchscreen_disable_video_controls },
	{ 3, TS_KEY_TOGGLE_ND   , 0x00004000, LB(0,4), 2, "ND",    0,    GUI_MODE_NONE, GUI_MODE_NONE, MODE_VID, &conf.nd_filter_state, ts_video_nd, &conf.touchscreen_disable_video_controls },

    { 3, KEY_MENU		    , 0x00000002, LB(0,2), 0, "Menu",  0, GUI_MODE_ALT, 100, MODE_REC|MODE_PLAY },
	{ 3, KEY_SET		    , 0x00000004, LB(0,3), 0, "Set",   0, GUI_MODE_ALT, 100, MODE_REC|MODE_PLAY },

    { 3, TS_KEY_TOGGLE_RAW  , 0x00000100, RB(1,1), 1, "RAW",   0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.save_raw, gui_on_off_enum, &conf.touchscreen_disable_shortcut_controls },
    { 3, TS_KEY_TOGGLE_OSD  , 0x00000200, RB(1,2), 1, "OSD",   0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.show_osd, gui_on_off_enum, &conf.touchscreen_disable_shortcut_controls },
    { 3, TS_KEY_TOGGLE_OVRD , 0x00000400, RB(1,3), 1, "OvrDis",0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.override_disable, gui_override_disable_enum, &conf.touchscreen_disable_shortcut_controls },
    { 3, TS_KEY_TOGGLE_ZEBRA, 0x00000800, RB(2,1), 1, "Zebra", 0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.zebra_draw, gui_on_off_enum, &conf.touchscreen_disable_shortcut_controls },
    { 3, TS_KEY_TOGGLE_HISTO, 0x00001000, RB(2,2), 1, "Hist",  0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.show_histo, gui_histo_show_enum, &conf.touchscreen_disable_shortcut_controls },
    { 3, TS_KEY_TOGGLE_EDGE , 0x00002000, RB(2,3), 1, "Edge",  0, GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC|MODE_PLAY, &conf.edge_overlay_enable, gui_on_off_enum, &conf.touchscreen_disable_shortcut_controls },

#if defined(TS_PLAY_POWER_HACK)
    { 3, TS_KEY_PLAYBACK    , 0x00400000, LB(1,0), 0, "PLAY",  0,    GUI_MODE_ALT,       GUI_MODE_ALT,  MODE_REC|MODE_PLAY, &playbutton_hack, simulate_playback_press, 0 },
    { 3, TS_KEY_POWER       , 0x00800000, LB(3,0), 0, "OFF",   0,    GUI_MODE_ALT,       GUI_MODE_ALT,  MODE_REC|MODE_PLAY, &playbutton_hack, simulate_power_press, 0 },
#endif
#ifdef OPT_DEBUGGING
    { 3, KEY_DISPLAY        , 0x00000008, LB(0,4), 0, "Debug", 0,    GUI_MODE_ALT,       GUI_MODE_ALT,  MODE_REC|MODE_PLAY },
#endif
    { 3, KEY_DISPLAY	    , 0x00000008, LB(0,4), 0, "Back",  0,    GUI_MODE_MENU,      GUI_MODE_MENU, MODE_REC|MODE_PLAY },
	{ 3, KEY_DISPLAY	    , 0x00000008, LB(0,4), 0, "Disp",  0,    GUI_MODE_PALETTE,   100,           MODE_REC|MODE_PLAY },
    { 3, KEY_UP 		    , 0x00000010, RB(0,1), 0, "Up",    0,    GUI_MODE_MENU,      100,           MODE_REC|MODE_PLAY },
	{ 3, KEY_LEFT		    , 0x00000020, RB(0,2), 0, "Left",  0,    GUI_MODE_MENU,      100,           MODE_REC|MODE_PLAY },
    { 3, KEY_RIGHT		    , 0x00000040, RB(0,3), 0, "Right", 0,    GUI_MODE_MENU,      100,           MODE_REC|MODE_PLAY },
	{ 3, KEY_DOWN		    , 0x00000080, RB(0,4), 0, "Down",  0,    GUI_MODE_MENU,      100,           MODE_REC|MODE_PLAY },

    { 3, KEY_UP 		    , 0x00000010, RB(0,0), 0, "Man",   "Focus",  GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC, &conf.subj_dist_override_koef, 0, &conf.touchscreen_disable_shortcut_controls },
	{ 3, KEY_DISPLAY	    , 0x00000008, RB(0,1), 0, "Inf.",  "Focus",  GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC, 0, 0, &conf.touchscreen_disable_shortcut_controls },
	{ 3, KEY_DOWN		    , 0x00000080, RB(0,2), 0, "Hyper", "Focus",  GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC, 0, 0, &conf.touchscreen_disable_shortcut_controls },
	{ 3, KEY_LEFT		    , 0x00000020, RB(0,3), 0, "- Foc.","Factor", GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC, 0, 0, &conf.touchscreen_disable_shortcut_controls },
    { 3, KEY_RIGHT		    , 0x00000040, RB(0,4), 0, "+ Foc.","Factor", GUI_MODE_ALT, GUI_MODE_ALT, MODE_REC, 0, 0, &conf.touchscreen_disable_shortcut_controls },

	{ 0 } 
};

static int is_button_displayed(int b, int guiMode, int camMode)
{
    return (
            (keymap[b].grp == 3) && 
            (guiMode >= keymap[b].min_gui_mode) && 
            (guiMode <= keymap[b].max_gui_mode) && 
            (camMode & keymap[b].cam_mode_mask) &&
            ((keymap[b].conf_disable == 0) || (*keymap[b].conf_disable == 0))
           );
}

static int is_button_active(int b, int guiMode, int camMode)
{
    return (is_button_displayed(b, guiMode, camMode) && keymap[b].canonkey);
}

int show_virtual_buttons()
{
    extern char canon_play_menu_active;
    return (canon_menu_active==(int)&canon_menu_active-4) && (canon_shoot_menu_active==0) && (canon_play_menu_active == 0);
}

//int ts_proc_cnt = 0;
//int ts_redraw_cnt = 0;
//int ts_check_cnt = 0;

// Called from hooked touch panel task (boot.c)
// Return 0 to allow touch event to pass onto firmware, 1 to block event from firmware.
int chdk_process_touch()
{
    //ts_check_cnt++;

    // If in canon menu, let the firmware have all the touch events.
    if (!show_virtual_buttons()) return 0;

    int guiMode = gui_get_mode();
    int camMode = (movie_status==VIDEO_RECORD_IN_PROGRESS) ? MODE_VID : (mode_get() & MODE_MASK);

    // Touch co-ordinate
    unsigned short tx, ty;
    tx = ((touch_screen_x & 0x7FFF) >> 5) ^ 0x3FF;
    ty = ((touch_screen_y & 0x7FFF) >> 5) ^ 0x3FF;

    // Search for CHDK on screen buttons matching co-ordinate
    int i;
    for (i=0; keymap[i].hackkey; i++)
    {
        if ((tx >= keymap[i].x1) && (tx < keymap[i].x2) && (ty >= keymap[i].y1) && (ty < keymap[i].y2) && is_button_active(i,guiMode,camMode))
        {
            touch_panel_state &= ~keymap[i].canonkey;
        }
    }

    // If in alt mode (or about to enter alt mode) block event from firmware
    return (guiMode != 0) || (((touch_panel_state & 1) == 0) && ((kbd_mod_state[3] & 1) != 0));
}

int redraw_buttons = 1;

void virtual_buttons()
{
    int guiMode = gui_get_mode();
    char buf[30];

    // If shooting or in any Canon menus then don't display any CHDK buttons
    if (((guiMode == 0) && kbd_is_key_pressed(KEY_SHOOT_HALF)) || !show_virtual_buttons()) return;

    // Check if border of CHDK button is corrupted, force redraw if so
    if (!draw_test_pixel(0, 80, (guiMode)?COLOR_GREEN:COLOR_WHITE)) redraw_buttons = 1;

    if (redraw_buttons)
    {
        //ts_redraw_cnt++;

        int i, x1, y1, x2, y2, ofst;
        int camMode = (movie_status==VIDEO_RECORD_IN_PROGRESS) ? MODE_VID : (mode_get() & MODE_MASK);

        //c1 = MAKE_COLOR((camMode&MODE_VID)?COLOR_TRANSPARENT:COLOR_BLACK, COLOR_WHITE);
        //c2 = MAKE_COLOR((camMode&MODE_VID)?COLOR_TRANSPARENT:COLOR_RED, (camMode&MODE_VID)?COLOR_RED:COLOR_WHITE);
        color c1 = MAKE_COLOR(COLOR_TRANSPARENT, COLOR_WHITE);
        color c2 = MAKE_COLOR(COLOR_TRANSPARENT, COLOR_GREEN);

        for (i=0; keymap[i].hackkey; i++)
        {
            if (is_button_displayed(i, guiMode, camMode) && keymap[i].nm)
            {
                x1 = ((keymap[i].x1 - 70) * 480) / 910;
                x2 = ((keymap[i].x2 - 70) * 480) / 910 - 1;
                y1 = ((keymap[i].y1 - 90) * 240) / 900;
                y2 = ((keymap[i].y2 - 90) * 240) / 900 - 1;

                color cl = c1;
                if (guiMode && (keymap[i].hackkey == KEY_PRINT)) cl = c2;
                if (keymap[i].conf_val && *keymap[i].conf_val) cl = c2;

                draw_filled_round_rect_thick(x1, y1, x2, y2, cl, 3);

                ofst = 16;
                if (keymap[i].hackkey == TS_UP_DN_BUTTON)
                {
                    sprintf(buf,keymap[i].nm,(char*)keymap[i].chg_val(0,(int)keymap[i].conf_val));
                    draw_string(x1+4, y1+ofst, buf, cl);
                }
                else
                {
                    if (keymap[i].conf_val && keymap[i].chg_val)
                    {
                        ofst = 7;
                        strcpy(buf,(char*)keymap[i].chg_val(0,(int)keymap[i].conf_val));
                        buf[6] = 0;
                        draw_string(x1+4, y1+25, buf, cl);
                    }
                    else if (keymap[i].nm2)
                    {
                        ofst = 7;
                        draw_string(x1+4, y1+25, keymap[i].nm2, cl);
                    }
                    draw_string(x1+4, y1+ofst, keymap[i].nm, cl);
                }
            }
        }
    }

    redraw_buttons = 0;
}

int ts_process_touch()
{
    int rv = 0, i;

    if (touch_panel_state != 0xFFFFFFFF)
    {
        int guiMode = gui_get_mode();
        int camMode = (movie_status==VIDEO_RECORD_IN_PROGRESS) ? MODE_VID : (mode_get() & MODE_MASK);

        //ts_proc_cnt++;

        for (i=0; keymap[i].hackkey; i++)
        {
            if (is_button_active(i, guiMode, camMode))
            {
                if (kbd_is_key_clicked(keymap[i].hackkey))
                {
                    if (keymap[i].conf_val && keymap[i].chg_val)
                    {
                        keymap[i].chg_val(1,(int)keymap[i].conf_val);
                        rv = keymap[i].redraw & 1;
                    }
                    if (keymap[i].redraw & 2) redraw_buttons = 1;
                }
            }
        }
    }

    return rv;
}

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
debug_led(1);
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
						if((int)get_tick_count()-tick2>1000) {debug_led(0);}
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

debug_led(0);
asm volatile ("LDMFD SP!, {R0-R11,LR}\n"); // restore R0-R11 and LR from stack
}

static void __attribute__((noinline)) mykbd_task_proceed()
{
	while (physw_run){
		_SleepTask(*((int*)(0x1c3c+0x8)));

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

void my_kbd_read_keys()
{
	kbd_prev_state[0] = kbd_new_state[0];
	kbd_prev_state[1] = kbd_new_state[1];
	kbd_prev_state[2] = kbd_new_state[2];
	kbd_prev_state[3] = kbd_new_state[3];

	_GetKbdState(kbd_new_state);
	_kbd_read_keys_r2(kbd_new_state);

    if (touch_screen_active == 2)               // Touch screen activated?
    {
        kbd_new_state[3] = touch_panel_state;               // Yes, use virtual button state
    }
    else
    {
        kbd_new_state[3] = touch_panel_state = 0xFFFFFFFF;  // No, clear out virtual button state
    }

	if (kbd_process() == 0){
		// leave it alone...
          physw_status[0] = kbd_new_state[0];
          physw_status[1] = kbd_new_state[1];
          physw_status[2] = kbd_new_state[2];
	} else {
		// override keys
		physw_status[0] = (kbd_new_state[0] & (~KEYS_MASK0)) | (kbd_mod_state[0] & KEYS_MASK0);
		physw_status[1] = (kbd_new_state[1] & (~KEYS_MASK1)) | (kbd_mod_state[1] & KEYS_MASK1);
		physw_status[2] = (kbd_new_state[2] & (~KEYS_MASK2)) | (kbd_mod_state[2] & KEYS_MASK2);
	}

	remote_key = (physw_status[2] & USB_MASK)==USB_MASK;
	if (remote_key)
		remote_count += 1;
	else if (remote_count) {
		usb_power = remote_count;
		remote_count = 0;
	}
	if (conf.remote_enable) {
		physw_status[2] = physw_status[2] & ~(SD_READONLY_FLAG | USB_MASK);
	} else {
		physw_status[2] = physw_status[2] & ~SD_READONLY_FLAG;
	}
}


/****************/

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
    kbd_mod_state[3] = 0xFFFFFFFF;
}

long kbd_is_key_pressed(long key)
{
	int i;
	for (i=0;keymap[i].hackkey;i++)
    {
		if ((keymap[i].hackkey == key) && keymap[i].canonkey)
        {
			return ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0) ? 1:0;
		}
	}
	return 0;
}

long kbd_is_key_clicked(long key)
{
	int i;
	for (i=0;keymap[i].hackkey;i++)
    {
		if ((keymap[i].hackkey == key) && keymap[i].canonkey)
        {
			return ((kbd_prev_state[keymap[i].grp] & keymap[i].canonkey) != 0) &&
			       ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0);
		}
	}
	return 0;
}

long kbd_get_pressed_key()
{
	int i;
	for (i=0;keymap[i].hackkey;i++)
    {
		if (keymap[i].canonkey && ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0))
        {
			return keymap[i].hackkey;
		}
	}
	return 0;
}

long kbd_get_clicked_key()
{
	int i;
	for (i=0;keymap[i].hackkey;i++)
    {
		if (keymap[i].canonkey &&
            ((kbd_prev_state[keymap[i].grp] & keymap[i].canonkey) != 0) &&
		    ((kbd_new_state[keymap[i].grp] & keymap[i].canonkey) == 0))
        {
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
