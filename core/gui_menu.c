#include "stdlib.h"
#include "platform.h"
#include "core.h"
#include "keyboard.h"
#include "conf.h"
#include "font.h"
#include "lang.h"
#include "gui.h"
#include "gui_draw.h"
#include "gui_palette.h"
#include "gui_menu.h"
#include "gui_lang.h"

//-------------------------------------------------------------------
#define MENUSTACK_MAXDEPTH  4

//-------------------------------------------------------------------
typedef struct {
    CMenu       *menu;
    int         curpos;
    int         toppos;
} CMenuStacked;

//-------------------------------------------------------------------

static CMenu        *curr_menu;
static CMenuStacked gui_menu_stack[MENUSTACK_MAXDEPTH];
static unsigned int gui_menu_stack_ptr;
static int          gui_menu_curr_item;
static int          gui_menu_top_item;
static int          gui_menu_redraw;

static int          count;
static int          x, y;
static int          w, num_lines;
static int          len_bool, len_int, len_enum, len_space, len_br1, len_br2, cl_rect;
static int          int_incr, incr_modified;
static unsigned char *item_color;

//-------------------------------------------------------------------
static void gui_menu_set_curr_menu(CMenu *menu_ptr, int top_item, int curr_item) {
    curr_menu = menu_ptr;
    gui_menu_top_item = top_item;
    gui_menu_curr_item = curr_item;
}

//-------------------------------------------------------------------
void gui_menu_init(CMenu *menu_ptr) {
    if (menu_ptr) {
        if (conf.menu_select_first_entry)
            gui_menu_set_curr_menu(menu_ptr, 0, 0);
        else 
            gui_menu_set_curr_menu(menu_ptr, 0, -1);
        gui_menu_stack_ptr = 0;
    }

    num_lines = screen_height/rbf_font_height()-1;
    x = CAM_MENU_BORDERWIDTH;
    w = screen_width-x-x;
    len_bool = rbf_str_width("\x95");
    len_int = rbf_str_width("99999");
    len_enum = rbf_str_width("WUBfS3a");
    len_space = rbf_char_width(' ');
    len_br1 = rbf_char_width('[');
    len_br2 = rbf_char_width(']');
    cl_rect = rbf_font_height() - 4;
    int_incr = 1;

    gui_menu_redraw=2;
}

//-------------------------------------------------------------------
int gui_menu_rows()
{
    int n;
    // Count the numer of rows in current menu
    for(n = 0; curr_menu->menu[n].text; n++);
    return n;
}

//-------------------------------------------------------------------
// Called from other gui functions to force redraw of menu
void gui_menu_force_redraw()
{
    if (gui_get_mode() == GUI_MODE_MENU)
    {
        gui_menu_redraw = 2;
    }
}

//-------------------------------------------------------------------
// Full screen erase and redraw of menu
static void gui_menu_erase_and_redraw()
{
    gui_menu_redraw = 2;
    draw_restore();
    gui_force_restore();
}

//-------------------------------------------------------------------
// Function passed to gui_palette_init
// This is called when a new color is selected to update the menu / config value
static void gui_menu_color_selected(color clr)
{
    *item_color = (unsigned char)(clr&0xFF);
    gui_menu_erase_and_redraw();
}

//-------------------------------------------------------------------
// Return to previous menu on stack
static void gui_menu_back() {
    if (gui_menu_stack_ptr > 0)
    {
        gui_menu_stack_ptr--;
        gui_menu_set_curr_menu(gui_menu_stack[gui_menu_stack_ptr].menu, gui_menu_stack[gui_menu_stack_ptr].toppos, gui_menu_stack[gui_menu_stack_ptr].curpos);
        gui_menu_erase_and_redraw();
    }
}

//-------------------------------------------------------------------
// Helper functions for gui_menu_kbd_process
//  common code blocks extracted to try and make it easier to understand

// If updating an 'int' value check if other buttons are also pressed, and set increment accordingly
// E.G. if ZOOM_OUT is held then RIGHT pressed the 'int' value will be incremented by 10, ZOOM_IN + RIGHT increment by 100
static void get_int_incr_from_button()
{
    if (kbd_is_key_pressed(KEY_ZOOM_OUT))
    {
        int_incr=10;
        incr_modified=1;
    }
    if (kbd_is_key_pressed(KEY_ZOOM_IN))
    {
        int_incr=100;
        incr_modified=1;
    }
    if (kbd_is_key_pressed(KEY_SHOOT_HALF))
    {
        int_incr=1000;
        incr_modified=1;
    }
}

// After updating a value check for callback and on_change functions and call if necessary
static void do_callback()
{
    if ((curr_menu->menu[gui_menu_curr_item].type & MENUITEM_ARG_MASK) == MENUITEM_ARG_CALLBACK && curr_menu->menu[gui_menu_curr_item].arg)
    {
        ((void (*)())(curr_menu->menu[gui_menu_curr_item].arg))();
    }

    if (curr_menu->on_change)
    {
        curr_menu->on_change(gui_menu_curr_item);
    }
}

// Update an 'int' value, direction = 1 for increment, -1 for decrement
static void update_int_value(int direction)
{
    // set amount to increment by (int_incr) if other buttons pressed
    get_int_incr_from_button();

    // do update based on 'int' sub-type
    switch (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_ARG_MASK)
    {
        case MENUITEM_ARG_INC:
            *(curr_menu->menu[gui_menu_curr_item].value) += curr_menu->menu[gui_menu_curr_item].arg * direction;
            break;
        case MENUITEM_ARG_ADDR_INC:
            *(curr_menu->menu[gui_menu_curr_item].value) += *(int *)(curr_menu->menu[gui_menu_curr_item].arg) * direction;
            break;
        default:
            *(curr_menu->menu[gui_menu_curr_item].value) += int_incr * direction;
            break;
    }

    // Limit new value to defined bounds
    if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_UNSIGNED)
    {
        if (*(curr_menu->menu[gui_menu_curr_item].value) < 0) 
            *(curr_menu->menu[gui_menu_curr_item].value) = 0;

        if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_MIN)
        {
            if (*(curr_menu->menu[gui_menu_curr_item].value) < (unsigned short)(curr_menu->menu[gui_menu_curr_item].arg & 0xFFFF)) 
                *(curr_menu->menu[gui_menu_curr_item].value) = (unsigned short)(curr_menu->menu[gui_menu_curr_item].arg & 0xFFFF);
        }
    }
    else
    {
        if (*(curr_menu->menu[gui_menu_curr_item].value) < -9999) 
            *(curr_menu->menu[gui_menu_curr_item].value) = -9999;

        if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_MIN)
        {
            if (*(curr_menu->menu[gui_menu_curr_item].value) < (short)(curr_menu->menu[gui_menu_curr_item].arg & 0xFFFF)) 
                *(curr_menu->menu[gui_menu_curr_item].value) = (short)(curr_menu->menu[gui_menu_curr_item].arg & 0xFFFF);
        }
    }

    if (*(curr_menu->menu[gui_menu_curr_item].value) > 99999) 
        *(curr_menu->menu[gui_menu_curr_item].value) = 99999;

    if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_UNSIGNED)
    {
        if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_MAX)
        {
            if (*(curr_menu->menu[gui_menu_curr_item].value) > (unsigned short)((curr_menu->menu[gui_menu_curr_item].arg>>16) & 0xFFFF)) 
                *(curr_menu->menu[gui_menu_curr_item].value) = (unsigned short)((curr_menu->menu[gui_menu_curr_item].arg>>16) & 0xFFFF);
        }
    }
    else
    {
        if ( curr_menu->menu[gui_menu_curr_item].type & MENUITEM_F_MAX)
        {
            if (*(curr_menu->menu[gui_menu_curr_item].value) > (short)((curr_menu->menu[gui_menu_curr_item].arg>>16) & 0xFFFF)) 
                *(curr_menu->menu[gui_menu_curr_item].value) = (short)((curr_menu->menu[gui_menu_curr_item].arg>>16) & 0xFFFF);
        }
    }

    // execute custom callback and on_change functions
    do_callback();

    // reset int_incr if necessary
    if (incr_modified)
    {
        int_incr=1;
        incr_modified=0;
        draw_string(FONT_WIDTH*2,0,"    ", MAKE_COLOR(COLOR_TRANSPARENT, COLOR_TRANSPARENT));
    }

    // force menu redraw
    gui_menu_redraw=1;
}

// Update a 'bool' value
static void update_bool_value()
{
    // update value
    *(curr_menu->menu[gui_menu_curr_item].value) = !(*(curr_menu->menu[gui_menu_curr_item].value));

    // execute custom callback and on_change functions
    do_callback();

    // force menu redraw
    gui_menu_redraw=1;
}

// Update an 'enum' value, direction = 1 for increment, -1 for decrement
static void update_enum_value(int direction)
{
    // update value
    if (curr_menu->menu[gui_menu_curr_item].value)
    {
        int c;
        if (kbd_is_key_pressed(KEY_SHOOT_HALF)) c=3;
        else if (kbd_is_key_pressed(KEY_ZOOM_IN)) c=6;
        else if (kbd_is_key_pressed(KEY_ZOOM_OUT)) c=3;
        else c=1;
        if ((curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK) == MENUITEM_ENUM)
        {
            ((const char* (*)(int change, int arg))(curr_menu->menu[gui_menu_curr_item].value))(c*direction, curr_menu->menu[gui_menu_curr_item].arg);
        }
        else
        {
            extern const char* gui_change_enum2(const CMenuItem *menu_item, int change);
            gui_change_enum2(&curr_menu->menu[gui_menu_curr_item], c*direction);
        }
    }

    // force menu redraw
    gui_menu_redraw=1;
}

// Open a sub-menu
static void select_sub_menu()
{
    // push current menu on stack
    gui_menu_stack[gui_menu_stack_ptr].menu = curr_menu;
    gui_menu_stack[gui_menu_stack_ptr].curpos = gui_menu_curr_item;
    gui_menu_stack[gui_menu_stack_ptr].toppos = gui_menu_top_item;

    // Select first item in menu, (or none)
    if (conf.menu_select_first_entry)
    {
        gui_menu_set_curr_menu((CMenu*)(curr_menu->menu[gui_menu_curr_item].value), 0, 0);
        if ((curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK)==MENUITEM_TEXT || (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK)==MENUITEM_SEPARATOR)
        {
            //++gui_menu_top_item;
            ++gui_menu_curr_item;
        }
    }
    else 
        gui_menu_set_curr_menu((CMenu*)(curr_menu->menu[gui_menu_curr_item].value), 0, -1);

    gui_menu_stack_ptr++;

    // FIXME check on stack overrun;
    if (gui_menu_stack_ptr > MENUSTACK_MAXDEPTH)
    {
        draw_txt_string(0, 0, "E1", MAKE_COLOR(COLOR_RED, COLOR_YELLOW));
        gui_menu_stack_ptr = 0;
    }

    // Force full redraw
    gui_menu_erase_and_redraw();
}

// Move up / down in menu, adjusting scroll position if needed
//   increment = -1 to move up, 1 to move down
static void gui_menu_updown(int increment)
{
    int c, j;

    // Determine number of rows to move (1 or 4)
    if (kbd_is_key_pressed(KEY_SHOOT_HALF) || kbd_is_key_pressed(KEY_ZOOM_IN) || kbd_is_key_pressed(KEY_ZOOM_OUT)) c=4; else c=1;

    for (j = 0; j < c; ++j)
    {
        do
        {
            // Move to next or previous row
            gui_menu_curr_item += increment;

            if (gui_menu_curr_item < 0)                                     // Off top, move to bottom
            {
                gui_menu_curr_item = gui_menu_rows() - 1;
                gui_menu_top_item = gui_menu_curr_item - num_lines + 1;
            }
            else if (gui_menu_curr_item >= gui_menu_rows())                 // Off bottom, move to top
            {
                gui_menu_curr_item = gui_menu_top_item = 0;
            }
            else if (increment == 1)                                        // Still in menu, if moving down adjust scroll if needed
            {
                if (gui_menu_curr_item - gui_menu_top_item >= num_lines - 1)
                {
                    gui_menu_top_item = gui_menu_curr_item - num_lines + 2;
                    if (gui_menu_top_item + num_lines > gui_menu_rows()) gui_menu_top_item = gui_menu_rows() - num_lines;
                }
            }
            else                                                            // Still in menu, and moving up, adjust scroll
            {
                if (gui_menu_curr_item == gui_menu_top_item) 
                    --gui_menu_top_item;
            }

            // Check in case scroll moved off top of menu
            if (gui_menu_top_item < 0) gui_menu_top_item = 0;
        } while ((curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK)==MENUITEM_TEXT || 
                 (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK)==MENUITEM_SEPARATOR);

        // Reset amount to increment integer values by
        int_incr = 1;

        // Redraw menu if needed
        if (gui_menu_redraw == 0) gui_menu_redraw=1;
    }
}

void gui_enter_submenu(CMenu* submenu)
{
        gui_menu_stack[gui_menu_stack_ptr].menu = curr_menu;
        gui_menu_stack[gui_menu_stack_ptr].curpos = gui_menu_curr_item;
        gui_menu_stack[gui_menu_stack_ptr].toppos = gui_menu_top_item;
        gui_menu_set_curr_menu((CMenu*)(curr_menu->menu[gui_menu_curr_item].value), 0, -1);
        gui_menu_stack_ptr++;
        // FIXME check on stack overrun;
        if (gui_menu_stack_ptr > MENUSTACK_MAXDEPTH){
        	draw_txt_string(0, 0, "E1", MAKE_COLOR(COLOR_RED, COLOR_YELLOW));
	        gui_menu_stack_ptr = 0;
        }
        gui_menu_redraw=2;
        draw_restore();
        gui_force_restore();
}

static inline CMenu* davefunc(int arg)
{
    	extern CMenu games_submenu;
	return &games_submenu;
}


//-------------------------------------------------------------------
// Process button presses when in GUI_MODE_MENU mode
void gui_menu_kbd_process() {
    static char sbuf[7];

    switch (kbd_get_autoclicked_key() | get_jogdial_direction()) {
#if CAM_HAS_ERASE_BUTTON
        case KEY_ERASE:
#else    
        case KEY_SHOOT_HALF:
#endif
            if (conf.user_menu_enable == 3) {
                if (curr_menu->title != LANG_MENU_USER_MENU) {
                    /*
                    * Add new entry
                    * user menu is currently not visible so no redraw necessary
                    */
                    mod_user_menu(curr_menu->menu[gui_menu_curr_item],&gui_menu_curr_item, 1);
                }
                else {
                    /*
                    * Remove entry from menu
                    */
                    mod_user_menu(curr_menu->menu[gui_menu_curr_item],&gui_menu_curr_item, 0);

                    /*
                    * Check to see if the last visible entry was deleted and we need need
                    * to move up our top menu item.
                    */
                    if(gui_menu_top_item)
                        if(!curr_menu->menu[gui_menu_top_item + num_lines-1].text)
                            gui_menu_top_item--;

                    /*
                    * menu list is smaller so have to redraw everything to get
                    * things like scroll bar correct.
                    */
                    gui_menu_redraw=2;

                    /*
                    * if the new menu is smaller than visible menu lines on screen
                    * you have to restore full screen before menu redraw.
                    * If you don't do this, then a new smaller menu will be drawn
                    * on top of the older larger menu
                    *
                    */
                    if(gui_menu_rows() < num_lines)
                        draw_restore();
                }
            }
            break;
        case JOGDIAL_LEFT:
        case KEY_UP:
            gui_menu_updown(-1);
            break;
        case JOGDIAL_RIGHT:
        case KEY_DOWN: 
            gui_menu_updown(1);
            break;
        case FRONTDIAL_LEFT:
        case KEY_LEFT:
            if (gui_menu_curr_item >= 0) {
                switch (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK) {
                    case MENUITEM_INT:
                        update_int_value(-1);
                        break;
                    case MENUITEM_BOOL:
                        update_bool_value();
                        break;
                    case MENUITEM_ENUM:
                    case MENUITEM_ENUM2:
                        update_enum_value(-1);
                        break;
                    case MENUITEM_UP:
                        gui_menu_back();
                        break;
                }
            } else {
                gui_menu_back();
            }
            break;
        case FRONTDIAL_RIGHT:
        case KEY_RIGHT:
            if (gui_menu_curr_item >= 0) {
                switch (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK){
                    case MENUITEM_INT:
                        update_int_value(1);
                        break;
                    case MENUITEM_BOOL:
                        update_bool_value();
                        break;
                    case MENUITEM_ENUM:
                    case MENUITEM_ENUM2:
                        update_enum_value(1);
                        break;
                    case MENUITEM_SUBMENU:
                        select_sub_menu();
                        break;
                }
            }
            break;
        case KEY_SET:
            if (gui_menu_curr_item >= 0) {
                switch (curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK){
                    case MENUITEM_INT:
                        if (kbd_is_key_pressed(KEY_SHOOT_HALF))
                        {
                            *(curr_menu->menu[gui_menu_curr_item].value) = 0;
                            gui_menu_redraw=1;
                        }
                        break;
                    case MENUITEM_BOOL:
                        update_bool_value();
                        break;
                    case MENUITEM_PROC:
                        if (curr_menu->menu[gui_menu_curr_item].value)
                        {
                            ((void (*)(int arg))(curr_menu->menu[gui_menu_curr_item].value))(curr_menu->menu[gui_menu_curr_item].arg);
                            if (curr_menu->on_change)
                            {
                                curr_menu->on_change(gui_menu_curr_item);
                            }
                            //gui_menu_set_curr_menu(curr_menu, 0, 0); // restore this if it causes problems
                            gui_menu_redraw=2;
                        }
                        break;
                    case MENUITEM_SUBMENU:
                        select_sub_menu();
                        break;
                    case MENUITEM_UP:
                        gui_menu_back();
                        break;
                    case MENUITEM_COLOR_FG:
                    case MENUITEM_COLOR_BG:
                        draw_restore();
                        item_color=((unsigned char*)(curr_menu->menu[gui_menu_curr_item].value)) + (((curr_menu->menu[gui_menu_curr_item].type & MENUITEM_MASK)==MENUITEM_COLOR_BG)?1:0);
                        gui_palette_init(PALETTE_MODE_SELECT, (*item_color)&0xFF, gui_menu_color_selected);
                        gui_set_mode(GUI_MODE_PALETTE);
                        gui_menu_redraw=2;
                        break;
                    case MENUITEM_ENUM:
                    case MENUITEM_ENUM2:
                        update_enum_value(1);
                        gui_menu_redraw=1;
                        break;
                }
            }
            break;

#if CAM_HAS_ZOOM_LEVER
        case KEY_ZOOM_IN:
            /*
            * Move current entry up in menu
            * if in user menu edit mode and viewing user menu
            */
            if( (conf.user_menu_enable == 3)  && (curr_menu->title == LANG_MENU_USER_MENU)) {
                mod_user_menu(curr_menu->menu[gui_menu_curr_item],&gui_menu_curr_item, 2);
                if(gui_menu_curr_item < gui_menu_top_item+1) {
                    if(gui_menu_curr_item)
                        gui_menu_top_item = gui_menu_curr_item-1;
                }

                gui_menu_redraw=1;
            }
            else {
                if (int_incr >= 10){
                    int_incr /= 10;
                }
                sprintf(sbuf, "±%d",int_incr);
                draw_string(FONT_WIDTH*2,0,"    ", MAKE_COLOR(COLOR_TRANSPARENT, COLOR_TRANSPARENT));
                draw_string(0,0,sbuf,MAKE_COLOR(COLOR_SELECTED_BG, COLOR_SELECTED_FG));
            }
            break;

        case KEY_ZOOM_OUT:
            /*
            * Move current entry down in menu
            * if in user menu edit mode and viewing user menu
            */
            if( (conf.user_menu_enable == 3)  && (curr_menu->title == LANG_MENU_USER_MENU)) {
                mod_user_menu(curr_menu->menu[gui_menu_curr_item],&gui_menu_curr_item, 3);
                if(gui_menu_curr_item > gui_menu_top_item + num_lines -2) {
                    if((gui_menu_curr_item < USER_MENU_ITEMS) && curr_menu->menu[gui_menu_curr_item +1].text)
                        gui_menu_top_item++;
                }

                gui_menu_redraw=1;
            }
            else {
                if (int_incr <= 1000){
                    int_incr *= 10;
                }
                sprintf(sbuf, "±%d",int_incr);
                draw_string(0,0,sbuf,MAKE_COLOR(COLOR_SELECTED_BG, COLOR_SELECTED_FG));
            }
            break;

        case KEY_DISPLAY:
            gui_menu_back();
            break;
#else
        case KEY_DISPLAY:
            if (conf.user_menu_enable == 3 && curr_menu->title == LANG_MENU_USER_MENU) {
                gui_menu_back();
            }
            else {
                if (int_incr <= 1000){
                    int_incr *= 10;
                }
                else {
                    int_incr = 1;
                }
                sprintf(sbuf, "±%d",int_incr);
                if (int_incr == 1) {
                    draw_string(FONT_WIDTH*2,0,"    ", MAKE_COLOR(COLOR_TRANSPARENT, COLOR_TRANSPARENT));
                }
                draw_string(0,0,sbuf,MAKE_COLOR(COLOR_SELECTED_BG, COLOR_SELECTED_FG));
                break;
            }
#endif
    }
}

char *menuitem_text(const CMenuItem *item)
{
	if (item->text != -1)
		return lang_str(item->text);
	return (char *)item->value;
}


//-------------------------------------------------------------------
// Draw menu scroll bar if needed, and title bar
void gui_menu_draw_initial() { 
    color cl=conf.menu_title_color>>8; 
    unsigned char wplus=0; 

    count = gui_menu_rows();

    if (count > num_lines)
    {
        y = ((screen_height-(num_lines-1)*rbf_font_height())>>1);
        wplus=8; 
        // scrollbar background 
        draw_filled_rect((x+w), y, (x+w)+wplus, y+num_lines*rbf_font_height()-1, MAKE_COLOR((conf.menu_color>>8)&0xFF, (conf.menu_color>>8)&0xFF)); 
    }
    else
    {
        if (conf.menu_center)
        {
            y = (screen_height-(count-1)*rbf_font_height())>>1; 
        }
        else
        {
            y = ((screen_height-(num_lines-1)*rbf_font_height())>>1);  
        }
    }

    rbf_draw_string_center_len(x, y-rbf_font_height(), w+wplus, (conf.menu_symbol_enable)?curr_menu->symbol:0, lang_str(curr_menu->title), conf.menu_title_color);
}

//-------------------------------------------------------------------

// Local variables used by menu draw functions
static int imenu, yy, xx, symbol_width;
static color cl, cl_symbol;

// Common code extracted from gui_menu_draw for displaying the symbol on the left
static void gui_menu_draw_symbol(int num_symbols)
{
    if (conf.menu_symbol_enable)
    {
        xx += rbf_draw_char(xx, yy, ' ', cl_symbol);
        xx += symbol_width = rbf_draw_symbol(xx, yy, curr_menu->menu[imenu].symbol, cl_symbol);
        symbol_width = (symbol_width * num_symbols) + len_space;
    }
    else
    {
        symbol_width = 0;
    }

    xx += rbf_draw_char(xx, yy, ' ', cl);
}

// Common code extracted from gui_menu_draw for displaying an int, enum or bool value on the right
static void gui_menu_draw_value(const char *str, int len_str)
{
    gui_menu_draw_symbol(1);
    xx += rbf_draw_string_len(xx, yy, w-len_space-len_space-len_br1-len_str-len_br2-len_space-symbol_width, lang_str(curr_menu->menu[imenu].text), cl);
    xx += rbf_draw_string(xx, yy, " [", cl);
    xx += rbf_draw_string_right_len(xx, yy, len_str, str, cl);
    rbf_draw_string(xx, yy, "] ", cl);
}

// Common code extracted from gui_menu_draw for displaying a text menu string
static void gui_menu_draw_text(char *str, int num_symbols)
{
    gui_menu_draw_symbol(num_symbols);
    xx += rbf_draw_string_len(xx, yy, w-len_space-len_space-symbol_width, str, cl);
    if ((num_symbols == 2) && conf.menu_symbol_enable)
        xx += rbf_draw_symbol(xx, yy, 0x52, cl_symbol);
    rbf_draw_char(xx, yy, ' ', cl);
}

//-------------------------------------------------------------------
void gui_menu_draw() {
    static char tbuf[64];
    int i, j;
    const char *ch = "";
    char *tmp;
    if (gui_menu_redraw)
    {
        if (gui_menu_redraw==2)
            gui_menu_draw_initial();

        gui_menu_redraw=0;

        for (imenu=gui_menu_top_item, i=0, yy=y; curr_menu->menu[imenu].text && i<num_lines; ++imenu, ++i, yy+=rbf_font_height())
        {
            cl = (gui_menu_curr_item==imenu)?conf.menu_cursor_color:conf.menu_color;
            /*
            * When cursor is over a symbol, force symbol background color to be the menu cursor color but
            * keep the symbol color user defined.
            * old method was to set the symbol color to the symbol background color when the cursor highlighted it.
            * This method allows the user to have any symbol color and background color they want with the restriction
            * that the symbol background color will match the rest of the line when the cursor highlights it.
            * It creates a nice consistent look expecially when the symbol color matches the menu text color.
            * without this mod, there is no way to ever make the symbol color match the color of the rest of text menu line
            * when the cursor highlights a line.
            */
            cl_symbol = (gui_menu_curr_item==imenu)?MAKE_COLOR((cl>>8)&0xFF,(conf.menu_symbol_color)&0xFF):conf.menu_symbol_color; //color 8Bit=Hintergrund 8Bit=Vordergrund

            xx = x;

            switch (curr_menu->menu[imenu].type & MENUITEM_MASK)
            {
            case MENUITEM_BOOL:
                gui_menu_draw_value((*(curr_menu->menu[imenu].value))?"\x95":"", len_bool);
                break;
            case MENUITEM_INT:
                sprintf(tbuf, "%d", *(curr_menu->menu[imenu].value));
                gui_menu_draw_value(tbuf, len_int);
                break;
            case MENUITEM_SUBMENU:
                sprintf(tbuf, "%s%s", lang_str(curr_menu->menu[imenu].text),(conf.menu_symbol_enable)?"":" ->");
                gui_menu_draw_text(tbuf,2);
                break;
            case MENUITEM_UP:
                sprintf(tbuf, "%s%s", (conf.menu_symbol_enable)?"":"<- ", lang_str(curr_menu->menu[imenu].text));
                gui_menu_draw_text(tbuf,1);
                break;
            case MENUITEM_DYNAMIC_SUB:
            case MENUITEM_PROC:
            case MENUITEM_TEXT:
                gui_menu_draw_text(lang_str(curr_menu->menu[imenu].text),1);
                break;
            case MENUITEM_SEPARATOR:
                rbf_draw_char(x, yy, ' ', cl);

                if (lang_str(curr_menu->menu[imenu].text)[0])
                    sprintf(tbuf," %s ",lang_str(curr_menu->menu[imenu].text));
                else
                    tbuf[0] = 0;

                j = rbf_str_width(tbuf);
                xx += ((w - j) >> 1);

                if (xx > (x + len_space))
                {
                    draw_filled_rect(x+len_space, yy, xx-1, yy+rbf_font_height()/2-1, MAKE_COLOR(cl>>8, cl>>8));
                    draw_line(x+len_space, yy+rbf_font_height()/2, xx-1, yy+rbf_font_height()/2, cl);
                    draw_filled_rect(x+len_space, yy+rbf_font_height()/2+1, xx-1, yy+rbf_font_height()-1, MAKE_COLOR(cl>>8, cl>>8));
                }
                else
                {
                    xx = x;
                }

                if (j) xx += rbf_draw_clipped_string(xx, yy, tbuf, cl, 0, w);

                if (xx < (x+w-len_space))
                {
                    draw_filled_rect(xx, yy, x+w-len_space-1, yy+rbf_font_height()/2-1, MAKE_COLOR(cl>>8, cl>>8));
                    draw_line(xx, yy+rbf_font_height()/2, x+w-1-len_space, yy+rbf_font_height()/2, cl);
                    draw_filled_rect(xx, yy+rbf_font_height()/2+1, x+w-len_space-1, yy+rbf_font_height()-1, MAKE_COLOR(cl>>8, cl>>8));
                }

                rbf_draw_char(x+w-len_space, yy, ' ', cl);
                break;
            case MENUITEM_COLOR_FG:
            case MENUITEM_COLOR_BG:
                gui_menu_draw_symbol(1);
                xx+=rbf_draw_string_len(xx, yy, w-len_space-symbol_width, lang_str(curr_menu->menu[imenu].text), cl);
                draw_filled_round_rect(x+w-1-cl_rect-2-len_space, yy+2, x+w-1-2-len_space, yy+rbf_font_height()-1-2, 
                    MAKE_COLOR(((*(curr_menu->menu[imenu].value))>>(((curr_menu->menu[imenu].type & MENUITEM_MASK)==MENUITEM_COLOR_BG)?8:0))&0xFF, 
                               ((*(curr_menu->menu[imenu].value))>>(((curr_menu->menu[imenu].type & MENUITEM_MASK)==MENUITEM_COLOR_BG)?8:0))&0xFF));
                break;
            case MENUITEM_ENUM:
                if (curr_menu->menu[imenu].value)
                    ch = ((const char* (*)(int change, int arg))(curr_menu->menu[imenu].value))(0, curr_menu->menu[imenu].arg);
                gui_menu_draw_value(ch, len_enum);
                break;
            case MENUITEM_ENUM2:
                if (curr_menu->menu[imenu].value)
                {
                    extern const char* gui_change_enum2(const CMenuItem *menu_item, int change);
                    ch = gui_change_enum2(&curr_menu->menu[imenu], 0);
                }
                gui_menu_draw_value(ch, len_enum);
                break;
            }
        }

        // scrollbar
        if (count > num_lines)
        {
            i = num_lines*rbf_font_height()-1 -1;           // full height
            j = i*num_lines/count;                          // bar height
            if (j<20) j=20;
            i = (i-j)*((gui_menu_curr_item<0)?0:gui_menu_curr_item)/(count-1);   // top pos
            draw_filled_round_rect((x+w)+2, y+1,   (x+w)+6, y+1+i,                             MAKE_COLOR(COLOR_BLACK, COLOR_BLACK));
            draw_filled_round_rect((x+w)+2, y+i+j, (x+w)+6, y+num_lines*rbf_font_height()-1-1, MAKE_COLOR(COLOR_BLACK, COLOR_BLACK));
            draw_filled_round_rect((x+w)+2, y+1+i, (x+w)+6, y+i+j,                             MAKE_COLOR(COLOR_WHITE, COLOR_WHITE));
        }
    }
}
