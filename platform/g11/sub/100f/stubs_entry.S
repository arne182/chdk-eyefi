// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R39 (DRYOS version 2.3, release #0039)
//   Firmware Ver GM1.00F
//   Canon PowerShot G11

// Values for makefile.inc
//   PLATFORMID = 12767 (0x31df) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff35a8
//   NEED_ENCODED_DISKBOOT = 3   // Found @ 0xffff35b8

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(SetScriptMode                         ,0xff895014) //101        *** != 0xff810f4c
NSTUB(kbd_pwr_off                             ,0xff8603ec) //  2 64%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff810b04
//NSTUB(rename                                ,0xff835278) //  4        *** != 0xff835a5c
//NSTUB(write                                 ,0xff835a10) //101        *** != 0xff81abd8

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff899018 -> ff895658 -> ff995248 -> ffab4778 -> ffbe6f0c
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00032578) // Found @0xff833554,          stubs_min = 0x00032578 (0x32578)
//DEF(physw_run                               ,0x00001c44) // Found @0xff8331c4,          stubs_min = 0x00001c44 (0x1c44)
//DEF(levent_table                            ,0xffb95d20) // Found @0xffb95d20,          stubs_min = 0xffb95d20 (0xFFB95D20)
//DEF(FlashParamsTable                        ,0xffbe7100) // Found @0xffbe7100,          stubs_min = 0xffbe7100 (0xFFBE7100)
//DEF(movie_status                            ,0x00006d90) // Found @0xff9627d8,          stubs_min = 0x00006d90 (0x6D58+0x38)
//DEF(full_screen_refresh                     ,0x00009840) // Found @0xffa0ec68
//DEF(canon_menu_active                       ,0x0000303c) // Found @0xff88e1ac,          stubs_min = 0x0000303c (0x3038+0x4)
//DEF(canon_shoot_menu_active                 ,0x00008259) // Found @0xff9af8c4,          stubs_min = 0x00008259 (0x8258+0x1)
//DEF(playrec_mode                            ,0x00002d64) // Found @0xff880488,          stubs_min = 0x00002d64 (0x2D60+0x4)
//DEF(zoom_status                             ,0x0000c868) // Found @0xffab7664,          stubs_min = 0x0000c868 (0xC868)
//DEF(some_flag_for_af_scan                   ,0x000072b4) // Found @0xff965e50,          stubs_min = 0x000072b4 (0x72B4)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff85a490
//void *vid_get_viewport_fb()      { return (void*)0x40587700; } // Found @0xffb066ac
//char *camera_jpeg_count_str()    { return (char*)0x00097234; } // Found @0xffa0107c
//long hook_raw_size()             { return 0x00ee9200; }        // Found @0xffb09964
//int get_flash_params_count(void) { return 0x84; }              // Found @0xff996848

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb474ec, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00100000 // Found @0xffb47510, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffb47378, levent 0x03
//    { 0, KEY_ZOOM_IN         ,0x00000010 }, // Found @0xffb47384, levent 0x02
//    { 0, KEY_LEFT            ,0x00000400 }, // Found @0xffb473cc, levent 0x06
//    { 0, KEY_SET             ,0x00000800 }, // Found @0xffb473d8, levent 0x08
//    { 0, KEY_RIGHT           ,0x00001000 }, // Found @0xffb473e4, levent 0x07
//    { 0, KEY_DOWN            ,0x00002000 }, // Found @0xffb473f0, levent 0x05
//    { 0, KEY_UP              ,0x00004000 }, // Found @0xffb473fc, levent 0x04
//    { 0, KEY_DISPLAY         ,0x00020000 }, // Found @0xffb47420, levent 0x0a
//    { 0, KEY_MENU            ,0x00040000 }, // Found @0xffb4742c, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb474b0, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb474b0, levent 0x01
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb474a4, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_RAW_ROWPIX    3744 // Found @0xff9356e4
//#define CAM_RAW_ROWS      2784 // Found @0xff9356ec
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff839430

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffaa3438) //101
NSTUB(AllocateUncacheableMemory               ,0xff8393ec) //112
NSTUB(Close                                   ,0xff835980) //101
NSTUB(CreateTask                              ,0xff81e5b4) //101
NSTUB(DebugAssert                             ,0xff81e88c) //111
NSTUB(DeleteFile_Fut                          ,0xff83530c) //112
//NSTUB(DoAFLock                              ,0xff837128) //102            == 0xff837128
//NSTUB(EnterToCompensationEVF                ,0xff8373a8) //104            == 0xff8373a8
NSTUB(ExecuteEventProcedure                   ,0xff889834) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff8373ec) //104            == 0xff8373ec
NSTUB(ExitTask                                ,0xff81e844) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff844cb0) //104            == 0xff844cb0
//NSTUB(ExpCtrlTool_StopContiAE               ,0xff844d88) //104            == 0xff844d88
NSTUB(Fclose_Fut                              ,0xff835488) //101
NSTUB(Feof_Fut                                ,0xff835674) //  1
NSTUB(Fflush_Fut                              ,0xff8356b0) //  1
NSTUB(Fgets_Fut                               ,0xff8355dc) //  1
NSTUB(Fopen_Fut                               ,0xff835448) //101
NSTUB(Fread_Fut                               ,0xff835534) //101
NSTUB(FreeMemory                              ,0xffaa3430) //101
NSTUB(FreeUncacheableMemory                   ,0xff83942c) //112
NSTUB(Fseek_Fut                               ,0xff835628) //101
NSTUB(Fwrite_Fut                              ,0xff835588) //101
NSTUB(GetBatteryTemperature                   ,0xff863588) //102
NSTUB(GetCCDTemperature                       ,0xff863514) //102
NSTUB(GetCurrentAvValue                       ,0xff95c14c) //102
NSTUB(GetDrive_ClusterSize                    ,0xff86fc30) //  3
NSTUB(GetDrive_FreeClusters                   ,0xff86fc90) //  3
NSTUB(GetDrive_TotalClusters                  ,0xff86fc64) //  3
NSTUB(GetFocusLensSubjectDistance             ,0xff95a720) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff95ab68) //  3
NSTUB(GetImageFolder                          ,0xff93d570) //106
//NSTUB(GetKbdState                           ,0xff8603d4) //109            == 0xff8603d4
NSTUB(GetMemInfo                              ,0xff81a070) //  3
NSTUB(GetOpticalTemperature                   ,0xff8635fc) //102
NSTUB(GetParameterData                        ,0xff996808) //101
NSTUB(GetPropertyCase                         ,0xff88d5e0) //102
NSTUB(GetSystemTime                           ,0xffaa3490) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff95ed28) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa9669c) //102
//NSTUB(GiveSemaphore                         ,0xff838e08) //112            == 0xff838e08
NSTUB(IsStrobeChargeCompleted                 ,0xff8db30c) //102
//NSTUB(LEDDrive                              ,0xff85f624) //103            == 0xff85f624
NSTUB(LocalTime                               ,0xff8871a8) //  1
NSTUB(LockMainPower                           ,0xff895274) //103
//NSTUB(Lseek                                 ,0xff835a9c) //101            == 0xff835a9c
NSTUB(MakeDirectory_Fut                       ,0xff835380) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffb030c8) //102
NSTUB(MoveIrisWithAv                          ,0xffaa0344) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffaa0a5c) //102
NSTUB(NewTaskShell                            ,0xff88d08c) //103
NSTUB(Open                                    ,0xff835928) //101
NSTUB(PB2Rec                                  ,0xff89837c) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8780a8) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff878080) //102
//NSTUB(PT_PlaySound                          ,0xff882344) //102            == 0xff882344
NSTUB(PostLogicalEventForNotPowerType         ,0xff8930a0) //103
NSTUB(PostLogicalEventToUI                    ,0xff8930ec) //103
//NSTUB(PutInNdFilter                         ,0xffaa08c0) //102            == 0xffaa08c0
//NSTUB(PutOutNdFilter                        ,0xffaa08e4) //102            == 0xffaa08e4
NSTUB(Read                                    ,0xff81ab78) //101
NSTUB(ReadFastDir                             ,0xffa8416c) //  3
NSTUB(Rec2PB                                  ,0xff8983bc) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffa0fe64) //104            == 0xffa0fe64
//NSTUB(Remove                                ,0xff8359b4) //  4            == 0xff8359b4
//NSTUB(RenameFile_Fut                        ,0xff835278) //  4            == 0xff835278
//NSTUB(Restart                               ,0xff83ab40) //106            == 0xff83ab40
//NSTUB(ScreenLock                            ,0xffa11094) //  3            == 0xffa11094
//NSTUB(ScreenUnlock                          ,0xffa110bc) //  3            == 0xffa110bc
NSTUB(SetAE_ShutterSpeed                      ,0xffb0586c) //102
NSTUB(SetAutoShutdownTime                     ,0xff8952e8) //103
NSTUB(SetCurrentCaptureModeType               ,0xff89ca38) //101
//NSTUB(SetFileTimeStamp                      ,0xff835c0c) //  3            == 0xff835c0c
NSTUB(SetLogicalEventActive                   ,0xff894fc4) //101
NSTUB(SetParameterData                        ,0xff9966e4) //101
NSTUB(SetPropertyCase                         ,0xff88d4dc) //102
NSTUB(SleepTask                               ,0xff839070) //101
NSTUB(TakeSemaphore                           ,0xff838d38) //101
//NSTUB(TurnOffBackLight                      ,0xff8a33a8) //104            == 0xff8a33a8
//NSTUB(TurnOnBackLight                       ,0xff8a3390) //104            == 0xff8a3390
//NSTUB(UIFS_WriteFirmInfoToFile              ,0xff98047c) //105            == 0xff98047c
//NSTUB(UnlockAF                              ,0xff837160) //102            == 0xff837160
NSTUB(UnlockMainPower                         ,0xff8951c8) //103
//NSTUB(UnsetZoomForMovie                     ,0xff99cdb4) //104            == 0xff99cdb4
NSTUB(UpdateMBROnFlash                        ,0xff86fab0) //  3
NSTUB(VbattGet                                ,0xff831e08) //103
NSTUB(Write                                   ,0xff835a10) //101
//NSTUB(WriteSDCard                           ,0xff94b66c) //108            == 0xff94b66c
NSTUB(_log                                    ,0xffb3dd88) //111
NSTUB(_log10                                  ,0xffb3cccc) //112
NSTUB(_pow                                    ,0xffb3ce3c) //114
NSTUB(_sqrt                                   ,0xffb3f0f0) //  1
NSTUB(add_ptp_handler                         ,0xffa4dd8c) //  3
//NSTUB(apex2us                               ,0xffa1484c) //  4            == 0xffa1484c
NSTUB(close                                   ,0xff81a990) //  1
NSTUB(closedir                                ,0xffa83ff4) //  3
NSTUB(err_init_task                           ,0xff815f28) //  4
NSTUB(exmem_alloc                             ,0xff888068) //103
NSTUB(free                                    ,0xff814138) //112
NSTUB(kbd_p1_f                                ,0xff8335d0) //109
NSTUB(kbd_p1_f_cont                           ,0xff8335dc) //109
NSTUB(kbd_p2_f                                ,0xff832e90) //109
NSTUB(kbd_read_keys                           ,0xff833554) //109
//NSTUB(kbd_read_keys_r2                      ,0xff85fb44) //109            == 0xff85fb44
NSTUB(lseek                                   ,0xff835a9c) //101
NSTUB(malloc                                  ,0xff8140dc) //112
NSTUB(memcmp                                  ,0xff8203ec) //101
NSTUB(memcpy                                  ,0xff83e9ec) //101
NSTUB(memset                                  ,0xffa1389c) //101
NSTUB(mkdir                                   ,0xff835df4) //  3
NSTUB(mktime_ext                              ,0xff8aaf6c) //  1
NSTUB(open                                    ,0xff81a8e0) //  1
NSTUB(opendir                                 ,0xffa84038) //  3
//NSTUB(openfastdir                           ,0xffa84038) //  3            == 0xffa84038
NSTUB(qsort                                   ,0xffaf37d8) //  1
NSTUB(rand                                    ,0xff8204f4) //  1
NSTUB(read                                    ,0xff81ab78) //101
//NSTUB(readfastdir                           ,0xffa8416c) //  3            == 0xffa8416c
NSTUB(reboot_fw_update                        ,0xffa8967c) //  1
NSTUB(set_control_event                       ,0xff894c18) //111
NSTUB(srand                                   ,0xff8204e8) //  1
NSTUB(stat                                    ,0xff835ad8) //  3
// ALT: NSTUB(stat, 0xff86d074) // 3 31/0
//NSTUB(strcat                                ,0xff8aa728) //  1            == 0xff8aa728
NSTUB(strchr                                  ,0xff813fc0) //  1
NSTUB(strcmp                                  ,0xff8203a8) //101
NSTUB(strcpy                                  ,0xff820390) //101
NSTUB(strftime                                ,0xff8aa974) //  1
NSTUB(strlen                                  ,0xff81400c) //101
NSTUB(strncmp                                 ,0xff813f74) //  1
//NSTUB(strncpy                               ,0xff813f38) //  1            == 0xff813f38
//NSTUB(strrchr                               ,0xff813fe4) //  1            == 0xff813fe4
NSTUB(strtol                                  ,0xff83eccc) //101
NSTUB(strtolx                                 ,0xff83ead0) //109
  DEF(task_CaptSeq                            ,0xff87b06c) //107
  DEF(task_ExpDrv                             ,0xff8bfac4) //107
  DEF(task_InitFileModules                    ,0xff898ea4) //107
  DEF(task_MovieRecord                        ,0xff962a10) //107
  DEF(task_PhySw                              ,0xff8331c0) //107
  DEF(task_RotaryEncoder                      ,0xff860504) //107
NSTUB(time                                    ,0xff887720) //  2
NSTUB(vsprintf                                ,0xff820354) //  1
