// Note : This file generated by CHDK-PT.
#include "stubs_asm.h"

NHSTUB(rename,   0xff8234f0) 
NHSTUB(write,  0xff823d44) 

NHSTUB(TurnOffBackLight, 0xff8810a0)  // 0xff878dec   
NHSTUB(VbattGet, 0xff820644)	// 0xff91b708   
NHSTUB(vsprintf, 0xff81cba0)   
NHSTUB(SetZoomActuatorSpeedPercent, 0xff858bec)   
NHSTUB(strchr, 0xff88779c)   
NHSTUB(kbd_pwr_on, 0xff858bec)   
NHSTUB(kbd_read_keys, 0xff821dcc)   
NHSTUB(DoAFLock, 0xff825334)  // 0xff85b170   
NHSTUB(UnlockAF, 0xff82536c)  // 0xff85b180   
NHSTUB(LEDDrive, 0xff842698)   
NHSTUB(ScreenLock, 0xff99cec4)   
NHSTUB(RefreshPhysicalScreen, 0xff99cf18)   
NHSTUB(EnterToCompensationEVF, 0xff825420)   
NHSTUB(ExitFromCompensationEVF, 0xff825464)   
NHSTUB(PT_PlaySound, 0xff85ad20)  // 0xff85b05c   
NHSTUB(WriteSDCard, 0xff903b38)   
NHSTUB(GetDrive_FreeClusters, 0xff852440)   
NHSTUB(GetDrive_TotalClusters, 0xff852414)   
NHSTUB(GetDrive_ClusterSize, 0xff8523e8)   
NHSTUB(GetOpticalTemperature, 0xff845fa4)   
NHSTUB(GetCurrentTargetDistance, 0xff912430)   
NHSTUB(kbd_p2_f, 0xff82170c)   
NHSTUB(qsort, 0xffa79a30)   
NHSTUB(PutInNdFilter, 0xffa3c488)   
NHSTUB(PutOutNdFilter, 0xffa3c4ac)   
NHSTUB(SetPropertyCase, 0xff86e17c)   
NHSTUB(OpLog_Get, 0xff86c53c)   
NHSTUB(qprintf, 0xff8115a8)   
NHSTUB(UnsetZoomForMovie, 0xff94afc4)   
NHSTUB(ShowAllTaskInfo, 0xff91ba70)   
NHSTUB(MoveIrisFullClose, 0xffa92360)   
NHSTUB(AllocateUncacheableMemory, 0xff827448)   
NHSTUB(kbd_pwr_off, 0xff843204)
NHSTUB(stdioSetup, 0xff813578)   
NHSTUB(HdmiRegDump, 0xff841cb0)   
NHSTUB(EdidDump, 0xff841be8)   
NHSTUB(drvInfo, 0xff81e33c)   
NHSTUB(blah, 0xff8462f8)   
NHSTUB(open2, 0xff823c70)   
NHSTUB(strrchr, 0xff99f3cc)   
NHSTUB(ExpCtrlTool_StartContiAE, 0xff82ff40)   
NHSTUB(ExpCtrlTool_StopContiAE, 0xff830084)   
NHSTUB(MakeAFScan, 0xff85b170)   
NHSTUB(apex2us, 0xff9a010c)   
NHSTUB(SetAE_ShutterSpeed, 0xffa96f44)   
NHSTUB(PostLogicalEventForNotPowerType, 0xff87392c)  // 0xff858bec   
NHSTUB(GetFocusLensSubjectDistance, 0xff912430)  // 0xffa94764   
NHSTUB(SetScriptMode, 0xff8740d0)   

NHSTUB(AllocateMemory                          ,0xffa3df40) //101                             
NHSTUB(Close                                   ,0xff823c98) //101                             
NHSTUB(CreateTask                              ,0xff81afac) //101                             
NHSTUB(DebugAssert                             ,0xff81b284) //111                             
NHSTUB(DeleteFile_Fut                          ,0xff823544) //112                             
NHSTUB(ExecuteEventProcedure                   ,0xff86a518) //  1                             
NHSTUB(ExitTask                                ,0xff81b23c) //101                                   == 0xff81b23c @  57%
NHSTUB(Fclose_Fut                              ,0xff8236c0) //101                             
NHSTUB(Feof_Fut                                ,0xff8238ac) //  1                             
NHSTUB(Fflush_Fut                              ,0xff8238e8) //  1                             
NHSTUB(Fgets_Fut                               ,0xff823814) //  1                             
NHSTUB(Fopen_Fut                               ,0xff823680) //101                             
NHSTUB(Fread_Fut                               ,0xff82376c) //101                             
NHSTUB(FreeMemory                              ,0xffa3df38) //101                             
NHSTUB(FreeUncacheableMemory                   ,0xff827488) //112                                   == 0xff827488 @  91%
NHSTUB(Fseek_Fut                               ,0xff823860) //101                             
NHSTUB(Fwrite_Fut                              ,0xff8237c0) //101                             
NHSTUB(GetBatteryTemperature                   ,0xff845f30) //102                                   == 0xff845f30 @  52%
NHSTUB(GetCCDTemperature                       ,0xff845ebc) //102                                   == 0xff845ebc @  52%
NHSTUB(GetCurrentAvValue                       ,0xff913380) //102                             
NHSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff91280c) //  3                                   == 0xff91280c @  83%
NHSTUB(GetKbdState                             ,0xff8431ec) //109                             
NHSTUB(GetMemInfo                              ,0xff813be4) //  1                             
NHSTUB(GetParameterData                        ,0xff94532c) //101                                   == 0xff94532c @  96%
NHSTUB(GetPropertyCase                         ,0xff86e284) //102                                   == 0xff86e284 @  86%
NHSTUB(GetSystemTime                           ,0xffa3df98) //101                                   == 0xffa3df98 @  96%
NHSTUB(GetZoomLensCurrentPoint                 ,0xff916a6c) //102                                   == 0xff916a6c @  74%
NHSTUB(GetZoomLensCurrentPosition              ,0xffa31828) //102                             
NHSTUB(GiveSemaphore                           ,0xff826e64) //112                             
NHSTUB(IsStrobeChargeCompleted                 ,0xff8a35c8) //102                                   == 0xff8a35c8 @  77%
NHSTUB(LocalTime                               ,0xff867f08) //  1                             
NHSTUB(LockMainPower                           ,0xff874304) //103                                   == 0xff874304 @  93%
NHSTUB(Lseek                                   ,0xff823dd8) //101                             
NHSTUB(MakeDirectory_Fut                       ,0xff8235b8) //  1                                   == 0xff8235b8 @  92%
NHSTUB(MoveFocusLensToDistance                 ,0xffa94764) //102                                   == 0xffa94764 @  69%
NHSTUB(MoveIrisWithAv                          ,0xffa3c098) //102                             
NHSTUB(MoveZoomLensWithPoint                   ,0xffa3c624) //102                                   == 0xffa3c624 @  58%
NHSTUB(NewTaskShell                            ,0xff86dd28) //103                                   == 0xff86dd28 @  62%
NHSTUB(Open                                    ,0xff823c70) //101                             
NHSTUB(PB2Rec                                  ,0xff8772bc) //104                                   == 0xff8772bc @  85%
NHSTUB(PT_MoveDigitalZoomToWide                ,0xff85b138) //102                             
NHSTUB(PT_MoveOpticalZoomAt                    ,0xff85b110) //102                             
NHSTUB(PostLogicalEventToUI                    ,0xff873978) //103                                   == 0xff873978 @  92%
NHSTUB(Read                                    ,0xff819ae4) //101                             
NHSTUB(ReadFastDir                             ,0xffa1fd78) //  1                             
NHSTUB(Rec2PB                                  ,0xff8772fc) //104                                   == 0xff8772fc @  86%
NHSTUB(Remove                                  ,0xff823ce0) //  1                             
NHSTUB(RenameFile_Fut                          ,0xff8234f0) //  1                                   == 0xff8234f0 @  93%
NHSTUB(Restart                                 ,0xff828b98) //106                             
NHSTUB(SetAutoShutdownTime                     ,0xff874378) //103                                   == 0xff874378 @  93%
NHSTUB(SetCurrentCaptureModeType               ,0xff87b2c0) //101                                   == 0xff87b2c0 @  90%
NHSTUB(SetFileTimeStamp                        ,0xff823f74) //  1                             
NHSTUB(SetLogicalEventActive                   ,0xff874080) //101                                   == 0xff874080 @  64%
NHSTUB(SetParameterData                        ,0xff94529c) //101                                   == 0xff94529c @  96%
NHSTUB(SleepTask                               ,0xff8270cc) //101                                   == 0xff8270cc @  92%
NHSTUB(TakeSemaphore                           ,0xff826d94) //101                                   == 0xff826d94 @  60%
NHSTUB(TurnOnBackLight                         ,0xff881088) //104                                   == 0xff881088 @  54%
NHSTUB(UIFS_WriteFirmInfoToFile                ,0xff931e7c) //101                                   == 0xff931e7c @  51%
NHSTUB(UnlockMainPower                         ,0xff874258) //103                                   == 0xff874258 @  93%
NHSTUB(UpdateMBROnFlash                        ,0xff852240) //  3                                   == 0xff852240 @  89%
NHSTUB(Write                                   ,0xff823d44) //101                             
NHSTUB(_log                                    ,0xffac9564) //111                             
NHSTUB(_log10                                  ,0xffac81f0) //112                             
NHSTUB(_pow                                    ,0xffac8360) //114                             
NHSTUB(_sqrt                                   ,0xffacb108) //  1                             
NHSTUB(add_ptp_handler                         ,0xff9eabc0) //  3                             
NHSTUB(close                                   ,0xff8198fc) //  1                             
NHSTUB(closedir                                ,0xffa1fe48) //  1                             
NHSTUB(err_init_task                           ,0xff814e2c) //  4                             
NHSTUB(exmem_alloc                             ,0xff868dc8) //103                             
NHSTUB(free                                    ,0xff813a3c) //112                             
NHSTUB(kbd_p1_f                                ,0xff821e48) //109                                   == 0xff821e48 @  86%
NHSTUB(kbd_p1_f_cont                           ,0xff821e54) //109                                   == 0xff821e54 @  86%
NHSTUB(kbd_read_keys_r2                        ,0xff842b6c) //109                                   == 0xff842b6c @  77%
NHSTUB(lseek                                   ,0xff823dd8) //101                             
NHSTUB(malloc                                  ,0xff813968) //112                             
NHSTUB(memcmp                                  ,0xff81cc5c) //101                             
NHSTUB(memcpy                                  ,0xff887900) //101                             
NHSTUB(memset                                  ,0xff99f3f4) //101                             
NHSTUB(mkdir                                   ,0xff82403c) //  1                             
NHSTUB(mktime_ext                              ,0xff88816c) //  1                             
NHSTUB(open                                    ,0xff81984c) //  1                             
NHSTUB(opendir                                 ,0xffa1fce4) //  1                             
NHSTUB(openfastdir                             ,0xffa1fce4) //  1                             
NHSTUB(rand                                    ,0xff81cd64) //  1                                   == 0xff81cd64 @  95%
NHSTUB(read                                    ,0xff819ae4) //101                             
NHSTUB(readfastdir                             ,0xffa1fd78) //  1                             
NHSTUB(reboot_fw_update                        ,0xffa27428) //  5                                   == 0xffa27428 @  86%
NHSTUB(set_control_event                       ,0xff873db4) //111                                   == 0xff873db4 @  93%
NHSTUB(srand                                   ,0xff81cd58) //  1                                   == 0xff81cd58 @  95%
NHSTUB(stat                                    ,0xff823ea4) //  1                             
NHSTUB(strcat                                  ,0xff887714) //  1                             
NHSTUB(strcmp                                  ,0xff81cbf4) //101                             
NHSTUB(strcpy                                  ,0xff81cbdc) //101                             
NHSTUB(strftime                                ,0xff887b74) //  1                             
NHSTUB(strlen                                  ,0xff81cc38) //101                             
NHSTUB(strncmp                                 ,0xff887750) //  1                                   == 0xff887750 @  85%
NHSTUB(strncpy                                 ,0xff82cd3c) //  1                             
NHSTUB(strtol                                  ,0xff82cf74) //101                             
NHSTUB(strtolx                                 ,0xff82cd78) //109                             
NHSTUB(time                                    ,0xff868480) //  2                                   == 0xff868480 @  86%
