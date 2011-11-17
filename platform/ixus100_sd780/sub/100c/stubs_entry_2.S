#include "stubs_asm.h"

NHSTUB(TurnOffBackLight,0xff8810a0)	//DispSwCon_TurnOffBackLight
NHSTUB(VbattGet,0xff820644)		// sigfinder2
NHSTUB(vsprintf,0xFF81CBA0)		//eventproc_export_CPrintf look for function called before error txt
NHSTUB(SetZoomActuatorSpeedPercent,0xFF858BEC)	//Do we fix? Not in Dryos?
NHSTUB(strchr,0xFF88779C)			//search AND R2, R1, #0xFF then LDRB R1, [R0]
NHSTUB(kbd_pwr_on,0xFF858BEC)			//Do we fix?
NHSTUB(kbd_read_keys,0xFF821DCC)		//Look for LDR R0, =YYYY then BL GetKbdState then LDR R0, =YYYY
NHSTUB(DoAFLock,0xff825334)			// sigfinder2
NHSTUB(UnlockAF,0xff82536c)			// sigfinder2
NHSTUB(LEDDrive,0xFF842698)
NHSTUB(ScreenLock,0xFF99CEC4)			//Look for ScreenLock
NHSTUB(RefreshPhysicalScreen,0xFF99CF18)	//Look for ScreenUnLock
NHSTUB(EnterToCompensationEVF,0xFF825420)	//Look for ExpOn
NHSTUB(ExitFromCompensationEVF,0xFF825464)	//Look for ExpOff
NHSTUB(PT_PlaySound,0xff85ad20)			// sigfinder2
NHSTUB(WriteSDCard,0xFF903B38)			//Look for ADD     R7, R1, R2,LSL#2
NHSTUB(GetDrive_FreeClusters,0xFF852440)	//Not certain
NHSTUB(GetDrive_TotalClusters,0xFF852414)	//Not certain
NHSTUB(GetDrive_ClusterSize,0xFF8523E8)		//Not certain
NHSTUB(GetOpticalTemperature,0xFF845FA4)	//Not certain	
NHSTUB(GetCurrentTargetDistance,0xFF912430)
NHSTUB(kbd_p2_f,0xFF82170C)			//task_PhySw+1C
NHSTUB(qsort,0xFFA79A4C)			//Look for "ORR     R2, R0, R2" (second hit)
NHSTUB(PutInNdFilter,0xFFA3C4A4)
NHSTUB(PutOutNdFilter,0xFFA3C4C8)  //Search for "NdActuator.c" and compare to SD990...
NHSTUB(SetPropertyCase,0xFF86E17C)
NHSTUB(OpLog_Get,0xFF86C53C)		//OpLog.Get()
NHSTUB(qprintf,0xFF8115A8)
NHSTUB(UnsetZoomForMovie,0xFF94AFC4)  //"ZoomCon_UnsetZoomForMovie"
NHSTUB(ShowAllTaskInfo,0xFF91BA70) //HMMM
NHSTUB(MoveIrisFullClose,0xFFA9237C)

NHSTUB(AllocateUncacheableMemory, 0xFF827448) //Override default found version Replaced found one based on missed location..
NHSTUB(kbd_pwr_off, 0xff843204)  // sigfinder2
NHSTUB(stdioSetup, 0xFF813578)
NHSTUB(HdmiRegDump,0xFF841CB0)
NHSTUB(EdidDump,0xFF841BE8)
NHSTUB(drvInfo,0xFF81E33C);
NHSTUB(blah,0xFF8462F8);
NHSTUB(open2,0xFF823C70);
NHSTUB(strrchr,0xFF99F3CC)

NHSTUB(ExpCtrlTool_StartContiAE, 0xFF82FF40) //"StartContiAE"
NHSTUB(ExpCtrlTool_StopContiAE, 0xFF830084)  //"StopContiAE"

NHSTUB(MakeAFScan, 0xFF85B170)  //DoAFLock   Well we don't know if this is the best way but it works for now....
NHSTUB(apex2us,0xFF9A010C)  //See 0xFF888F4C
NHSTUB(SetAE_ShutterSpeed, 0xFFA96F60)

NHSTUB(PostLogicalEventForNotPowerType,0xff87392c) // sigfinder2
NHSTUB(GetFocusLensSubjectDistance, 0xff912430) // sigfinder2
NHSTUB(SetScriptMode, 0xff8740d0) // sigfinder2


NHSTUB(rename                                  ,0xff8234f0) //  1                               *** != 0xff823d6c @ 100%
NHSTUB(write                                   ,0xff823d44) //101                               *** != 0xff819b44 @ 100%
NHSTUB(AllocateMemory                          ,0xffa3df5c) //101                             
NHSTUB(Close                                   ,0xff823c98) //101                             
NHSTUB(CreateTask                              ,0xff81afac) //101                             
NHSTUB(DebugAssert                             ,0xff81b284) //111                             
NHSTUB(DeleteFile_Fut                          ,0xff823544) //112                             
NHSTUB(ExecuteEventProcedure                   ,0xff86a518) //  1                              
NHSTUB(Fclose_Fut                              ,0xff8236c0) //101                             
NHSTUB(Feof_Fut                                ,0xff8238ac) //  1                             
NHSTUB(Fflush_Fut                              ,0xff8238e8) //  1                             
NHSTUB(Fgets_Fut                               ,0xff823814) //  1                             
NHSTUB(Fopen_Fut                               ,0xff823680) //101                             
NHSTUB(Fread_Fut                               ,0xff82376c) //101                             
NHSTUB(FreeMemory                              ,0xffa3df54) //101                             
NHSTUB(Fseek_Fut                               ,0xff823860) //101                             
NHSTUB(Fwrite_Fut                              ,0xff8237c0) //101                             
NHSTUB(GetCurrentAvValue                       ,0xff913380) //102                             
NHSTUB(GetKbdState                             ,0xff8431ec) //109                             
NHSTUB(GetMemInfo                              ,0xff813be4) //  1                             
NHSTUB(GetZoomLensCurrentPosition              ,0xffa31844) //102                             
NHSTUB(GiveSemaphore                           ,0xff826e64) //112                               
NHSTUB(LocalTime                               ,0xff867f08) //  1                             
NHSTUB(Lseek                                   ,0xff823dd8) //101                             
NHSTUB(MoveIrisWithAv                          ,0xffa3c0b4) //102                             
NHSTUB(Open                                    ,0xff823c70) //101                             
NHSTUB(PT_MoveDigitalZoomToWide                ,0xff85b138) //102                             
NHSTUB(PT_MoveOpticalZoomAt                    ,0xff85b110) //102                                   
NHSTUB(Read                                    ,0xff819ae4) //101                             
NHSTUB(ReadFastDir                             ,0xffa1fd94) //  1                             
NHSTUB(Remove                                  ,0xff823ce0) //  1                             
NHSTUB(Restart                                 ,0xff828b98) //106                             
NHSTUB(SetFileTimeStamp                        ,0xff823f74) //  1                              
NHSTUB(Write                                   ,0xff823d44) //101                               
NHSTUB(_log                                    ,0xffac9580) //111                             
NHSTUB(_log10                                  ,0xffac820c) //112                             
NHSTUB(_pow                                    ,0xffac837c) //114                             
NHSTUB(_sqrt                                   ,0xffacb124) //  1                             
NHSTUB(add_ptp_handler                         ,0xff9eabdc) //  3                               
NHSTUB(close                                   ,0xff8198fc) //  1                             
NHSTUB(closedir                                ,0xffa1fe64) //  1                             
NHSTUB(err_init_task                           ,0xff814e2c) //  4                             
NHSTUB(exmem_alloc                             ,0xff868dc8) //103                             
NHSTUB(free                                    ,0xff813a3c) //112                             
NHSTUB(lseek                                   ,0xff823dd8) //101                             
NHSTUB(malloc                                  ,0xff813968) //112                             
NHSTUB(memcmp                                  ,0xff81cc5c) //101                             
NHSTUB(memcpy                                  ,0xff887900) //101                             
NHSTUB(memset                                  ,0xff99f3f4) //101                             
NHSTUB(mkdir                                   ,0xff82403c) //  1       
NHSTUB(mktime_ext                              ,0xff88816c) //  1                             
NHSTUB(open                                    ,0xff81984c) //  1                             
NHSTUB(opendir                                 ,0xffa1fd00) //  1                             
NHSTUB(openfastdir                             ,0xffa1fd00) //  1                             
NHSTUB(read                                    ,0xff819ae4) //101                             
NHSTUB(readfastdir                             ,0xffa1fd94) //  1                             
NHSTUB(stat                                    ,0xff823ea4) //  1                             
NHSTUB(strcat                                  ,0xff887714) //  1                             
NHSTUB(strcmp                                  ,0xff81cbf4) //101                             
NHSTUB(strcpy                                  ,0xff81cbdc) //101                             
NHSTUB(strftime                                ,0xff887b74) //  1                             
NHSTUB(strlen                                  ,0xff81cc38) //101                             
NHSTUB(strncpy                                 ,0xff82cd3c) //  1                             
NHSTUB(strtol                                  ,0xff82cf74) //101                             
NHSTUB(strtolx                                 ,0xff82cd78) //109                             


