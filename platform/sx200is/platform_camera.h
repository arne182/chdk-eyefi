// Camera - SX200IS - platform_camera.h

// This file contains the various settings values specific to the SX200IS camera.
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

    // copied from SX10 and modified
    #define CAM_PROPSET                 2
    #define CAM_DRYOS                   1
    #define CAM_RAW_ROWPIX              4080 // from calcs see 100C lib.c 
    #define CAM_RAW_ROWS                3048 //  "     "    "    "    "  
    
    #undef  CAM_CAN_SD_OVER_NOT_IN_MF
    #undef  CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO
    #define CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO 1

    #define CAM_VIDEO_QUALITY_ONLY          1  

    #undef  CAM_VIDEO_CONTROL
    #define CAM_MULTIPART               1
    #define CAM_HAS_JOGDIAL             1
    #undef  CAM_USE_ZOOM_FOR_MF
    #undef  CAM_UNCACHED_BIT  // shut up compiler
    #define CAM_UNCACHED_BIT    0x40000000

    #define CAM_DNG_LENS_INFO               { 50,10, 600,10, 34,10, 53,10 } // See comments in camera.h
    // pattern
    #define cam_CFAPattern 0x02010100 // Red  Green  Green  Blue
    // color
    //need fixing *****************************************************
    #define CAM_COLORMATRIX1                               \
      14134, 1000000, -5576, 1000000, -1527, 1000000, \
     -1991,  1000000, 10719,  1000000, 1273,   1000000, \
      -1158,   1000000, 1929,   1000000, 3581,  1000000

    #define cam_CalibrationIlluminant1 17 // Standard Light A
    // cropping
    #define CAM_JPEG_WIDTH  4000
    #define CAM_JPEG_HEIGHT 3000
    #define CAM_ACTIVE_AREA_X1 52
    #define CAM_ACTIVE_AREA_Y1 14
    #define CAM_ACTIVE_AREA_X2 4052
    #define CAM_ACTIVE_AREA_Y2 3014
    // camera name
    #define PARAM_CAMERA_NAME 4 // parameter number for GetParameterData

    #undef  CAM_SENSOR_BITS_PER_PIXEL
    #define CAM_SENSOR_BITS_PER_PIXEL   12

    #define CAM_EXT_TV_RANGE            1
    #undef CAM_BITMAP_PALETTE
    #define CAM_BITMAP_PALETTE    3
    #undef CAM_HAS_ERASE_BUTTON
    #define  CAM_SHOW_OSD_IN_SHOOT_MENU  1
        
    #undef CAM_USES_ASPECT_CORRECTION   
    #define CAM_USES_ASPECT_CORRECTION  1  //camera uses the modified graphics primitives to map screens an viewports to buffers more sized 

    #undef EDGE_HMARGIN 
    #define EDGE_HMARGIN 28

    //zebra letterbox for saving memory
    #undef ZEBRA_HMARGIN0
    #define ZEBRA_HMARGIN0  30 //this 30 rows are not used by the display buffer is 720x240 effective, no 960x270, i.e. (270-240) reduction in widht possible but not done (more difficult to manage it and slower).

    #define CAM_QUALITY_OVERRIDE 1
    #define CAM_AF_SCAN_DURING_VIDEO_RECORD 1
    #define CAM_ZEBRA_ASPECT_ADJUST 1
    #define  CAM_CHDK_PTP               1 // include CHDK PTP support

    #define CAM_DRIVE_MODE_FROM_TIMER_MODE      // use PROPCASE_TIMER_MODE to check for multiple shot custom timer.
                                                // Used to enabled bracketing in custom timer, required on many recent cameras
                                                // see http://chdk.setepontos.com/index.php/topic,3994.405.html

//----------------------------------------------------------

