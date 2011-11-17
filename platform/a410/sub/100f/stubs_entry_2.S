#include "stubs_asm.h"

NHSTUB(AllocateMemory, 0xffc0b294)
NHSTUB(DisplayImagePhysicalScreen, 0xffd093a0)//
NHSTUB(FreeMemory, 0xffc0b280)
NHSTUB(GetFocusLensSubjectDistance, 0xffe23180)
NHSTUB(GetFocusLensSubjectDistanceFromLens, 0xffe231A4)
NHSTUB(free, 0xFFE75B50)//
//VbattGet ok
NHSTUB(exmem_alloc, 0xFFC028B8) //found using the A610 port
NHSTUB(exmem_free ,0xFFC02904)

NHSTUB(kbd_pwr_on, 0xFFC0E2E0) //not found, null stub
NHSTUB(kbd_pwr_off, 0xFFC0E2E0) //not found, null stub

//from A430
NHSTUB(SetZoomActuatorSpeedPercent, 0xFFC0E2E0)// null stub
NHSTUB(GetDrive_ClusterSize, 0xFFC59DF4) //
NHSTUB(GetDrive_TotalClusters, 0xFFC59E30) //
NHSTUB(GetDrive_FreeClusters, 0xFFC59E6C) //
NHSTUB(TurnOffMic, 0xFFC0E2E0) //useless, null stub
NHSTUB(TurnOnMic, 0xFFC0E2E0) //useless, null stub

NHSTUB(ExpCtrlTool_StopContiAE,  0xFFCD88B0) //found using the A610 port
NHSTUB(ExpCtrlTool_StartContiAE, 0xFFCD8898) //found using the A610 port
NHSTUB(MakeAFScan,               0xFFD285F8) //found using the A610 port
NHSTUB(GetBatteryTemperature, 0xFFC1CDF0) //
NHSTUB(GetCCDTemperature,     0xFFC1CDDC) //
NHSTUB(GetOpticalTemperature, 0xFFC1CDC8) //
NHSTUB(PT_PlaySound, 0xFFD31254) //

NHSTUB(EnterToCompensationEVF, 0xFFD24234) //
NHSTUB(ExitFromCompensationEVF, 0xFFD24244) //
NHSTUB(SetAE_ShutterSpeed, 0xFFE313A8) //
NHSTUB(DoAFLock, 0xFFD24124) //
NHSTUB(UnlockAF, 0xFFD24164) //

NHSTUB(apex2us, 0xFFC94108) //for extra long exposures
NHSTUB(WriteSDCard, 0xFFC69824) //a bit unsure, found using the A610 port

NHSTUB(SetScriptMode,0xFFD3799C) //
NHSTUB(MFOn,0xffd24c18)
NHSTUB(MFOff,0xffd24c48)

NHSTUB(MoveFocusLensToDistance, MoveFocusLensToDistanceA410) //hack to make this work
