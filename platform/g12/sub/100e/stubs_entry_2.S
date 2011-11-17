#include "stubs_asm.h"

# Confirmed
NHSTUB(MakeAFScan,						0xFF98AA10)	// ok (comp 1.00c)

# Missing
NHSTUB(kbd_pwr_off,						0xFF810B1C)								// ??? not on sx20 or s95
NHSTUB(kbd_pwr_on,						0xFF810B1C)								// ??? not on sx20 or s95
NHSTUB(SetZoomActuatorSpeedPercent,		0xFF810B1C)
