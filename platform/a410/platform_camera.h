// Camera - A410 - platform_camera.h

// This file contains the various settings values specific to the A410 camera.
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

	#define CAM_PROPSET						1

	#define CAM_RAW_ROWPIX					2144  // for 3.34 MP 1/3.2" sensor size
	#define CAM_RAW_ROWS					1560  // for 3.34 MP 1/3.2" sensor size

	#undef  CAM_USE_ZOOM_FOR_MF
	#undef  CAM_HAS_ZOOM_LEVER
	#define CAM_DRAW_EXPOSITION				1
	#undef  CAM_HAS_ERASE_BUTTON
	#undef  CAM_HAS_IRIS_DIAPHRAGM
	#define CAM_HAS_ND_FILTER				1
	#undef  CAM_HAS_MANUAL_FOCUS
	#define CAM_CAN_SD_OVER_NOT_IN_MF		1
	#define CAM_CAN_SD_OVERRIDE			1 // :/ it's broken in firmware, but got worked around

	#undef  CAM_HAS_USER_TV_MODES
	#define CAM_SHOW_OSD_IN_SHOOT_MENU		1
	#undef  CAM_HAS_IS
	#undef  CAM_CAN_MUTE_MICROPHONE

	#define CAM_CHDK_HAS_EXT_VIDEO_MENU		1//
	#undef  CAM_AF_SCAN_DURING_VIDEO_RECORD // :( too complex to fix
	#define CAM_EV_IN_VIDEO				1 //but not very reliable...
    
    #define CAM_DNG_LENS_INFO               { 54,10, 173,10, 28,10, 51,10 } // See comments in camera.h
    
	// pattern
	#define cam_CFAPattern 0x02010100 // Red  Green  Green  Blue
	// color
/*	#define CAM_COLORMATRIX1                                \ //copy from A430
      479627,  1000000, -156240, 1000000,  -84926, 1000000, \
     -215238,  1000000,  534902, 1000000,   60219, 1000000, \
      -96906,  1000000,  148194, 1000000,  191583, 1000000
*/
	//well, first try, probably not accurate enough (used dng2ps2):
	#define CAM_COLORMATRIX1				\
	 270041, 1000000, -110546, 1000000,  -43914, 1000000,	\
	-121712, 1000000,  256251, 1000000,   12623, 1000000,	\
	 -27956, 1000000,   36119, 1000000,  104654, 1000000
	#undef  CAM_CONSOLE_LOG_ENABLED
	#define cam_CalibrationIlluminant1		1 // Daylight
	// cropping
	#define CAM_JPEG_WIDTH			2048
	#define CAM_JPEG_HEIGHT			1536
	#define CAM_ACTIVE_AREA_X1		2
	#define CAM_ACTIVE_AREA_Y1		6
	#define CAM_ACTIVE_AREA_X2		2090
	#define CAM_ACTIVE_AREA_Y2		1558
	// camera name
	#define PARAM_CAMERA_NAME		3 // parameter number for GetParameterData
	#undef  CAM_BRACKETING //no bracketing in fw
	#define CAM_EXT_TV_RANGE		1
	#define CAM_DETECT_SCREEN_ERASE		1
//	#define CAM_NO_MEMPARTINFO		1
//	#define CAM_MULTIPART			1
//----------------------------------------------------------

