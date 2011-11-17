// Camera - IXUS300_SD4000 - platform_camera.h

// This file contains the various settings values specific to the IXUS300_SD4000 camera.
// This file is referenced via the 'include/camera.h' file and should not be loaded directly.

// If adding a new settings value put a suitable default in 'include/camera.h',
// along with documentation on what the setting does and how to determine the correct value.
// If the setting should not have a default value then add it in 'include/camera.h'
// using the '#undef' directive along with appropriate documentation.

// Override any default values with your camera specific values in this file. Try and avoid
// having override values that are the same as the default value.

// When overriding a setting value there are two cases:
// 1. If removing the value, because it does not apply to your camera, use the '#undef' directive.
// 2. If changing the value it is best to use an '#undef' directive to remove the default value
//    followed by a '#define' to set the new value.

// When porting CHDK to a new camera, check the documentation in 'include/camera.h'
// for information on each setting. If the default values are correct for your camera then
// don't override them again in here.

    #define CAM_PROPSET                 3           // ToDo: check PropSet 4 & 5
    #define CAM_DRYOS                   1
    #define CAM_DRYOS_2_3_R39           1           // ROM:FFB5E1C0, actually its DRYOS version 2.3, release #0043

    #undef  CAM_BITMAP_PALETTE                      // shut up compiler
    // ToDo: canon palette does not contain all colors anymore like on vxworks and palette is different in playback/record mode
    //#define CAM_BITMAP_PALETTE          8
    //#define CAM_BITMAP_PALETTE          5           // ToDo
    #define CAM_BITMAP_PALETTE          11          // ToDo: optimize palette (gui_draw.h)

    #undef  CAM_UNCACHED_BIT                        // shut up compiler
    #define CAM_UNCACHED_BIT            0x40000000  // ROM:FF88A248 via ExMem.FreeCacheable(), finsig2

    #undef  CAM_HAS_ERASE_BUTTON
    #undef  CAM_SYNCH
    #define CAM_HAS_ND_FILTER           1           // ToDo: does camera have ND ?
    #define CAM_HAS_IRIS_DIAPHRAGM      1           // OK
    //#undef  CAM_HAS_MANUAL_FOCUS                  // ToDo: working ?
    //#undef  CAM_CAN_SD_OVERRIDE                   // ToDo: looks like always cause ASSERT Error "FocusLensController.c Line 714" on CaptSeqTask
    //#undef  CAM_USE_ZOOM_FOR_MF                   // ToDo: working ?
    #define CAM_HAS_USER_TV_MODES       1
    //#define CAM_AF_SCAN_DURING_VIDEO_RECORD 1
    #undef  CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO    // canon firmware allow optical zoom while recording movie
    //#define CAM_EV_IN_VIDEO             1
    #define CAM_VIDEO_CONTROL           1
    #define CAM_VIDEO_QUALITY_ONLY      1           // ToDo: Video Bitrate override cause crash
    #define CAM_HAS_JOGDIAL             1
    #define CAM_FEATURE_FEATHER         1
    //#define CAM_SHOW_OSD_IN_SHOOT_MENU  1         // not required anymore, workaround to force CHDK to display OSD in record mode while canon_shoot_menu_active was wrong
    #define CAM_MULTIPART               1           // ToDo: working ?
    #define CAM_DATE_FOLDER_NAMING      1
    //#define CAM_DRAW_EXPOSITION         1         // not required because Canon Firmware does always show it on Shutter half press
    //#define CAM_ADJUSTABLE_ALT_BUTTON   1         // ToDo: let user choose different key combo if possible

    #define CAM_CHDK_PTP                1           // OK

    #define PARAM_CAMERA_NAME           4           // OK

    #define CAM_DNG_LENS_INFO               { 49,10, 186,10, 20,10, 53,10 } // See comments in camera.h

    #define cam_CFAPattern 0x02010100               // RAW/DNG: Red  Green  Green  Blue, OK

    #define CAM_DRIVE_MODE_FROM_TIMER_MODE          // ToDo: working ?

    #define CAM_QUALITY_OVERRIDE        1           // enable 'super fine' override, OK

    #define CAM_DETECT_SCREEN_ERASE     1           // ToDo: CHDK OSD flicker more often, OSD redrawn is more reliable

    #define CAM_STARTUP_CRASH_FILE_OPEN_FIX   1     // cameras intermittently crashing on startup with "ASSERT!! FsIoNotify.c Line 457   Task name: SpyTask" in ROMLOG, ToDo: working ?

    // ToDo
    #define CAM_COLORMATRIX1                               \
      640019, 1000000, -220031, 1000000, -96241, 1000000,  \
     -77419,  1000000, 639766,  1000000,  44009, 1000000,  \
      17965,  1000000, 78396,   1000000, 231868, 1000000

    #define cam_CalibrationIlluminant1  1           // ToDo: Daylight ?

    #define CAM_RAW_ROWPIX              3816        // ROM:FFB28EEC or ROM:ff93c408, finsig2
    #define CAM_RAW_ROWS                2784        // ROM:FFB28EF4 or ROM:ff93c414, finsig2

    #define CAM_JPEG_WIDTH              3648        // JPEG Exif data or ROM:FFB28EFC
    #define CAM_JPEG_HEIGHT             2736        // JPEG Exif data or ROM:FFB28F04

    // http://chdk.setepontos.com/index.php?topic=6122.0
    // use exiftool -activearea="24 120 2764 3784" to change values till DNG fit
    // use even numbers!

    // RAW/DNG without Dark Frame
    #define CAM_ACTIVE_AREA_X1          120         // x offset (right)
    #define CAM_ACTIVE_AREA_Y1          24          // y offset (down)
    #define CAM_ACTIVE_AREA_X2          3784
    #define CAM_ACTIVE_AREA_Y2          2764

    /*
    // RAW/DNG with Dark Frame
    #define CAM_ACTIVE_AREA_X1          92          // x offset (right)
    #define CAM_ACTIVE_AREA_Y1          4           // y offset (down)
    #define CAM_ACTIVE_AREA_X2          3812
    #define CAM_ACTIVE_AREA_Y2          2784
    */

    /*
    // Test values to messure correct buffer "crop" Values
    #define CAM_ACTIVE_AREA_X1          0
    #define CAM_ACTIVE_AREA_Y1          0
    #define CAM_ACTIVE_AREA_X2          3816
    #define CAM_ACTIVE_AREA_Y2          2784
    */

    #undef  CAM_SENSOR_BITS_PER_PIXEL
    #define CAM_SENSOR_BITS_PER_PIXEL   12

    #define PARAM_CAMERA_NAME           4           // parameter number (index) for GetParameterData to get Camera Name
    #define DNG_EXT_FROM                ".CR2"

    // --- everthing below is ToDo !!! -------------------------------------------------------------------------------------------------------------------

    //#define CAM_HAS_VARIABLE_ASPECT     1           // ToDo: SD4000 do switch between 16:9 and 4:3

    #undef CAM_USES_ASPECT_CORRECTION
    #define CAM_USES_ASPECT_CORRECTION  1    // camera uses the modified graphics primitives to map screens an viewports to buffers more sized

    // Not required
    //#undef EDGE_HMARGIN
    //#define EDGE_HMARGIN 10    // 10 fits video mode of sx210
