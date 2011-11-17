// Camera - SX40HS - platform_camera.h

// This file contains the various settings values specific to the SX40HS camera.
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

	#define CAM_PROPSET					4
	#define CAM_DRYOS					1
	#define CAM_DRYOS_2_3_R39			1
    #define CAM_DRYOS_2_3_R47			1

	#define CAM_RAW_ROWPIX				4176 // Found @0xff18e050
	#define CAM_RAW_ROWS				3060 // Found @0xff18e05c
	#undef  CAM_UNCACHED_BIT
	#define CAM_UNCACHED_BIT			0x40000000 // Found @0xff02bea8

	#define CAM_SWIVEL_SCREEN			1
	#define CAM_ADJUSTABLE_ALT_BUTTON	1
	#undef  CAM_CAN_SD_OVER_NOT_IN_MF
	#undef  CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO
	#define CAM_HAS_VIDEO_BUTTON		1
	#define CAM_VIDEO_QUALITY_ONLY		1
	#define CAM_BRACKETING				1
	#undef  CAM_VIDEO_CONTROL
	#define CAM_MULTIPART				1
	#define CAM_HAS_JOGDIAL				1
	#undef  CAM_USE_ZOOM_FOR_MF
    #define CAM_DETECT_SCREEN_ERASE     1       // Turn on guard pixels to detect screen erase and redraw CHDK buttons and menus

	#undef DEFAULT_RAW_EXT
    #define DEFAULT_RAW_EXT             2   // use .CR2 

    #undef CAM_MENU_BORDERWIDTH
    #define CAM_MENU_BORDERWIDTH	10

    // bayer sensor pattern
    #define cam_CFAPattern 0x02010100 // Red  Green  Green  Blue

	#define	CAM_DNG_EXPOSURE_BIAS		0,1		// Specify DNG exposure bias value to 0 (to override default of -0.5 in the dng.c code)

    #define	CAM_DNG_LENS_INFO           { 43,10, 1505,10, 27,10, 58,10 }	// See comments in camera.h

	//need fixing *****************************************************
	#define cam_CalibrationIlluminant1  1
	#define CAM_COLORMATRIX1	\
	544808, 100000, -174047, 100000, -80399, 100000, \
	-75055, 100000,  440444, 100000,  11367, 100000, \
	 -5801, 100000,   71589, 100000, 118914, 100000

	// cropping
	#define CAM_JPEG_WIDTH				4072
	#define CAM_JPEG_HEIGHT				3044
	#define CAM_ACTIVE_AREA_X1			96
	#define CAM_ACTIVE_AREA_Y1			16
	#define CAM_ACTIVE_AREA_X2			4168
	#define CAM_ACTIVE_AREA_Y2			3060

	// camera name
	#define PARAM_CAMERA_NAME			4 // parameter number for GetParameterData
	#undef  CAM_SENSOR_BITS_PER_PIXEL
	#define CAM_SENSOR_BITS_PER_PIXEL	12

	#define CAM_EXT_TV_RANGE			1
	#define CAM_QUALITY_OVERRIDE		1

	// copied from the SX200 which has the same video buffer size
	#undef CAM_USES_ASPECT_CORRECTION
	#define CAM_USES_ASPECT_CORRECTION		1  //camera uses the modified graphics primitives to map screens an viewports to buffers more sized 

    #define CAM_ZEBRA_ASPECT_ADJUST 1
    #define CAM_ZEBRA_NOBUF 1

	#undef CAM_BITMAP_PALETTE
	#define CAM_BITMAP_PALETTE		12

	//zebra letterbox for saving memory
	#undef ZEBRA_HMARGIN0
	#define ZEBRA_HMARGIN0  30 //this 30 rows are not used by the display buffer is 720x240 effective, no 960x270, i.e. (270-240) reduction in widht possible but not done (more difficult to manage it and slower).
  
	#undef EDGE_HMARGIN
	#define EDGE_HMARGIN 2
	
	#define	CAM_DATE_FOLDER_NAMING	1

	#define	CAM_STARTUP_CRASH_FILE_OPEN_FIX	1				// enable fix for camera crash at startup when opening the conf / font files
															// see http://chdk.setepontos.com/index.php?topic=6179.0

//    #define CAM_KEY_CLICK_DELAY         150 // Does SX40 need extra delay for clicks ???

    #define CAM_FIRMWARE_MEMINFO        1       // Use 'GetMemInfo' to get free memory size.

    #define CAM_DRIVE_MODE_FROM_TIMER_MODE      // use PROPCASE_TIMER_MODE to check for multiple shot custom timer.
                                                // Used to enabled bracketing in custom timer, required on many recent cameras
                                                // see http://chdk.setepontos.com/index.php/topic,3994.405.html
	
	#define CAM_AV_OVERRIDE_IRIS_FIX	1				// for cameras that require _MoveIrisWithAv function to override Av in bracketing.

    #define CAM_DISABLE_RAW_IN_LOW_LIGHT_MODE   1       // For cameras with 'low light' mode that does not work with raw define this
    #define CAM_DISABLE_RAW_IN_HQ_BURST         1       // For cameras with 'HQ Burst' mode that does not work with raw define this
    #define CAM_DISABLE_RAW_IN_HANDHELD_NIGHT_SCN 1     // For cameras with 'HandHeld Night Scene' mode that does not work with raw define this

    #define CAM_LOAD_CUSTOM_COLORS              1       // Enable loading CHDK colors into the camera palette memory/hardware
    #define CHDK_COLOR_BASE                     0xA8    // Start color index for CHDK colors loaded into camera palette.
    #define CAM_USE_COLORED_ICONS               1       // Enable using the CHDK-DE colored icons.

	#undef	CAM_USB_EVENTID
	#define	CAM_USB_EVENTID				0x202			// Levent ID for USB control. Changed in DryOS R49 so needs to be overridable.
	
//----------------------------------------------------------
