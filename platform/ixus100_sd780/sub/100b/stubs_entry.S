// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00B
//   Canon DIGITAL IXUS 100 IS

// Values for makefile.inc
//   PLATFORMID = 12738 (0x31c2) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff3584
//   NEED_ENCODED_DISKBOOT = 2   // Found @ 0xffff3594

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(kbd_pwr_off                           ,0xff843204) //  2 64%        == 0xff843204
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff858bec

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff877f44 -> ff8746ec -> ff9442b0 -> ffa4a5e8 -> ffb2e4b4
// Mode 16390 in firmware but not in current modemap
// Mode 16904 in firmware but not in current modemap
// Mode 16906 in firmware but not in current modemap
// Mode 16923 in firmware but not in current modemap
// Mode 16924 in firmware but not in current modemap
// Mode 16413 in firmware but not in current modemap
// Mode 16408 in firmware but not in current modemap
// Mode 16406 in firmware but not in current modemap
// Mode  2600 in firmware but not in current modemap
// Mode  2601 in firmware but not in current modemap
// Current modemap entry not found in firmware - MODE_LANDSCAPE           32780
// Current modemap entry not found in firmware - MODE_SCN_NIGHT_SCENE     16398
// Current modemap entry not found in firmware - MODE_VIDEO_SPEED          2598
// Current modemap entry not found in firmware - MODE_VIDEO_STD            2597

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000e238) // Found @0xff821dcc,          stubs_min = 0x0000e238 (0xE238)
//DEF(physw_run                               ,0x00001c34) // Found @0xff821a40,          stubs_min = 0x00001c34 (0x1C34)
//DEF(levent_table                            ,0xffb009d4) // Found @0xffb009d4,          stubs_min = 0xffb009d4 (0xffb009d4)
//DEF(FlashParamsTable                        ,0xffb2e690) // Found @0xffb2e690,          stubs_min = 0xffb2e690 (0xffb2e690)
//DEF(movie_status                            ,0x00005b10) // Found @0xff91a3c4,          stubs_min = 0x00005b10 (0x5B10)
//DEF(canon_menu_active                       ,0x00002ca0) // Found @0xff86edcc,          stubs_min = 0x00002ca0 (0x2CA0)
//DEF(canon_shoot_menu_active                 ,0x00006e29) // Found @0xff953cac,          stubs_min = 0x00006e29 (0x6E29)
//DEF(playrec_mode                            ,0x00002a08) // Found @0xff862160,          stubs_min = 0x00002a08 (0x2A08)
//DEF(zoom_status                             ,0x0000ac68) // Found @0xffa4be18,          stubs_min = 0x0000ac68 (0xAC68)
//DEF(some_flag_for_af_scan                   ,0x00006068) // Found @0xff91d6b8,          stubs_min = 0x00006068 (0x6068)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403f1000; } // Found @0xff83dae4
//void *vid_get_viewport_fb()      { return (void*)0x415f3570; } // Found @0xffa97dcc
//char *camera_jpeg_count_str()    { return (char*)0x00033110; } // Found @0xff98fafc
//long hook_raw_size()             { return 0x011ca240; }        // Found @0xffa9a358
//int get_flash_params_count(void) { return 0x7a; }              // Found @0xff94536c

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffacd568, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffacd580, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_LEFT            ,0x00000001 }, // Found @0xffacd460, levent 0x06
//    { 0, KEY_RIGHT           ,0x00000002 }, // Found @0xffacd46c, levent 0x07
//    { 0, KEY_DOWN            ,0x00000004 }, // Found @0xffacd478, levent 0x05
//    { 0, KEY_UP              ,0x00000008 }, // Found @0xffacd484, levent 0x04
//    { 1, KEY_MENU            ,0x00000800 }, // Found @0xffacd490, levent 0x09
//    { 1, KEY_SET             ,0x00004000 }, // Found @0xffacd49c, levent 0x08
//    { 2, KEY_SHOOT_FULL      ,0x00001001 }, // Found @0xffacd52c, levent 0x01
//    { 2, KEY_DISPLAY         ,0x00000040 }, // Found @0xffacd514, levent 0x0a
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00001000 }, // Found @0xffacd52c, levent 0x01
//    { 2, KEY_ZOOM_OUT        ,0x00002000 }, // Found @0xffacd538, levent 0x03
//    { 2, KEY_ZOOM_IN         ,0x00004000 }, // Found @0xffacd544, levent 0x02
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffacd4d8, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4080 // Found @0xff8e6184
//#define CAM_RAW_ROWS      3048 // Found @0xff8e6188
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff82748c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
//NSTUB(AllocateMemory                        ,0xffa3df40) //101            == 0xffa3df40
//NSTUB(AllocateUncacheableMemory             ,0xff827448) //112            == 0xff827448
//NSTUB(Close                                 ,0xff823c98) //101            == 0xff823c98
//NSTUB(CreateTask                            ,0xff81afac) //101            == 0xff81afac
//NSTUB(DebugAssert                           ,0xff81b284) //111            == 0xff81b284
//NSTUB(DeleteFile_Fut                        ,0xff823544) //112            == 0xff823544
//NSTUB(DoAFLock                              ,0xff825334) //102            == 0xff825334
//NSTUB(EnterToCompensationEVF                ,0xff825420) //104            == 0xff825420
//NSTUB(ExecuteEventProcedure                 ,0xff86a518) //  1            == 0xff86a518
//NSTUB(ExitFromCompensationEVF               ,0xff825464) //104            == 0xff825464
//NSTUB(ExitTask                              ,0xff81b23c) //101            == 0xff81b23c
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff82ff40) //104            == 0xff82ff40
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff830084) //104            == 0xff830084
//NSTUB(Fclose_Fut                            ,0xff8236c0) //101            == 0xff8236c0
//NSTUB(Feof_Fut                              ,0xff8238ac) //  1            == 0xff8238ac
//NSTUB(Fflush_Fut                            ,0xff8238e8) //  1            == 0xff8238e8
//NSTUB(Fgets_Fut                             ,0xff823814) //  1            == 0xff823814
//NSTUB(Fopen_Fut                             ,0xff823680) //101            == 0xff823680
//NSTUB(Fread_Fut                             ,0xff82376c) //101            == 0xff82376c
//NSTUB(FreeMemory                            ,0xffa3df38) //101            == 0xffa3df38
//NSTUB(FreeUncacheableMemory                 ,0xff827488) //112            == 0xff827488
//NSTUB(Fseek_Fut                             ,0xff823860) //101            == 0xff823860
//NSTUB(Fwrite_Fut                            ,0xff8237c0) //101            == 0xff8237c0
//NSTUB(GetBatteryTemperature                 ,0xff845f30) //102            == 0xff845f30
//NSTUB(GetCCDTemperature                     ,0xff845ebc) //102            == 0xff845ebc
//NSTUB(GetCurrentAvValue                     ,0xff913380) //102            == 0xff913380
//NSTUB(GetDrive_ClusterSize                  ,0xff8523e8) //  5            == 0xff8523e8
//NSTUB(GetDrive_FreeClusters                 ,0xff852440) //  5            == 0xff852440
//NSTUB(GetDrive_TotalClusters                ,0xff852414) //  5            == 0xff852414
//NSTUB(GetFocusLensSubjectDistance           ,0xff912430) //102            == 0xff912430
//NSTUB(GetFocusLensSubjectDistanceFromLens   ,0xff91280c) //  3            == 0xff91280c
//NSTUB(GetKbdState                           ,0xff8431ec) //109            == 0xff8431ec
//NSTUB(GetMemInfo                            ,0xff813be4) //  1            == 0xff813be4
//NSTUB(GetOpticalTemperature                 ,0xff845fa4) //102            == 0xff845fa4
//NSTUB(GetParameterData                      ,0xff94532c) //101            == 0xff94532c
//NSTUB(GetPropertyCase                       ,0xff86e284) //102            == 0xff86e284
//NSTUB(GetSystemTime                         ,0xffa3df98) //101            == 0xffa3df98
//NSTUB(GetZoomLensCurrentPoint               ,0xff916a6c) //102            == 0xff916a6c
//NSTUB(GetZoomLensCurrentPosition            ,0xffa31828) //102            == 0xffa31828
//NSTUB(GiveSemaphore                         ,0xff826e64) //112            == 0xff826e64
//NSTUB(IsStrobeChargeCompleted               ,0xff8a35c8) //102            == 0xff8a35c8
//NSTUB(LEDDrive                              ,0xff842698) //103            == 0xff842698
//NSTUB(LocalTime                             ,0xff867f08) //  1            == 0xff867f08
//NSTUB(LockMainPower                         ,0xff874304) //103            == 0xff874304
//NSTUB(Lseek                                 ,0xff823dd8) //101            == 0xff823dd8
//NSTUB(MakeDirectory_Fut                     ,0xff8235b8) //  1            == 0xff8235b8
//NSTUB(MoveFocusLensToDistance               ,0xffa94764) //102            == 0xffa94764
//NSTUB(MoveIrisWithAv                        ,0xffa3c098) //102            == 0xffa3c098
//NSTUB(MoveZoomLensWithPoint                 ,0xffa3c624) //102            == 0xffa3c624
//NSTUB(NewTaskShell                          ,0xff86dd28) //103            == 0xff86dd28
//NSTUB(Open                                  ,0xff823c70) //101            == 0xff823c70
//NSTUB(PB2Rec                                ,0xff8772bc) //104            == 0xff8772bc
//NSTUB(PT_MoveDigitalZoomToWide              ,0xff85b138) //102            == 0xff85b138
//NSTUB(PT_MoveOpticalZoomAt                  ,0xff85b110) //102            == 0xff85b110
//NSTUB(PT_PlaySound                          ,0xff85ad20) //102            == 0xff85ad20
//NSTUB(PostLogicalEventForNotPowerType       ,0xff87392c) //103            == 0xff87392c
//NSTUB(PostLogicalEventToUI                  ,0xff873978) //103            == 0xff873978
//NSTUB(PutInNdFilter                         ,0xffa3c488) //102            == 0xffa3c488
//NSTUB(PutOutNdFilter                        ,0xffa3c4ac) //102            == 0xffa3c4ac
//NSTUB(Read                                  ,0xff819ae4) //101            == 0xff819ae4
//NSTUB(ReadFastDir                           ,0xffa1fd78) //  1            == 0xffa1fd78
//NSTUB(Rec2PB                                ,0xff8772fc) //104            == 0xff8772fc
//NSTUB(RefreshPhysicalScreen                 ,0xff99cf18) //104            == 0xff99cf18
//NSTUB(Remove                                ,0xff823ce0) //  1            == 0xff823ce0
//NSTUB(RenameFile_Fut                        ,0xff8234f0) //  1            == 0xff8234f0
//NSTUB(Restart                               ,0xff828b98) //106            == 0xff828b98
//NSTUB(SetAE_ShutterSpeed                    ,0xffa96f44) //102            == 0xffa96f44
//NSTUB(SetAutoShutdownTime                   ,0xff874378) //103            == 0xff874378
//NSTUB(SetCurrentCaptureModeType             ,0xff87b2c0) //101            == 0xff87b2c0
//NSTUB(SetFileTimeStamp                      ,0xff823f74) //  1            == 0xff823f74
//NSTUB(SetLogicalEventActive                 ,0xff874080) //101            == 0xff874080
//NSTUB(SetParameterData                      ,0xff94529c) //101            == 0xff94529c
//NSTUB(SetPropertyCase                       ,0xff86e17c) //102            == 0xff86e17c
//NSTUB(SetScriptMode                         ,0xff8740d0) //101            == 0xff8740d0
//NSTUB(SleepTask                             ,0xff8270cc) //101            == 0xff8270cc
//NSTUB(TakeSemaphore                         ,0xff826d94) //101            == 0xff826d94
//NSTUB(TurnOffBackLight                      ,0xff8810a0) //104            == 0xff8810a0
//NSTUB(TurnOnBackLight                       ,0xff881088) //104            == 0xff881088
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff931e7c) //101            == 0xff931e7c
//NSTUB(UnlockAF                              ,0xff82536c) //102            == 0xff82536c
//NSTUB(UnlockMainPower                       ,0xff874258) //103            == 0xff874258
//NSTUB(UnsetZoomForMovie                     ,0xff94afc4) //104            == 0xff94afc4
//NSTUB(UpdateMBROnFlash                      ,0xff852240) //  3            == 0xff852240
//NSTUB(VbattGet                              ,0xff820644) //103            == 0xff820644
//NSTUB(Write                                 ,0xff823d44) //101            == 0xff823d44
//NSTUB(WriteSDCard                           ,0xff903b38) //108            == 0xff903b38
//NSTUB(_log                                  ,0xffac9564) //111            == 0xffac9564
//NSTUB(_log10                                ,0xffac81f0) //112            == 0xffac81f0
//NSTUB(_pow                                  ,0xffac8360) //114            == 0xffac8360
//NSTUB(_sqrt                                 ,0xffacb108) //  1            == 0xffacb108
//NSTUB(add_ptp_handler                       ,0xff9eabc0) //  3            == 0xff9eabc0
//NSTUB(apex2us                               ,0xff9a010c) //  4            == 0xff9a010c
//NSTUB(close                                 ,0xff8198fc) //  1            == 0xff8198fc
//NSTUB(closedir                              ,0xffa1fe48) //  1            == 0xffa1fe48
//NSTUB(err_init_task                         ,0xff814e2c) //  4            == 0xff814e2c
//NSTUB(exmem_alloc                           ,0xff868dc8) //103            == 0xff868dc8
//NSTUB(free                                  ,0xff813a3c) //112            == 0xff813a3c
//NSTUB(kbd_p1_f                              ,0xff821e48) //109            == 0xff821e48
//NSTUB(kbd_p1_f_cont                         ,0xff821e54) //109            == 0xff821e54
//NSTUB(kbd_p2_f                              ,0xff82170c) //109            == 0xff82170c
//NSTUB(kbd_read_keys                         ,0xff821dcc) //109            == 0xff821dcc
//NSTUB(kbd_read_keys_r2                      ,0xff842b6c) //109            == 0xff842b6c
//NSTUB(lseek                                 ,0xff823dd8) //101            == 0xff823dd8
//NSTUB(malloc                                ,0xff813968) //112            == 0xff813968
//NSTUB(memcmp                                ,0xff81cc5c) //101            == 0xff81cc5c
//NSTUB(memcpy                                ,0xff887900) //101            == 0xff887900
//NSTUB(memset                                ,0xff99f3f4) //101            == 0xff99f3f4
//NSTUB(mkdir                                 ,0xff82403c) //  1            == 0xff82403c
// ALT: NSTUB(mkdir, 0xff8240dc) // 1 32/0
//NSTUB(mktime_ext                            ,0xff88816c) //  1            == 0xff88816c
//NSTUB(open                                  ,0xff81984c) //  1            == 0xff81984c
//NSTUB(opendir                               ,0xffa1fce4) //  1            == 0xffa1fce4
//NSTUB(openfastdir                           ,0xffa1fce4) //  1            == 0xffa1fce4
//NSTUB(qsort                                 ,0xffa79a30) //  1            == 0xffa79a30
//NSTUB(rand                                  ,0xff81cd64) //  1            == 0xff81cd64
//NSTUB(read                                  ,0xff819ae4) //101            == 0xff819ae4
//NSTUB(readfastdir                           ,0xffa1fd78) //  1            == 0xffa1fd78
//NSTUB(reboot_fw_update                      ,0xffa27428) //  5            == 0xffa27428
//NSTUB(rename                                ,0xff8234f0) //  1            == 0xff8234f0
//NSTUB(set_control_event                     ,0xff873db4) //111            == 0xff873db4
//NSTUB(srand                                 ,0xff81cd58) //  1            == 0xff81cd58
//NSTUB(stat                                  ,0xff823ea4) //  1            == 0xff823ea4
//NSTUB(strcat                                ,0xff887714) //  1            == 0xff887714
//NSTUB(strchr                                ,0xff88779c) //  1            == 0xff88779c
//NSTUB(strcmp                                ,0xff81cbf4) //101            == 0xff81cbf4
//NSTUB(strcpy                                ,0xff81cbdc) //101            == 0xff81cbdc
//NSTUB(strftime                              ,0xff887b74) //  1            == 0xff887b74
//NSTUB(strlen                                ,0xff81cc38) //101            == 0xff81cc38
//NSTUB(strncmp                               ,0xff887750) //  1            == 0xff887750
//NSTUB(strncpy                               ,0xff82cd3c) //  1            == 0xff82cd3c
//NSTUB(strrchr                               ,0xff99f3cc) //  1            == 0xff99f3cc
//NSTUB(strtol                                ,0xff82cf74) //101            == 0xff82cf74
//NSTUB(strtolx                               ,0xff82cd78) //109            == 0xff82cd78
  DEF(task_CaptSeq                            ,0xff85d754) //107
  DEF(task_ExpDrv                             ,0xff899cc4) //110
  DEF(task_InitFileModules                    ,0xff877dd0) //107
  DEF(task_MovieRecord                        ,0xff91a6ac) //107
  DEF(task_PhySw                              ,0xff821a3c) //107
//NSTUB(time                                  ,0xff868480) //  2            == 0xff868480
//NSTUB(vsprintf                              ,0xff81cba0) //  1            == 0xff81cba0
//NSTUB(write                                 ,0xff823d44) //101            == 0xff823d44
