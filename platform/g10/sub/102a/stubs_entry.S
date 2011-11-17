// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.02A
//   Canon PowerShot G10

// Values for makefile.inc
//   PLATFORMID = 12687 (0x318f) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4                 // Found @ 0xffff368c
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff369c

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff84b174) //  2 60%        == 0xff84b174
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff81093c

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff88301c -> ff87f310 -> ff970650 -> ffa7aa78 -> ffb75040
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00011cb8) // Found @0xff821c28,          stubs_min = 0x00011cb8 (0x00011cb8)
//DEF(physw_run                               ,0x00001c2c) // Found @0xff82189c,          stubs_min = 0x00001c2c (0x00001c2c)
//DEF(levent_table                            ,0xffb43a90) // Found @0xffb43a90,          stubs_min = 0xffb43a90 (0xffb43a90)
//DEF(FlashParamsTable                        ,0xffb75220) // Found @0xffb75220,          stubs_min = 0xffb75220 (0xffb75220)
//DEF(movie_status                            ,0x00005418) // Found @0xff8629c4,          stubs_min = 0x00005418 (0x00005418)
//DEF(canon_menu_active                       ,0x00005868) // Found @0xff8782dc,          stubs_min = 0x00005868 (0x00005868)
//DEF(canon_shoot_menu_active                 ,0x0000a8ad) // Found @0xff987994,          stubs_min = 0x0000a8ad (0x0000a8ad)
//DEF(playrec_mode                            ,0x000055d0) // Found @0xff86b300,          stubs_min = 0x000055d0 (0x000055d0)
//DEF(zoom_status                             ,0x0000e0b0) // Found @0xffa7c758,          stubs_min = 0x0000e0b0 (0x0000e0b0)
//DEF(some_flag_for_af_scan                   ,0x000096f8) // Found @0xff946b5c,          stubs_min = 0x000096f8 (0x000096f8)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff846a4c
//void *vid_get_viewport_fb()      { return (void*)0x40816dc0; } // Found @0xffad4d84
//char *camera_jpeg_count_str()    { return (char*)0x0004c95c; } // Found @0xff9cccf0
//long hook_raw_size()             { return 0x01574d00; }        // Found @0xffad7140
//int get_flash_params_count(void) { return 0x78; }              // Found @0xff971c50

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb0f954, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb0f960, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb0f7d4, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb0f7d4, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb0f7c8, levent 0x00
//    { 1, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffb0f840, levent 0x03
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffb0f84c, levent 0x02
//    { 1, KEY_LEFT            ,0x00000400 }, // Found @0xffb0f894, levent 0x06
//    { 1, KEY_SET             ,0x00000800 }, // Found @0xffb0f8a0, levent 0x08
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb0f8ac, levent 0x07
//    { 1, KEY_DOWN            ,0x00002000 }, // Found @0xffb0f8b8, levent 0x05
//    { 1, KEY_UP              ,0x00004000 }, // Found @0xffb0f8c4, levent 0x04
//    { 1, KEY_DISPLAY         ,0x00020000 }, // Found @0xffb0f8e8, levent 0x0a
//    { 1, KEY_MENU            ,0x00040000 }, // Found @0xffb0f8f4, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4480 // Found @0xffacde4c
//#define CAM_RAW_ROWS      3348 // Found @0xffacde50
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff828844

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa6886c) //101
NSTUB(AllocateUncacheableMemory               ,0xff828800) //112
NSTUB(Close                                   ,0xff824088) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff823934) //112
NSTUB(DoAFLock                                ,0xff825e48) //102
NSTUB(EnterToCompensationEVF                  ,0xff826110) //104
NSTUB(ExecuteEventProcedure                   ,0xff873ae4) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff826154) //104
NSTUB(ExitTask                                ,0xff81b184) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff831950) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff831a94) //104
NSTUB(Fclose_Fut                              ,0xff823ab0) //101
NSTUB(Feof_Fut                                ,0xff823c9c) //  1
NSTUB(Fflush_Fut                              ,0xff823cd8) //  1
NSTUB(Fgets_Fut                               ,0xff823c04) //  1
NSTUB(Fopen_Fut                               ,0xff823a70) //101
NSTUB(Fread_Fut                               ,0xff823b5c) //101
NSTUB(FreeMemory                              ,0xffa68864) //101
NSTUB(FreeUncacheableMemory                   ,0xff828840) //112
NSTUB(Fseek_Fut                               ,0xff823c50) //101
NSTUB(Fwrite_Fut                              ,0xff823bb0) //101
NSTUB(GetBatteryTemperature                   ,0xff84dc90) //102
NSTUB(GetCCDTemperature                       ,0xff84dc20) //102
NSTUB(GetCurrentAvValue                       ,0xff93b378) //102
NSTUB(GetDrive_ClusterSize                    ,0xff859f90) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff859ff8) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff859fc4) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff939848) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff939c30) //  3
NSTUB(GetKbdState                             ,0xff84afbc) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff84dd00) //102
NSTUB(GetParameterData                        ,0xff971c10) //101
NSTUB(GetPropertyCase                         ,0xff8777cc) //102
NSTUB(GetSystemTime                           ,0xffa688c4) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff93e7c8) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa5dcb8) //102
NSTUB(GiveSemaphore                           ,0xff82821c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b4794) //102
NSTUB(LEDDrive                                ,0xff84a53c) //103
NSTUB(LocalTime                               ,0xff871280) //  1
NSTUB(LockMainPower                           ,0xff87ef28) //103
NSTUB(Lseek                                   ,0xff8241c8) //101
NSTUB(MakeDirectory_Fut                       ,0xff8239a8) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffad17b8) //102
NSTUB(MoveIrisWithAv                          ,0xffa65290) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa659a8) //102
NSTUB(NewTaskShell                            ,0xff877274) //103
NSTUB(Open                                    ,0xff824060) //101
NSTUB(PB2Rec                                  ,0xff8822ec) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff864344) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff86431c) //102
NSTUB(PT_PlaySound                            ,0xff863c98) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xff87ccec) //103
NSTUB(PostLogicalEventToUI                    ,0xff87cd38) //103
NSTUB(PutInNdFilter                           ,0xffa6580c) //102
NSTUB(PutOutNdFilter                          ,0xffa65830) //102
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa4a194) //  1
NSTUB(Rec2PB                                  ,0xff880c28) //104
//NSTUB(RefreshPhysicalScreen                 ,0xff9dae58) //104            == 0xff9dae58
NSTUB(Remove                                  ,0xff8240d0) //  1
NSTUB(RenameFile_Fut                          ,0xff8238e0) //  1
NSTUB(Restart                                 ,0xff82a074) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffad3f88) //102
NSTUB(SetAutoShutdownTime                     ,0xff87ef9c) //103
NSTUB(SetCurrentCaptureModeType               ,0xff885d94) //101
NSTUB(SetFileTimeStamp                        ,0xff824364) //  1
NSTUB(SetLogicalEventActive                   ,0xff87ec78) //101
NSTUB(SetParameterData                        ,0xff971aec) //101
NSTUB(SetPropertyCase                         ,0xff8776c4) //102
NSTUB(SetScriptMode                           ,0xff87ecc8) //101
NSTUB(SleepTask                               ,0xff828484) //101
NSTUB(TakeSemaphore                           ,0xff82814c) //101
NSTUB(TurnOffBackLight                        ,0xff88c57c) //104
NSTUB(TurnOnBackLight                         ,0xff88c564) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff95fddc) //103
NSTUB(UnlockAF                                ,0xff825e9c) //102
NSTUB(UnlockMainPower                         ,0xff87ee7c) //103
NSTUB(UnsetZoomForMovie                       ,0xff977ed4) //104
NSTUB(UpdateMBROnFlash                        ,0xff859dd0) //  1
NSTUB(VbattGet                                ,0xff820574) //103
NSTUB(Write                                   ,0xff824134) //101
NSTUB(WriteSDCard                             ,0xff92a7c0) //108
NSTUB(_log                                    ,0xffb068c8) //111
NSTUB(_log10                                  ,0xffb05554) //112
NSTUB(_pow                                    ,0xffb056c4) //114
NSTUB(_sqrt                                   ,0xffb08524) //  1
NSTUB(add_ptp_handler                         ,0xffa15950) //  3
NSTUB(apex2us                                 ,0xff9dc33c) //  4
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa4a264) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff8721c0) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821d24) //109
NSTUB(kbd_p1_f_cont                           ,0xff821d30) //109
NSTUB(kbd_p2_f                                ,0xff82153c) //109
NSTUB(kbd_read_keys                           ,0xff821c28) //109
NSTUB(kbd_read_keys_r2                        ,0xff84a99c) //109
NSTUB(lseek                                   ,0xff8241c8) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cbb0) //101
NSTUB(memcpy                                  ,0xff899344) //101
NSTUB(memset                                  ,0xff9db1ac) //101
NSTUB(mkdir                                   ,0xff82442c) //  1
// ALT: NSTUB(mkdir, 0xff8244cc) // 1 32/0
NSTUB(mktime_ext                              ,0xff899bb0) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa4a100) //  1
NSTUB(openfastdir                             ,0xffa4a100) //  1
NSTUB(qsort                                   ,0xff9db6b4) //  1
NSTUB(rand                                    ,0xff81ccb8) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa4a194) //  1
NSTUB(reboot_fw_update                        ,0xffa51b94) //  5
NSTUB(rename                                  ,0xff8238e0) //  1
NSTUB(set_control_event                       ,0xff87e8dc) //111
NSTUB(srand                                   ,0xff81ccac) //  1
NSTUB(stat                                    ,0xff824294) //  1
NSTUB(strcat                                  ,0xff899158) //  1
NSTUB(strchr                                  ,0xff8991e0) //  1
NSTUB(strcmp                                  ,0xff81cb48) //101
NSTUB(strcpy                                  ,0xff81cb30) //101
NSTUB(strftime                                ,0xff8995b8) //  1
NSTUB(strlen                                  ,0xff81cb8c) //101
NSTUB(strncmp                                 ,0xff899194) //  1
NSTUB(strncpy                                 ,0xff82e2bc) //  1
NSTUB(strrchr                                 ,0xff9db184) //  1
NSTUB(strtol                                  ,0xff82e4f4) //101
NSTUB(strtolx                                 ,0xff82e2f8) //109
  DEF(task_CaptSeq                            ,0xff866bfc) //107
  DEF(task_ExpDrv                             ,0xff8ab0e0) //110
  DEF(task_InitFileModules                    ,0xff882ea8) //107
  DEF(task_MovieRecord                        ,0xff862c0c) //107
  DEF(task_PhySw                              ,0xff821898) //107
NSTUB(time                                    ,0xff871860) //  2
NSTUB(vsprintf                                ,0xff81caf4) //  1
NSTUB(write                                   ,0xff824134) //101
