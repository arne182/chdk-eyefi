// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00C
//   Canon DIGITAL IXUS 860 IS

// Values for makefile.inc
//   PLATFORMID = 12640 (0x3160) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d3                 // Found @ 0xffff3184
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff3164

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetCCDTemperature                     ,0xff846ac0) //102        *** != 0xff846c54
//NSTUB(GetZoomLensCurrentPosition            ,0xffa14b84) //102        *** != 0xff928bb8
//NSTUB(NewTaskShell                          ,0xff868ef4) //103        *** != 0xffc596b0
//NSTUB(PutInNdFilter                         ,0xff9262dc) //102        *** != 0xff9e448c
//NSTUB(PutOutNdFilter                        ,0xff926300) //102        *** != 0xff9e44c4
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff981760) //103        *** != 0xffd4a934
//NSTUB(kbd_pwr_off                           ,0xff84447c) //  2 67%    *** != 0xff84448c
//NSTUB(kbd_pwr_on                            ,0xff84443c) //  2 86%        == 0xff84443c
//NSTUB(rename                                ,0xff824840) //  1        *** != 0xff825100
//NSTUB(write                                 ,0xff8250d8) //101        *** != 0xff81a4a0

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff870e5c -> ff86d41c -> ff942670 -> ffa20600 -> ffacfef8
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x000113fc) // Found @0xff8230cc,          stubs_min = 0x000113fc (0x113FC)
//DEF(physw_run                               ,0x00001ca4) // Found @0xff822d7c,          stubs_min = 0x00001ca4 (0x1ca4)
//DEF(levent_table                            ,0xffaac8b8) // Found @0xffaac8b8,          stubs_min = 0xffaac8b8 (0xFFAAC8B8)
//DEF(FlashParamsTable                        ,0xffad00b4) // Found @0xffad00b4,          stubs_min = 0xffad00b4 (0xFFAD00B4)
//DEF(movie_status                            ,0x0000551c) // Found @0xff857f90,          stubs_min = 0x0000551c (0x551C)
//DEF(canon_menu_active                       ,0x0000c04c) // Found @0xff98090c,          stubs_min = 0x0000c04c (0xC04C)
//DEF(canon_shoot_menu_active                 ,0x0000b65d) // Found @0xff951f90,          stubs_min = 0x0000b65d (0xB65D)
//DEF(playrec_mode                            ,0x000056c8) // Found @0xff85eed0,          stubs_min = 0x000056c8 (0x56C8)
//DEF(zoom_status                             ,0x0000e560) // Found @0xffa21df8,          stubs_min = 0x0000e560 (0xE560)
//DEF(some_flag_for_af_scan                   ,0x0000e498) // Found @0xffa1a914

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff84034c
//void *vid_get_viewport_fb()      { return (void*)0x1065b4b0; } // Found @0xff9e8fb0
//char *camera_jpeg_count_str()    { return (char*)0x0005a668; } // Found @0xff9921b4
//long hook_raw_size()             { return 0x009dcce0; }        // Found @0xff9eae94
//int get_flash_params_count(void) { return 0x72; }              // Found @0xff94372c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffa8fd64, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffa8fd70, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffa8fcc8, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffa8fcc8, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffa8fcbc, levent 0x00
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffa8fcd4, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffa8fce0, levent 0x03
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffa8fd28, levent 0x0a
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffa8fd34, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3336 // Found @0xff9e3310
//#define CAM_RAW_ROWS      2480 // Found @0xff9e3318
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff829944

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa1d788) //103
NSTUB(AllocateUncacheableMemory               ,0xff829908) //112
NSTUB(Close                                   ,0xff82502c) //101
NSTUB(CreateTask                              ,0xff81bbb8) //101
//NSTUB(DebugAssert                           ,0xff81c090) //111            == 0xff81c090
NSTUB(DeleteFile_Fut                          ,0xff824894) //112
//NSTUB(DoAFLock                              ,0xff826bb8) //103            == 0xff826bb8
NSTUB(EnterToCompensationEVF                  ,0xff826f2c) //104
NSTUB(ExecuteEventProcedure                   ,0xff81c270) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff826f7c) //104
NSTUB(ExitTask                                ,0xff81be48) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff834214) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8343d4) //104
NSTUB(Fclose_Fut                              ,0xff824a10) //101
NSTUB(Feof_Fut                                ,0xff824bfc) //  1
NSTUB(Fflush_Fut                              ,0xff824c38) //  1
NSTUB(Fgets_Fut                               ,0xff824b64) //  1
NSTUB(Fopen_Fut                               ,0xff8249d0) //101
NSTUB(Fread_Fut                               ,0xff824abc) //101
NSTUB(FreeMemory                              ,0xffa1d774) //103
NSTUB(FreeUncacheableMemory                   ,0xff82993c) //112
NSTUB(Fseek_Fut                               ,0xff824bb0) //101
NSTUB(Fwrite_Fut                              ,0xff824b10) //101
//NSTUB(GetBatteryTemperature                 ,0xff846b30) //102            == 0xff846b30
//NSTUB(GetCurrentAvValue                     ,0xff924f7c) //102            == 0xff924f7c
NSTUB(GetDrive_ClusterSize                    ,0xff84d8a0) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff84d940) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff84d8d4) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff923634) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff923940) //  1
NSTUB(GetKbdState                             ,0xff844408) //109
NSTUB(GetMemInfo                              ,0xff813c58) //  1
//NSTUB(GetOpticalTemperature                 ,0xff846ba0) //102            == 0xff846ba0
NSTUB(GetParameterData                        ,0xff9436ec) //  1
NSTUB(GetPropertyCase                         ,0xff869470) //101
NSTUB(GetSystemTime                           ,0xffa1d890) //  1
NSTUB(GetZoomLensCurrentPoint                 ,0xff928038) //102
NSTUB(GiveSemaphore                           ,0xff81bb24) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b4cbc) //102
NSTUB(LEDDrive                                ,0xff8439fc) //103
NSTUB(LocalTime                               ,0xff865240) //  1
//NSTUB(LockMainPower                         ,0xff86d04c) //103            == 0xff86d04c
NSTUB(Lseek                                   ,0xff82516c) //101
NSTUB(MakeDirectory_Fut                       ,0xff824908) //  1
NSTUB(MoveFocusLensToDistance                 ,0xff9e5f64) //102
NSTUB(MoveIrisWithAv                          ,0xff925208) //102
NSTUB(MoveZoomLensWithPoint                   ,0xff928ae4) //102
NSTUB(Open                                    ,0xff825004) //101
//NSTUB(PB2Rec                                ,0xff870204) //104            == 0xff870204
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8605e8) //103
NSTUB(PT_MoveOpticalZoomAt                    ,0xff8605b0) //103
//NSTUB(PT_PlaySound                          ,0xff86015c) //103            == 0xff86015c
//NSTUB(PostLogicalEventForNotPowerType       ,0xff86ae94) //103            == 0xff86ae94
//NSTUB(PostLogicalEventToUI                  ,0xff86aee0) //103            == 0xff86aee0
NSTUB(Read                                    ,0xff81a440) //101
NSTUB(ReadFastDir                             ,0xffa040d4) //  1
//NSTUB(Rec2PB                                ,0xff86ebfc) //104            == 0xff86ebfc
NSTUB(RefreshPhysicalScreen                   ,0xff99e624) //104
NSTUB(Remove                                  ,0xff825074) //  1
NSTUB(RenameFile_Fut                          ,0xff824840) //  1
NSTUB(Restart                                 ,0xff82b964) //106
NSTUB(SetAE_ShutterSpeed                      ,0xff9e81ac) //102
NSTUB(SetAutoShutdownTime                     ,0xff86d0c0) //103
NSTUB(SetCurrentCaptureModeType               ,0xff874b44) //101
NSTUB(SetFileTimeStamp                        ,0xff825308) //  1
NSTUB(SetLogicalEventActive                   ,0xff86cc7c) //  1
NSTUB(SetParameterData                        ,0xff94365c) //101
NSTUB(SetPropertyCase                         ,0xff869368) //103
//NSTUB(SetScriptMode                         ,0xff86cccc) //101            == 0xff86cccc
NSTUB(SleepTask                               ,0xff829790) //101
//NSTUB(TakeSemaphore                         ,0xff81ba54) //101            == 0xff81ba54
NSTUB(TurnOffBackLight                        ,0xff87a148) //104
NSTUB(TurnOnBackLight                         ,0xff87a130) //104
//NSTUB(UnlockAF                              ,0xff826c08) //103            == 0xff826c08
NSTUB(UnlockMainPower                         ,0xff86cfa0) //103
//NSTUB(UnsetZoomForMovie                     ,0xff94a2c4) //104            == 0xff94a2c4
NSTUB(UpdateMBROnFlash                        ,0xff84d668) //  1
NSTUB(VbattGet                                ,0xff8219a8) //101
NSTUB(Write                                   ,0xff8250d8) //101
NSTUB(WriteSDCard                             ,0xff9182fc) //108
NSTUB(_log                                    ,0xffa8d318) //111
NSTUB(_log10                                  ,0xffa8c25c) //112
NSTUB(_pow                                    ,0xffa8c3cc) //114
NSTUB(_sqrt                                   ,0xffa8e680) //  1
NSTUB(add_ptp_handler                         ,0xff8caa9c) //  1
NSTUB(apex2us                                 ,0xff99fadc) //  4
NSTUB(close                                   ,0xff81a258) //  1
NSTUB(closedir                                ,0xffa041a4) //  1
NSTUB(err_init_task                           ,0xff814eb0) //  4
NSTUB(exmem_alloc                             ,0xff866388) //  1
NSTUB(free                                    ,0xff813ab0) //112
NSTUB(kbd_p1_f                                ,0xff8231d0) //109
NSTUB(kbd_p1_f_cont                           ,0xff8231dc) //109
NSTUB(kbd_p2_f                                ,0xff822a1c) //109
//NSTUB(kbd_read_keys                         ,0xff8230cc) //109            == 0xff8230cc
//NSTUB(kbd_read_keys_r2                      ,0xff843fa8) //109            == 0xff843fa8
NSTUB(lseek                                   ,0xff82516c) //101
NSTUB(malloc                                  ,0xff8139dc) //112
NSTUB(memcmp                                  ,0xff81e8f4) //101
NSTUB(memcpy                                  ,0xff88fb00) //101
NSTUB(memset                                  ,0xffa5b468) //101
NSTUB(mkdir                                   ,0xff8253d0) //  1
// ALT: NSTUB(mkdir, 0xff825470) // 1 32/0
NSTUB(mktime_ext                              ,0xff89036c) //  1
NSTUB(open                                    ,0xff81a1a8) //  1
NSTUB(opendir                                 ,0xffa04040) //  1
NSTUB(openfastdir                             ,0xffa04040) //  1
NSTUB(qsort                                   ,0xff99eeb4) //  1
NSTUB(rand                                    ,0xff81e9fc) //  1
NSTUB(read                                    ,0xff81a440) //101
NSTUB(readfastdir                             ,0xffa040d4) //  1
NSTUB(reboot_fw_update                        ,0xffa0ba98) //  1
NSTUB(set_control_event                       ,0xff86c968) //  1
NSTUB(srand                                   ,0xff81e9f0) //  1
NSTUB(stat                                    ,0xff825238) //  1
NSTUB(strcat                                  ,0xff88fa2c) //  1
NSTUB(strchr                                  ,0xff88fab4) //  1
NSTUB(strcmp                                  ,0xff81e88c) //101
NSTUB(strcpy                                  ,0xff81e838) //101
NSTUB(strftime                                ,0xff88fd74) //  1
NSTUB(strlen                                  ,0xff81e8d0) //101
NSTUB(strncmp                                 ,0xff88fa68) //  1
NSTUB(strncpy                                 ,0xff81e850) //  1
NSTUB(strrchr                                 ,0xff88fad8) //  1
NSTUB(strtol                                  ,0xff82ff78) //101
NSTUB(strtolx                                 ,0xff82fd7c) //109
  DEF(task_CaptSeq                            ,0xff85bd10) //107
  DEF(task_ExpDrv                             ,0xff8aebf4) //110
  DEF(task_InitFileModules                    ,0xff870ce8) //107
  DEF(task_MovieRecord                        ,0xff85821c) //107
  DEF(task_PhySw                              ,0xff822d78) //107
//NSTUB(time                                  ,0xff865744) //  2            == 0xff865744
NSTUB(vsprintf                                ,0xff81e7b8) //  1
