// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.02B
//   Possible corrupt firmware dump - file size to small for start address 0xff810000
//     file size = 7.88MB, should be 7.94MB
//   Canon PowerShot SD880 IS

// Values for makefile.inc
//   PLATFORMID = 12694 (0x3196) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetDrive_TotalClusters                ,0xff8554e0) //  1        *** != 0xff85557c
//NSTUB(kbd_pwr_off                           ,0xff846260) //  2 64%    *** != 0x00000000
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0x00000000
//NSTUB(rename                                ,0xff82334c) //  1        *** != 0xff823bc8
//NSTUB(write                                 ,0xff823ba0) //101        *** != 0xff819aac

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff87caf4 -> ff8792b0 -> ff9596f4 -> ffa4b9b4 -> ffb2d32c
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00011078) // Found @0xff821ba4,          stubs_min = 0x00011078 (0x11078)
//DEF(physw_run                               ,0x00001c28) // Found @0xff821818,          stubs_min = 0x00001c28 (0x1C1C+0x0C)
//DEF(levent_table                            ,0xffb072a0) // Found @0xffb072a0,          stubs_min = 0xffb072a0 (0xFFB072A0)
//DEF(FlashParamsTable                        ,0xffb2d500) // Found @0xffb2d500,          stubs_min = 0xffb2d500 (0xFFB2D500)
//DEF(movie_status                            ,0x000051e4) // Found @0xff85dd18,          stubs_min = 0x000051e4 (0x51A8+0x3C)
//DEF(canon_menu_active                       ,0x00005610) // Found @0xff872298,          stubs_min = 0x00005610 (0x560C+0x4)
//DEF(canon_shoot_menu_active                 ,0x0000a161) // Found @0xff96aa10,          stubs_min = 0x0000a161 (0xA160+0x1)
//DEF(playrec_mode                            ,0x00005398) // Found @0xff865b40,          stubs_min = 0x00005398 (0x5394+0x4)
//DEF(zoom_status                             ,0x0000d570) // Found @0xffa4d1c8,          stubs_min = 0x0000d570 (0xD570)
//DEF(some_flag_for_af_scan                   ,0x00009280) // Found @0xff933ca0,          stubs_min = 0x00009280 (0x9280)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x403b1000; } // Found @0xff841de0
//void *vid_get_viewport_fb()      { return (void*)0x40a2f2d0; } // Found @0xffaa19b8
//char *camera_jpeg_count_str()    { return (char*)0x0004a980; } // Found @0xff9ad200
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffaa3d98
//int get_flash_params_count(void) { return 0x78; }              // Found @0xff95a7b0

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffad7064, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffad7070, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffad6fd4, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffad6fe0, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffad6fec, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffad6ff8, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffad7004, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffad7010, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffad701c, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffad7028, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffad6fc8, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffad6fc8, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffad7034, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffad6fbc, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffa9ac80
//#define CAM_RAW_ROWS      2772 // Found @0xffa9ac88
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff827bac

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa3d8b8) //101
NSTUB(AllocateUncacheableMemory               ,0xff827b68) //112
NSTUB(Close                                   ,0xff823af4) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff8233a0) //112
//NSTUB(DoAFLock                              ,0xff8255d8) //102            == 0xff8255d8
//NSTUB(EnterToCompensationEVF                ,0xff82582c) //104            == 0xff82582c
NSTUB(ExecuteEventProcedure                   ,0xff86dac0) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff825870) //104            == 0xff825870
NSTUB(ExitTask                                ,0xff81b184) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xff830d00) //104            == 0xff830d00
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff830e44) //104
NSTUB(Fclose_Fut                              ,0xff82351c) //101
NSTUB(Feof_Fut                                ,0xff823708) //  1
NSTUB(Fflush_Fut                              ,0xff823744) //  1
NSTUB(Fgets_Fut                               ,0xff823670) //  1
NSTUB(Fopen_Fut                               ,0xff8234dc) //101
NSTUB(Fread_Fut                               ,0xff8235c8) //101
NSTUB(FreeMemory                              ,0xffa3d8b0) //101
NSTUB(FreeUncacheableMemory                   ,0xff827ba8) //112
NSTUB(Fseek_Fut                               ,0xff8236bc) //101
NSTUB(Fwrite_Fut                              ,0xff82361c) //101
NSTUB(GetBatteryTemperature                   ,0xff848cf4) //102
NSTUB(GetCCDTemperature                       ,0xff848c84) //102
NSTUB(GetCurrentAvValue                       ,0xff928280) //102
NSTUB(GetDrive_ClusterSize                    ,0xff8554ac) //  1
//NSTUB(GetDrive_FreeClusters                 ,0xff855514) //  1            == 0xff855514
NSTUB(GetFocusLensSubjectDistance             ,0xff927344) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92772c) //  3
NSTUB(GetKbdState                             ,0xff846248) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff848d64) //102
NSTUB(GetParameterData                        ,0xff95a770) //101
NSTUB(GetPropertyCase                         ,0xff8717a8) //102
NSTUB(GetSystemTime                           ,0xffa3d910) //101
//NSTUB(GetZoomLensCurrentPoint               ,0xff92b9cc) //102            == 0xff92b9cc
NSTUB(GetZoomLensCurrentPosition              ,0xffa337f0) //102
NSTUB(GiveSemaphore                           ,0xff827584) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8ab714) //102
//NSTUB(LEDDrive                              ,0xff8459e8) //103            == 0xff8459e8
NSTUB(LocalTime                               ,0xff86b25c) //  1
NSTUB(LockMainPower                           ,0xff878ec8) //103
NSTUB(Lseek                                   ,0xff823c34) //101
NSTUB(MakeDirectory_Fut                       ,0xff823414) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffa9e3fc) //102
NSTUB(MoveIrisWithAv                          ,0xffa3a93c) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa3aec4) //102
NSTUB(NewTaskShell                            ,0xff871250) //103
NSTUB(Open                                    ,0xff823acc) //101
//NSTUB(PB2Rec                                ,0xff87bf0c) //104            == 0xff87bf0c
NSTUB(PT_MoveDigitalZoomToWide                ,0xff85f93c) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff85f914) //102
NSTUB(PT_PlaySound                            ,0xff85f28c) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff876ca4) //103            == 0xff876ca4
NSTUB(PostLogicalEventToUI                    ,0xff876cf0) //103
//NSTUB(PutInNdFilter                         ,0xffa3ad28) //102            == 0xffa3ad28
//NSTUB(PutOutNdFilter                        ,0xffa3ad4c) //102            == 0xffa3ad4c
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa21ca0) //  1
//NSTUB(Rec2PB                                ,0xff87a8a4) //104            == 0xff87a8a4
//NSTUB(RefreshPhysicalScreen                 ,0xff9b8424) //104            == 0xff9b8424
NSTUB(Remove                                  ,0xff823b3c) //  1
NSTUB(RenameFile_Fut                          ,0xff82334c) //  1
//NSTUB(Restart                               ,0xff8293dc) //106            == 0xff8293dc
NSTUB(SetAE_ShutterSpeed                      ,0xffaa0bc8) //102
NSTUB(SetAutoShutdownTime                     ,0xff878f3c) //103
NSTUB(SetCurrentCaptureModeType               ,0xff8800bc) //101
NSTUB(SetFileTimeStamp                        ,0xff823dd0) //  1
NSTUB(SetLogicalEventActive                   ,0xff878c18) //101
NSTUB(SetParameterData                        ,0xff95a6e0) //101
NSTUB(SetPropertyCase                         ,0xff8716a0) //102
//NSTUB(SetScriptMode                         ,0xff878c68) //101            == 0xff878c68
NSTUB(SleepTask                               ,0xff8277ec) //101
NSTUB(TakeSemaphore                           ,0xff8274b4) //101
//NSTUB(TurnOffBackLight                      ,0xff886078) //104            == 0xff886078
NSTUB(TurnOnBackLight                         ,0xff886060) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff94b858) //103
//NSTUB(UnlockAF                              ,0xff825610) //102            == 0xff825610
NSTUB(UnlockMainPower                         ,0xff878e1c) //103
//NSTUB(UnsetZoomForMovie                     ,0xff9607a0) //104            == 0xff9607a0
NSTUB(UpdateMBROnFlash                        ,0xff8552ec) //  1
NSTUB(VbattGet                                ,0xff820570) //103
NSTUB(Write                                   ,0xff823ba0) //101
//NSTUB(WriteSDCard                           ,0xff918858) //108            == 0xff918858
NSTUB(_log                                    ,0xffad3188) //111
NSTUB(_log10                                  ,0xffad1e14) //112
NSTUB(_pow                                    ,0xffad1f84) //114
NSTUB(_sqrt                                   ,0xffad4de4) //  1
NSTUB(add_ptp_handler                         ,0xff9ef744) //  3
//NSTUB(apex2us                               ,0xff9b9440) //  4            == 0xff9b9440
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa21d70) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff86c19c) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821ca0) //109
NSTUB(kbd_p1_f_cont                           ,0xff821cac) //109
NSTUB(kbd_p2_f                                ,0xff8214b8) //109
NSTUB(kbd_read_keys                           ,0xff821ba4) //109
NSTUB(kbd_read_keys_r2                        ,0xff845de0) //109
NSTUB(lseek                                   ,0xff823c34) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cbb4) //101
NSTUB(memcpy                                  ,0xff8928f4) //101
NSTUB(memset                                  ,0xff9b8778) //101
NSTUB(mkdir                                   ,0xff823e98) //  1
// ALT: NSTUB(mkdir, 0xff823f38) // 1 32/0
NSTUB(mktime_ext                              ,0xff893160) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa21c0c) //  1
NSTUB(openfastdir                             ,0xffa21c0c) //  1
//NSTUB(qsort                                 ,0xffa84fc8) //  1            == 0xffa84fc8
NSTUB(rand                                    ,0xff81ccbc) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa21ca0) //  1
NSTUB(reboot_fw_update                        ,0xffa296a0) //  5
NSTUB(set_control_event                       ,0xff878894) //  1
NSTUB(srand                                   ,0xff81ccb0) //  1
NSTUB(stat                                    ,0xff823d00) //  1
NSTUB(strcat                                  ,0xff892708) //  1
//NSTUB(strchr                                ,0xff892790) //  1            == 0xff892790
NSTUB(strcmp                                  ,0xff81cb4c) //101
NSTUB(strcpy                                  ,0xff81cb34) //101
NSTUB(strftime                                ,0xff892b68) //  1
NSTUB(strlen                                  ,0xff81cb90) //101
NSTUB(strncmp                                 ,0xff892744) //  1
NSTUB(strncpy                                 ,0xff82d678) //  1
//NSTUB(strrchr                               ,0xff9b8750) //  1            == 0xff9b8750
NSTUB(strtol                                  ,0xff82d8b0) //101
NSTUB(strtolx                                 ,0xff82d6b4) //109
  DEF(task_CaptSeq                            ,0xff861cfc) //107
  DEF(task_ExpDrv                             ,0xff8a4608) //110
  DEF(task_InitFileModules                    ,0xff87c980) //107
  DEF(task_MovieRecord                        ,0xff85e03c) //107
  DEF(task_PhySw                              ,0xff821814) //107
NSTUB(time                                    ,0xff86b83c) //  2
NSTUB(vsprintf                                ,0xff81caf8) //  1
