#include "stdlib.h"
#include "keyboard.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "gui.h"
#include "gui_draw.h"
#include "gui_usb.h"

//-------------------------------------------------------------------
void gui_usb_draw_icon() {

    color cl1 = COLOR_BG;
    color cl2 = COLOR_GREY;
    color cl3 = COLOR_YELLOW;

    // usb icon
    draw_filled_round_rect(conf.usb_info_pos.x+3, conf.usb_info_pos.y+11, conf.usb_info_pos.x+29, conf.usb_info_pos.y+14, MAKE_COLOR(cl1, cl1));
    draw_filled_round_rect(conf.usb_info_pos.x,   conf.usb_info_pos.y,    conf.usb_info_pos.x+31, conf.usb_info_pos.y+11, MAKE_COLOR(cl1, cl1));
    
    draw_filled_rect(conf.usb_info_pos.x+2,       conf.usb_info_pos.y+1,  conf.usb_info_pos.x+29, conf.usb_info_pos.y+2,  MAKE_COLOR(cl2, cl2));
    
    draw_filled_rect(conf.usb_info_pos.x+1,       conf.usb_info_pos.y+2,  conf.usb_info_pos.x+2,  conf.usb_info_pos.y+8,  MAKE_COLOR(cl2, cl2));
    draw_filled_rect(conf.usb_info_pos.x+29,      conf.usb_info_pos.y+2,  conf.usb_info_pos.x+30, conf.usb_info_pos.y+8,  MAKE_COLOR(cl2, cl2));
    
    draw_filled_rect(conf.usb_info_pos.x+5,       conf.usb_info_pos.y+5,  conf.usb_info_pos.x+26, conf.usb_info_pos.y+8,  MAKE_COLOR(cl2, cl2));
    
    draw_filled_rect(conf.usb_info_pos.x+7,       conf.usb_info_pos.y+7,  conf.usb_info_pos.x+9,  conf.usb_info_pos.y+8,  MAKE_COLOR(cl3, cl3));
    draw_filled_rect(conf.usb_info_pos.x+12,      conf.usb_info_pos.y+7,  conf.usb_info_pos.x+14, conf.usb_info_pos.y+8,  MAKE_COLOR(cl3, cl3));
    draw_filled_rect(conf.usb_info_pos.x+17,      conf.usb_info_pos.y+7,  conf.usb_info_pos.x+19, conf.usb_info_pos.y+8,  MAKE_COLOR(cl3, cl3));
    draw_filled_rect(conf.usb_info_pos.x+22,      conf.usb_info_pos.y+7,  conf.usb_info_pos.x+24, conf.usb_info_pos.y+8,  MAKE_COLOR(cl3, cl3));
    
    draw_filled_rect(conf.usb_info_pos.x+2,       conf.usb_info_pos.y+9,  conf.usb_info_pos.x+3,  conf.usb_info_pos.y+10, MAKE_COLOR(cl2, cl2));
    draw_filled_rect(conf.usb_info_pos.x+28,      conf.usb_info_pos.y+9,  conf.usb_info_pos.x+29, conf.usb_info_pos.y+10, MAKE_COLOR(cl2, cl2));
    
    draw_filled_rect(conf.usb_info_pos.x+3,       conf.usb_info_pos.y+11, conf.usb_info_pos.x+4,  conf.usb_info_pos.y+12, MAKE_COLOR(cl2, cl2));
    draw_filled_rect(conf.usb_info_pos.x+27,      conf.usb_info_pos.y+11, conf.usb_info_pos.x+28, conf.usb_info_pos.y+12, MAKE_COLOR(cl2, cl2));
    
    draw_filled_rect(conf.usb_info_pos.x+5,       conf.usb_info_pos.y+12, conf.usb_info_pos.x+26, conf.usb_info_pos.y+13, MAKE_COLOR(cl2, cl2));
}

//-------------------------------------------------------------------
static void gui_usb_draw_text(){
    color cl = conf.osd_color;
    draw_string(conf.usb_info_pos.x, conf.usb_info_pos.y, "<USB>", cl);
}

//--------------------------------------------------------------------
void gui_usb_draw_osd() {
   
    if (conf.usb_info_enable == 1 && conf.remote_enable) {
        gui_usb_draw_icon();
    }
    if (conf.usb_info_enable == 2 && conf.remote_enable) {
        gui_usb_draw_text();
    }
}
