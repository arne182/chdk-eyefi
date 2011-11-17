// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R49 (DRYOS version 2.3, release #0049)
//   Firmware Ver GM1.00A
//   Canon PowerShot SX150 IS

// Values for makefile.inc
//   PLATFORMID = 12852 (0x3234) // Found @ 0xfffe0040
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4c                // Found @ 0xffff3514
//   NEED_ENCODED_DISKBOOT = 7   // Found @ 0xffff3524

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
NSTUB(kbd_pwr_off                             ,0xff8652c4) //  2 60%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff89f7c4 -> ff89bf40 -> ff9af560 -> ffaf76d4 -> ffc4e108
// Mode 32818 in firmware but not in current modemap

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00033694) // Found @0xff834580,          stubs_min = 0x00033694 (0x00033694)
//DEF(physw_run                               ,0x00001c30) // Found @0xff83412c,          stubs_min = 0x00001c30 (0x00001c30)
//DEF(levent_table                            ,0xffbe99e8) // Found @0xffbe99e8,          stubs_min = 0xffbe99e8 (0xffbe99e8)
//DEF(FlashParamsTable                        ,0xffc4e360) // Found @0xffc4e360,          stubs_min = 0xffc4e360 (0xffc4e360)
//DEF(movie_status                            ,0x00006ec4) // Found @0xff985fb4,          stubs_min = 0x00006ec4 (0x00006ec4)
//DEF(full_screen_refresh                     ,0x00009654) // Found @0xffa2a00c,          stubs_min = 0x00009654 (0x00009654)
//DEF(canon_menu_active                       ,0x00003194) // Found @0xff8958f0,          stubs_min = 0x00003194 (0x00003194)
//DEF(canon_shoot_menu_active                 ,0x00008109) // Found @0xff9cec20,          stubs_min = 0x00008109 (0x00008109)
//DEF(playrec_mode                            ,0x00002eb8) // Found @0xff8877d0,          stubs_min = 0x00002eb8 (0x00002eb8)
//DEF(zoom_status                             ,0x0000d520) // Found @0xffafaf48,          stubs_min = 0x0000d520 (0x0000d520)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff860d18
//void *vid_get_viewport_fb()      { return (void*)0x40546b80; } // Found @0xffb4d228
//char *camera_jpeg_count_str()    { return (char*)0x000ba380; } // Found @0xffa1ea9c
//long hook_raw_size()             { return 0x014eb7e0; }        // Found @0xffb50048
//int get_flash_params_count(void) { return 0x9f; }              // Found @0xff9b0610

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb90df0, levent 0x20a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb90df8, levent 0x202
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_SHOOT_FULL      ,0x00003000 }, // Found @0xffb90d58, levent 0x01
//    { 1, KEY_SHOOT_FULL_ONLY ,0x00002000 }, // Found @0xffb90d58, levent 0x01
//    { 1, KEY_SHOOT_HALF      ,0x00001000 }, // Found @0xffb90d50, levent 0x00
//    { 1, KEY_ZOOM_IN         ,0x00004000 }, // Found @0xffb90d60, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00008000 }, // Found @0xffb90d68, levent 0x03
//    { 2, KEY_UP              ,0x00000100 }, // Found @0xffb90da8, levent 0x04
//    { 2, KEY_DOWN            ,0x00000200 }, // Found @0xffb90db0, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000400 }, // Found @0xffb90db8, levent 0x07
//    { 2, KEY_LEFT            ,0x00000800 }, // Found @0xffb90dc0, levent 0x06
//    { 2, KEY_SET             ,0x00001000 }, // Found @0xffb90dc8, levent 0x08
//    { 2, KEY_MENU            ,0x00002000 }, // Found @0xffb90dd0, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00004000 }, // Found @0xffb90dd8, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher
//#define CAM_RAW_ROWPIX    4464 // Found @0xff94fc10
//#define CAM_RAW_ROWS      3276 // Found @0xff94fc1c
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff83adb8

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffae4dfc) //101
NSTUB(AllocateUncacheableMemory               ,0xff83ad70) //112
NSTUB(Close                                   ,0xff836d90) //101
NSTUB(CreateTask                              ,0xff81eae4) //101
NSTUB(DebugAssert                             ,0xff81edbc) //111
NSTUB(DeleteFile_Fut                          ,0xff8366a8) //112
NSTUB(DoAFLock                                ,0xff838934) //102
NSTUB(EnterToCompensationEVF                  ,0xff838bf0) //104
NSTUB(ExecuteEventProcedure                   ,0xff890dd0) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff838c34) //104
NSTUB(ExitTask                                ,0xff81ed74) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8469b8) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff846a98) //104
NSTUB(Fclose_Fut                              ,0xff836824) //101
NSTUB(Feof_Fut                                ,0xff836a10) //  1
NSTUB(Fflush_Fut                              ,0xff836a4c) //  1
NSTUB(Fgets_Fut                               ,0xff836978) //  6
NSTUB(Fopen_Fut                               ,0xff8367e4) //101
NSTUB(Fread_Fut                               ,0xff8368d0) //101
NSTUB(FreeMemory                              ,0xffae4df4) //101
NSTUB(FreeUncacheableMemory                   ,0xff83adb0) //112
NSTUB(Fseek_Fut                               ,0xff8369c4) //101
NSTUB(Fwrite_Fut                              ,0xff836924) //101
NSTUB(GetBatteryTemperature                   ,0xff86889c) //102
NSTUB(GetCCDTemperature                       ,0xff868828) //102
NSTUB(GetCurrentAvValue                       ,0xff97e650) //102
NSTUB(GetDrive_ClusterSize                    ,0xff876a20) //  6
NSTUB(GetDrive_FreeClusters                   ,0xff876a78) //  6
NSTUB(GetDrive_TotalClusters                  ,0xff876a50) //  6
NSTUB(GetFocusLensSubjectDistance             ,0xff97c4b8) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff97c908) //  3
NSTUB(GetImageFolder                          ,0xff958ff0) //  6
NSTUB(GetKbdState                             ,0xff8652ac) //109
NSTUB(GetMemInfo                              ,0xff81a2ac) //  3
NSTUB(GetOpticalTemperature                   ,0xff868914) //102
NSTUB(GetParameterData                        ,0xff9b05d0) //101
NSTUB(GetPropertyCase                         ,0xff894e58) //102
NSTUB(GetSystemTime                           ,0xffae4e54) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff981808) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffad21ac) //102
NSTUB(GiveSemaphore                           ,0xff83a768) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8e5648) //102
NSTUB(LEDDrive                                ,0xff864868) //101
NSTUB(LocalTime                               ,0xff88e6c8) //  6
NSTUB(LockMainPower                           ,0xff89bb38) //103
NSTUB(Lseek                                   ,0xff836fac) //101
NSTUB(MakeDirectory_Fut                       ,0xff83671c) //  6
NSTUB(MakeSDCardBootable                      ,0xff876cb0) //  6
NSTUB(MoveFocusLensToDistance                 ,0xffb494c8) //102
NSTUB(MoveIrisWithAv                          ,0xffae167c) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffae1ebc) //102
NSTUB(NewTaskShell                            ,0xff8947cc) //101
NSTUB(Open                                    ,0xff836cc8) //101
NSTUB(PB2Rec                                  ,0xff89edb8) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff87f620) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87f5f8) //102
NSTUB(PT_PlaySound                            ,0xff889628) //  6
NSTUB(PostLogicalEventForNotPowerType         ,0xff8997dc) //103
NSTUB(PostLogicalEventToUI                    ,0xff899828) //103
NSTUB(PutInNdFilter                           ,0xffb47064) //102
NSTUB(PutOutNdFilter                          ,0xffb4709c) //102
NSTUB(Read                                    ,0xff81ad68) //101
NSTUB(ReadFastDir                             ,0xffabec28) //  6
NSTUB(Rec2PB                                  ,0xff89edf8) //104
NSTUB(RefreshPhysicalScreen                   ,0xff8b1cc8) //104
NSTUB(Remove                                  ,0xff836f04) //  6
NSTUB(RenameFile_Fut                          ,0xff836614) //  6
NSTUB(Restart                                 ,0xff83c584) //106
NSTUB(ScreenLock                              ,0xff8b2f00) //  4
NSTUB(ScreenUnlock                            ,0xff8b2f64) //  3
NSTUB(SetAE_ShutterSpeed                      ,0xffb4c400) //102
NSTUB(SetAutoShutdownTime                     ,0xff89bbac) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8a3c5c) //101
NSTUB(SetFileTimeStamp                        ,0xff83711c) //  6
NSTUB(SetLogicalEventActive                   ,0xff89b884) //101
NSTUB(SetParameterData                        ,0xff9b0540) //101
NSTUB(SetPropertyCase                         ,0xff894ccc) //102
NSTUB(SetScriptMode                           ,0xff89b8d4) //101
NSTUB(SleepTask                               ,0xff83aa14) //101
NSTUB(TakeSemaphore                           ,0xff83a698) //101
NSTUB(TurnOffBackLight                        ,0xff8aa24c) //104
NSTUB(TurnOnBackLight                         ,0xff8aa234) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff9a14b0) //101
NSTUB(UnlockAF                                ,0xff83896c) //102
NSTUB(UnlockMainPower                         ,0xff89ba8c) //103
NSTUB(VbattGet                                ,0xff832df0) //101
NSTUB(Write                                   ,0xff836de4) //101
NSTUB(WriteSDCard                             ,0xff96b754) //108
NSTUB(_log                                    ,0xffb8c048) //111
NSTUB(_log10                                  ,0xffb8c588) //112
NSTUB(_pow                                    ,0xffb8c700) //114
NSTUB(_sqrt                                   ,0xffb8e324) //  6
NSTUB(add_ptp_handler                         ,0xffa74894) //  6
NSTUB(apex2us                                 ,0xffa300ec) //  4
NSTUB(close                                   ,0xff81abc4) //  6
NSTUB(closedir                                ,0xffabea84) //  4
NSTUB(err_init_task                           ,0xff816020) //  4
NSTUB(exmem_alloc                             ,0xff88f688) //101
NSTUB(free                                    ,0xff814258) //112
NSTUB(kbd_p1_f                                ,0xff8345d0) //109
NSTUB(kbd_p1_f_cont                           ,0xff8345dc) //109
NSTUB(kbd_p2_f                                ,0xff833dc4) //109
NSTUB(kbd_read_keys                           ,0xff834580) //109
NSTUB(kbd_read_keys_r2                        ,0xff864cac) //109
NSTUB(lseek                                   ,0xff836fac) //101
NSTUB(malloc                                  ,0xff814200) //112
NSTUB(memcmp                                  ,0xff820a00) //101
NSTUB(memcpy                                  ,0xff840494) //101
NSTUB(memset                                  ,0xffa2e124) //101
NSTUB(mkdir                                   ,0xff83722c) //  6
NSTUB(mktime_ext                              ,0xff8b3d28) //  1
NSTUB(open                                    ,0xff81ab14) //  6
NSTUB(opendir                                 ,0xffabead4) //  6
NSTUB(openfastdir                             ,0xffabead4) //  6
NSTUB(qsort                                   ,0xffb32c40) //  6
NSTUB(rand                                    ,0xffa2e260) //  6
NSTUB(read                                    ,0xff81ad68) //101
NSTUB(readfastdir                             ,0xffabec28) //  6
NSTUB(reboot_fw_update                        ,0xffac4168) //  6
NSTUB(rename                                  ,0xff836614) //  6
NSTUB(set_control_event                       ,0xff89b478) //111
NSTUB(srand                                   ,0xffa2e254) //  6
NSTUB(stat                                    ,0xff836ff4) //  3
NSTUB(strcat                                  ,0xff8b34e0) //  1
NSTUB(strchr                                  ,0xff8140cc) //  1
NSTUB(strcmp                                  ,0xff8209bc) //101
NSTUB(strcpy                                  ,0xff8209a4) //101
NSTUB(strftime                                ,0xff8b3728) //113
NSTUB(strlen                                  ,0xff814118) //101
NSTUB(strncmp                                 ,0xff814080) //  1
NSTUB(strncpy                                 ,0xff814044) //  1
NSTUB(strrchr                                 ,0xff8140f0) //  1
NSTUB(strtol                                  ,0xff840794) //101
NSTUB(strtolx                                 ,0xff840598) //109
  DEF(task_CaptSeq                            ,0xff881eb4) //110
  DEF(task_ExpDrv                             ,0xff8ca794) //110
  DEF(task_InitFileModules                    ,0xff89f638) //110
  DEF(task_MovieRecord                        ,0xff986a84) //110
  DEF(task_PhySw                              ,0xff834128) //110
  DEF(task_RotaryEncoder                      ,0xff865420) //110
NSTUB(time                                    ,0xff88eca4) //  6
NSTUB(vsprintf                                ,0xff820964) //  6
NSTUB(write                                   ,0xff836de4) //101
