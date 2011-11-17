// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00D
//   Canon DIGITAL IXUS 960 IS

// Values for makefile.inc
//   PLATFORMID = 12639 (0x315f) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3                 // Found @ 0xffff31c8
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff31a8

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetCCDTemperature                     ,0xff846c74) //102        *** != 0xff846e08
//NSTUB(GetOpticalTemperature                 ,0xff846d54) //102        *** != 0xff846ce4
//NSTUB(GetZoomLensCurrentPosition            ,0xffa1abc8) //102        *** != 0xff92b200
//NSTUB(NewTaskShell                          ,0xff869278) //103        *** != 0xffc596b0
//NSTUB(PutInNdFilter                         ,0xff928924) //102        *** != 0xff9e8ac4
//NSTUB(PutOutNdFilter                        ,0xff928948) //102        *** != 0xff9e8afc
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff983f58) //103        *** != 0xffd4a934
//NSTUB(kbd_pwr_off                           ,0xff844630) //  2 67%    *** != 0xff844640
//NSTUB(kbd_pwr_on                            ,0xff8445f0) //  2 86%        == 0xff8445f0
//NSTUB(rename                                ,0xff8247dc) //  1        *** != 0xff82509c
//NSTUB(write                                 ,0xff825074) //101        *** != 0xff81a3d8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8711e4 -> ff86d7a4 -> ff944de8 -> ffa26630 -> ffad6ddc
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00014cfc) // Found @0xff823068,          stubs_min = 0x00014cfc (0x14CFC)
//DEF(physw_run                               ,0x00001ca4) // Found @0xff822d18,          stubs_min = 0x00001ca4 (0x1ca4)
//DEF(levent_table                            ,0xffab3444) // Found @0xffab3444,          stubs_min = 0xffab3444 (0xFFAB3444)
//DEF(FlashParamsTable                        ,0xffad6f9c) // Found @0xffad6f9c,          stubs_min = 0xffad6f9c (0xFFAD6F9C)
//DEF(movie_status                            ,0x00005524) // Found @0xff85824c,          stubs_min = 0x00005524 (0x5524)
//DEF(canon_menu_active                       ,0x0000f7d4) // Found @0xff983100,          stubs_min = 0x0000f7d4 (0xF7D4)
//DEF(canon_shoot_menu_active                 ,0x0000ede5) // Found @0xff9546d0,          stubs_min = 0x0000ede5 (0xEDE5)
//DEF(playrec_mode                            ,0x000056d0) // Found @0xff85f234,          stubs_min = 0x000056d0 (0x56D0)
//DEF(zoom_status                             ,0x00011e48) // Found @0xffa27e28,          stubs_min = 0x00011e48 (0x11E48)
//DEF(some_flag_for_af_scan                   ,0x00011d80) // Found @0xffa20824

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff8404d8
//void *vid_get_viewport_fb()      { return (void*)0x1065b540; } // Found @0xff9ed600
//char *camera_jpeg_count_str()    { return (char*)0x0005e288; } // Found @0xff994a8c
//long hook_raw_size()             { return 0x00ee9710; }        // Found @0xff9ef4c4
//int get_flash_params_count(void) { return 0x72; }              // Found @0xff945ea4

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffa95924, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffa95930, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffa95888, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffa95888, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffa9587c, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffa95894, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffa958a0, levent 0x03
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffa958e8, levent 0x0a
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffa958f4, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4104 // Found @0xff9e79d8
//#define CAM_RAW_ROWS      3048 // Found @0xff9e79e0
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff8298ec

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa237b8) //103
NSTUB(AllocateUncacheableMemory               ,0xff8298b0) //112
NSTUB(Close                                   ,0xff824fc8) //101
NSTUB(CreateTask                              ,0xff81baf0) //101
NSTUB(DebugAssert                             ,0xff81bfc8) //111
NSTUB(DeleteFile_Fut                          ,0xff824830) //112
//NSTUB(DoAFLock                              ,0xff826b54) //103            == 0xff826b54
NSTUB(EnterToCompensationEVF                  ,0xff826ec8) //104
NSTUB(ExecuteEventProcedure                   ,0xff81c1a8) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff826f18) //104
NSTUB(ExitTask                                ,0xff81bd80) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff834204) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8343c4) //104
NSTUB(Fclose_Fut                              ,0xff8249ac) //101
NSTUB(Feof_Fut                                ,0xff824b98) //  1
NSTUB(Fflush_Fut                              ,0xff824bd4) //  1
NSTUB(Fgets_Fut                               ,0xff824b00) //  1
NSTUB(Fopen_Fut                               ,0xff82496c) //101
NSTUB(Fread_Fut                               ,0xff824a58) //101
NSTUB(FreeMemory                              ,0xffa237a4) //103
NSTUB(FreeUncacheableMemory                   ,0xff8298e4) //112
NSTUB(Fseek_Fut                               ,0xff824b4c) //101
NSTUB(Fwrite_Fut                              ,0xff824aac) //101
//NSTUB(GetBatteryTemperature                 ,0xff846ce4) //102            == 0xff846ce4
//NSTUB(GetCurrentAvValue                     ,0xff9275c4) //102            == 0xff9275c4
NSTUB(GetDrive_ClusterSize                    ,0xff84da50) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff84daf0) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff84da84) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff925c7c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff925f88) //  1
NSTUB(GetKbdState                             ,0xff8445bc) //109
NSTUB(GetMemInfo                              ,0xff813c58) //  1
NSTUB(GetParameterData                        ,0xff945e64) //  1
NSTUB(GetPropertyCase                         ,0xff8697f4) //101
NSTUB(GetSystemTime                           ,0xffa238c0) //  1
NSTUB(GetZoomLensCurrentPoint                 ,0xff92a680) //102
NSTUB(GiveSemaphore                           ,0xff81ba5c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b5978) //102
NSTUB(LEDDrive                                ,0xff843bd8) //103
NSTUB(LocalTime                               ,0xff8655c4) //  1
NSTUB(LockMainPower                           ,0xff86d3d0) //103
NSTUB(Lseek                                   ,0xff825108) //101
NSTUB(MakeDirectory_Fut                       ,0xff8248a4) //  1
NSTUB(MoveFocusLensToDistance                 ,0xff9ea6b8) //102
NSTUB(MoveIrisWithAv                          ,0xff927850) //102
NSTUB(MoveZoomLensWithPoint                   ,0xff92b12c) //102
NSTUB(Open                                    ,0xff824fa0) //101
//NSTUB(PB2Rec                                ,0xff87058c) //104            == 0xff87058c
NSTUB(PT_MoveDigitalZoomToWide                ,0xff86096c) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xff860934) //103
//NSTUB(PT_PlaySound                          ,0xff8604e0) //103            == 0xff8604e0
NSTUB(PostLogicalEventForNotPowerType         ,0xff86b218) //103
NSTUB(PostLogicalEventToUI                    ,0xff86b264) //103
NSTUB(Read                                    ,0xff81a378) //101
NSTUB(ReadFastDir                             ,0xffa0a1bc) //  1
//NSTUB(Rec2PB                                ,0xff86ef84) //104            == 0xff86ef84
NSTUB(RefreshPhysicalScreen                   ,0xff9a0f54) //104
NSTUB(Remove                                  ,0xff825010) //  1
NSTUB(RenameFile_Fut                          ,0xff8247dc) //  1
NSTUB(Restart                                 ,0xff82b90c) //106
NSTUB(SetAE_ShutterSpeed                      ,0xff9ec7b4) //102
NSTUB(SetAutoShutdownTime                     ,0xff86d444) //103
NSTUB(SetCurrentCaptureModeType               ,0xff874e2c) //101
NSTUB(SetFileTimeStamp                        ,0xff8252a4) //  1
NSTUB(SetLogicalEventActive                   ,0xff86d000) //  1
NSTUB(SetParameterData                        ,0xff945dd4) //101
NSTUB(SetPropertyCase                         ,0xff8696ec) //103
//NSTUB(SetScriptMode                         ,0xff86d050) //101            == 0xff86d050
NSTUB(SleepTask                               ,0xff829738) //101
NSTUB(TakeSemaphore                           ,0xff81b98c) //101
NSTUB(TurnOffBackLight                        ,0xff87a430) //104
NSTUB(TurnOnBackLight                         ,0xff87a418) //104
//NSTUB(UnlockAF                              ,0xff826ba4) //103            == 0xff826ba4
NSTUB(UnlockMainPower                         ,0xff86d324) //103
//NSTUB(UnsetZoomForMovie                     ,0xff94ca38) //104            == 0xff94ca38
NSTUB(UpdateMBROnFlash                        ,0xff84d818) //  1
NSTUB(VbattGet                                ,0xff821944) //101
NSTUB(Write                                   ,0xff825074) //101
NSTUB(WriteSDCard                             ,0xff91a968) //108
NSTUB(_log                                    ,0xffa92ed8) //111
NSTUB(_log10                                  ,0xffa91e1c) //112
NSTUB(_pow                                    ,0xffa91f8c) //114
NSTUB(_sqrt                                   ,0xffa94240) //  1
NSTUB(add_ptp_handler                         ,0xff8cc2b0) //  1
NSTUB(apex2us                                 ,0xff9a240c) //  4
NSTUB(close                                   ,0xff81a190) //  1
NSTUB(closedir                                ,0xffa0a28c) //  1
NSTUB(err_init_task                           ,0xff814eb0) //  4
NSTUB(exmem_alloc                             ,0xff86670c) //  1
NSTUB(free                                    ,0xff813ab0) //112
NSTUB(kbd_p1_f                                ,0xff82316c) //109
NSTUB(kbd_p1_f_cont                           ,0xff823178) //109
NSTUB(kbd_p2_f                                ,0xff8229b8) //109
NSTUB(kbd_read_keys                           ,0xff823068) //109
//NSTUB(kbd_read_keys_r2                      ,0xff84415c) //109            == 0xff84415c
NSTUB(lseek                                   ,0xff825108) //101
NSTUB(malloc                                  ,0xff8139dc) //112
NSTUB(memcmp                                  ,0xff81e82c) //101
NSTUB(memcpy                                  ,0xff88fdec) //101
NSTUB(memset                                  ,0xffa614e4) //101
NSTUB(mkdir                                   ,0xff82536c) //  1
// ALT: NSTUB(mkdir, 0xff82540c) // 1 32/0
NSTUB(mktime_ext                              ,0xff890658) //  1
NSTUB(open                                    ,0xff81a0e0) //  1
NSTUB(opendir                                 ,0xffa0a128) //  1
NSTUB(openfastdir                             ,0xffa0a128) //  1
NSTUB(qsort                                   ,0xff9a17e4) //  1
NSTUB(rand                                    ,0xff81e934) //  1
NSTUB(read                                    ,0xff81a378) //101
NSTUB(readfastdir                             ,0xffa0a1bc) //  1
NSTUB(reboot_fw_update                        ,0xffa11b80) //  1
NSTUB(set_control_event                       ,0xff86ccec) //  1
NSTUB(srand                                   ,0xff81e928) //  1
NSTUB(stat                                    ,0xff8251d4) //  1
NSTUB(strcat                                  ,0xff88fd18) //  1
NSTUB(strchr                                  ,0xff88fda0) //  1
NSTUB(strcmp                                  ,0xff81e7c4) //101
NSTUB(strcpy                                  ,0xff81e770) //101
NSTUB(strftime                                ,0xff890060) //  1
NSTUB(strlen                                  ,0xff81e808) //101
NSTUB(strncmp                                 ,0xff88fd54) //  1
NSTUB(strncpy                                 ,0xff81e788) //  1
NSTUB(strrchr                                 ,0xff88fdc4) //  1
NSTUB(strtol                                  ,0xff82ff20) //101
NSTUB(strtolx                                 ,0xff82fd24) //109
  DEF(task_CaptSeq                            ,0xff85c038) //107
  DEF(task_ExpDrv                             ,0xff8af7b0) //110
  DEF(task_InitFileModules                    ,0xff871070) //107
  DEF(task_MovieRecord                        ,0xff8584ec) //107
  DEF(task_PhySw                              ,0xff822d14) //107
//NSTUB(time                                  ,0xff865ac8) //  2            == 0xff865ac8
NSTUB(vsprintf                                ,0xff81e6f0) //  1
