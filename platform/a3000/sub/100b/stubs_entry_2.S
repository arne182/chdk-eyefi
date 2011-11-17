#include "stubs_asm.h"
//FOUND
NHSTUB(RenameFile_Fut, 0xFFC25B9C)
NHSTUB(SetFileTimeStamp, 0xFFC26554)
NHSTUB(closedir, 0xFFDF61C0)
NHSTUB(closefastdir, 0xFFDF61C0)
NHSTUB(Lseek, 0xFFC263D4)
NHSTUB(lseek, 0xFFC263D4)
NHSTUB(strcat, 0xFFC7FE68)
NHSTUB(strrchr, 0xFFC0400C)
NHSTUB(kbd_read_keys_r2, 0xFFC43EAC)
NHSTUB(ScreenUnlock, 0xFFD85BA4)
NHSTUB(ScreenLock, 0xFFD86EF4)
NHSTUB(ReadFastDir, 0xFFDF6364)
NHSTUB(readfastdir, 0xFFDF6364)
NHSTUB(openfastdir, 0xFFDF6210)
NHSTUB(PutInNdFilter, 0xFFE053F0)
NHSTUB(PutOutNdFilter, 0xFFE05414)
NHSTUB(UnlockAF, 0xFFC59F38)
NHSTUB(DoAFLock, 0xFFC59F28)
NHSTUB(Remove, 0xFFC262EC)
NHSTUB(PT_PlaySound, 0xFFC62498)
NHSTUB(RefreshPhysicalScreen, 0xFFD85B40)
NHSTUB(rename, 0xFFC26394)
NHSTUB(qsort, 0xFFE4719C)
NHSTUB(LockAndRefresh, 0xFFD86CEC)
NHSTUB(UnlockAndRefresh, 0xFFD86D30)
NHSTUB(SetScriptMode, 0xFFC00F70)
NHSTUB(EnterToCompensationEVF, 0xFFC277F4)
NHSTUB(ExitFromCompensationEVF, 0xFFC27838)
NHSTUB(GetDrive_FreeClusters, 0xFFC524A0)
NHSTUB(TurnOffBackLight, 0xFFC7B3F0)
NHSTUB(TurnOnBackLight, 0xFFC7B3D8)
NHSTUB(UIFS_WriteFirmInfoToFile, 0xFFD272E8)
NHSTUB(apex2us, 0xFFD8803C)
NHSTUB(GetLogToFile, 0xFFD1A568)
NHSTUB(UnsetZoomForMovie, 0xFFD3CBA4)
NHSTUB(MakeAFScan, 0xFFD16108)
NHSTUB(ExpCtrlTool_StartContiAE, 0xFFC35110)
NHSTUB(ExpCtrlTool_StopContiAE, 0xFFC351E8)
NHSTUB(LEDDrive,0xFFC43ACC)
NHSTUB(add_ptp_handler, 0xFFDC8DE4) // via ptp handler table
NHSTUB(set_control_event, 0xFFC6F9B8) // via eventproc_export_IsControl
NHSTUB(PB2Rec, 0xFFC72CE8) // via aAcPb2rec
NHSTUB(Rec2PB, 0xFFC72D28) // via aAcRec2pb
NHSTUB(reboot_fw_update, 0xFFDF7BD8)

// NULLSUB
NHSTUB(kbd_pwr_off, 0xFFC43E0C)
NHSTUB(rewinddir, 0xFFC43E0C)
NHSTUB(SetZoomActuatorSpeedPercent, 0xFFC43E0C)
NHSTUB(Unmount_FileSystem, 0xFFC43E0C)
NHSTUB(Mount_FileSystem, 0xFFC43E0C)




