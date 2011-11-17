#include "stubs_asm.h"

// corrected stubs_entry_2.S

NHSTUB(DoAFLock                              ,0xff8368f0) //102     **** stubs_entry_2.S: 0xff87481c 
NHSTUB(EnterToCompensationEVF                ,0xff836ae0) //104          == stubs_entry_2.S          Prev: Not Found
NHSTUB(ExitFromCompensationEVF               ,0xff836b24) //104     **** stubs_entry_2.S: 0xff825464 Prev: Not Found
NHSTUB(LEDDrive                              ,0xff85a31c) //103     **** stubs_entry_2.S: 0xff810b04 
NHSTUB(Lseek                                 ,0xff835524) //101          == stubs_entry_2.S          Prev: Not Found
NHSTUB(PT_PlaySound                          ,0xff87d8a8) //102          == stubs_entry_2.S          Prev: Not Found
NHSTUB(PutInNdFilter                         ,0xffb05ec8) //102     **** stubs_entry_2.S: 0xff810b04 
NHSTUB(PutOutNdFilter                        ,0xffb05f00) //102     **** stubs_entry_2.S: 0xff810b04 
NHSTUB(Remove                                ,0xff83543c) //  5          == stubs_entry_2.S          Prev: Not Found
NHSTUB(RenameFile_Fut                        ,0xff834d00) //  5          == stubs_entry_2.S          Prev stub: 0xff834ecc @ 53%
NHSTUB(SetFileTimeStamp                      ,0xff835694) //  4     **** stubs_entry_2.S: 0xff810b04 Prev stub: 0xff932af4 @ 55%
NHSTUB(TurnOffBackLight                      ,0xff89e2b8) //104     **** stubs_entry_2.S: 0xff895660 Prev: Not Found
NHSTUB(UIFS_WriteFirmInfoToFile              ,0xff9642c8) //105     **** stubs_entry_2.S: 0xffa15804 Prev: Not Found
NHSTUB(UnlockAF                              ,0xff836928) //102     **** stubs_entry_2.S: 0xff87482c 
NHSTUB(WriteSDCard                           ,0xff933968) //108          == stubs_entry_2.S          
NHSTUB(apex2us                               ,0xff9fd42c) //  5          == stubs_entry_2.S          
NHSTUB(kbd_pwr_off                           ,0xff85ae98) //  2 64% **** stubs_entry_2.S: 0xff810b04 Prev match @ 51%
NHSTUB(openfastdir                           ,0xffa7e0c0) //  4     **** stubs_entry_2.S: 0xffa7dcc0 Prev: Not Found
NHSTUB(readfastdir                           ,0xffa7e1f4) //  4     **** stubs_entry_2.S: 0xffa7ddf4 Prev: Not Found
NHSTUB(rename                                ,0xff834d00) //  5          == stubs_entry_2.S          Prev: Not Found
NHSTUB(strcat                                ,0xff8a5524) //  1          == stubs_entry_2.S          Prev stub: 0xff813f38 @ 61%
NHSTUB(strrchr                               ,0xff813fe4) //  1          == stubs_entry_2.S          Prev stub: 0xff83df6c @ 71%
NHSTUB(stat                                  ,0xff835560) //  4  ALT: NHSTUB(stat, 0xff868f48) // 31/0                                   

// stub found wrong in subs_entry.S

NHSTUB(AllocateMemory                        ,0xffa9edb0) //  2  ??? check this --->     Prev stub: 0xffa9e9b0 @ 100%
NHSTUB(FreeMemory                            ,0xffa9eda8) //  2  ??? check this --->     Prev stub: 0xffa9e9a8 @ 100%
NHSTUB(GetSystemTime                         ,0xffa9ee08) //101  ??? check this --->     Prev stub: 0xffa9ea08 @ 96%
NHSTUB(GetZoomLensCurrentPosition            ,0xffa904f8) //102  ??? check this --->     Prev stub: 0xffa900f8 @ 100%
NHSTUB(MoveFocusLensToDistance               ,0xffb08268) //102  ??? check this --->     Prev stub: 0xffb07e68 @ 57%
NHSTUB(MoveZoomLensWithPoint                 ,0xffa9c990) //102  ??? check this --->     Prev stub: 0xffa9c590 @ 58%
NHSTUB(ReadFastDir                           ,0xffa7e1f4) //  4  ??? check this --->     Prev stub: 0xffa7ddf4 @ 100%
NHSTUB(_log                                  ,0xffb3bc6c) //  1  ??? check this --->     Prev stub: 0xffb3b86c @ 100%
NHSTUB(_log10                                ,0xffb3a8f8) //  1  ??? check this --->     Prev stub: 0xffb3a4f8 @ 100%
NHSTUB(_pow                                  ,0xffb3aa68) //  1  ??? check this --->     Prev stub: 0xffb3a668 @ 100%
NHSTUB(_sqrt                                 ,0xffb3d8f0) //  1  ??? check this --->     Prev stub: 0xffb3d4f0 @ 100%
NHSTUB(add_ptp_handler                       ,0xffa3f98c) //  4  ??? check this --->     Prev stub: 0xffa3f58c @ 100%
NHSTUB(closedir                              ,0xffa7e07c) //  4  ??? check this --->     Prev stub: 0xffa7dc7c @ 100%
NHSTUB(closefastdir                          ,0xffa7e07c) //  4  ??? check this --->     Prev stub: 0xffa7df90 @ 71%
NHSTUB(memset                                ,0xff9fbfa0) //101  ??? check this --->     Prev stub: 0xff9fbba0 @ 100%
NHSTUB(opendir                               ,0xffa7e0c0) //  4  ??? check this --->     Prev stub: 0xffa7dcc0 @ 100%
NHSTUB(qsort                                 ,0xff9fc560) //  4  ??? check this --->     Prev stub: 0xff9fc160 @ 100%
NHSTUB(reboot_fw_update                      ,0xffa83704) //  1  ??? check this --->     Prev stub: 0xffa83304 @ 82%


// missing from philmoz's findsig file

NHSTUB(RefreshPhysicalScreen                 ,0xFF9F8694) //--- --- **** stubs_entry_2.S: 0xff9f8294 Prev: Not Found
NHSTUB(ScreenLock                            ,0xFF9F98B4) //--- --- **** stubs_entry_2.S: 0xff9f9644 
NHSTUB(ScreenUnlock                          ,0xFF9F98DC)

NHSTUB(kbd_pwr_on,  0xFF810B04)
NHSTUB(SetZoomActuatorSpeedPercent,  0xFF810B04)

NHSTUB(SetScriptMode, 0xFF810F4)
NHSTUB(platformsub_kbd_fetch_data,  0xFF85AE80)
NHSTUB(UnsetZoomForMovie,  0xFF97FDD8)


# Addresses for firmware task handlers (used in taskHook)
  DEF(task_CaptSeq                            ,0xff876e70) //107                                      
  DEF(task_ExpDrv                             ,0xff8ba2d4) //101                                      
  DEF(task_InitFileModules                    ,0xff894500) //107                                      
  DEF(task_MovieRecord                        ,0xff94af08) //107                                      
  DEF(task_RotaryEncoder                      ,0xff85afb0) //107                                      


// Added by finsig_dryos V2 to match old values found by finsig.
// Values should be checked in firmware, if the new address in stubs_entry.S
// is correct then delete the correspoding entry below.
NHSTUB(write                         ,0xff81abd8) // New address = 0xff835498
