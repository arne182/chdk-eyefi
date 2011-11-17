#include "stdlib.h"
#include "keyboard.h"
#include "platform.h"
#include "core.h"
#include "lang.h"
#include "conf.h"
#include "gui.h"
#include "gui_menu.h"
#include "gui_draw.h"
#include "gui_lang.h"
#include "gui_batt.h"
#include "gui_mbox.h"
#include "eyefi-config.h"

extern CMenu eyefi_scan_submenu;
extern CMenuItem eyefi_scan_submenu_items[];

extern char chdk_buf[1000];
extern void chdk_print(char *c);
extern int debug_level;

#define debug_printf(level, args...) do{                        \
        if (level <= debug_level) {                             \
                sprintf(&chdk_buf[0], args);                    \
                chdk_print(&chdk_buf[0]);                       \
        }}while(0)

void eyefi_scan_enter_submenu(int arg)
{
	struct scanned_net_list *nets;
	int i;

	nets = scan_nets();

	debug_printf(4, "%s() nets: %p\n", __func__, nets);
	for (i = 0; i < nets->nr; i++) {
		CMenuItem *item = &eyefi_scan_submenu_items[i+1];
		struct scanned_net *net = &nets->nets[i];
		char *type;

		if (!item->text)
			break;
		if (item->text == LANG_MENU_ITEM_BLANK) {
			item->value = malloc(100);
			item->text = -1;
			item->type = MENUITEM_TEXT;
		}
		debug_printf(1, "i: %d i: %p/%p '%s'\n", i, item, item->value, net->essid);
		type = net_type_name(net->type);
		sprintf((char *)item->value, "%d-Add Net: '%s'/%s/%d",
				i, net->essid, type, net->strength);
	}
	debug_printf(1, "%s() done\n", __func__);
}

