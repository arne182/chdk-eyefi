// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R31 (DRYOS version 2.3, release #0031)
//   Firmware Ver GM1.00B
//   Canon PowerShot SX110 IS

// Values for makefile.inc
//   PLATFORMID = 12690 (0x3192) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d4                 // Found @ 0xffff1a08
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff1a18

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(LEDDrive                              ,0xffc35930) //103        *** != 0xffd17758
//NSTUB(kbd_pwr_off                           ,0xffc36434) //  2 60%    *** != 0xffc36444
// ERROR: kbd_pwr_on is not found.                         //--- ---    *** != 0xffc3642c
//NSTUB(rename                                ,0xffc12ba0) //  1        *** != 0xffc1341c
//NSTUB(write                                 ,0xffc133f4) //101        *** != 0xffc0a198

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ffc67bdc -> ffc64188 -> ffd378fc -> ffe1421c -> ffedd5f4
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x0000fb38) // Found @0xffc113f0,          stubs_min = 0x0000fb38 (0xFB38)
//DEF(physw_run                               ,0x00001be4) // Found @0xffc11064,          stubs_min = 0x00001be4 (0x1BD8+0xC)
//DEF(levent_table                            ,0xffeb9c50) // Found @0xffeb9c50,          stubs_min = 0xffeb9c50 (0xFFEB9C50)
//DEF(FlashParamsTable                        ,0xffedd7c4) // Found @0xffedd7c4,          stubs_min = 0xffedd7c4 (0xFFEDD7C4)
//DEF(movie_status                            ,0x00005278) // Found @0xffc4ca28,          stubs_min = 0x00005278 (0x5240+0x38)
//DEF(canon_menu_active                       ,0x000093d4) // Found @0xffd2c7f4,          stubs_min = 0x000093d4 (0x93D0+0x4)
//DEF(canon_shoot_menu_active                 ,0x00009b0d) // Found @0xffd49ac0,          stubs_min = 0x00009b0d (0x9B0C+0x1)
//DEF(playrec_mode                            ,0x0000540c) // Found @0xffc542a4,          stubs_min = 0x0000540c (0x5408+0x4)
//DEF(zoom_status                             ,0x0000c79c) // Found @0xffe15a30,          stubs_min = 0x0000c79c (0xC79C)
//DEF(some_flag_for_af_scan                   ,0x00008c78) // Found @0xffd19670,          stubs_min = 0x00008c78 (0x8C78)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xffc31d1c
//void *vid_get_viewport_fb()      { return (void*)0x10659de0; } // Found @0xffe5e820
//char *camera_jpeg_count_str()    { return (char*)0x00045e58; } // Found @0xffd84a7c
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffe60bb4
//int get_flash_params_count(void) { return 0x77; }              // Found @0xffd389b8

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffe97f24, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffe97f30, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x0000000c }, // Found @0xffe97e04, levent 0x01
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000008 }, // Found @0xffe97e04, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00000004 }, // Found @0xffe97df8, levent 0x00
//    { 1, KEY_ZOOM_IN         ,0x00000100 }, // Found @0xffe97e88, levent 0x02
//    { 1, KEY_ZOOM_OUT        ,0x00000200 }, // Found @0xffe97e94, levent 0x03
//    { 1, KEY_RIGHT           ,0x00010000 }, // Found @0xffe97ea0, levent 0x07
//    { 1, KEY_DOWN            ,0x00020000 }, // Found @0xffe97eac, levent 0x05
//    { 1, KEY_LEFT            ,0x00040000 }, // Found @0xffe97eb8, levent 0x06
//    { 1, KEY_UP              ,0x00080000 }, // Found @0xffe97ec4, levent 0x04
//    { 1, KEY_SET             ,0x00100000 }, // Found @0xffe97ed0, levent 0x08
//    { 1, KEY_DISPLAY         ,0x02000000 }, // Found @0xffe97ee8, levent 0x0a
//    { 1, KEY_MENU            ,0x08000000 }, // Found @0xffe97f00, levent 0x09
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffe578ec
//#define CAM_RAW_ROWS      2772 // Found @0xffe578f4
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xffc1786c

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffe08340) //101
NSTUB(AllocateUncacheableMemory               ,0xffc17828) //112
NSTUB(Close                                   ,0xffc13348) //101
NSTUB(CreateTask                              ,0xffc0b8c0) //101
NSTUB(DebugAssert                             ,0xffc0bd98) //111
NSTUB(DeleteFile_Fut                          ,0xffc12bf4) //112
//NSTUB(DoAFLock                              ,0xffc15048) //102            == 0xffc15048
//NSTUB(EnterToCompensationEVF                ,0xffc15318) //104            == 0xffc15318
//NSTUB(ExecuteEventProcedure                 ,0xffc5b5b8) //  1            == 0xffc5b5b8
//NSTUB(ExitFromCompensationEVF               ,0xffc1535c) //104            == 0xffc1535c
NSTUB(ExitTask                                ,0xffc0bb50) //101
//NSTUB(ExpCtrlTool_StartContiAE              ,0xffc20894) //104            == 0xffc20894
//NSTUB(ExpCtrlTool_StopContiAE               ,0xffc209d8) //104            == 0xffc209d8
NSTUB(Fclose_Fut                              ,0xffc12d70) //101
NSTUB(Feof_Fut                                ,0xffc12f5c) //  1
NSTUB(Fflush_Fut                              ,0xffc12f98) //  1
NSTUB(Fgets_Fut                               ,0xffc12ec4) //  1
NSTUB(Fopen_Fut                               ,0xffc12d30) //101
NSTUB(Fread_Fut                               ,0xffc12e1c) //101
NSTUB(FreeMemory                              ,0xffe08338) //101
NSTUB(FreeUncacheableMemory                   ,0xffc17868) //112
NSTUB(Fseek_Fut                               ,0xffc12f10) //101
NSTUB(Fwrite_Fut                              ,0xffc12e70) //101
NSTUB(GetBatteryTemperature                   ,0xffc3885c) //102
NSTUB(GetCCDTemperature                       ,0xffc387ec) //102
NSTUB(GetCurrentAvValue                       ,0xffd0f3d4) //102
NSTUB(GetDrive_ClusterSize                    ,0xffc44dcc) //  1
//NSTUB(GetDrive_FreeClusters                 ,0xffc44e34) //  1            == 0xffc44e34
//NSTUB(GetDrive_TotalClusters                ,0xffc44e00) //  1            == 0xffc44e00
NSTUB(GetFocusLensSubjectDistance             ,0xffd0d8d4) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xffd0dbe0) //  3
NSTUB(GetKbdState                             ,0xffc362cc) //109
NSTUB(GetMemInfo                              ,0xffc03c28) //  1
NSTUB(GetOpticalTemperature                   ,0xffc388cc) //102
NSTUB(GetParameterData                        ,0xffd38978) //101
//NSTUB(GetPropertyCase                       ,0xffc5f2a0) //102            == 0xffc5f2a0
NSTUB(GetSystemTime                           ,0xffe08398) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xffd12370) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffe02890) //102
//NSTUB(GiveSemaphore                         ,0xffc0b81c) //112            == 0xffc0b81c
NSTUB(IsStrobeChargeCompleted                 ,0xffc92e08) //102
NSTUB(LocalTime                               ,0xffc595bc) //  1
NSTUB(LockMainPower                           ,0xffc63da0) //103
NSTUB(Lseek                                   ,0xffc13488) //101
NSTUB(MakeDirectory_Fut                       ,0xffc12c68) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffe5b264) //102
NSTUB(MoveIrisWithAv                          ,0xffe04a30) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffe0507c) //102
NSTUB(NewTaskShell                            ,0xffc5ed48) //103
NSTUB(Open                                    ,0xffc13320) //101
//NSTUB(PB2Rec                                ,0xffc65a2c) //104            == 0xffc65a2c
NSTUB(PT_MoveDigitalZoomToWide                ,0xffc4ddc4) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xffc4dd9c) //102
NSTUB(PT_PlaySound                            ,0xffc4d9ac) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xffc61bb4) //103            == 0xffc61bb4
NSTUB(PostLogicalEventToUI                    ,0xffc61c00) //103
NSTUB(PutInNdFilter                           ,0xffe5903c) //102
NSTUB(PutOutNdFilter                          ,0xffe59074) //102
NSTUB(Read                                    ,0xffc0a138) //101
NSTUB(ReadFastDir                             ,0xffdf35b8) //  1
//NSTUB(Rec2PB                                ,0xffc65a80) //104            == 0xffc65a80
//NSTUB(RefreshPhysicalScreen                 ,0xffd8fc00) //104            == 0xffd8fc00
NSTUB(Remove                                  ,0xffc13390) //  1
NSTUB(RenameFile_Fut                          ,0xffc12ba0) //  1
//NSTUB(Restart                               ,0xffc190a0) //106            == 0xffc190a0
NSTUB(SetAE_ShutterSpeed                      ,0xffe5da30) //102
NSTUB(SetAutoShutdownTime                     ,0xffc63e14) //103
NSTUB(SetCurrentCaptureModeType               ,0xffc6a8c4) //101
NSTUB(SetFileTimeStamp                        ,0xffc13624) //  1
NSTUB(SetLogicalEventActive                   ,0xffc63af0) //101
NSTUB(SetParameterData                        ,0xffd388e8) //101
NSTUB(SetPropertyCase                         ,0xffc5f198) //102
//NSTUB(SetScriptMode                         ,0xffc63b40) //101            == 0xffc63b40
NSTUB(SleepTask                               ,0xffc176ac) //101
NSTUB(TakeSemaphore                           ,0xffc0b74c) //101
//NSTUB(TurnOffBackLight                      ,0xffc6f9fc) //104            == 0xffc6f9fc
NSTUB(TurnOnBackLight                         ,0xffc6f9e4) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xffd2d3a0) //103
//NSTUB(UnlockAF                              ,0xffc1509c) //102            == 0xffc1509c
NSTUB(UnlockMainPower                         ,0xffc63cf4) //103
//NSTUB(UnsetZoomForMovie                     ,0xffd3e944) //104            == 0xffd3e944
NSTUB(UpdateMBROnFlash                        ,0xffc44c0c) //  1
NSTUB(VbattGet                                ,0xffc10314) //103
NSTUB(Write                                   ,0xffc133f4) //101
//NSTUB(WriteSDCard                           ,0xffd02b30) //108            == 0xffd02b30
NSTUB(_log                                    ,0xffe90410) //111
NSTUB(_log10                                  ,0xffe8f354) //112
NSTUB(_pow                                    ,0xffe8f4c4) //114
NSTUB(_sqrt                                   ,0xffe91778) //  1
NSTUB(add_ptp_handler                         ,0xffdc1104) //  1
NSTUB(apex2us                                 ,0xffd910e4) //  4
NSTUB(close                                   ,0xffc09f50) //  1
NSTUB(closedir                                ,0xffdf3688) //  1
NSTUB(err_init_task                           ,0xffc04e84) //  4
NSTUB(exmem_alloc                             ,0xffc59dbc) //103
NSTUB(free                                    ,0xffc03a80) //112
NSTUB(kbd_p1_f                                ,0xffc114f4) //109
NSTUB(kbd_p1_f_cont                           ,0xffc11500) //109
NSTUB(kbd_p2_f                                ,0xffc10d04) //109
NSTUB(kbd_read_keys                           ,0xffc113f0) //109
//NSTUB(kbd_read_keys_r2                      ,0xffc35d7c) //109            == 0xffc35d7c
NSTUB(lseek                                   ,0xffc13488) //101
NSTUB(malloc                                  ,0xffc039ac) //112
NSTUB(memcmp                                  ,0xffc0d8b4) //101
NSTUB(memcpy                                  ,0xffc74b70) //101
NSTUB(memset                                  ,0xffd8ff54) //101
NSTUB(mkdir                                   ,0xffc136ec) //  1
// ALT: NSTUB(mkdir, 0xffc1378c) // 1 32/0
NSTUB(mktime_ext                              ,0xffc753dc) //  1
NSTUB(open                                    ,0xffc09ea0) //  1
NSTUB(opendir                                 ,0xffdf3524) //  1
NSTUB(openfastdir                             ,0xffdf3524) //  1
NSTUB(qsort                                   ,0xffd9045c) //  1
NSTUB(rand                                    ,0xffc0d9bc) //  1
NSTUB(read                                    ,0xffc0a138) //101
NSTUB(readfastdir                             ,0xffdf35b8) //  1
NSTUB(reboot_fw_update                        ,0xffdf7e8c) //  5
NSTUB(set_control_event                       ,0xffc6376c) //  1
NSTUB(srand                                   ,0xffc0d9b0) //  1
NSTUB(stat                                    ,0xffc13554) //  1
NSTUB(strcat                                  ,0xffc74984) //  1
//NSTUB(strchr                                ,0xffc74a0c) //  1            == 0xffc74a0c
NSTUB(strcmp                                  ,0xffc0d84c) //101
NSTUB(strcpy                                  ,0xffc0d834) //101
NSTUB(strftime                                ,0xffc74de4) //  1
NSTUB(strlen                                  ,0xffc0d890) //101
NSTUB(strncmp                                 ,0xffc749c0) //  1
NSTUB(strncpy                                 ,0xffc1d254) //  1
//NSTUB(strrchr                               ,0xffd8ff2c) //  1            == 0xffd8ff2c
NSTUB(strtol                                  ,0xffc1d48c) //101
NSTUB(strtolx                                 ,0xffc1d290) //109
  DEF(task_CaptSeq                            ,0xffc503b0) //107
  DEF(task_ExpDrv                             ,0xffc8bddc) //110
  DEF(task_InitFileModules                    ,0xffc67a68) //107
  DEF(task_MovieRecord                        ,0xffc4cc8c) //107
  DEF(task_PhySw                              ,0xffc11060) //107
NSTUB(time                                    ,0xffc59470) //  1
NSTUB(vsprintf                                ,0xffc0d7f8) //  1
