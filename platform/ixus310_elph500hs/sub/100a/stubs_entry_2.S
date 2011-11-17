#include "stubs_asm.h"

NHSTUB(reboot_fw_update                ,0xff2e99cc)

NHSTUB(kbd_pwr_on,						0xFF055974)		// null
NHSTUB(SetZoomActuatorSpeedPercent,		0xFF055974)		// null

NHSTUB(SetCDSGain,						0xFF384A38)
NHSTUB(GetCdsGainValue,					0xFF384998)

DEF(task_TouchPanel,					0xFF059E84)
