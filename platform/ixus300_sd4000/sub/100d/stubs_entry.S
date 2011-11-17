// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R43 (DRYOS version 2.3, release #0043)
//   Firmware Ver GM1.00D
//   Canon IXUS 300 HS

// Values for makefile.inc
//   PLATFORMID = 12791 (0x31f7) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4a                // Found @ 0xffff366c
//   NEED_ENCODED_DISKBOOT = 4   // Found @ 0xffff367c

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetDrive_FreeClusters                 ,0xff8344a8) //  3        *** != 0xff871e90
// ALT: NSTUB(GetDrive_FreeClusters, 0xff871e90) // 4 9/0
//NSTUB(GetImageFolder                        ,0xff94345c) //106        *** != 0xff94337c
//NSTUB(PutInNdFilter                         ,0xffab69c8) //102        *** != 0xffb2056c
//NSTUB(PutOutNdFilter                        ,0xffab69ec) //102        *** != 0xffb205a4
//NSTUB(ScreenLock                            ,0xffa13354) //  3        *** != 0xffa1356c
//NSTUB(SetScriptMode                         ,0xff895904) //101        *** != 0xff810f6c
//NSTUB(kbd_pwr_off                           ,0xff861a14) //  2 60%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff899754 -> ff895f74 -> ff996578 -> ffac969c -> ffc0041c
// Mode 33324 in firmware but not in current modemap
// Mode 33323 in firmware but not in current modemap
// Mode 33320 in firmware but not in current modemap
// Mode 33322 in firmware but not in current modemap
// Mode 33321 in firmware but not in current modemap
// Mode 33288 in firmware but not in current modemap
// Mode 33289 in firmware but not in current modemap

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00032e94) // Found @0xff8347d4,          stubs_min = 0x00032e94 (0x32E94)
//DEF(physw_run                               ,0x00001c34) // Found @0xff834404,          stubs_min = 0x00001c34 (0x1C34)
//DEF(levent_table                            ,0xffb9f59c) // Found @0xffb9f59c,          stubs_min = 0xffb9f59c (0xFFB9F59C)
//DEF(FlashParamsTable                        ,0xffc00624) // Found @0xffc00624,          stubs_min = 0xffc00624 (0xFFC00624)
//DEF(movie_status                            ,0x00006a14) // Found @0xff96b418,          stubs_min = 0x00006a14 (0x6A14)
//DEF(full_screen_refresh                     ,0x0000926c) // Found @0xffa11520,          stubs_min = 0x0000926c (0x926C)
//DEF(canon_menu_active                       ,0x00003040) // Found @0xff890234,          stubs_min = 0x00003040 (0x3040)
//DEF(canon_shoot_menu_active                 ,0x00007b5d) // Found @0xff9abd94,          stubs_min = 0x00007b5d (0x7B5D)
//DEF(playrec_mode                            ,0x00002d78) // Found @0xff882334,          stubs_min = 0x00002d78 (0x2D78)
//DEF(zoom_status                             ,0x0000cea4) // Found @0xffaccb94,          stubs_min = 0x0000cea4 (0xCEA4)
//DEF(some_flag_for_af_scan                   ,0x00006dd8) // Found @0xff96e984,          stubs_min = 0x00006dd8 (0x6DD8)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85b150
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb25ed8
//char *camera_jpeg_count_str()    { return (char*)0x000a15b8; } // Found @0xffa04f80
//long hook_raw_size()             { return 0x00f32880; }        // Found @0xffb292d0
//int get_flash_params_count(void) { return 0x94; }              // Found @0xff997634

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb5f77c, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffb5f784, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000900 }, // Found @0xffb5f6ec, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000800 }, // Found @0xffb5f6ec, levent 0x01
//    { 0, KEY_DOWN            ,0x00000001 }, // Found @0xffb5f6bc, levent 0x05
//    { 0, KEY_RIGHT           ,0x00000002 }, // Found @0xffb5f6c4, levent 0x07
//    { 0, KEY_SHOOT_HALF      ,0x00000100 }, // Found @0xffb5f6e4, levent 0x00
//    { 0, KEY_UP              ,0x00000004 }, // Found @0xffb5f6cc, levent 0x04
//    { 0, KEY_LEFT            ,0x00000008 }, // Found @0xffb5f6d4, levent 0x06
//    { 1, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffb5f734, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00000020 }, // Found @0xffb5f73c, levent 0x03
//    { 1, KEY_SET             ,0x00000040 }, // Found @0xffb5f744, levent 0x08
//    { 1, KEY_MENU            ,0x00000080 }, // Found @0xffb5f74c, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3816 // Found @0xff93c408
//#define CAM_RAW_ROWS      2784 // Found @0xff93c414
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff83a460

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffab8cf0) //101
NSTUB(AllocateUncacheableMemory               ,0xff83a41c) //112
NSTUB(Close                                   ,0xff836db8) //101
NSTUB(CreateTask                              ,0xff81e83c) //101
NSTUB(DebugAssert                             ,0xff81eb14) //111
NSTUB(DeleteFile_Fut                          ,0xff836730) //112
NSTUB(DoAFLock                                ,0xff8382e4) //102
//NSTUB(EnterToCompensationEVF                ,0xff8383e4) //104            == 0xff8383e4
NSTUB(ExecuteEventProcedure                   ,0xff88b948) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff838428) //104            == 0xff838428
NSTUB(ExitTask                                ,0xff81eacc) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8462a0) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff846378) //104
NSTUB(Fclose_Fut                              ,0xff8368ac) //101
NSTUB(Feof_Fut                                ,0xff836a98) //  1
NSTUB(Fflush_Fut                              ,0xff836ad4) //  1
NSTUB(Fgets_Fut                               ,0xff836a00) //  1
NSTUB(Fopen_Fut                               ,0xff83686c) //101
NSTUB(Fread_Fut                               ,0xff836958) //101
NSTUB(FreeMemory                              ,0xffab8ce8) //101
NSTUB(FreeUncacheableMemory                   ,0xff83a45c) //112
NSTUB(Fseek_Fut                               ,0xff836a4c) //101
NSTUB(Fwrite_Fut                              ,0xff8369ac) //101
NSTUB(GetBatteryTemperature                   ,0xff8652a0) //102
NSTUB(GetCCDTemperature                       ,0xff86522c) //102
//NSTUB(GetCurrentAvValue                     ,0xff9644f8) //102            == 0xff9644f8
NSTUB(GetDrive_ClusterSize                    ,0xff871e30) //  4
NSTUB(GetDrive_TotalClusters                  ,0xff871e64) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff9629b8) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff962d40) //  3
NSTUB(GetKbdState                             ,0xff861908) //109
NSTUB(GetMemInfo                              ,0xff81a16c) //  3
NSTUB(GetOpticalTemperature                   ,0xff865314) //102
NSTUB(GetParameterData                        ,0xff9975f4) //101
NSTUB(GetPropertyCase                         ,0xff88f660) //102
NSTUB(GetSystemTime                           ,0xffab8d48) //101
//NSTUB(GetZoomLensCurrentPoint               ,0xff965e54) //102            == 0xff965e54
//NSTUB(GetZoomLensCurrentPosition            ,0xffaa9298) //102            == 0xffaa9298
//NSTUB(GiveSemaphore                         ,0xff839e38) //112            == 0xff839e38
//NSTUB(IsStrobeChargeCompleted               ,0xff8da44c) //102            == 0xff8da44c
//NSTUB(LEDDrive                              ,0xff860c6c) //103            == 0xff860c6c
NSTUB(LocalTime                               ,0xff88923c) //  1
NSTUB(LockMainPower                           ,0xff895b78) //103
//NSTUB(Lseek                                 ,0xff836ed4) //101            == 0xff836ed4
NSTUB(MakeDirectory_Fut                       ,0xff8367a4) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffb228b0) //102
NSTUB(MoveIrisWithAv                          ,0xffab6408) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffab6b64) //102
NSTUB(NewTaskShell                            ,0xff88f06c) //103
NSTUB(Open                                    ,0xff836d4c) //101
//NSTUB(PB2Rec                                ,0xff898b40) //104            == 0xff898b40
NSTUB(PT_MoveDigitalZoomToWide                ,0xff87a8c0) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff87a898) //102
//NSTUB(PT_PlaySound                          ,0xff8840b8) //  7            == 0xff8840b8
NSTUB(PostLogicalEventForNotPowerType         ,0xff893948) //103
NSTUB(PostLogicalEventToUI                    ,0xff893994) //103
NSTUB(Read                                    ,0xff81ac7c) //101
//NSTUB(ReadFastDir                           ,0xffa95de4) //  4            == 0xffa95de4
//NSTUB(Rec2PB                                ,0xff897590) //104            == 0xff897590
//NSTUB(RefreshPhysicalScreen                 ,0xffa12124) //104            == 0xffa12124
//NSTUB(Remove                                ,0xff836dec) //  4            == 0xff836dec
//NSTUB(RenameFile_Fut                        ,0xff83669c) //  4            == 0xff83669c
NSTUB(Restart                                 ,0xff83bbfc) //106
NSTUB(ScreenUnlock                            ,0xffa13398) //  7
NSTUB(SetAE_ShutterSpeed                      ,0xffb2504c) //102
NSTUB(SetAutoShutdownTime                     ,0xff895bec) //103
NSTUB(SetCurrentCaptureModeType               ,0xff89e550) //101
//NSTUB(SetFileTimeStamp                      ,0xff837054) //  4            == 0xff837054
NSTUB(SetLogicalEventActive                   ,0xff8958b4) //101
NSTUB(SetParameterData                        ,0xff997564) //101
NSTUB(SetPropertyCase                         ,0xff88f530) //102
NSTUB(SleepTask                               ,0xff83a0a0) //101
NSTUB(TakeSemaphore                           ,0xff839d68) //101
//NSTUB(TurnOffBackLight                      ,0xff8a4980) //104            == 0xff8a4980
//NSTUB(TurnOnBackLight                       ,0xff8a4968) //104            == 0xff8a4968
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff984ab4) //103            == 0xff984ab4
NSTUB(UnlockAF                                ,0xff83831c) //102
NSTUB(UnlockMainPower                         ,0xff895acc) //103
NSTUB(UpdateMBROnFlash                        ,0xff871cb0) //  3
NSTUB(VbattGet                                ,0xff8330d8) //103
NSTUB(Write                                   ,0xff836e48) //101
//NSTUB(WriteSDCard                           ,0xff952494) //108            == 0xff952494
NSTUB(_log                                    ,0xffb5b348) //111
NSTUB(_log10                                  ,0xffb59fd4) //112
NSTUB(_pow                                    ,0xffb5a144) //114
NSTUB(_sqrt                                   ,0xffb5cf50) //  1
NSTUB(add_ptp_handler                         ,0xffa4eabc) //  3
NSTUB(apex2us                                 ,0xffa16da4) //  4
NSTUB(close                                   ,0xff81aa94) //  1
//NSTUB(closedir                              ,0xffa95c40) //  4            == 0xffa95c40
NSTUB(err_init_task                           ,0xff815f4c) //  4
//NSTUB(exmem_alloc                           ,0xff88a17c) //103            == 0xff88a17c
NSTUB(free                                    ,0xff81415c) //112
NSTUB(kbd_p1_f                                ,0xff83484c) //109
NSTUB(kbd_p1_f_cont                           ,0xff834858) //109
NSTUB(kbd_p2_f                                ,0xff8340d0) //109
//NSTUB(kbd_read_keys                         ,0xff8347d4) //109            == 0xff8347d4
NSTUB(kbd_read_keys_r2                        ,0xff86122c) //109
//NSTUB(lseek                                 ,0xff836ed4) //101            == 0xff836ed4
NSTUB(malloc                                  ,0xff814100) //112
NSTUB(memcmp                                  ,0xff82066c) //101
NSTUB(memcpy                                  ,0xff83fae8) //101
NSTUB(memset                                  ,0xffa15ddc) //101
NSTUB(mkdir                                   ,0xff837254) //  4
NSTUB(mktime_ext                              ,0xff8ac9f0) //  1
NSTUB(open                                    ,0xff81a9e4) //  1
NSTUB(opendir                                 ,0xffa95c90) //  4
//NSTUB(openfastdir                           ,0xffa95c90) //  4            == 0xffa95c90
//NSTUB(qsort                                 ,0xffb0b1f8) //  4            == 0xffb0b1f8
NSTUB(rand                                    ,0xff820774) //  1
NSTUB(read                                    ,0xff81ac7c) //101
//NSTUB(readfastdir                           ,0xffa95de4) //  4            == 0xffa95de4
NSTUB(reboot_fw_update                        ,0xffa9b228) //  1
NSTUB(rename                                  ,0xff83669c) //  4
NSTUB(set_control_event                       ,0xff895504) //111
NSTUB(srand                                   ,0xff820768) //  1
NSTUB(stat                                    ,0xff836f1c) //  3
//NSTUB(strcat                                ,0xff8ac1ac) //  1            == 0xff8ac1ac
NSTUB(strchr                                  ,0xff813fe4) //  1
NSTUB(strcmp                                  ,0xff820628) //101
NSTUB(strcpy                                  ,0xff820610) //101
NSTUB(strftime                                ,0xff8ac3f8) //113
NSTUB(strlen                                  ,0xff814030) //101
NSTUB(strncmp                                 ,0xff813f98) //  1
NSTUB(strncpy                                 ,0xff813f5c) //  1
//NSTUB(strrchr                               ,0xff814008) //  1            == 0xff814008
NSTUB(strtol                                  ,0xff83fdc8) //101
NSTUB(strtolx                                 ,0xff83fbcc) //109
  DEF(task_CaptSeq                            ,0xff87d2d8) //110
  DEF(task_ExpDrv                             ,0xff8c25dc) //110
  DEF(task_InitFileModules                    ,0xff8995e0) //107
  DEF(task_MovieRecord                        ,0xff96bd30) //107
  DEF(task_PhySw                              ,0xff834400) //107
  DEF(task_RotaryEncoder                      ,0xff861b68) //107
NSTUB(time                                    ,0xff88981c) //  2
NSTUB(vsprintf                                ,0xff8205d4) //  4
NSTUB(write                                   ,0xff836e48) //101
