#include "stubs_asm.h"

// Not found automatically
NHSTUB(EnterToCompensationEVF, 0xFFC27604)		// "ExpOn"
NHSTUB(ExitFromCompensationEVF, 0xFFC2764C)		// "ExpOff"
NHSTUB(GetCCDTemperature, 0xFFC455B0)			// Not tested
NHSTUB(GetOpticalTemperature, 0xFFC4569C)		// Not tested
NHSTUB(GetDrive_FreeClusters, 0xFFC5131C)		// Not tested, but maybe OK
NHSTUB(PT_PlaySound, 0xFFC5F328)				// Tested, ok
NHSTUB(ReadFastDir, 0xFFDE8E44)
NHSTUB(RefreshPhysicalScreen, 0xFFD79EA0)
NHSTUB(Remove, 0xFFC26140)
NHSTUB(Lseek, 0xFFC26228)						// Same as lseek
NHSTUB(openfastdir, 0xFFDE8CF0)
NHSTUB(qsort, 0xFFE3936C)						// Probably ok
NHSTUB(readfastdir, 0xFFDE8E44)					// Ok
NHSTUB(rename, 0xFFC261E8)

// Autofound failed
NHSTUB(lseek, 0xFFC26228)						// Same as LSeek
NHSTUB(GetZoomLensCurrentPosition, 0xFFDF2448)
NHSTUB(UpdateMBROnFlash, 0xFFC5113C)
NHSTUB(closedir, 0xFFDE8CA0)
NHSTUB(closefastdir, 0xFFDE8CA0)				// Same as closedir
NHSTUB(UIFS_WriteFirmInfoToFile, 0xFFD1F818)
NHSTUB(strcat, 0xFFC7C35C)
NHSTUB(RenameFile_Fut, 0xFFC259F0)				// Maybe ok, Find 0x9400013
NHSTUB(SetFileTimeStamp, 0xFFC263A8)			// Maybe ok, Find 0x12CEA600
NHSTUB(TurnOnBackLight, 0xFFC77D70)				// Seems ok
NHSTUB(TurnOffBackLight, 0xFFC77F9C)			// Seems ok
NHSTUB(kbd_read_keys_r2, 0xFFC42FB0)			// Probably ok
NHSTUB(strrchr, 0xFFC0400C)

// Found manually
NHSTUB(DoAFLock, 0xFFC27558)
NHSTUB(UnlockAF, 0xFFC27590)
NHSTUB(MakeAFScan, 0xFFD0F178)					// Ok
NHSTUB(ExpCtrlTool_StartContiAE, 0xFFC34CE8)	// "StartContiAE"
NHSTUB(ExpCtrlTool_StopContiAE, 0xFFC34DC0)		// "StopContiAE"
NHSTUB(apex2us, 0xFFD7C39C)						// Untested, for extra long exposure
NHSTUB(SetScriptMode, 0xFFC00F70)				// Ok

NHSTUB(platformsub_kbd_fetch_data, 0xFFC435D4)
NHSTUB(SetAE_ShutterSpeed, 0xFFE52DE4)			// Untested
NHSTUB(UnsetZoomForMovie, 0xFFD35564)
NHSTUB(LEDDrive, 0xFFC42BC8)					// Seems ok, "LEDDrv.c"

// video buffer stuff
NHSTUB(UnlockAndRefresh, 0xFFD7B090)			// "Window.c"
NHSTUB(LockAndRefresh, 0xFFD7B04C)				// "Window.c"

// null subs, Not yet found
NHSTUB(GetBatteryTemperature, 0xFFC00B20)		// Maybe 0xFFC455B0 works???
NHSTUB(TurnOffMic, 0xFFC43C30)					// Doesn't work
NHSTUB(TurnOnMic, 0xFFC43C5C)					// Doesn't work

NHSTUB(PutInNdFilter, 0xFFDF7EDC)					// Ok
NHSTUB(PutOutNdFilter, 0xFFDF7F00)					// Ok
NHSTUB(SetZoomActuatorSpeedPercent, 0xFFC00B20)		// nullsub_1
NHSTUB(WriteSDCard, 0xFFCFC7AC)  					// Ok

NHSTUB(GetImageFolder, 0xFFCF1058)	// function before 'GetCameraObjectTmpPath ERROR' string

// --- Those aren't used or don't exist in DryOS (like A720 and other)
NHSTUB(kbd_pwr_on, 0xFFC00B20)
NHSTUB(kbd_pwr_off, 0xFFC00B20)


// Added by finsig_dryos V2 to match old values found by finsig.
// Values should be checked in firmware, if the new address in stubs_entry.S
// is correct then delete the correspoding entry below.
NHSTUB(Open                          ,0xffc4e5d8) // New address = 0xffc260a0
NHSTUB(write                         ,0xffc0b368) // New address = 0xffc2619c
