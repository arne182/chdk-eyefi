// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM2.00H
//   Canon PowerShot SX1 IS

// Values for makefile.inc
//   PLATFORMID = 12693 (0x3195) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4                 // Found @ 0xffff3674
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff3684

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(ExitFromCompensationEVF               ,0xff825b88) //104        *** != 0xff825bac
//NSTUB(kbd_pwr_off                           ,0xff84da28) //  2 60%    *** != 0xff81093c
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff81093c
//NSTUB(rename                                ,0xff82329c) //  1        *** != 0xff823b18
//NSTUB(write                                 ,0xff823af0) //101        *** != 0xff819aac

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff889430 -> ff885968 -> ff98bf94 -> ffaa2ff8 -> ffbbb0cc
// Current modemap entry not found in firmware - MODE_VIDEO_STD            3622

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00012da4) // Found @0xff821af4,          stubs_min = 0x00012da4 (0x12DA4)
//DEF(physw_run                               ,0x00001c30) // Found @0xff821768,          stubs_min = 0x00001c30 (0x1C24+0x0C)
//DEF(levent_table                            ,0xffb89f4c) // Found @0xffb89f4c,          stubs_min = 0xffb89f4c (0xFFB89F4C)
//DEF(FlashParamsTable                        ,0xffbbb2a4) // Found @0xffbbb2a4,          stubs_min = 0xffbbb2a4 (0xFFBBB2A4)
//DEF(movie_status                            ,0x000055a8) // Found @0xff867b10,          stubs_min = 0x000055a8 (0x5570+0x38)
//DEF(canon_menu_active                       ,0x00005a5c) // Found @0xff87e710,          stubs_min = 0x00005a5c (0x5A58+4)
//DEF(canon_shoot_menu_active                 ,0x0000b819) // Found @0xff9a688c,          stubs_min = 0x0000b819 (0xB818+1)
//DEF(playrec_mode                            ,0x000057c4) // Found @0xff8716c8,          stubs_min = 0x000057c4 (0x57C0+0x4)
//DEF(zoom_status                             ,0x0000f2a0) // Found @0xffaa4d24,          stubs_min = 0x0000f2a0 (0xF2A0)
//DEF(some_flag_for_af_scan                   ,0x0000a5e8) // Found @0xff95e58c

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff84807c
//void *vid_get_viewport_fb()      { return (void*)0x4133bb10; } // Found @0xffafc454
//char *camera_jpeg_count_str()    { return (char*)0x0005ced4; } // Found @0xff9ed730
//long hook_raw_size()             { return 0x01076d90; }        // Found @0xffafe94c
//int get_flash_params_count(void) { return 0x79; }              // Found @0xff98d594

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffb36734, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffb36740, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffb365cc, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffb365cc, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffb365c0, levent 0x00
//    { 1, KEY_SET             ,0x00000100 }, // Found @0xffb3665c, levent 0x08
//    { 1, KEY_DISPLAY         ,0x00000200 }, // Found @0xffb36668, levent 0x0a
//    { 1, KEY_UP              ,0x00000400 }, // Found @0xffb36674, levent 0x04
//    { 1, KEY_DOWN            ,0x00000800 }, // Found @0xffb36680, levent 0x05
//    { 1, KEY_RIGHT           ,0x00001000 }, // Found @0xffb3668c, levent 0x07
//    { 1, KEY_LEFT            ,0x00002000 }, // Found @0xffb36698, levent 0x06
//    { 1, KEY_MENU            ,0x00004000 }, // Found @0xffb366a4, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4152 // Found @0xffaf52d8
//#define CAM_RAW_ROWS      2772 // Found @0xffaf52dc
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff8280b0

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa91b9c) //101
NSTUB(AllocateUncacheableMemory               ,0xff82806c) //112
NSTUB(Close                                   ,0xff823a44) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff8232f0) //112
//NSTUB(DoAFLock                              ,0xff825898) //102            == 0xff825898
//NSTUB(EnterToCompensationEVF                ,0xff825b44) //104            == 0xff825b44
NSTUB(ExecuteEventProcedure                   ,0xff879ea0) //  1
NSTUB(ExitTask                                ,0xff81b184) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8312a4) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff8313e8) //104
NSTUB(Fclose_Fut                              ,0xff82346c) //101
NSTUB(Feof_Fut                                ,0xff823658) //  1
NSTUB(Fflush_Fut                              ,0xff823694) //  1
NSTUB(Fgets_Fut                               ,0xff8235c0) //  1
NSTUB(Fopen_Fut                               ,0xff82342c) //101
NSTUB(Fread_Fut                               ,0xff823518) //101
NSTUB(FreeMemory                              ,0xffa91b94) //101
NSTUB(FreeUncacheableMemory                   ,0xff8280ac) //112
NSTUB(Fseek_Fut                               ,0xff82360c) //101
NSTUB(Fwrite_Fut                              ,0xff82356c) //101
NSTUB(GetBatteryTemperature                   ,0xff850b00) //102
NSTUB(GetCCDTemperature                       ,0xff850a90) //102
NSTUB(GetCurrentAvValue                       ,0xff94f5d4) //102
//NSTUB(GetDrive_ClusterSize                  ,0xff85e284) //  1            == 0xff85e284
//NSTUB(GetDrive_FreeClusters                 ,0xff85e2ec) //  1            == 0xff85e2ec
//NSTUB(GetDrive_TotalClusters                ,0xff85e2b8) //  1            == 0xff85e2b8
NSTUB(GetFocusLensSubjectDistance             ,0xff94da5c) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff94dd68) //  3
NSTUB(GetKbdState                             ,0xff84d880) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff850b70) //102
NSTUB(GetParameterData                        ,0xff98d554) //101
NSTUB(GetPropertyCase                         ,0xff87dbcc) //102
NSTUB(GetSystemTime                           ,0xffa91bf4) //101
//NSTUB(GetZoomLensCurrentPoint               ,0xff9548a8) //102            == 0xff9548a8
//NSTUB(GetZoomLensCurrentPosition            ,0xffa820f8) //102            == 0xffa820f8
NSTUB(GiveSemaphore                           ,0xff827a88) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8bdbdc) //102
//NSTUB(LEDDrive                              ,0xff84cc34) //103            == 0xff84cc34
NSTUB(LocalTime                               ,0xff87763c) //  1
NSTUB(LockMainPower                           ,0xff885580) //103
NSTUB(Lseek                                   ,0xff823b84) //101
NSTUB(MakeDirectory_Fut                       ,0xff823364) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffaf8794) //102
NSTUB(MoveIrisWithAv                          ,0xffa8c384) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa8caac) //102
NSTUB(NewTaskShell                            ,0xff87d674) //103
NSTUB(Open                                    ,0xff823a1c) //101
//NSTUB(PB2Rec                                ,0xff888840) //104            == 0xff888840
NSTUB(PT_MoveDigitalZoomToWide                ,0xff8697c0) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff869798) //102
NSTUB(PT_PlaySound                            ,0xff869110) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff88328c) //103            == 0xff88328c
NSTUB(PostLogicalEventToUI                    ,0xff8832d8) //103
NSTUB(PutInNdFilter                           ,0xffa8c930) //102
NSTUB(PutOutNdFilter                          ,0xffa8c954) //102
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa6fe64) //  1
//NSTUB(Rec2PB                                ,0xff8871b8) //104            == 0xff8871b8
//NSTUB(RefreshPhysicalScreen                 ,0xff9fa6fc) //104            == 0xff9fa6fc
NSTUB(Remove                                  ,0xff823a8c) //  1
NSTUB(RenameFile_Fut                          ,0xff82329c) //  1
//NSTUB(Restart                               ,0xff8298f0) //106            == 0xff8298f0
NSTUB(SetAE_ShutterSpeed                      ,0xffafb614) //102
NSTUB(SetAutoShutdownTime                     ,0xff8855f4) //103
NSTUB(SetCurrentCaptureModeType               ,0xff88d348) //101
NSTUB(SetFileTimeStamp                        ,0xff823d20) //  1
NSTUB(SetLogicalEventActive                   ,0xff885240) //101
NSTUB(SetParameterData                        ,0xff98d430) //101
NSTUB(SetPropertyCase                         ,0xff87dac4) //102
//NSTUB(SetScriptMode                         ,0xff885290) //101            == 0xff885290
NSTUB(SleepTask                               ,0xff827cf0) //101
NSTUB(TakeSemaphore                           ,0xff8279b8) //101
//NSTUB(TurnOffBackLight                      ,0xff893fc8) //104            == 0xff893fc8
NSTUB(TurnOnBackLight                         ,0xff893fb0) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff978be0) //103
//NSTUB(UnlockAF                              ,0xff8258d0) //102            == 0xff8258d0
NSTUB(UnlockMainPower                         ,0xff8854d4) //103
NSTUB(UpdateMBROnFlash                        ,0xff85e0c4) //  1
//NSTUB(VbattGet                              ,0xff82046c) //103            == 0xff82046c
NSTUB(Write                                   ,0xff823af0) //101
//NSTUB(WriteSDCard                           ,0xff93dd0c) //108            == 0xff93dd0c
NSTUB(_log                                    ,0xffb28344) //111
NSTUB(_log10                                  ,0xffb26fd0) //112
NSTUB(_pow                                    ,0xffb27140) //114
NSTUB(_sqrt                                   ,0xffb29fa0) //  1
NSTUB(add_ptp_handler                         ,0xffa3afbc) //  3
//NSTUB(apex2us                               ,0xff9fdbc8) //  4            == 0xff9fdbc8
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa6ff34) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff87857c) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821bf0) //109
NSTUB(kbd_p1_f_cont                           ,0xff821bfc) //109
NSTUB(kbd_p2_f                                ,0xff821408) //109
NSTUB(kbd_read_keys                           ,0xff821af4) //109
NSTUB(kbd_read_keys_r2                        ,0xff84d130) //109
NSTUB(lseek                                   ,0xff823b84) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cba4) //101
NSTUB(memcpy                                  ,0xff8a0984) //101
NSTUB(memset                                  ,0xff9fcf00) //101
NSTUB(mkdir                                   ,0xff823de8) //  1
// ALT: NSTUB(mkdir, 0xff823e88) // 1 32/0
NSTUB(mktime_ext                              ,0xff8a11f0) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa6fdd0) //  1
NSTUB(openfastdir                             ,0xffa6fdd0) //  1
//NSTUB(qsort                                 ,0xffae3d50) //  1            == 0xffae3d50
NSTUB(rand                                    ,0xff81ccac) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa6fe64) //  1
NSTUB(reboot_fw_update                        ,0xffa77864) //  5
NSTUB(set_control_event                       ,0xff884e9c) //111
NSTUB(srand                                   ,0xff81cca0) //  1
NSTUB(stat                                    ,0xff823c50) //  1
NSTUB(strcat                                  ,0xff8a0798) //  1
//NSTUB(strchr                                ,0xff8a0820) //  1            == 0xff8a0820
NSTUB(strcmp                                  ,0xff81cb3c) //101
NSTUB(strcpy                                  ,0xff81cb24) //101
NSTUB(strftime                                ,0xff8a0bf8) //  1
NSTUB(strlen                                  ,0xff81cb80) //101
NSTUB(strncmp                                 ,0xff8a07d4) //  1
NSTUB(strncpy                                 ,0xff82dbf8) //  1
//NSTUB(strrchr                               ,0xff9fced8) //  1            == 0xff9fced8
NSTUB(strtol                                  ,0xff82de30) //101
NSTUB(strtolx                                 ,0xff82dc34) //109
  DEF(task_CaptSeq                            ,0xff86cb80) //110
  DEF(task_ExpDrv                             ,0xff8b3e4c) //110
  DEF(task_InitFileModules                    ,0xff8892bc) //107
  DEF(task_MovieRecord                        ,0xff867d90) //107
  DEF(task_PhySw                              ,0xff821764) //107
NSTUB(time                                    ,0xff877c1c) //  2
NSTUB(vsprintf                                ,0xff81cae8) //  1
