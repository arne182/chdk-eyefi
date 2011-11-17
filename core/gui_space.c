#include "stdlib.h"
#include "keyboard.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "gui.h"
#include "gui_draw.h"
#include "gui_batt.h"
#include "gui_space.h"
//-------------------------------------------------------------------

static char osd_buf[32];

//-------------------------------------------------------------------

unsigned long get_space_perc() {
    return GetFreeCardSpaceKb()*100/GetTotalCardSpaceKb();
}

// Local variables used by various space display functions, setup in space_color
static color cl;
static coord xx, yy;
static int perc, width, height;

// Set up color and percent free variables for free space OSD
static void space_color()
{
    perc = get_space_perc();
    cl = conf.space_color;
    if (((conf.space_warn_type == 0) && (perc <= conf.space_perc_warn)) ||
        ((conf.space_warn_type == 1) && (GetFreeCardSpaceKb() <= conf.space_mb_warn*1024)))
    {
        cl = conf.osd_color_warn;
    }
}

// Setup position and size variables then draw free space bar, outer shape
static void spacebar_outer(OSD_pos pos, int w, int h)
{
    // Get color and percent free
    space_color();

    // space icon / bar position
    xx = pos.x;
    yy = pos.y;

    // space icon / bar size
    width = w;
    height = h;

    // Clamp co-ordinates to keep bar on screen
    if (xx > (screen_width-width-4)) {
        xx = screen_width-width-4;
    }
    if (yy > (screen_height-height-4)) {
        yy = screen_height-height-4;
    }

    draw_rect(xx, yy, xx+width+3, yy+height+3, COLOR_BLACK);     // Outer black rectangle
    draw_rect(xx+1, yy+1, xx+width+2, yy+height+2, cl);          // Inner white/red rectangle
}

static void gui_space_draw_spacebar_horizontal() {
    coord x;

    // Setup and draw outer shape
    spacebar_outer(conf.space_hor_pos, (screen_width / (4 >> conf.space_bar_size)) - 4, conf.space_bar_width);

    // space bar fill
    x = width - ((perc*width)/100);
    if (x < 1) x = 1;
    if (x >= width) x = width;
    else draw_filled_rect(xx+x+2, yy+2, xx+width+1, yy+height+1, MAKE_COLOR(cl, cl));               // If not empty fill 'free' space area
    draw_filled_rect(xx+2, yy+2, xx+x+1, yy+height+1, MAKE_COLOR(COLOR_TRANSPARENT, COLOR_BLACK));  // fill 'used' space area
}

static void gui_space_draw_spacebar_vertical() {
    coord y;

    // Setup and draw outer shape
    spacebar_outer(conf.space_ver_pos, conf.space_bar_width, (screen_height / (4 >> conf.space_bar_size)) - 4);

    // space bar fill
    y = height - ((perc*height)/100);
    if (y < 1) y = 1;
    if (y >= height) y = height;
    else draw_filled_rect(xx+2, yy+y+2, xx+width+1, yy+height+1, MAKE_COLOR(cl, cl));               // If not empty fill 'free' space area
    draw_filled_rect(xx+2, yy+2, xx+width+1, yy+y+1, MAKE_COLOR(COLOR_TRANSPARENT, COLOR_BLACK));   // fill 'used' space area
}

static void gui_space_draw_icon() {
    coord x;
    register coord xx, yy;
    int i;

    xx = conf.space_icon_pos.x;
    yy = conf.space_icon_pos.y;

    space_color();
    
#if defined(CAM_USE_COLORED_ICONS)

    draw_get_icon_colors();

    color cl1 = icon_green[1];
    color cl2 = icon_green[0];
    if (((conf.space_warn_type == 0) && (perc <= conf.space_perc_warn)) ||
        ((conf.space_warn_type == 1) && (GetFreeCardSpaceKb() <= conf.space_mb_warn*1024)))
    {
        cl1 = icon_red[1];
        cl2 = icon_red[0];
    } 
  
    //icon
    draw_hline(xx,    yy,    30,  icon_grey[2]);
    draw_vline(xx,    yy,    12,  icon_grey[2]);
    draw_vline(xx+31, yy,    18,  icon_grey[0]);
    draw_line(xx+1,   yy+13, xx+5, yy+17, icon_grey[0]);
    draw_hline(xx+6,  yy+18, 24,  icon_grey[0]);
           
    draw_filled_rect(xx+1,  yy+1,   xx+30,   yy+13,  MAKE_COLOR(icon_grey[1], icon_grey[1]));
    draw_filled_rect(xx+5,  yy+14,  xx+30,   yy+17,  MAKE_COLOR(icon_grey[1], icon_grey[1]));
    draw_filled_rect(xx+3,  yy+14,  xx+6,    yy+15,  MAKE_COLOR(icon_grey[1], icon_grey[1]));
    
    draw_filled_rect(xx+2,  yy+2,   xx+6,    yy+4,   MAKE_COLOR(icon_yellow[0], icon_yellow[0]));
    draw_filled_rect(xx+2,  yy+6,   xx+6,    yy+7,   MAKE_COLOR(icon_yellow[0], icon_yellow[0]));
    draw_filled_rect(xx+2,  yy+9,   xx+6,    yy+10,  MAKE_COLOR(icon_yellow[0], icon_yellow[0]));
    draw_filled_rect(xx+2,  yy+12,  xx+6,    yy+13,  MAKE_COLOR(icon_yellow[0], icon_yellow[0]));
    draw_filled_rect(xx+5,  yy+15,  xx+9,    yy+16,  MAKE_COLOR(icon_yellow[0], icon_yellow[0]));   
    
    draw_hline(xx+8,  yy,    2, COLOR_TRANSPARENT);
    draw_hline(xx+11, yy,    3, icon_grey[0]);
    draw_hline(xx+11, yy+18, 2, COLOR_TRANSPARENT);

    //fill icon
    draw_rect(xx+9,         yy+4,   xx+28,   yy+13,  cl1);
    draw_filled_rect(xx+27-(17*perc/100),      yy+5,       xx+27,     yy+12,   MAKE_COLOR(cl2, cl2));

#else

#define LE  23
#define WI  15

    draw_hline(xx+5,     yy,      LE-5,     COLOR_BLACK);          // outer top
    draw_hline(xx+6,     yy+1,    LE-7,     cl);                   // inner top
    draw_vline(xx,       yy+5,    WI-5,     COLOR_BLACK);          // outer left
    draw_vline(xx+1,     yy+6,    WI-7,     cl);                   // inner left
    draw_hline(xx,       yy+WI,   LE,       COLOR_BLACK);          // outer bottom
    draw_hline(xx+1,     yy+WI-1, LE-2,     cl);                   // inner bottom
    draw_vline(xx+LE,    yy,      WI,       COLOR_BLACK);          // outer right
    draw_vline(xx+LE-1,  yy+1,    WI-2,     cl);                   // inner right
    draw_line(xx+5,      yy,      xx,       yy+5,  COLOR_BLACK);   // edge
    draw_line(xx+5,      yy+1,    xx+1,     yy+5,  cl);            // edge
    draw_line(xx+6,      yy+1,    xx+1,     yy+6,  cl);            // edge

    // memory fill
    x = LE - (perc*(LE-3)/100) - 2;
    if (x>5) draw_hline(xx+6,      yy+2,     x-6,     COLOR_BLACK);
    if (x>2) draw_hline(xx+x+1,    yy+2,     LE-x-3,  cl);
    else     draw_hline(xx+4,      yy+2,     LE-6,    cl);
    for(i=3; i<7; i++) {                                                   //          /--------------|
        if (x>7-i) draw_pixel(xx+8-i,     yy+i,     COLOR_BLACK);          //        /  1st for loop  |
        if (x>7-i) draw_pixel(xx+x,       yy+i,     COLOR_BLACK);          //      /__________________|
        draw_hline(xx+x+1, yy+i, LE-x-3, cl);                              //     |                   |
    }                                                                      //     |     2nd for loop  |
    for(i=7; i<WI-2; i++) {                                                //     |                   |
        if (x>1) draw_pixel(xx+2, yy+i, COLOR_BLACK);                      //     |-------------------|
        if (x>1) draw_pixel(xx+x, yy+i, COLOR_BLACK);
        draw_hline(xx+x+1, yy+i, LE-x-3, cl);
    }
    if (x>1) draw_hline(xx+2,      yy+WI-2,    x-2,     COLOR_BLACK);
    draw_hline(xx+x+1,             yy+WI-2,    LE-x-3,  cl);

#endif
}

//-------------------------------------------------------------------
static void gui_space_draw_percent() {
    space_color();
    sprintf(osd_buf, "%3d%%", perc);
    osd_buf[5]=0;
    draw_string(conf.space_txt_pos.x, conf.space_txt_pos.y, osd_buf, cl);
}

//-------------------------------------------------------------------
static void gui_space_draw_mb() {
    space_color();
    unsigned int freemb=GetFreeCardSpaceKb()/1024;
    if (freemb < 10000) sprintf(osd_buf, "%3d%M",freemb);
    else sprintf(osd_buf, "%3d%G",freemb/1024);   // if 10 GiB or more free, print in GiB instead of MiB
    osd_buf[5]=0;
    draw_string(conf.space_txt_pos.x, conf.space_txt_pos.y, osd_buf, cl);
}

//-------------------------------------------------------------------

void gui_space_draw_osd() {
    if (conf.space_icon_show) {
        gui_space_draw_icon();
    }
    if (conf.space_perc_show) {
        gui_space_draw_percent();
    } else if (conf.space_mb_show) {
        gui_space_draw_mb();
    }
    if (conf.space_bar_show==1) {
        gui_space_draw_spacebar_horizontal();
    } else if (conf.space_bar_show==2) {
        gui_space_draw_spacebar_vertical();
    }
}
