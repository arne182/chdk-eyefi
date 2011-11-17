#include "stubs_asm.h"
//FOUND
NHSTUB(RenameFile_Fut, 0xFFC25B9C)
NHSTUB(SetFileTimeStamp, 0xFFC26554)
NHSTUB(closedir, 0xFFDF61C4)
NHSTUB(closefastdir, 0xFFDF61C4)
NHSTUB(Lseek, 0xFFC263D4)
NHSTUB(lseek, 0xFFC263D4)
NHSTUB(strcat, 0xFFC7FEB8)
NHSTUB(strrchr, 0xFFC0400C)
NHSTUB(kbd_read_keys_r2, 0xFFC43EAC)
NHSTUB(ScreenUnlock, 0xFFD85C54)
NHSTUB(ScreenLock, 0xFFD86FA4)
NHSTUB(ReadFastDir, 0xFFDF6368)
NHSTUB(readfastdir, 0xFFDF6368)
NHSTUB(openfastdir, 0xFFDF6214)

NHSTUB(PutInNdFilter, 0xFFE053F4)
NHSTUB(PutOutNdFilter, 0xFFE05418)
NHSTUB(UnlockAF, 0xFFC59F88)
NHSTUB(DoAFLock, 0xFFC59F78)
NHSTUB(Remove, 0xFFC262EC) // under aFileWriteFail_
NHSTUB(PT_PlaySound, 0xFFC624E8) // under aSndcvrop
NHSTUB(RefreshPhysicalScreen, 0xFFD85BF0) // ScreenUnlock
NHSTUB(rename, 0xFFC26394)
NHSTUB(qsort, 0xFFE471A0)
NHSTUB(LockAndRefresh, 0xFFD86D9C)
NHSTUB(UnlockAndRefresh, 0xFFD86DE0)  
NHSTUB(SetScriptMode, 0xFFC00F70)
NHSTUB(EnterToCompensationEVF, 0xFFC277F4)
NHSTUB(ExitFromCompensationEVF, 0xFFC27838)
NHSTUB(GetDrive_FreeClusters, 0xFFC524A0)
NHSTUB(TurnOffBackLight, 0xFFC7B440)
NHSTUB(TurnOnBackLight, 0xFFC7B428)
NHSTUB(UIFS_WriteFirmInfoToFile, 0xFFD27398)
NHSTUB(apex2us,0xFFD880EC)
NHSTUB(GetLogToFile, 0xFFD1A618)  
NHSTUB(UnsetZoomForMovie, 0xFFD3CC54) //"ZoomCon_UnsetZoomForMovie"
NHSTUB(MakeAFScan, 0xFFD161B8)
NHSTUB(ExpCtrlTool_StartContiAE, 0xFFC35110)
NHSTUB(ExpCtrlTool_StopContiAE, 0xFFC351E8)
NHSTUB(LEDDrive,0xFFC43ACC)
NHSTUB(add_ptp_handler, 0xFFDC8DE8) // via ptp handler table
NHSTUB(set_control_event, 0xFFC6FA08) // via eventproc_export_IsControl
NHSTUB(PB2Rec, 0xFFC72D38) // via aAcPb2rec
NHSTUB(Rec2PB, 0xFFC72D78) // via aAcRec2pb
NHSTUB(reboot_fw_update, 0xFFDF7BDC) 


// NULLSUB
NHSTUB(kbd_pwr_off, 0xFFC43E0C)
NHSTUB(rewinddir, 0xFFC43E0C)
NHSTUB(SetZoomActuatorSpeedPercent, 0xFFC43E0C)
NHSTUB(Unmount_FileSystem, 0xFFC43E0C)
NHSTUB(Mount_FileSystem, 0xFFC43E0C)




