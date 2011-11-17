#include "stubs_asm.h"

NHSTUB(Open, 0xffc2609c)
NHSTUB(write, 0xffc26198)

// Not found automatically
NHSTUB(EnterToCompensationEVF, 0xFFC27604)		// "ExpOn"
NHSTUB(ExitFromCompensationEVF, 0xFFC27648)		// "ExpOff"

// found automatically with errors
NHSTUB(lseek, 0xFFC26224)						// Same as LSeek
NHSTUB(GetZoomLensCurrentPosition, 0xFFDF5210)
NHSTUB(RenameFile_Fut, 0xFFC259EC)				// Maybe ok, Find 0x9400013
NHSTUB(SetFileTimeStamp, 0xFFC263A4)			// Maybe ok, Find 0x12CEA600
NHSTUB(UpdateMBROnFlash, 0xFFC51140)
NHSTUB(closedir, 0xFFDEBA54)
NHSTUB(closefastdir, 0xFFDEBA54)				// Same as closedir
NHSTUB(kbd_read_keys_r2, 0xffc42fb0)			// 0xFFC23B58
NHSTUB(strcat, 0xFFC7C578)
NHSTUB(strrchr, 0xFFC0400C)

// Found manually
NHSTUB(RefreshPhysicalScreen, 0xFFD7B3FC)		// 0xFFD7B3FC/0xFFD7B460?
NHSTUB(Lseek, 0xFFC26224)						// Same as lseek
NHSTUB(GetCCDTemperature, 0xFFC455A8)			// Not tested, but maybe OK
NHSTUB(GetOpticalTemperature, 0xFFC45694)		// Not tested, but maybe OK
NHSTUB(GetDrive_FreeClusters, 0xFFC51320)		// Not tested, but maybe OK
NHSTUB(PT_PlaySound, 0xFFC5F400)				// Tested, ok
NHSTUB(openfastdir, 0xFFDEBAA4)
NHSTUB(ReadFastDir, 0xFFDEBBF8)
NHSTUB(readfastdir, 0xFFDEBBF8)
NHSTUB(Remove, 0xFFC2613C)
NHSTUB(TurnOnBackLight, 0xFFC77F84)
NHSTUB(TurnOffBackLight, 0xFFC77F9C)
NHSTUB(UIFS_WriteFirmInfoToFile, 0xFFD1F9D4)
NHSTUB(kbd_read_keys, 0xFFC23B2C)
NHSTUB(rename, 0xffc259ec)						// 0xFFC261E4
NHSTUB(DoAFLock, 0xFFC27554)
NHSTUB(UnlockAF, 0xFFC2758C)
NHSTUB(MakeAFScan, 0xFFD0F2AC)					// Ok
NHSTUB(ExpCtrlTool_StartContiAE, 0xFFC34CE4)	// "StartContiAE"
NHSTUB(ExpCtrlTool_StopContiAE, 0xFFC34DBC)		// "StopContiAE"
NHSTUB(apex2us, 0xFFD7D8F8)						// Untested, for extra long exposure
NHSTUB(SetScriptMode, 0xFFC00F70)				// Ok
NHSTUB(platformsub_kbd_fetch_data, 0xFFC435CC)
NHSTUB(SetAE_ShutterSpeed, 0xFFE55BE8)			// Untested
NHSTUB(UnsetZoomForMovie, 0xFFD3594C)
NHSTUB(LEDDrive, 0xFFC42BC4)					// Untested
NHSTUB(qsort, 0xFFE3C194)						// Untested

// video buffer stuff
NHSTUB(UnlockAndRefresh, 0xFFD7C5EC)			// "Window.c"
NHSTUB(LockAndRefresh, 0xFFD7C5A8)				// "Window.c"

// null subs, Not yet found
NHSTUB(GetBatteryTemperature, 0xffc4561c)		// 0xFFC00B20	// 0xFFC4561C crashed ??
NHSTUB(TurnOffMic, 0xFFC43C28)					// Doesn't work
NHSTUB(TurnOnMic, 0xFFC43C54)					// Doesn't work

NHSTUB(PutInNdFilter, 0xFFDFACA8)						// fixed
NHSTUB(PutOutNdFilter, 0xFFDFACCC)					// fixed
NHSTUB(SetZoomActuatorSpeedPercent, 0xFFC00B20)
NHSTUB(WriteSDCard, 0xffcfcbcc)  // 0xFFCFC9E8)		// fixed
NHSTUB(GetImageFolder, 0xFFCF1478)	// function before 'GetCameraObjectTmpPath ERROR' string

// --- Those aren't used or don't exist in DryOS (like A720 and other)
NHSTUB(kbd_pwr_on, 0xFFC00B20)
NHSTUB(kbd_pwr_off, 0xffc435e4)	// 0xFFC00B20)
