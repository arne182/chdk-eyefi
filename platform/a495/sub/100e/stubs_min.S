#include "stubs_asm.h"

DEF(physw_status, 0x2E7F4)							// ok, Search "GpioStatus "
DEF(physw_run, 0x1BE4 + 0x0C)						// ROM:FFC2378C
DEF(FlashParamsTable, 0xffecf93c)					// ROM:FFE0AA80
DEF(zoom_busy, 0x5410 + 0x14)
DEF(focus_busy, 0x532C + 8)
DEF(canon_menu_active, 0x2A38 + 4)					// Ok ROM:FFC6A11C
DEF(canon_shoot_menu_active, 0x000065b5)				// ?? Found on ROM:FFC77758 taskcreate_DSITask
DEF(recreview_hold, 0x6308 + 2)						// ROM:FFD34410 
DEF(zoom_status, 0x00009648)							// "TerminateDeliverToZoomController"
DEF(movie_status, 0x5468 + 0x38)					// Unknown
DEF(enabled_refresh_physical_screen, 0x73AC+0x20)	// ROM:FFD7C7B4
DEF(playrec_mode, 0x2794+0x4)						// ROM:FFC27ACC "MenuIn" ROM:FFC5D8F4
DEF(levent_table, 0xffea2dc0)						// Ok
DEF(some_flag_for_af_scan, 0x5848)					// Correct? ROM:FFD0F9DC
DEF(full_screen_refresh, 0x7370)					// ROM:FFD7A9FC, called by RefreshPhysicalScreen()
