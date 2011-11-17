#include "stubs_asm.h"

// not found automatically

NHSTUB(EnterToCompensationEVF,0xFFC14FF0)
NHSTUB(ExitFromCompensationEVF,0xFFC15034)
NHSTUB(GetBatteryTemperature,0xffc32c44)           
NHSTUB(GetCCDTemperature,0xffc32bd0)
NHSTUB(GetDrive_ClusterSize,0xFFC3ED84)
NHSTUB(GetDrive_FreeClusters,0xFFC3EDDC)
NHSTUB(GetDrive_TotalClusters,0xFFC3EDB0)
NHSTUB(GetFocusLensSubjectDistance,0xffcf08f4) 
NHSTUB(RefreshPhysicalScreen,0xFFD6B630)
NHSTUB(TurnOffBackLight,0xFFC67D48)
NHSTUB(kbd_pwr_off,0xFFC30B40)     
NHSTUB(strchr,0xFFC6B878)
NHSTUB(PB2Rec,0xffc5e760)
NHSTUB(rename,0xffc13138)
NHSTUB(write,0xffc1398c)

// found manually

NHSTUB(GetKbdState,0xFFC30B28)
NHSTUB(platformsub_kbd_fetch_data,0xFFC30B28)
NHSTUB(LEDDrive,0xffc30088)
NHSTUB(DoAFLock,0xFFC14F40)
NHSTUB(SetZoomActuatorSpeedPercent,0xFFC00950)//null
NHSTUB(UnlockAF,0xFFC14F78)
NHSTUB(SetScriptMode,0xFFC5CAB4)
NHSTUB(UnsetZoomForMovie,0xFFD226EC)
NHSTUB(PutInNdFilter,0xffdf2a38)
NHSTUB(PutOutNdFilter,0xffdf2a5c)
NHSTUB(WriteSDCard,0xffce4748)
NHSTUB(TurnOffMic,0xFFC31214)
NHSTUB(TurnOnMic,0xFFC311E8)
NHSTUB(MakeAFScan,0xFFCFA90C)
NHSTUB(ExpCtrlTool_StartContiAE,0xFFC1F880)
NHSTUB(apex2us,0xFFD6C6E8)
NHSTUB(SetAE_ShutterSpeed,0xFFE3D994)
NHSTUB(ExpCtrlTool_StopContiAE,0xFFC1FAAC)

//not match in entry.s

//NHSTUB(kbd_pwr_on,0xFFC00950)//null
//NHSTUB(kbd_read_keys,0xFFC11A0C )//correct

NHSTUB(kbd_read_keys_r2,0xffc304a4)
NHSTUB(qsort,0xFFE265E4)
NHSTUB(strrchr,0xFFD6B9A8)
NSTUB(UpdateMBROnFlash, 0xFFC3EBDC)

  DEF(task_CaptSeq                            ,0xffc49060)
  DEF(task_ExpDrv                             ,0xffc7ddcc)
  DEF(task_InitFileModules                    ,0xffc60508)
  DEF(task_MovieRecord                        ,0xffcf82d4)
  DEF(task_PhySw                              ,0xffc1167c)
