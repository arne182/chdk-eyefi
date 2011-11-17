#ifndef GUI_MENU_H
#define GUI_MENU_H

//-------------------------------------------------------------------
#define MENUITEM_MASK           0x000f
#define MENUITEM_BOOL           1
#define MENUITEM_INT            2
#define MENUITEM_SUBMENU        3
#define MENUITEM_PROC           4
#define MENUITEM_UP             5
#define MENUITEM_TEXT           6
#define MENUITEM_SEPARATOR      7
#define MENUITEM_ENUM           8
#define MENUITEM_COLOR_BG       9
#define MENUITEM_COLOR_FG       10
#define MENUITEM_ENUM2          11
#define MENUITEM_DYNAMIC_SUB    12

// Flags, which describe limits of F_INT value
#define MENUITEM_F_MASK         0x00f0
#define MENUITEM_F_UNSIGNED     0x0010
#define MENUITEM_F_MIN          0x0020
#define MENUITEM_F_MAX          0x0040
#define MENUITEM_F_MINMAX       0x0060

// Value, which specify specific kind of argument
#define MENUITEM_ARG_MASK       0x0f00
    // menuitem.arg contain incrementor value
#define MENUITEM_ARG_INC        0x0100
    // menuitem.arg contain (int*) to incrementor
#define MENUITEM_ARG_ADDR_INC   0x0200
    // menuitem.arg contain ptr to callback function
#define MENUITEM_ARG_CALLBACK   0x0300

#define MENU_MINMAX(min, max)   (((max)<<16)|(min))

//-------------------------------------------------------------------
typedef struct {
    char                symbol;     // menuitem icon symbol
    char                opt_len;    // ENUM2 num of elements 
    short               type;       // MENUITEM_MASKS
    int                 text;       // Text
    int                 *value;     // pointer to binded variable
                                    //   exceptions: _PROC = pointer to processing func
                                    //               _ENUM = pointer to processing func
    int                 arg;        // additional argument
                                    //     by default type is controled by _ARG_MASK and by _F_MINMAX
                                    //     for ENUM2 - pointer to string list
} CMenuItem;

typedef struct {
    char                symbol;
    short               title;
    void                (*on_change)(unsigned int item);
    const CMenuItem     *menu;
} CMenu;

// Menu item constructor macros
#define MENU_ITEM(sym, txt, typ, val, arg)  { (char)sym, 0, (short)typ, (int)txt, (int*)val, (int)arg }
#define MENU_ENUM2(sym, txt, val, arg)      { (char)sym, sizeof(arg)/sizeof(arg[0]), MENUITEM_ENUM2, (int)txt, (int*)val, (int)arg }
#define MENU_ENUM2a(sym, txt, val, arg, num){ (char)sym, (char)num, MENUITEM_ENUM2, (int)txt, (int*)val, (int)arg }

//-------------------------------------------------------------------
extern void gui_menu_init(CMenu *menu_ptr);
extern void gui_menu_kbd_process();
extern void gui_menu_draw();
extern void mod_user_menu(CMenuItem curr_menu_item, int* gui_menu_add_item, int mod);
extern void gui_menu_force_redraw();
extern void gui_enter_submenu(CMenu* submenu);
//-------------------------------------------------------------------
#endif
