// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   DRYOS R23 (DRYOS version 2.3, release #0023)
//   Firmware Ver GM1.00C
//   Canon DIGITAL IXUS 970 IS

// Values for makefile.inc
//   PLATFORMID = 12659 (0x3173) // Found @ 0xfffe0130
//   MAXRAMADDR = 0x03ffffff
//   KEYSYS = d3enc              // Found @ 0xffff33e0
//   NEED_ENCODED_DISKBOOT = 1   // Found @ 0xffff33c0

// Stubs below should be checked. Stub not matched 100%, or difference found to current 'stubs_entry_2.S'
//    Name                                     Address      Rule  %  Comp to stubs_entry_2.S
//NSTUB(DebugAssert                           ,0xff81bcf0) //111        *** != 0xff81bcf8
//NSTUB(PutInNdFilter                         ,0xffa2ac20) //102        *** != 0xffa838f8
//NSTUB(PutOutNdFilter                        ,0xffa2ac44) //102        *** != 0xffa8392c
//NSTUB(rename                                ,0xff8235e8) //  1        *** != 0xff823e64
//NSTUB(write                                 ,0xff823e3c) //101        *** != 0xff81a0f4

// Check of modemap from 'platform/CAMERA/shooting.c':
// Firmware modemap table found @ff8790f8 -> ff87589c -> ff95c8b8 -> ffa3eec8 -> ffaf9530
// No problems found with modemap table.

// Values below go in 'stubs_min.S':
//DEF(physw_status                            ,0x00010650) // Found @0xff821e38,          stubs_min = 0x00010650 (0x10650)
//DEF(physw_run                               ,0x00001c00) // Found @0xff821ad0,          stubs_min = 0x00001c00 (0x1BF4+0xC)
//DEF(levent_table                            ,0xffad40a0) // Found @0xffad40a0,          stubs_min = 0xffad40a0 (0xFFAD40A0)
//DEF(FlashParamsTable                        ,0xffaf96f0) // Found @0xffaf96f0,          stubs_min = 0xffaf96f0 (0xFFAF96F0)
//DEF(movie_status                            ,0x000053cc) // Found @0xff859d78,          stubs_min = 0x000053cc (0x5390+0x3C)
//DEF(canon_menu_active                       ,0x000099e0) // Found @0xff950198,          stubs_min = 0x000099e0 (0x99DC+4)
//DEF(canon_shoot_menu_active                 ,0x00009fd9) // Found @0xff96cd70,          stubs_min = 0x00009fd9 (0x9FD8+1)
//DEF(playrec_mode                            ,0x0000555c) // Found @0xff861170,          stubs_min = 0x0000555c (0x5558+0x4)
//DEF(zoom_status                             ,0x0000d4a4) // Found @0xffa406c8,          stubs_min = 0x0000d4a4 (0xD4A4)
//DEF(some_flag_for_af_scan                   ,0x0000d228) // Found @0xffa2b598,          stubs_min = 0x0000d228 (0xD228)

// Values below go in 'lib.c':
//void *vid_get_bitmap_fb()        { return (void*)0x10361000; } // Found @0xff83e8a0
//void *vid_get_viewport_fb()      { return (void*)0x1065adc0; } // Found @0xffa88afc
//char *camera_jpeg_count_str()    { return (char*)0x0004ca80; } // Found @0xff9a6fdc
//long hook_raw_size()             { return 0x00ec04f0; }        // Found @0xffa8ad80
//int get_flash_params_count(void) { return 0x73; }              // Found @0xff95d974

// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).
//#define SD_READONLY_FLAG    0x00020000 // Found @0xffab1704, levent 0x90a
//#define SD_READONLY_IDX     2
//#define USB_MASK            0x00040000 // Found @0xffab1710, levent 0x902
//#define USB_IDX             2

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
//static KeyMap keymap[] = {
//    { 2, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xffab1674, levent 0x02
//    { 2, KEY_ZOOM_OUT        ,0x00000008 }, // Found @0xffab1680, levent 0x03
//    { 2, KEY_LEFT            ,0x00000010 }, // Found @0xffab168c, levent 0x06
//    { 2, KEY_RIGHT           ,0x00000020 }, // Found @0xffab1698, levent 0x07
//    { 2, KEY_DOWN            ,0x00000040 }, // Found @0xffab16a4, levent 0x05
//    { 2, KEY_UP              ,0x00000080 }, // Found @0xffab16b0, levent 0x04
//    { 2, KEY_SET             ,0x00000100 }, // Found @0xffab16bc, levent 0x08
//    { 2, KEY_DISPLAY         ,0x00000200 }, // Found @0xffab16c8, levent 0x0a
//    { 2, KEY_SHOOT_FULL      ,0x00000003 }, // Found @0xffab1668, levent 0x01
//    { 2, KEY_SHOOT_FULL_ONLY ,0x00000002 }, // Found @0xffab1668, levent 0x01
//    { 2, KEY_MENU            ,0x00000400 }, // Found @0xffab16d4, levent 0x09
//    { 2, KEY_SHOOT_HALF      ,0x00000001 }, // Found @0xffab165c, levent 0x00
//    { 0, 0, 0 }
//};

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_RAW_ROWPIX    3720 // Found @0xffa8251c
//#define CAM_RAW_ROWS      2772 // Found @0xffa82524
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x10000000 // Found @0xff8285a8

// Stubs below matched 100%.
//    Name                                     Address                Comp to stubs_entry_2.S
NSTUB(AllocateMemory                          ,0xffa2e430) //101
NSTUB(AllocateUncacheableMemory               ,0xff82856c) //112
NSTUB(Close                                   ,0xff823d90) //101
NSTUB(CreateTask                              ,0xff81b818) //101
NSTUB(DeleteFile_Fut                          ,0xff82363c) //112
//NSTUB(DoAFLock                              ,0xff825b88) //102            == 0xff825b88
NSTUB(EnterToCompensationEVF                  ,0xff825e84) //104
NSTUB(ExecuteEventProcedure                   ,0xff869408) //  1
NSTUB(ExitFromCompensationEVF                 ,0xff825ed4) //104
NSTUB(ExitTask                                ,0xff81baa8) //101
NSTUB(ExpCtrlTool_StartContiAE                ,0xff832b04) //104
NSTUB(ExpCtrlTool_StopContiAE                 ,0xff832c48) //104
NSTUB(Fclose_Fut                              ,0xff8237b8) //101
NSTUB(Feof_Fut                                ,0xff8239a4) //  1
NSTUB(Fflush_Fut                              ,0xff8239e0) //  1
NSTUB(Fgets_Fut                               ,0xff82390c) //  1
NSTUB(Fopen_Fut                               ,0xff823778) //101
NSTUB(Fread_Fut                               ,0xff823864) //101
NSTUB(FreeMemory                              ,0xffa2e428) //101
NSTUB(FreeUncacheableMemory                   ,0xff8285a0) //112
NSTUB(Fseek_Fut                               ,0xff823958) //101
NSTUB(Fwrite_Fut                              ,0xff8238b8) //101
NSTUB(GetBatteryTemperature                   ,0xff8453a0) //102
NSTUB(GetCCDTemperature                       ,0xff845330) //102
NSTUB(GetCurrentAvValue                       ,0xff92fb48) //102
NSTUB(GetDrive_ClusterSize                    ,0xff84f2c0) //  1
NSTUB(GetDrive_FreeClusters                   ,0xff84f328) //  1
NSTUB(GetDrive_TotalClusters                  ,0xff84f2f4) //  1
NSTUB(GetFocusLensSubjectDistance             ,0xff92ec40) //102
NSTUB(GetFocusLensSubjectDistanceFromLens     ,0xff92ef4c) //  1
NSTUB(GetKbdState                             ,0xff8428e8) //109
NSTUB(GetMemInfo                              ,0xff813c40) //  1
NSTUB(GetOpticalTemperature                   ,0xff845410) //102
NSTUB(GetParameterData                        ,0xff95d934) //101
NSTUB(GetPropertyCase                         ,0xff86d008) //102
NSTUB(GetSystemTime                           ,0xffa2e488) //101
NSTUB(GetZoomLensCurrentPoint                 ,0xff932dec) //102
NSTUB(GetZoomLensCurrentPosition              ,0xffa244d8) //102
NSTUB(GiveSemaphore                           ,0xff81b77c) //112
NSTUB(IsStrobeChargeCompleted                 ,0xff8bda04) //102
//NSTUB(LEDDrive                              ,0xff84206c) //103            == 0xff84206c
NSTUB(LocalTime                               ,0xff866acc) //  1
NSTUB(LockMainPower                           ,0xff8754b4) //103
NSTUB(Lseek                                   ,0xff823ed0) //101
NSTUB(MakeDirectory_Fut                       ,0xff8236b0) //  1
NSTUB(MoveFocusLensToDistance                 ,0xffa85638) //102
NSTUB(MoveIrisWithAv                          ,0xffa2a838) //102
NSTUB(MoveZoomLensWithPoint                   ,0xffa2adbc) //102
NSTUB(NewTaskShell                            ,0xff86cacc) //103
NSTUB(Open                                    ,0xff823d68) //101
//NSTUB(PB2Rec                                ,0xff8784d0) //104            == 0xff8784d0
NSTUB(PT_MoveDigitalZoomToWide                ,0xff85bbe4) //102
NSTUB(PT_MoveOpticalZoomAt                    ,0xff85bbbc) //102
NSTUB(PT_PlaySound                            ,0xff85b240) //102
//NSTUB(PostLogicalEventForNotPowerType       ,0xff873274) //103            == 0xff873274
//NSTUB(PostLogicalEventToUI                  ,0xff8732c0) //103            == 0xff8732c0
NSTUB(Read                                    ,0xff81a094) //101
NSTUB(ReadFastDir                             ,0xffa13500) //  1
//NSTUB(Rec2PB                                ,0xff876ed4) //104            == 0xff876ed4
NSTUB(RefreshPhysicalScreen                   ,0xff9b12e8) //104
NSTUB(Remove                                  ,0xff823dd8) //  1
NSTUB(RenameFile_Fut                          ,0xff8235e8) //  1
NSTUB(Restart                                 ,0xff829de4) //106
NSTUB(SetAE_ShutterSpeed                      ,0xffa87d0c) //102
NSTUB(SetAutoShutdownTime                     ,0xff875528) //103
NSTUB(SetCurrentCaptureModeType               ,0xff87c334) //101
NSTUB(SetFileTimeStamp                        ,0xff82406c) //  1
NSTUB(SetLogicalEventActive                   ,0xff875194) //  1
NSTUB(SetParameterData                        ,0xff95d8a4) //101
NSTUB(SetPropertyCase                         ,0xff86cf08) //102
//NSTUB(SetScriptMode                         ,0xff8751e4) //101            == 0xff8751e4
NSTUB(SleepTask                               ,0xff8283f0) //101
NSTUB(TakeSemaphore                           ,0xff81b6ac) //101
NSTUB(TurnOffBackLight                        ,0xff881d28) //104
NSTUB(TurnOnBackLight                         ,0xff881d10) //104
NSTUB(UIFS_WriteFirmInfoToFile                ,0xff9510f4) //103
//NSTUB(UnlockAF                              ,0xff825bcc) //102            == 0xff825bcc
NSTUB(UnlockMainPower                         ,0xff875408) //103
//NSTUB(UnsetZoomForMovie                     ,0xff962ed0) //104            == 0xff962ed0
NSTUB(UpdateMBROnFlash                        ,0xff84f100) //  1
NSTUB(VbattGet                                ,0xff82071c) //103
NSTUB(Write                                   ,0xff823e3c) //101
//NSTUB(WriteSDCard                           ,0xff9227e0) //108            == 0xff9227e0
NSTUB(_log                                    ,0xffaaec8c) //111
NSTUB(_log10                                  ,0xffaadbd0) //112
NSTUB(_pow                                    ,0xffaadd40) //114
NSTUB(_sqrt                                   ,0xffab00ac) //  1
NSTUB(add_ptp_handler                         ,0xff9e1b24) //  1
//NSTUB(apex2us                               ,0xff9b2824) //  4            == 0xff9b2824
NSTUB(close                                   ,0xff819eac) //  1
NSTUB(closedir                                ,0xffa135d0) //  1
NSTUB(err_init_task                           ,0xff814e98) //  4
NSTUB(exmem_alloc                             ,0xff867bf0) //103
NSTUB(free                                    ,0xff813a98) //112
NSTUB(kbd_p1_f                                ,0xff821f3c) //109
NSTUB(kbd_p1_f_cont                           ,0xff821f48) //109
NSTUB(kbd_p2_f                                ,0xff821770) //109
NSTUB(kbd_pwr_off                             ,0xff84296c) //  2
NSTUB(kbd_pwr_on                              ,0xff84291c) //  2
NSTUB(kbd_read_keys                           ,0xff821e38) //109
NSTUB(kbd_read_keys_r2                        ,0xff842494) //109
NSTUB(lseek                                   ,0xff823ed0) //101
NSTUB(malloc                                  ,0xff8139c4) //112
NSTUB(memcmp                                  ,0xff81d844) //101
NSTUB(memcpy                                  ,0xff8943a4) //101
NSTUB(memset                                  ,0xff9b169c) //101
NSTUB(mkdir                                   ,0xff824134) //  1
// ALT: NSTUB(mkdir, 0xff8241d4) // 1 32/0
NSTUB(mktime_ext                              ,0xff894c10) //  1
NSTUB(open                                    ,0xff819dfc) //  1
NSTUB(opendir                                 ,0xffa1346c) //  1
NSTUB(openfastdir                             ,0xffa1346c) //  1
NSTUB(qsort                                   ,0xff9b1ba4) //  1
NSTUB(rand                                    ,0xff81d94c) //  1
NSTUB(read                                    ,0xff81a094) //101
NSTUB(readfastdir                             ,0xffa13500) //  1
NSTUB(reboot_fw_update                        ,0xffa1af00) //  5
NSTUB(set_control_event                       ,0xff874e10) //  1
NSTUB(srand                                   ,0xff81d940) //  1
NSTUB(stat                                    ,0xff823f9c) //  1
NSTUB(strcat                                  ,0xff894190) //  1
NSTUB(strchr                                  ,0xff894218) //  1
NSTUB(strcmp                                  ,0xff81d7dc) //101
NSTUB(strcpy                                  ,0xff81d7c4) //101
NSTUB(strftime                                ,0xff894618) //  1
NSTUB(strlen                                  ,0xff81d820) //101
NSTUB(strncmp                                 ,0xff8941cc) //  1
NSTUB(strncpy                                 ,0xff82e200) //  1
//NSTUB(strrchr                               ,0xff89423c) //  1            == 0xff89423c
NSTUB(strtol                                  ,0xff82e438) //101
NSTUB(strtolx                                 ,0xff82e23c) //109
  DEF(task_CaptSeq                            ,0xff85e03c) //107
  DEF(task_ExpDrv                             ,0xff8b6864) //110
  DEF(task_InitFileModules                    ,0xff878f84) //107
  DEF(task_MovieRecord                        ,0xff85a004) //107
  DEF(task_PhySw                              ,0xff821acc) //107
NSTUB(time                                    ,0xff866fd0) //  2
NSTUB(vsprintf                                ,0xff81d744) //  1
