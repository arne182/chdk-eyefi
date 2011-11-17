// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00B
//   Canon PowerShot A480

// Values for makefile.inc
//   PLATFORMID = 12735 (0x31bf) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x01ffffff
//   KEYSYS = d4                 // Found @ 0xffff1a44
//   NEED_ENCODED_DISKBOOT = 2   // Found @ 0xffff1a54

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(GetBatteryTemperature                 ,0xffc2e964) //102        *** != 0xffc2eb38
//NSTUB(GetCCDTemperature                     ,0xffc2e8f0) //102        *** != 0xffc2eb38
//NSTUB(PutInNdFilter                         ,0xffdc22b8) //102        *** != 0xffe01e0c
//NSTUB(PutOutNdFilter                        ,0xffdc22dc) //102        *** != 0xffe01e44
NSTUB(kbd_pwr_off                             ,0xffc2c8c4) //  2 64%
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc00954
//NSTUB(kbd_read_keys_r2                      ,0xffc2c384) //109        *** != 0xffc1138c
//NSTUB(rename                                ,0xffc12a84) //  1        *** != 0xffc13300
//NSTUB(write                                 ,0xffc132d8) //101        *** != 0xffc0a27c

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc58b40 -> ffc555f8 -> ffd07cb4 -> ffdcd6ec -> ffe71f6c
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000cef8) // Found @0xffc11360,          stubs_min = 0x0000cef8 (0xCEF8)
//DEF(physw_run                               ,0x00001bec) // Found @0xffc10fd4,          stubs_min = 0x00001bec (0x1BE0+0x0C)
//DEF(levent_table                            ,0xffe57a18) // Found @0xffe57a18,          stubs_min = 0xffe57a18 (0xFFE57A18)
//DEF(FlashParamsTable                        ,0xffe72138) // Found @0xffe72138,          stubs_min = 0xffe72138 (0xFFE72138)
//DEF(movie_status                            ,0x00005700) // Found @0xffce5478,          stubs_min = 0x00005700 (0x56C8+0x38)
//DEF(canon_menu_active                       ,0x00002a00) // Found @0xffc52450,          stubs_min = 0x00002a00 (0x29FC+4)
//DEF(canon_shoot_menu_active                 ,0x00006861) // Found @0xffd16804, ** != ** stubs_min = 0xffc00414 (0xFFC00414)
//DEF(playrec_mode                            ,0x00002798) // Found @0xffc46f04,          stubs_min = 0x00002798 (0x2794+0x4)
//DEF(zoom_status                             ,0x0000a2d4) // Found @0xffdcf93c,          stubs_min = 0x0000a2d4 (0xA2D4)
//DEF(some_flag_for_af_scan                   ,0x00005bbc) // Found @0xffce7b58,          stubs_min = 0x00005bbc (0x5BBC)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc2845c
//void *vid_get_viewport_fb()      { return (void*)0x10659ec0; } // Found @0xffe07650
//char *camera_jpeg_count_str()    { return (char*)0x0002cff8; } // Found @0xffd41b24
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe09bc4
//int get_flash_params_count(void) { return 0x7a; }              // Found @0xffd08d70

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00040000 // Found @0xffe34fec, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00080000 // Found @0xffe34ff8, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffe34fbc, levent 0x09
//    { 2, KEY_SHOOT_FULL      ,0x00000030 }, // Found @0xffe34f8c, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000020 }, // Found @0xffe34f8c, levent 0x01
//    { 2, KEY_UP              ,0x00000001 }, // Found @0xffe34f50, levent 0x04
//    { 2, KEY_DOWN            ,0x00000002 }, // Found @0xffe34f5c, levent 0x05
//    { 2, KEY_RIGHT           ,0x00000004 }, // Found @0xffe34f68, levent 0x07
//    { 2, KEY_LEFT            ,0x00000008 }, // Found @0xffe34f74, levent 0x06
//    { 2, KEY_ZOOM_OUT        ,0x00000040 }, // Found @0xffe34f98, levent 0x03
//    { 2, KEY_ZOOM_IN         ,0x00000080 }, // Found @0xffe34fa4, levent 0x02
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffe34fb0, levent 0x08
//    { 2, KEY_SHOOT_HALF      ,0x00000010 }, // Found @0xffe34f80, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffcb8f20
//#define CAM_RAW_ROWS      2772 // Found @0xffcb8f28
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc16738

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffdc45b0) //101
NSTUB(AllocateUncacheableMemory               ,0xffc166f4) //112
NSTUB(Close                                   ,0xffc1322c) //101
NSTUB(CreateTask                              ,0xffc0b9c4) //101
NSTUB(DebugAssert                             ,0xffc0be9c) //111
NSTUB(DeleteFile_Fut                          ,0xffc12ad8) //112
//NSTUB(DoAFLock                              ,0xffc14830) //102            == 0xffc14830
//NSTUB(EnterToCompensationEVF                ,0xffc148e0) //104            == 0xffc148e0
NSTUB(ExecuteEventProcedure                   ,0xffc4dbd8) //  1
//NSTUB(ExitFromCompensationEVF               ,0xffc14924) //104            == 0xffc14924
NSTUB(ExitTask                                ,0xffc0bc54) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc1eee4) //104            == 0xffc1eee4
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc1f028) //104            == 0xffc1f028
NSTUB(Fclose_Fut                              ,0xffc12c54) //101
NSTUB(Feof_Fut                                ,0xffc12e40) //  1
NSTUB(Fflush_Fut                              ,0xffc12e7c) //  1
NSTUB(Fgets_Fut                               ,0xffc12da8) //  1
NSTUB(Fopen_Fut                               ,0xffc12c14) //101
NSTUB(Fread_Fut                               ,0xffc12d00) //101
NSTUB(FreeMemory                              ,0xffdc45a8) //101
NSTUB(FreeUncacheableMemory                   ,0xffc16734) //112
NSTUB(Fseek_Fut                               ,0xffc12df4) //101
NSTUB(Fwrite_Fut                              ,0xffc12d54) //101
NSTUB(GetCurrentAvValue                       ,0xffce0fe8) //102
//NSTUB(GetDrive_ClusterSize                  ,0xffc3a924) //  5            == 0xffc3a924
//NSTUB(GetDrive_FreeClusters                 ,0xffc3a97c) //  5            == 0xffc3a97c
//NSTUB(GetDrive_TotalClusters                ,0xffc3a950) //  5            == 0xffc3a950
NSTUB(GetFocusLensSubjectDistance             ,0xffce00c8) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffce03d4) //  3
NSTUB(GetKbdState                             ,0xffc2c8ac) //109
NSTUB(GetMemInfo                              ,0xffc03be8) //  1
NSTUB(GetOpticalTemperature                   ,0xffc2e9dc) //102
NSTUB(GetParameterData                        ,0xffd08d30) //101
NSTUB(GetPropertyCase                         ,0xffc51944) //102
NSTUB(GetSystemTime                           ,0xffdc4608) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffce3dac) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffdbcdf4) //102
NSTUB(GiveSemaphore                           ,0xffc0b920) //112
NSTUB(IsStrobeChargeCompleted                 ,0xffc7ccc4) //102
//NSTUB(LEDDrive                              ,0xffc2c020) //103            == 0xffc2c020
NSTUB(LocalTime                               ,0xffc4b954) //  1
NSTUB(LockMainPower                           ,0xffc55210) //103
NSTUB(Lseek                                   ,0xffc1336c) //101
NSTUB(MakeDirectory_Fut                       ,0xffc12b4c) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe04080) //102
NSTUB(MoveIrisWithAv                          ,0xffdc1ec8) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffdc2454) //102
NSTUB(NewTaskShell                            ,0xffc513e8) //103
NSTUB(Open                                    ,0xffc13204) //101
NSTUB(PB2Rec                                  ,0xffc57ebc) //104
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc40e3c) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc40e14) //102
NSTUB(PT_PlaySound                            ,0xffc40a50) //102
NSTUB(PostLogicalEventForNotPowerType         ,0xffc54838) //103
NSTUB(PostLogicalEventToUI                    ,0xffc54884) //103
NSTUB(Read                                    ,0xffc0a21c) //101
NSTUB(ReadFastDir                             ,0xffdb0044) //  1
NSTUB(Rec2PB                                  ,0xffc57efc) //104
//NSTUB(RefreshPhysicalScreen                 ,0xffd4be50) //104            == 0xffd4be50
NSTUB(Remove                                  ,0xffc13274) //  1
NSTUB(RenameFile_Fut                          ,0xffc12a84) //  1
NSTUB(Restart                                 ,0xffc17e44) //106
//NSTUB(SetAE_ShutterSpeed                    ,0xffe06860) //102            == 0xffe06860
NSTUB(SetAutoShutdownTime                     ,0xffc55284) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc5b514) //101
NSTUB(SetFileTimeStamp                        ,0xffc13508) //  1
NSTUB(SetLogicalEventActive                   ,0xffc54f8c) //101
NSTUB(SetParameterData                        ,0xffd08ca0) //101
NSTUB(SetPropertyCase                         ,0xffc5183c) //102
//NSTUB(SetScriptMode                         ,0xffc54fdc) //101            == 0xffc54fdc
NSTUB(SleepTask                               ,0xffc16578) //101
NSTUB(TakeSemaphore                           ,0xffc0b850) //101
//NSTUB(TurnOffBackLight                      ,0xffc5fcec) //104            == 0xffc5fcec
NSTUB(TurnOnBackLight                         ,0xffc5fcd4) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffcfa8ec) //101
//NSTUB(UnlockAF                              ,0xffc14868) //102            == 0xffc14868
NSTUB(UnlockMainPower                         ,0xffc55164) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd0e960) //104            == 0xffd0e960
//NSTUB(UpdateMBROnFlash                      ,0xffc3a77c) //  3            == 0xffc3a77c
NSTUB(VbattGet                                ,0xffc10294) //103
NSTUB(Write                                   ,0xffc132d8) //101
//NSTUB(WriteSDCard                           ,0xffcd598c) //108            == 0xffcd598c
NSTUB(_log                                    ,0xffe328a4) //111
NSTUB(_log10                                  ,0xffe317e8) //112
NSTUB(_pow                                    ,0xffe31958) //114
NSTUB(_sqrt                                   ,0xffe33c0c) //  1
NSTUB(add_ptp_handler                         ,0xffd8a108) //  3
//NSTUB(apex2us                               ,0xffd4cf08) //  4            == 0xffd4cf08
NSTUB(close                                   ,0xffc0a034) //  1
NSTUB(closedir                                ,0xffdb0114) //  1
NSTUB(err_init_task                           ,0xffc04e30) //  4
NSTUB(exmem_alloc                             ,0xffc4c588) //103
NSTUB(free                                    ,0xffc03a40) //112
NSTUB(kbd_p1_f                                ,0xffc113dc) //109
NSTUB(kbd_p1_f_cont                           ,0xffc113e8) //109
NSTUB(kbd_p2_f                                ,0xffc10ca0) //109
NSTUB(kbd_read_keys                           ,0xffc11360) //109
NSTUB(lseek                                   ,0xffc1336c) //101
NSTUB(malloc                                  ,0xffc0396c) //112
NSTUB(memcmp                                  ,0xffc0d9b4) //101
NSTUB(memcpy                                  ,0xffc63638) //101
NSTUB(memset                                  ,0xffd4c1f0) //101
NSTUB(mkdir                                   ,0xffc135d0) //  1
// ALT: NSTUB(mkdir, 0xffc13670) // 1 32/0
NSTUB(mktime_ext                              ,0xffc63ea4) //  1
NSTUB(open                                    ,0xffc09f84) //  1
NSTUB(opendir                                 ,0xffdaffb0) //  1
NSTUB(openfastdir                             ,0xffdaffb0) //  1
//NSTUB(qsort                                 ,0xffdf2a18) //  1            == 0xffdf2a18
NSTUB(rand                                    ,0xffc0dabc) //  1
NSTUB(read                                    ,0xffc0a21c) //101
NSTUB(readfastdir                             ,0xffdb0044) //  1
NSTUB(reboot_fw_update                        ,0xffdb3b28) //  5
NSTUB(set_control_event                       ,0xffc54cc0) //111
NSTUB(srand                                   ,0xffc0dab0) //  1
NSTUB(stat                                    ,0xffc13438) //  1
NSTUB(strcat                                  ,0xffc6344c) //  1
//NSTUB(strchr                                ,0xffc634d4) //  1            == 0xffc634d4
NSTUB(strcmp                                  ,0xffc0d94c) //101
NSTUB(strcpy                                  ,0xffc0d934) //101
NSTUB(strftime                                ,0xffc638ac) //  1
NSTUB(strlen                                  ,0xffc0d990) //101
NSTUB(strncmp                                 ,0xffc63488) //  1
NSTUB(strncpy                                 ,0xffc1bf08) //  1
//NSTUB(strrchr                               ,0xffd4c1c8) //  1            == 0xffd4c1c8
NSTUB(strtol                                  ,0xffc1c140) //101
NSTUB(strtolx                                 ,0xffc1bf44) //109
  DEF(task_CaptSeq                            ,0xffc42f34) //107
  DEF(task_ExpDrv                             ,0xffc74cb0) //110
  DEF(task_InitFileModules                    ,0xffc589cc) //107
  DEF(task_MovieRecord                        ,0xffce56dc) //107
  DEF(task_PhySw                              ,0xffc10fd0) //107
NSTUB(time                                    ,0xffc4b808) //  1
NSTUB(vsprintf                                ,0xffc0d8f8) //  1
