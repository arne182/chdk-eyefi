#include "stubs_asm.h"
NHSTUB(ExitFromCompensationEVF, 0xFF8279F8)
NHSTUB(kbd_read_keys_r2, 0xFF848DC8)
NHSTUB(kbd_pwr_off, 0xFF810958) // nullsub
NHSTUB(kbd_pwr_on, 0xFF810958) // nullsub
NHSTUB(SetZoomActuatorSpeedPercent, 0xFF810958) // nullsub
NHSTUB(PT_PlaySound, 0xFF866454) 
NHSTUB(DoAFLock, 0xff8275cc)
NHSTUB(UnlockAF, 0xff827638)
NHSTUB(MakeAFScan,  0xFFA449F8)
NHSTUB(PostLEDMessage, 0xFF848910) 
NHSTUB(ExpCtrlTool_StartContiAE, 0xFF835600) 
NHSTUB(GetKbdState, 0xFF849300)
NHSTUB(UnsetZoomForMovie, 0xFF95D048)
NHSTUB(GiveSemaphore, 0xFF81BA5C)
NHSTUB(PutInNdFilter, 0xFFA0C578)
NHSTUB(PutOutNdFilter, 0xFFA0C5B0)
NHSTUB(WriteSDCard, 0xFF928D00)
NHSTUB(SetScriptMode, 0xFF872F78) // "SetScriptMode"
NHSTUB(apex2us, 0xFF9BF0C4) // from sub_FF897408 via exp_drv_task
NHSTUB(PB2Rec, 0xFF876664)
NHSTUB(Rec2PB, 0xFF875024)


// Added by finsig_dryos V2 to match old values found by finsig.
// Values should be checked in firmware, if the new address in stubs_entry.S
// is correct then delete the correspoding entry below.
NHSTUB(GetZoomLensCurrentPosition    ,0xff93ae1c) // New address = 0xffa3e680
NHSTUB(rename                        ,0xff825600) // New address = 0xff824d40
NHSTUB(write                         ,0xff81a3d8) // New address = 0xff8255d8
