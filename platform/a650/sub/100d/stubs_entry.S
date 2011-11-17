// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00D
//   Canon PowerShot A650 IS

// Values for makefile.inc
//   PLATFORMID = 12635 (0x315b) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3                 // Found @ 0xffff1b20
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1b00

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetZoomLensCurrentPosition            ,0xffddefdc) //102        *** != 0xffd07fc4
//NSTUB(rename                                ,0xffc14734) //  1        *** != 0xffc14ff4
//NSTUB(write                                 ,0xffc14fcc) //101        *** != 0xffc0a3d8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc60c5c -> ffc5d5e0 -> ffd20374 -> ffdeadb8 -> ffe8e628
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00013fdc) // Found @0xffc12fc0,          stubs_min = 0x00013fdc (0x13FDC)
//DEF(physw_run                               ,0x00001ca4) // Found @0xffc12c70,          stubs_min = 0x00001ca4 (0x1CA4)
//DEF(levent_table                            ,0xffe6f8b0) // Found @0xffe6f8b0,          stubs_min = 0xffe6f8b0 (0xFFE6F8B0)
//DEF(FlashParamsTable                        ,0xffe8e7e4) // Found @0xffe8e7e4,          stubs_min = 0xffe8e7e4 (0xFFE8E7E4)
//DEF(movie_status                            ,0x00005550) // Found @0xffc4a7c0,          stubs_min = 0x00005550 (0x5550)
//DEF(canon_menu_active                       ,0x0000ee9c) // Found @0xffd56ff4,          stubs_min = 0x0000ee9c (0xEE9C)
//DEF(canon_shoot_menu_active                 ,0x0000e6cd) // Found @0xffd31738,          stubs_min = 0x0000e6cd (0xE6CD)
//DEF(playrec_mode                            ,0x000056e4) // Found @0xffc50f34,          stubs_min = 0x000056e4 (0x56E4)
//DEF(zoom_status                             ,0x00011174) // Found @0xffdeca7c,          stubs_min = 0x00011174 (0x11174)
//DEF(some_flag_for_af_scan                   ,0x00011040) // Found @0xffde385c,          stubs_min = 0x00011040 (0x11040)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc3396c
//void *vid_get_viewport_fb()      { return (void*)0x1065a560; } // Found @0xffdb7e64
//char *camera_jpeg_count_str()    { return (char*)0x0005cb38; } // Found @0xffd634c8
//long hook_raw_size()             { return 0x00ee9710; }        // Found @0xffdb9d28
//int get_flash_params_count(void) { return 0x72; }              // Found @0xffd21974

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe53450, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe53458, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 1, KEY_SHOOT_FULL      ,0xc0000000 }, // Found @0xffe533c0, levent 0x01
//    { 1, KEY_SHOOT_FULL_ONLY ,0x80000000 }, // Found @0xffe533c0, levent 0x01
//    { 1, KEY_SHOOT_HALF      ,0x40000000 }, // Found @0xffe533b8, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffe533d8, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffe533e0, levent 0x03
//    { 2, KEY_UP              ,0x00000010 }, // Found @0xffe533e8, levent 0x04
//    { 2, KEY_DOWN            ,0x00000020 }, // Found @0xffe533f0, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000040 }, // Found @0xffe533f8, levent 0x07
//    { 2, KEY_LEFT            ,0x00000080 }, // Found @0xffe53400, levent 0x06
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe53408, levent 0x08
//    { 2, KEY_MENU            ,0x00000200 }, // Found @0xffe53410, levent 0x09
//    { 2, KEY_DISPLAY         ,0x00000400 }, // Found @0xffe53418, levent 0x0a
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4104 // Found @0xffdb1df0
//#define CAM_RAW_ROWS      3048 // Found @0xffdb1df8
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc19a44

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffde6eac) //103            == 0xffde6eac
//NSTUB(AllocateUncacheableMemory             ,0xffc19a08) //112            == 0xffc19a08
//NSTUB(Close                                 ,0xffc14f20) //101            == 0xffc14f20
//NSTUB(CreateTask                            ,0xffc0baf0) //101            == 0xffc0baf0
NSTUB(DebugAssert                             ,0xffc0bfc8) //111
NSTUB(DeleteFile_Fut                          ,0xffc14788) //112
//NSTUB(DoAFLock                              ,0xffc16d94) //103            == 0xffc16d94
//NSTUB(EnterToCompensationEVF                ,0xffc17108) //104            == 0xffc17108
//NSTUB(ExecuteEventProcedure                 ,0xffc0c1a8) //  1            == 0xffc0c1a8
//NSTUB(ExitFromCompensationEVF               ,0xffc17158) //104            == 0xffc17158
//NSTUB(ExitTask                              ,0xffc0bd80) //101            == 0xffc0bd80
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc24250) //104            == 0xffc24250
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc24410) //104            == 0xffc24410
//NSTUB(Fclose_Fut                            ,0xffc14904) //101            == 0xffc14904
NSTUB(Feof_Fut                                ,0xffc14af0) //  1
NSTUB(Fflush_Fut                              ,0xffc14b2c) //  1
NSTUB(Fgets_Fut                               ,0xffc14a58) //  1
//NSTUB(Fopen_Fut                             ,0xffc148c4) //101            == 0xffc148c4
//NSTUB(Fread_Fut                             ,0xffc149b0) //101            == 0xffc149b0
//NSTUB(FreeMemory                            ,0xffde6e98) //103            == 0xffde6e98
//NSTUB(FreeUncacheableMemory                 ,0xffc19a3c) //112            == 0xffc19a3c
//NSTUB(Fseek_Fut                             ,0xffc14aa4) //101            == 0xffc14aa4
//NSTUB(Fwrite_Fut                            ,0xffc14a04) //101            == 0xffc14a04
//NSTUB(GetBatteryTemperature                 ,0xffc39d34) //102            == 0xffc39d34
//NSTUB(GetCCDTemperature                     ,0xffc39cc4) //102            == 0xffc39cc4
//NSTUB(GetCurrentAvValue                     ,0xffd03f7c) //102            == 0xffd03f7c
//NSTUB(GetDrive_ClusterSize                  ,0xffc40084) //  1            == 0xffc40084
//NSTUB(GetDrive_FreeClusters                 ,0xffc40124) //  1            == 0xffc40124
//NSTUB(GetDrive_TotalClusters                ,0xffc400b8) //  1            == 0xffc400b8
NSTUB(GetFocusLensSubjectDistance             ,0xffd01e10) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd0211c) //  1
NSTUB(GetKbdState                             ,0xffc37bf0) //109
NSTUB(GetMemInfo                              ,0xffc03c58) //  1
//NSTUB(GetOpticalTemperature                 ,0xffc39da4) //102            == 0xffc39da4
//NSTUB(GetParameterData                      ,0xffd21934) //101            == 0xffd21934
//NSTUB(GetPropertyCase                       ,0xffc5aecc) //101            == 0xffc5aecc
//NSTUB(GetSystemTime                         ,0xffde6fb4) //  1            == 0xffde6fb4
//NSTUB(GetZoomLensCurrentPoint               ,0xffd07444) //102            == 0xffd07444
NSTUB(GiveSemaphore                           ,0xffc0ba5c) //112
//NSTUB(IsStrobeChargeCompleted               ,0xffc999c0) //102            == 0xffc999c0
NSTUB(LEDDrive                                ,0xffc37174) //103
//NSTUB(LocalTime                             ,0xffc572f8) //  1            == 0xffc572f8
//NSTUB(LockMainPower                         ,0xffc5d20c) //103            == 0xffc5d20c
//NSTUB(Lseek                                 ,0xffc15060) //101            == 0xffc15060
NSTUB(MakeDirectory_Fut                       ,0xffc147fc) //  1
//NSTUB(MoveFocusLensToDistance               ,0xffdb4cbc) //102            == 0xffdb4cbc
NSTUB(MoveIrisWithAv                          ,0xffd0435c) //102
//NSTUB(MoveZoomLensWithPoint                 ,0xffd07ef0) //102            == 0xffd07ef0
NSTUB(NewTaskShell                            ,0xffc5a950) //103
//NSTUB(Open                                  ,0xffc14ef8) //101            == 0xffc14ef8
NSTUB(PB2Rec                                  ,0xffc600a8) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc5266c) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc52634) //103
//NSTUB(PT_PlaySound                          ,0xffc521e0) //103            == 0xffc521e0
NSTUB(PostLogicalEventForNotPowerType         ,0xffc5c8f0) //103
NSTUB(PostLogicalEventToUI                    ,0xffc5c93c) //103
NSTUB(PutInNdFilter                           ,0xffd0568c) //102
NSTUB(PutOutNdFilter                          ,0xffd056b0) //102
//NSTUB(Read                                  ,0xffc0a378) //101            == 0xffc0a378
//NSTUB(ReadFastDir                           ,0xffdd0640) //  1            == 0xffdd0640
NSTUB(Rec2PB                                  ,0xffc600d8) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffd6f958) //104            == 0xffd6f958
//NSTUB(Remove                                ,0xffc14f68) //  1            == 0xffc14f68
NSTUB(RenameFile_Fut                          ,0xffc14734) //  1
NSTUB(Restart                                 ,0xffc1ba64) //106
//NSTUB(SetAE_ShutterSpeed                    ,0xffdb7018) //102            == 0xffdb7018
NSTUB(SetAutoShutdownTime                     ,0xffc5d280) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc63bd0) //101
NSTUB(SetFileTimeStamp                        ,0xffc151fc) //  1
NSTUB(SetLogicalEventActive                   ,0xffc5cf70) //  1
//NSTUB(SetParameterData                      ,0xffd21810) //101            == 0xffd21810
NSTUB(SetPropertyCase                         ,0xffc5adc4) //103
//NSTUB(SetScriptMode                         ,0xffc5cfc0) //101            == 0xffc5cfc0
//NSTUB(SleepTask                             ,0xffc19890) //101            == 0xffc19890
//NSTUB(TakeSemaphore                         ,0xffc0b98c) //101            == 0xffc0b98c
NSTUB(TurnOffBackLight                        ,0xffc69390) //104
NSTUB(TurnOnBackLight                         ,0xffc69378) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd57a68) //103
//NSTUB(UnlockAF                              ,0xffc16de4) //103            == 0xffc16de4
//NSTUB(UnlockMainPower                       ,0xffc5d160) //103            == 0xffc5d160
//NSTUB(UnsetZoomForMovie                     ,0xffd278c0) //104            == 0xffd278c0
//NSTUB(UpdateMBROnFlash                      ,0xffc3fe4c) //  1            == 0xffc3fe4c
//NSTUB(VbattGet                              ,0xffc1189c) //101            == 0xffc1189c
//NSTUB(Write                                 ,0xffc14fcc) //101            == 0xffc14fcc
NSTUB(WriteSDCard                             ,0xffcf89dc) //108
//NSTUB(_log                                  ,0xffe4ba40) //111            == 0xffe4ba40
//NSTUB(_log10                                ,0xffe4a984) //112            == 0xffe4a984
//NSTUB(_pow                                  ,0xffe4aaf4) //114            == 0xffe4aaf4
//NSTUB(_sqrt                                 ,0xffe4cda8) //  1            == 0xffe4cda8
NSTUB(add_ptp_handler                         ,0xffcb0674) //  1
NSTUB(apex2us                                 ,0xffd70ed0) //  4
//NSTUB(close                                 ,0xffc0a190) //  1            == 0xffc0a190
//NSTUB(closedir                              ,0xffdd0710) //  1            == 0xffdd0710
NSTUB(err_init_task                           ,0xffc04eb0) //  4
NSTUB(exmem_alloc                             ,0xffc57de4) //  1
//NSTUB(free                                  ,0xffc03ab0) //112            == 0xffc03ab0
//NSTUB(kbd_p1_f                              ,0xffc130c4) //109            == 0xffc130c4
//NSTUB(kbd_p1_f_cont                         ,0xffc130d0) //109            == 0xffc130d0
//NSTUB(kbd_p2_f                              ,0xffc12910) //109            == 0xffc12910
//NSTUB(kbd_pwr_off                           ,0xffc37c7c) //  1            == 0xffc37c7c
//NSTUB(kbd_pwr_on                            ,0xffc37c24) //  1            == 0xffc37c24
//NSTUB(kbd_read_keys                         ,0xffc12fc0) //109            == 0xffc12fc0
//NSTUB(kbd_read_keys_r2                      ,0xffc3764c) //109            == 0xffc3764c
//NSTUB(lseek                                 ,0xffc15060) //101            == 0xffc15060
//NSTUB(malloc                                ,0xffc039dc) //112            == 0xffc039dc
//NSTUB(memcmp                                ,0xffc0e820) //101            == 0xffc0e820
//NSTUB(memcpy                                ,0xffc73a9c) //101            == 0xffc73a9c
//NSTUB(memset                                ,0xffe1de08) //101            == 0xffe1de08
//NSTUB(mkdir                                 ,0xffc152c4) //  1            == 0xffc152c4
// ALT: NSTUB(mkdir, 0xffc15364) // 1 32/0
NSTUB(mktime_ext                              ,0xffc74308) //  1
//NSTUB(open                                  ,0xffc0a0e0) //  1            == 0xffc0a0e0
//NSTUB(opendir                               ,0xffdd05ac) //  1            == 0xffdd05ac
//NSTUB(openfastdir                           ,0xffdd05ac) //  1            == 0xffdd05ac
//NSTUB(qsort                                 ,0xffd702a8) //  1            == 0xffd702a8
//NSTUB(rand                                  ,0xffc0e928) //  1            == 0xffc0e928
//NSTUB(read                                  ,0xffc0a378) //101            == 0xffc0a378
//NSTUB(readfastdir                           ,0xffdd0640) //  1            == 0xffdd0640
NSTUB(reboot_fw_update                        ,0xffdd4fe0) //  1
NSTUB(set_control_event                       ,0xffc5cd44) //  1
//NSTUB(srand                                 ,0xffc0e91c) //  1            == 0xffc0e91c
//NSTUB(stat                                  ,0xffc1512c) //  1            == 0xffc1512c
//NSTUB(strcat                                ,0xffc739c8) //  1            == 0xffc739c8
//NSTUB(strchr                                ,0xffc73a50) //  1            == 0xffc73a50
//NSTUB(strcmp                                ,0xffc0e7b8) //101            == 0xffc0e7b8
//NSTUB(strcpy                                ,0xffc0e764) //101            == 0xffc0e764
NSTUB(strftime                                ,0xffc73d10) //  1
//NSTUB(strlen                                ,0xffc0e7fc) //101            == 0xffc0e7fc
//NSTUB(strncmp                               ,0xffc73a04) //  1            == 0xffc73a04
//NSTUB(strncpy                               ,0xffc0e77c) //  1            == 0xffc0e77c
//NSTUB(strrchr                               ,0xffc73a74) //  1            == 0xffc73a74
//NSTUB(strtol                                ,0xffc1fe0c) //101            == 0xffc1fe0c
NSTUB(strtolx                                 ,0xffc1fc10) //109
  DEF(task_CaptSeq                            ,0xffc4db88) //107
  DEF(task_ExpDrv                             ,0xffc93848) //110
  DEF(task_InitFileModules                    ,0xffc60ae8) //107
  DEF(task_MovieRecord                        ,0xffc4aa38) //107
  DEF(task_PhySw                              ,0xffc12c6c) //107
//NSTUB(time                                  ,0xffc571ac) //  1            == 0xffc571ac
//NSTUB(vsprintf                              ,0xffc0e6e4) //  1            == 0xffc0e6e4
