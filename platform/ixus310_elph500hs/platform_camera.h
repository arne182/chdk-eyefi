// Camera - IXUS 310 HS (Elph 500 HS / IXY 31S) - platform_camera.h

// This file contains the various settings values specific to the IXUS 310 HS camera.
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

    #define CAM_PROPSET                 4
    #define CAM_DRYOS                   1
    #define CAM_DRYOS_2_3_R39			1
    #define CAM_DRYOS_2_3_R47			1

#define CAM_RAW_ROWPIX    4168 // Found @0xff14a2ec
#define CAM_RAW_ROWS      3060 // Found @0xff14a2f0
#undef  CAM_UNCACHED_BIT
#define CAM_UNCACHED_BIT  0x40000000 // Found @0xff02b914

    // cropping
    #define CAM_JPEG_WIDTH  4016
    #define CAM_JPEG_HEIGHT 3004
    #define CAM_ACTIVE_AREA_X1 120
    #define CAM_ACTIVE_AREA_Y1 36
    #define CAM_ACTIVE_AREA_X2 4136
    #define CAM_ACTIVE_AREA_Y2 3040

    #undef  CAM_EMUL_KEYPRESS_DURATION
    #define CAM_EMUL_KEYPRESS_DURATION  10
	#undef  CAM_USE_ZOOM_FOR_MF
    #define CAM_BRACKETING              1
	#undef  CAM_VIDEO_CONTROL
	#define CAM_VIDEO_QUALITY_ONLY		1
    #define CAM_EXT_TV_RANGE            1
    //#define CAM_EV_IN_VIDEO             1
	//#define CAM_SHOW_OSD_IN_SHOOT_MENU  1
    //#define CAM_QUALITY_OVERRIDE    1

    #define CAM_HAS_ND_FILTER           1

    #undef  CAM_HAS_ERASE_BUTTON                    // No erase button
    #undef  CAM_HAS_MANUAL_FOCUS                    // No manual focus mode

    #undef CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO     // Can already zoom in video, no need to unlock

	#undef DEFAULT_RAW_EXT
    #define DEFAULT_RAW_EXT             2   // use .CR2 

    #undef CAM_MENU_BORDERWIDTH
    #define CAM_MENU_BORDERWIDTH        70      // Need to leave this much border to avoid overlap with on screen buttons.
    #undef CAM_TS_BUTTON_BORDER
    #define CAM_TS_BUTTON_BORDER        60      // Define this to leave a border on each side of the palette display. Used on the IXUS 310 to
                                                // stop the palette from overlapping the on screen buttons on each side
    #undef CAM_DISP_ALT_TEXT                    // Turn off <ALT> at bottom of screen in Alt mode - changes button color instead
    #define CAM_DETECT_SCREEN_ERASE     1       // Turn on guard pixels to detect screen erase and redraw CHDK buttons and menus
    #define CAM_TOUCHSCREEN_UI          1       // Enable touch screen U/I

    // camera name
    #define PARAM_CAMERA_NAME 4 // parameter number for GetParameterData
    #undef  CAM_SENSOR_BITS_PER_PIXEL
    #define CAM_SENSOR_BITS_PER_PIXEL   12

    #undef CAM_BITMAP_PALETTE
    #define CAM_BITMAP_PALETTE          12

    #undef CAM_USES_ASPECT_CORRECTION
    #define CAM_USES_ASPECT_CORRECTION  1       //camera uses the modified graphics primitives to map screens an viewports to buffers more sized

    #undef EDGE_HMARGIN
    #define EDGE_HMARGIN                2

    // bayer sensor pattern
    #define cam_CFAPattern 0x02010100 // Red  Green  Green  Blue

	#define	CAM_DNG_EXPOSURE_BIAS		0,1		// Specify DNG exposure bias value to 0 (to override default of -0.5 in the dng.c code)

    #define	CAM_DNG_LENS_INFO           { 43,10, 188,10, 20,10, 58,10 }	// See comments in camera.h

	//need fixing *****************************************************
/*
    #define cam_CalibrationIlluminant1	17		// Standard Light A
    //colormatrix from sx220hs
	#define CAM_COLORMATRIX1 \
    14458, 10000, -5704, 10000, -1562, 10000, \
    -2520, 10000, 11470, 10000,  1388, 10000, \
    -1336, 10000,  2334, 10000,  4387, 10000
*/
	#define cam_CalibrationIlluminant1  1
	#define CAM_COLORMATRIX1	\
	544808, 100000, -174047, 100000, -80399, 100000, \
	-75055, 100000,  440444, 100000,  11367, 100000, \
	 -5801, 100000,   71589, 100000, 118914, 100000
    
	#define CAM_ZEBRA_ASPECT_ADJUST     1

	//zebra letterbox for saving memory
	#undef ZEBRA_HMARGIN0
	#define ZEBRA_HMARGIN0              30 //this 30 rows are not used by the display buffer is 720x240 effective, no 960x270, i.e. (270-240) reduction in widht possible but not done (more difficult to manage it and slower).
	
	#define	CAM_DATE_FOLDER_NAMING	    1

	#define	CAM_STARTUP_CRASH_FILE_OPEN_FIX	1				// enable fix for camera crash at startup when opening the conf / font files
															// see http://chdk.setepontos.com/index.php?topic=6179.0

    #define CAM_FIRMWARE_MEMINFO        1       // Use 'GetMemInfo' to get free memory size.

    #define CAM_DRIVE_MODE_FROM_TIMER_MODE      // use PROPCASE_TIMER_MODE to check for multiple shot custom timer.
                                                // Used to enabled bracketing in custom timer, required on many recent cameras
                                                // see http://chdk.setepontos.com/index.php/topic,3994.405.html

	#define CAM_AV_OVERRIDE_IRIS_FIX	1				// for cameras that require _MoveIrisWithAv function to override Av in bracketing.

    #define CAM_DISABLE_RAW_IN_LOW_LIGHT_MODE   1       // For cameras with 'low light' mode that does now work with raw define this

    #define DNG_VERT_RLE_BADPIXELS      1       // Enable vertical run length compression of bad pixels, reduces badpixel.bin file size by approx 45%

    #define CAM_LOAD_CUSTOM_COLORS              1       // Enable loading CHDK colors into the camera palette memory/hardware
    #define CHDK_COLOR_BASE                     0xA2    // Start color index for CHDK colors loaded into camera palette.
    #define CAM_USE_COLORED_ICONS               1       // Enable using the CHDK-DE colored icons.

//----------------------------------------------------------

