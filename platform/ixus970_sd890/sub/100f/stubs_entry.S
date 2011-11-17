// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00F
//   Canon PowerShot SD890 IS

// Values for makefile.inc
//   PLATFORMID = 12659 (0x3173) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3enc              // Found @ 0xffff33e0
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff33c0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(PutInNdFilter                         ,0xffa2ab90) //102        *** != 0xffa83868
//NSTUB(PutOutNdFilter                        ,0xffa2abb4) //102        *** != 0xffa8389c
//NSTUB(rename                                ,0xff8235e8) //  1        *** != 0xff823e64
//NSTUB(write                                 ,0xff823e3c) //101        *** != 0xff81a0f4

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff87907c -> ff875820 -> ff95c828 -> ffa3ee38 -> ffaf9518
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00010650) // Found @0xff821e38,          stubs_min = 0x00010650 (0x10650)
//DEF(physw_run                               ,0x00001c00) // Found @0xff821ad0,          stubs_min = 0x00001c00 (0x1BF4+0xC)
//DEF(levent_table                            ,0xffad4084) // Found @0xffad4084,          stubs_min = 0xffad4084 (0xFFAD4084)
//DEF(FlashParamsTable                        ,0xffaf96d8) // Found @0xffaf96d8,          stubs_min = 0xffaf96d8 (0xFFAF96D8)
//DEF(movie_status                            ,0x000053cc) // Found @0xff859cfc,          stubs_min = 0x000053cc (0x5390+0x3C)
//DEF(canon_menu_active                       ,0x000099e0) // Found @0xff950108,          stubs_min = 0x000099e0 (0x99DC+4)
//DEF(canon_shoot_menu_active                 ,0x00009fd9) // Found @0xff96cce0,          stubs_min = 0x00009fd9 (0x9FD8+1)
//DEF(playrec_mode                            ,0x0000555c) // Found @0xff8610f4,          stubs_min = 0x0000555c (0x5558+0x4)
//DEF(zoom_status                             ,0x0000d4a4) // Found @0xffa40638,          stubs_min = 0x0000d4a4 (0xD4A4)
//DEF(some_flag_for_af_scan                   ,0x0000d228) // Found @0xffa2b508,          stubs_min = 0x0000d228 (0xD228)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff83e89c
//void *vid_get_viewport_fb()      { return (void*)0x1065adc0; } // Found @0xffa88a6c
//char *camera_jpeg_count_str()    { return (char*)0x0004ca80; } // Found @0xff9a6f4c
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffa8acf0
//int get_flash_params_count(void) { return 0x73; }              // Found @0xff95d8e4

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffab16e8, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffab16f4, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffab1658, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffab1664, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffab1670, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffab167c, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffab1688, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffab1694, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffab16a0, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffab16ac, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffab164c, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffab164c, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffab16b8, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffab1640, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffa8248c
//#define CAM_RAW_ROWS      2772 // Found @0xffa82494
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff8285a4

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa2e3a0) //101
NSTUB(AllocateUncacheableMemory               ,0xff828568) //112
NSTUB(Close                                   ,0xff823d90) //101
NSTUB(CreateTask                              ,0xff81b818) //101
//NSTUB(DebugAssert                           ,0xff81bcf0) //111            == 0xff81bcf0
NSTUB(DeleteFile_Fut                          ,0xff82363c) //112
//NSTUB(DoAFLock                              ,0xff825b84) //102            == 0xff825b84
NSTUB(EnterToCompensationEVF                  ,0xff825e80) //104
NSTUB(ExecuteEventProcedure                   ,0xff86938c) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff825ed0) //104
NSTUB(ExitTask                                ,0xff81baa8) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff832b00) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff832c44) //104
NSTUB(Fclose_Fut                              ,0xff8237b8) //101
NSTUB(Feof_Fut                                ,0xff8239a4) //  1
NSTUB(Fflush_Fut                              ,0xff8239e0) //  1
NSTUB(Fgets_Fut                               ,0xff82390c) //  1
NSTUB(Fopen_Fut                               ,0xff823778) //101
NSTUB(Fread_Fut                               ,0xff823864) //101
NSTUB(FreeMemory                              ,0xffa2e398) //101
NSTUB(FreeUncacheableMemory                   ,0xff82859c) //112
NSTUB(Fseek_Fut                               ,0xff823958) //101
NSTUB(Fwrite_Fut                              ,0xff8238b8) //101
NSTUB(GetBatteryTemperature                   ,0xff84539c) //102
NSTUB(GetCCDTemperature                       ,0xff84532c) //102
NSTUB(GetCurrentAvValue                       ,0xff92facc) //102
NSTUB(GetDrive_ClusterSize                    ,0xff84f2bc) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff84f324) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff84f2f0) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff92ebc4) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92eed0) //  1
NSTUB(GetKbdState                             ,0xff8428e4) //109
NSTUB(GetMemInfo                              ,0xff813c40) //  1
NSTUB(GetOpticalTemperature                   ,0xff84540c) //102
NSTUB(GetParameterData                        ,0xff95d8a4) //101
NSTUB(GetPropertyCase                         ,0xff86cf8c) //102
NSTUB(GetSystemTime                           ,0xffa2e3f8) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff932d74) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa24448) //102
NSTUB(GiveSemaphore                           ,0xff81b77c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8bd988) //102
//NSTUB(LEDDrive                              ,0xff842068) //103            == 0xff842068
NSTUB(LocalTime                               ,0xff866a50) //  1
NSTUB(LockMainPower                           ,0xff875438) //103
NSTUB(Lseek                                   ,0xff823ed0) //101
NSTUB(MakeDirectory_Fut                       ,0xff8236b0) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffa855a8) //102
NSTUB(MoveIrisWithAv                          ,0xffa2a7a8) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa2ad2c) //102
NSTUB(NewTaskShell                            ,0xff86ca50) //103
NSTUB(Open                                    ,0xff823d68) //101
//NSTUB(PB2Rec                                ,0xff878454) //104            == 0xff878454
NSTUB(PT_MoveDigitalZoomToWide                ,0xff85bb68) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff85bb40) //102
NSTUB(PT_PlaySound                            ,0xff85b1c4) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff8731f8) //103            == 0xff8731f8
//NSTUB(PostLogicalEventToUI                  ,0xff873244) //103            == 0xff873244
NSTUB(Read                                    ,0xff81a094) //101
NSTUB(ReadFastDir                             ,0xffa13470) //  1
//NSTUB(Rec2PB                                ,0xff876e58) //104            == 0xff876e58
NSTUB(RefreshPhysicalScreen                   ,0xff9b1258) //104
NSTUB(Remove                                  ,0xff823dd8) //  1
NSTUB(RenameFile_Fut                          ,0xff8235e8) //  1
NSTUB(Restart                                 ,0xff829de0) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffa87c7c) //102
NSTUB(SetAutoShutdownTime                     ,0xff8754ac) //103
NSTUB(SetCurrentCaptureModeType               ,0xff87c2b8) //101
NSTUB(SetFileTimeStamp                        ,0xff82406c) //  1
NSTUB(SetLogicalEventActive                   ,0xff875118) //  1
NSTUB(SetParameterData                        ,0xff95d814) //101
NSTUB(SetPropertyCase                         ,0xff86ce8c) //102
//NSTUB(SetScriptMode                         ,0xff875168) //101            == 0xff875168
NSTUB(SleepTask                               ,0xff8283ec) //101
NSTUB(TakeSemaphore                           ,0xff81b6ac) //101
NSTUB(TurnOffBackLight                        ,0xff881cac) //104
NSTUB(TurnOnBackLight                         ,0xff881c94) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff951064) //103
//NSTUB(UnlockAF                              ,0xff825bc8) //102            == 0xff825bc8
NSTUB(UnlockMainPower                         ,0xff87538c) //103
//NSTUB(UnsetZoomForMovie                     ,0xff962e40) //104            == 0xff962e40
NSTUB(UpdateMBROnFlash                        ,0xff84f0fc) //  1
NSTUB(VbattGet                                ,0xff82071c) //103
NSTUB(Write                                   ,0xff823e3c) //101
//NSTUB(WriteSDCard                           ,0xff922764) //108            == 0xff922764
NSTUB(_log                                    ,0xffaaec70) //111
NSTUB(_log10                                  ,0xffaadbb4) //112
NSTUB(_pow                                    ,0xffaadd24) //114
NSTUB(_sqrt                                   ,0xffab0090) //  1
NSTUB(add_ptp_handler                         ,0xff9e1a94) //  1
//NSTUB(apex2us                               ,0xff9b2794) //  4            == 0xff9b2794
NSTUB(close                                   ,0xff819eac) //  1
NSTUB(closedir                                ,0xffa13540) //  1
NSTUB(err_init_task                           ,0xff814e98) //  4
NSTUB(exmem_alloc                             ,0xff867b74) //103
NSTUB(free                                    ,0xff813a98) //112
NSTUB(kbd_p1_f                                ,0xff821f3c) //109
NSTUB(kbd_p1_f_cont                           ,0xff821f48) //109
NSTUB(kbd_p2_f                                ,0xff821770) //109
NSTUB(kbd_pwr_off                             ,0xff842968) //  2
NSTUB(kbd_pwr_on                              ,0xff842918) //  2
NSTUB(kbd_read_keys                           ,0xff821e38) //109
NSTUB(kbd_read_keys_r2                        ,0xff842490) //109
NSTUB(lseek                                   ,0xff823ed0) //101
NSTUB(malloc                                  ,0xff8139c4) //112
NSTUB(memcmp                                  ,0xff81d844) //101
NSTUB(memcpy                                  ,0xff894328) //101
NSTUB(memset                                  ,0xff9b160c) //101
NSTUB(mkdir                                   ,0xff824134) //  1
// ALT: NSTUB(mkdir, 0xff8241d4) // 1 32/0
NSTUB(mktime_ext                              ,0xff894b94) //  1
NSTUB(open                                    ,0xff819dfc) //  1
NSTUB(opendir                                 ,0xffa133dc) //  1
NSTUB(openfastdir                             ,0xffa133dc) //  1
NSTUB(qsort                                   ,0xff9b1b14) //  1
NSTUB(rand                                    ,0xff81d94c) //  1
NSTUB(read                                    ,0xff81a094) //101
NSTUB(readfastdir                             ,0xffa13470) //  1
NSTUB(reboot_fw_update                        ,0xffa1ae70) //  5
NSTUB(set_control_event                       ,0xff874d94) //  1
NSTUB(srand                                   ,0xff81d940) //  1
NSTUB(stat                                    ,0xff823f9c) //  1
NSTUB(strcat                                  ,0xff894114) //  1
NSTUB(strchr                                  ,0xff89419c) //  1
NSTUB(strcmp                                  ,0xff81d7dc) //101
NSTUB(strcpy                                  ,0xff81d7c4) //101
NSTUB(strftime                                ,0xff89459c) //  1
NSTUB(strlen                                  ,0xff81d820) //101
NSTUB(strncmp                                 ,0xff894150) //  1
NSTUB(strncpy                                 ,0xff82e1fc) //  1
//NSTUB(strrchr                               ,0xff8941c0) //  1            == 0xff8941c0
NSTUB(strtol                                  ,0xff82e434) //101
NSTUB(strtolx                                 ,0xff82e238) //109
  DEF(task_CaptSeq                            ,0xff85dfc0) //107
  DEF(task_ExpDrv                             ,0xff8b67e8) //110
  DEF(task_InitFileModules                    ,0xff878f08) //107
  DEF(task_MovieRecord                        ,0xff859f88) //107
  DEF(task_PhySw                              ,0xff821acc) //107
NSTUB(time                                    ,0xff866f54) //  2
NSTUB(vsprintf                                ,0xff81d744) //  1
