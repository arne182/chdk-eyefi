#include "stdlib.h"
#include "keyboard.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "gui.h"
#include "gui_draw.h"
#include "gui_batt.h"
//-------------------------------------------------------------------

static char osd_buf[32];

//-------------------------------------------------------------------
static long get_batt_average() {
    #define VOLTS_N         100
    static unsigned short   volts[VOLTS_N] = {0};
    static unsigned int     n = 0, rn = 0;
    static unsigned long    volt_aver = 0;

    volt_aver-=volts[n];
    volts[n]=(unsigned short)stat_get_vbatt();
    volt_aver+=volts[n];
    if (++n>rn) rn=n;
    if (n>=VOLTS_N) n=0;
    return volt_aver/rn;
}

//-------------------------------------------------------------------
unsigned long get_batt_perc() {
    unsigned long v;

    v = get_batt_average();
    if (v>conf.batt_volts_max) v=conf.batt_volts_max;
    if (v<conf.batt_volts_min) v=conf.batt_volts_min;
    return (v-conf.batt_volts_min)*100/(conf.batt_volts_max-conf.batt_volts_min);
}

//-------------------------------------------------------------------
static void gui_batt_draw_icon () {
    coord x;
    register coord xx, yy;
    
    xx = conf.batt_icon_pos.x;
    yy = conf.batt_icon_pos.y;

    int perc = get_batt_perc();

#if defined(CAM_USE_COLORED_ICONS)

    draw_get_icon_colors();

    // set bar color depending percent
    color cl1 = (perc>50) ? icon_green[0] : (perc<=20) ? icon_red[0] : icon_yellow[0];
    color cl2 = (perc>50) ? icon_green[1] : (perc<=20) ? icon_red[1] : icon_yellow[1];
    color cl3 = (perc>50) ? icon_green[2] : (perc<=20) ? icon_red[2] : icon_yellow[2];

    // icon
    draw_vline(xx, yy+5, 2, icon_grey[1]);
    draw_filled_rect(xx+1, yy+4, xx+2, yy+8, MAKE_COLOR(icon_yellow[0], icon_yellow[0]));
    draw_rect(xx+3, yy, xx+31, yy+12, icon_grey[1]);
    draw_hline(xx+4, yy+1,  26, icon_grey[2]);
    draw_hline(xx+4, yy+11, 26, icon_grey[1]);
    // fill icon
    draw_rect(xx+4,           yy+2,   xx+30,  yy+10,  cl1);
    draw_filled_rect(xx+5,    yy+6,   xx+28-(25*perc/100),  yy+9,  MAKE_COLOR(icon_grey[1], icon_grey[1]));
    draw_filled_rect(xx+5,    yy+3,   xx+28-(25*perc/100),  yy+5,   MAKE_COLOR(icon_grey[2], icon_grey[2]));
    draw_filled_rect(xx+29-(25*perc/100),    yy+6,     xx+29,   yy+9,  MAKE_COLOR(cl2, cl2));
    draw_filled_rect(xx+29-(25*perc/100),    yy+3,     xx+29,   yy+5,  MAKE_COLOR(cl3, cl3));

#else

    color cl = (perc<=20)?conf.osd_color_warn:(conf.batt_icon_color&0xFF);

    // battery icon
    draw_rect(xx+3-1,    yy+1,     xx+3+25+1, yy+1+10,  cl);
    draw_rect(xx+3-3,    yy+1+2,   xx+3-2,    yy+1+8,   cl);
    draw_vline(xx+3-4,    yy+1+2-1, 8,   COLOR_BLACK);  // l
    draw_hline(xx+3-2,    yy+1-1,   29,  COLOR_BLACK);  // t
    draw_hline(xx+3-2,    yy+1+11,  29,  COLOR_BLACK);  // b
    draw_vline(xx+3+25+2, yy+1-1,   11,  COLOR_BLACK);  // r

    // battery fill
    x = xx+3+1+25-(perc/4);
    if (x<=xx+3) x=xx+3+1;
    if (x>xx+3+25+1) x=xx+3+25+1;
    draw_filled_rect(xx+3, yy+1+1, x-1, yy+1+9, MAKE_COLOR(COLOR_TRANSPARENT, COLOR_BLACK));
    draw_filled_rect(x, yy+1+1, xx+3+25, yy+1+9, MAKE_COLOR(cl, cl));

#endif
}

//-------------------------------------------------------------------
static void gui_batt_draw_charge() {
    int perc = get_batt_perc();
    color cl = (perc<=20)?conf.osd_color_warn:conf.osd_color;
    sprintf(osd_buf, "%3d%%", perc);
    osd_buf[5]=0;
    draw_string(conf.batt_txt_pos.x, conf.batt_txt_pos.y, osd_buf, cl);
}

//-------------------------------------------------------------------
static void gui_batt_draw_volts() {
    unsigned long v;

    v = get_batt_average();
    sprintf(osd_buf, "%ld.%03ld", v/1000, v%1000);
    osd_buf[5]=0;
    draw_string(conf.batt_txt_pos.x, conf.batt_txt_pos.y, osd_buf, conf.osd_color);
}

//-------------------------------------------------------------------
void gui_batt_draw_osd() {
    if (conf.batt_perc_show) {
        gui_batt_draw_charge();
    } else if (conf.batt_volts_show) {
        gui_batt_draw_volts();
    }

    if (conf.batt_icon_show) {
        gui_batt_draw_icon();
    }
}

//-------------------------------------------------------------------
