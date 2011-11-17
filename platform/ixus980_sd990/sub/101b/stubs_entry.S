// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.01B
//   Canon DIGITAL IXUS 980 IS

// Values for makefile.inc
//   PLATFORMID = 12691 (0x3193) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x07ffffff
//   KEYSYS = d4                 // Found @ 0xffff363c
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff364c

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DoAFLock                              ,0xff8258d0) //102        *** != 0xff863a80
//NSTUB(UnlockAF                              ,0xff825908) //102        *** != 0xff863a90
//NSTUB(kbd_pwr_off                           ,0xff84a3a8) //  2 64%    *** != 0xff81093c
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xff81093c
//NSTUB(rename                                ,0xff8233cc) //  1        *** != 0xff823c48
//NSTUB(write                                 ,0xff823c20) //101        *** != 0xff819aac

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8816a8 -> ff87de64 -> ff961a3c -> ffa58654 -> ffb49850
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00011318) // Found @0xff821c24,          stubs_min = 0x00011318 (0x11318)
//DEF(physw_run                               ,0x00001c28) // Found @0xff821898,          stubs_min = 0x00001c28 (0x1c28)
//DEF(levent_table                            ,0xffb198e0) // Found @0xffb198e0,          stubs_min = 0xffb198e0 (0xFFB198E0)
//DEF(FlashParamsTable                        ,0xffb49a24) // Found @0xffb49a24,          stubs_min = 0xffb49a24 (0xFFB49A24)
//DEF(movie_status                            ,0x000053dc) // Found @0xff861ed0,          stubs_min = 0x000053dc (0x53DC)
//DEF(canon_menu_active                       ,0x00005830) // Found @0xff876e48,          stubs_min = 0x00005830 (0x5830)
//DEF(canon_shoot_menu_active                 ,0x0000a351) // Found @0xff973b2c,          stubs_min = 0x0000a351 (0xA351)
//DEF(playrec_mode                            ,0x00005594) // Found @0xff869e90,          stubs_min = 0x00005594 (0x5594)
//DEF(zoom_status                             ,0x0000d890) // Found @0xffa59e68,          stubs_min = 0x0000d890 (0xD890)
//DEF(some_flag_for_af_scan                   ,0x000093e0) // Found @0xff93be2c,          stubs_min = 0x000093e0 (0x93E0)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x40471000; } // Found @0xff845f24
//void *vid_get_viewport_fb()      { return (void*)0x407f6dc0; } // Found @0xffaadbb8
//char *camera_jpeg_count_str()    { return (char*)0x0004af18; } // Found @0xff9b957c
//long hook_raw_size()             { return 0x01574d00; }        // Found @0xffaaff70
//int get_flash_params_count(void) { return 0x78; }              // Found @0xff962af8

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffae8700, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffae870c, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffae8670, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffae867c, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffae8688, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffae8694, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffae86a0, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffae86ac, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffae86b8, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffae86c4, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffae8664, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffae8664, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffae86d0, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffae8658, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    4480 // Found @0xffaa6e8c
//#define CAM_RAW_ROWS      3348 // Found @0xffaa6e90
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff827f80

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa49a40) //101
NSTUB(AllocateUncacheableMemory               ,0xff827f3c) //112
NSTUB(Close                                   ,0xff823b74) //101
NSTUB(CreateTask                              ,0xff81aef4) //101
NSTUB(DebugAssert                             ,0xff81b1cc) //111
NSTUB(DeleteFile_Fut                          ,0xff823420) //112
//NSTUB(EnterToCompensationEVF                ,0xff825b7c) //104            == 0xff825b7c
NSTUB(ExecuteEventProcedure                   ,0xff872670) //  1
//NSTUB(ExitFromCompensationEVF               ,0xff825bc0) //104            == 0xff825bc0
NSTUB(ExitTask                                ,0xff81b184) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff8310e4) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff831228) //104
NSTUB(Fclose_Fut                              ,0xff82359c) //101
NSTUB(Feof_Fut                                ,0xff823788) //  1
NSTUB(Fflush_Fut                              ,0xff8237c4) //  1
NSTUB(Fgets_Fut                               ,0xff8236f0) //  1
NSTUB(Fopen_Fut                               ,0xff82355c) //101
NSTUB(Fread_Fut                               ,0xff823648) //101
NSTUB(FreeMemory                              ,0xffa49a38) //101
NSTUB(FreeUncacheableMemory                   ,0xff827f7c) //112
NSTUB(Fseek_Fut                               ,0xff82373c) //101
NSTUB(Fwrite_Fut                              ,0xff82369c) //101
NSTUB(GetBatteryTemperature                   ,0xff84ce3c) //102
NSTUB(GetCCDTemperature                       ,0xff84cdcc) //102
NSTUB(GetCurrentAvValue                       ,0xff9303b0) //102
NSTUB(GetDrive_ClusterSize                    ,0xff859648) //  1
//NSTUB(GetDrive_FreeClusters                 ,0xff8596b0) //  1            == 0xff8596b0
//NSTUB(GetDrive_TotalClusters                ,0xff85967c) //  1            == 0xff85967c
NSTUB(GetFocusLensSubjectDistance             ,0xff92f474) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92f85c) //  3
NSTUB(GetKbdState                             ,0xff84a390) //109
NSTUB(GetMemInfo                              ,0xff813c24) //  1
NSTUB(GetOpticalTemperature                   ,0xff84ceac) //102
NSTUB(GetParameterData                        ,0xff962ab8) //101
NSTUB(GetPropertyCase                         ,0xff876358) //102
NSTUB(GetSystemTime                           ,0xffa49a98) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff933afc) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa4059c) //102
NSTUB(GiveSemaphore                           ,0xff827958) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8b0638) //102
//NSTUB(LEDDrive                              ,0xff849b2c) //103            == 0xff849b2c
NSTUB(LocalTime                               ,0xff86fe0c) //  1
NSTUB(LockMainPower                           ,0xff87da7c) //103
NSTUB(Lseek                                   ,0xff823cb4) //101
NSTUB(MakeDirectory_Fut                       ,0xff823494) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffaaa5fc) //102
NSTUB(MoveIrisWithAv                          ,0xffa46ae4) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa4706c) //102
NSTUB(NewTaskShell                            ,0xff875e00) //103
NSTUB(Open                                    ,0xff823b4c) //101
//NSTUB(PB2Rec                                ,0xff880ac0) //104            == 0xff880ac0
NSTUB(PT_MoveDigitalZoomToWide                ,0xff863a48) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff863a20) //102
NSTUB(PT_PlaySound                            ,0xff863398) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xff87b858) //103
NSTUB(PostLogicalEventToUI                    ,0xff87b8a4) //103
//NSTUB(PutInNdFilter                         ,0xffa46ed0) //102            == 0xffa46ed0
//NSTUB(PutOutNdFilter                        ,0xffa46ef4) //102            == 0xffa46ef4
NSTUB(Read                                    ,0xff819a4c) //101
NSTUB(ReadFastDir                             ,0xffa2eb80) //  1
//NSTUB(Rec2PB                                ,0xff87f458) //104            == 0xff87f458
//NSTUB(RefreshPhysicalScreen                 ,0xff9c7c94) //104            == 0xff9c7c94
NSTUB(Remove                                  ,0xff823bbc) //  1
NSTUB(RenameFile_Fut                          ,0xff8233cc) //  1
//NSTUB(Restart                               ,0xff8297b0) //106            == 0xff8297b0
NSTUB(SetAE_ShutterSpeed                      ,0xffaacdc8) //102
NSTUB(SetAutoShutdownTime                     ,0xff87daf0) //103
NSTUB(SetCurrentCaptureModeType               ,0xff884c28) //101
NSTUB(SetFileTimeStamp                        ,0xff823e50) //  1
NSTUB(SetLogicalEventActive                   ,0xff87d7cc) //101
NSTUB(SetParameterData                        ,0xff962a28) //101
NSTUB(SetPropertyCase                         ,0xff876250) //102
//NSTUB(SetScriptMode                         ,0xff87d81c) //101            == 0xff87d81c
NSTUB(SleepTask                               ,0xff827bc0) //101
NSTUB(TakeSemaphore                           ,0xff827888) //101
//NSTUB(TurnOffBackLight                      ,0xff88aca0) //104            == 0xff88aca0
NSTUB(TurnOnBackLight                         ,0xff88ac88) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff953ba0) //101
NSTUB(UnlockMainPower                         ,0xff87d9d0) //103
//NSTUB(UnsetZoomForMovie                     ,0xff9689ec) //104            == 0xff9689ec
NSTUB(UpdateMBROnFlash                        ,0xff859488) //  1
NSTUB(VbattGet                                ,0xff820560) //103
NSTUB(Write                                   ,0xff823c20) //101
//NSTUB(WriteSDCard                           ,0xff9210a4) //108            == 0xff9210a4
NSTUB(_log                                    ,0xffadfaec) //111
NSTUB(_log10                                  ,0xffade778) //112
NSTUB(_pow                                    ,0xffade8e8) //114
NSTUB(_sqrt                                   ,0xffae1748) //  1
NSTUB(add_ptp_handler                         ,0xff9fbed8) //  3
NSTUB(apex2us                                 ,0xff9c8cb0) //  4
NSTUB(close                                   ,0xff819864) //  1
NSTUB(closedir                                ,0xffa2ec50) //  1
NSTUB(err_init_task                           ,0xff814e80) //  4
NSTUB(exmem_alloc                             ,0xff870d4c) //103
NSTUB(free                                    ,0xff813a7c) //112
NSTUB(kbd_p1_f                                ,0xff821d20) //109
NSTUB(kbd_p1_f_cont                           ,0xff821d2c) //109
NSTUB(kbd_p2_f                                ,0xff821538) //109
NSTUB(kbd_read_keys                           ,0xff821c24) //109
NSTUB(kbd_read_keys_r2                        ,0xff849f24) //109
NSTUB(lseek                                   ,0xff823cb4) //101
NSTUB(malloc                                  ,0xff8139a8) //112
NSTUB(memcmp                                  ,0xff81cba4) //101
NSTUB(memcpy                                  ,0xff8977a4) //101
NSTUB(memset                                  ,0xff9c7fe8) //101
NSTUB(mkdir                                   ,0xff823f18) //  1
// ALT: NSTUB(mkdir, 0xff823fb8) // 1 32/0
NSTUB(mktime_ext                              ,0xff898010) //  1
NSTUB(open                                    ,0xff8197b4) //  1
NSTUB(opendir                                 ,0xffa2eaec) //  1
NSTUB(openfastdir                             ,0xffa2eaec) //  1
//NSTUB(qsort                                 ,0xffa93dc0) //  1            == 0xffa93dc0
NSTUB(rand                                    ,0xff81ccac) //  1
NSTUB(read                                    ,0xff819a4c) //101
NSTUB(readfastdir                             ,0xffa2eb80) //  1
NSTUB(reboot_fw_update                        ,0xffa36580) //  5
NSTUB(set_control_event                       ,0xff87d448) //  1
NSTUB(srand                                   ,0xff81cca0) //  1
NSTUB(stat                                    ,0xff823d80) //  1
NSTUB(strcat                                  ,0xff8975b8) //  1
//NSTUB(strchr                                ,0xff897640) //  1            == 0xff897640
NSTUB(strcmp                                  ,0xff81cb3c) //101
NSTUB(strcpy                                  ,0xff81cb24) //101
NSTUB(strftime                                ,0xff897a18) //  1
NSTUB(strlen                                  ,0xff81cb80) //101
NSTUB(strncmp                                 ,0xff8975f4) //  1
NSTUB(strncpy                                 ,0xff82da50) //  1
//NSTUB(strrchr                               ,0xff9c7fc0) //  1            == 0xff9c7fc0
NSTUB(strtol                                  ,0xff82dc88) //101
NSTUB(strtolx                                 ,0xff82da8c) //109
  DEF(task_CaptSeq                            ,0xff865f0c) //107
  DEF(task_ExpDrv                             ,0xff8a9554) //110
  DEF(task_InitFileModules                    ,0xff881534) //107
  DEF(task_MovieRecord                        ,0xff862148) //107
  DEF(task_PhySw                              ,0xff821894) //107
NSTUB(time                                    ,0xff8703ec) //  2
NSTUB(vsprintf                                ,0xff81cae8) //  1
