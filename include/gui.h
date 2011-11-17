#ifndef GUI_H
#define GUI_H

typedef unsigned int      coord;
typedef unsigned short    color;

#define MAKE_COLOR(bg, fg)    ((color)((((char)(bg))<<8)|((char)(fg))))

// Don't delete or re-order entries unless guiHandlers (gui.c) table is updated to match 
enum Gui_Mode {
    GUI_MODE_NONE = 0,
    GUI_MODE_ALT,
    GUI_MODE_MENU,
    GUI_MODE_PALETTE,
    GUI_MODE_MBOX,
    GUI_MODE_REVERSI,
    GUI_MODE_SOKOBAN,
    GUI_MODE_DEBUG,
    GUI_MODE_FSELECT,
    GUI_MODE_READ,
    GUI_MODE_OSD,
    GUI_MODE_CALENDAR,
    GUI_MODE_BENCH,
    GUI_MODE_MPOPUP,
    GUI_MODE_4WINS,
    GUI_MODE_MASTERMIND,
    GUI_MODE_EYEFI
};

extern void gui_redraw();
extern void gui_force_restore();

extern void draw_pixel(coord x, coord y, color cl);

extern enum Gui_Mode gui_get_mode();
extern void gui_set_mode(enum Gui_Mode mode);

#ifdef OPT_SCRIPTING
extern void gui_update_script_submenu();
#endif

#endif
