#include "stubs_asm.h"


// not found ... yet.
#define do_nothing 0xffa7b654

NHSTUB(dumpMemoryToFile, do_nothing)
NHSTUB(ExpCtrlTool_StartContiAE, do_nothing)
NHSTUB(ExpCtrlTool_StopContiAE, do_nothing)
NHSTUB(PostLEDMessage, do_nothing)

// not found on other dryos cams here, so not in sig
NHSTUB(OpLog_WriteToSD, 0xff86ab44)
NSTUB(PutInNdFilter, 0xffa7aacc)
NSTUB(PutOutNdFilter, 0xffa7ab04)
NHSTUB(UnsetZoomForMovie,0xff960a4c)

NHSTUB(TurnOffMic, do_nothing)
NHSTUB(TurnOnMic, do_nothing)

// vx stuff
// not found or used in dryos
NHSTUB(SetZoomActuatorSpeedPercent, do_nothing)
NHSTUB(taskUnlock, do_nothing)
NHSTUB(taskLock, do_nothing)

NHSTUB(DoAFLock, 0xff825c4c)
NHSTUB(UnlockAF, 0xff825c90)
NHSTUB(apex2us, 0xFF9AC134)
NHSTUB(SetScriptMode, 0xFF873680)


// Added by finsig_dryos V2 to match old values found by finsig.
// Values should be checked in firmware, if the new address in stubs_entry.S
// is correct then delete the correspoding entry below.
NHSTUB(rename                        ,0xff823f28) // New address = 0xff8236ac
NHSTUB(write                         ,0xff81a1bc) // New address = 0xff823f00
