#include "stubs_asm.h"

DEF(physw_status, 0x2E754)							// ok, search for "GpioStatus", 0xFFC23A8C
DEF(physw_run, 0x1BE4 + 0x0C)						// Ok 0xFFC2378C (0x10???)
DEF(FlashParamsTable,0xFFECA71C)					// Ok 0xFFE07CAC
DEF(zoom_busy, 0x53DC + 0x14)           			// Ok Found at FFD09900, "ZoomLensController.c", 0x14 = FFD0993C
DEF(focus_busy, 0x52F8 + 8)             			// Ok Found at FFD06F38, "FocusLensController.c", 0x08=FFD06F98
DEF(canon_menu_active, 0x2A38 + 4)					// Ok ROM:FFC6A028 (FFC6A2A4???)
DEF(canon_shoot_menu_active, 0x6570 + 1)			// Ok Found at FFD3F7E8
DEF(recreview_hold, 0x61E0 + 0xD4)					// Ok ROM:FFD30D50, 0xd4=FFD30D5C
DEF(zoom_status, 0x9588)							// Ok Found at FFE0AB5C, "TerminateDeliverToZoomController"
DEF(movie_status, 0x5438 + 0x38)					// Maybe FFD0C404
DEF(enabled_refresh_physical_screen, 0x7324+0x20)	// Ok Found at FFD7B254, "ScreenLock"
DEF(playrec_mode, 0x2794+0x4)						// Ok FFC27AD0 "MenuIn", B FFC5D81C
DEF(levent_table, 0xFFE9FE78)						// Ok FFD2A990
DEF(some_flag_for_af_scan, 0x5818)					// Perhaps ok, FFD0F8A8
DEF(full_screen_refresh, 0x72E8)					// Ok ROM:FFD794A0, called by RefreshPhysicalScreen()
