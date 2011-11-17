// Camera - IXUS1000_SD4500 - platform_camera.h

// This file contains the various settings values specific to the IXUS980_SD990 camera.
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

// copied from SX200 and modified
    #define CAM_DRYOS_2_3_R39			1
    #define CAM_PROPSET					4
    
    #define	CAM_DATE_FOLDER_NAMING	1

//    #define CAM_PROPSET                 2
    #define CAM_DRYOS                   1
    #define CAM_RAW_ROWPIX              3816 // from calcs see 100C lib.c   //ASM1989
    #define CAM_RAW_ROWS                2784 //  "     "    "    "    "  //ASM1989
   #undef CAM_EMUL_KEYPRESS_DURATION
   #define CAM_EMUL_KEYPRESS_DURATION  100
   #define EXMEM_HEAP_SKIP (0x08000000-0x07D08A00)			// G12 & SX30 uses movie memory buffers at the top of the memory allocated by exmem_alloc
   #define EXMEM_BUFFER_SIZE (1024*1024*2)        // desired amount of exmem memory to allocate

    #undef  CAM_CAN_SD_OVER_NOT_IN_MF
    #undef  CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO

    //ASM1989 TESTING VIDEO HANG
    //#define CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO 1
    #define CAM_HAS_VIDEO_BUTTON		1
    #define CAM_VIDEO_QUALITY_ONLY          1
    #undef  CAM_VIDEO_CONTROL
    #define CAM_MULTIPART               1
    #define CAM_HAS_JOGDIAL             1
    #undef  CAM_USE_ZOOM_FOR_MF

    //Why not??
	//#define CAM_BRACKETING				1

    #undef  CAM_UNCACHED_BIT  // shut up compiler
    #define CAM_UNCACHED_BIT    0x40000000

    #define CAM_DNG_LENS_INFO               { 63,10, 630,10, 34,10, 56,10 } // See comments in camera.h
    //#define cam_CFAPattern 0x01020001 // Green  red  blue  Green
	#define cam_CFAPattern 0x01000201 // Green blue  red   Green
	
   #define CAM_COLORMATRIX1                               \
      14134, 1000000, -5576, 1000000, -1527, 1000000, \
     -1991,  1000000, 10719,  1000000, 1273,   1000000, \
      -1158,   1000000, 1929,   1000000, 3581,  1000000

//Testing
    #define cam_CalibrationIlluminant1  1        // Daylight ?!?
    //#define cam_CalibrationIlluminant1 17 // Standard Light A
    // cropping  //ASM1989
    #define CAM_JPEG_WIDTH  3648
    #define CAM_JPEG_HEIGHT 2736

    // ASM1989 for IXus 1000 needs testing
   #define CAM_ACTIVE_AREA_X1			20 //42
	#define CAM_ACTIVE_AREA_Y1			10 //24
	#define CAM_ACTIVE_AREA_X2			3816-126
	#define CAM_ACTIVE_AREA_Y2			2784-10 //2784-24
//
//    #define CAM_ACTIVE_AREA_X1 10 // ToDo, just guesswork
    //#define CAM_ACTIVE_AREA_Y1 8 // ToDo, just guesswork
//    #define CAM_ACTIVE_AREA_X2 3600 // ToDo, just guesswork
    //#define CAM_ACTIVE_AREA_Y2 2750 // ToDo, just guesswork


    // camera name
    #define PARAM_CAMERA_NAME 4 // parameter number for GetParameterData
    #undef  CAM_SENSOR_BITS_PER_PIXEL
    #define CAM_SENSOR_BITS_PER_PIXEL   12

    #define CAM_EXT_TV_RANGE            1

    #undef CAM_BITMAP_PALETTE
    #define CAM_BITMAP_PALETTE    7
    #undef CAM_HAS_ERASE_BUTTON
    #define  CAM_SHOW_OSD_IN_SHOOT_MENU  1

  #define CAM_HAS_VARIABLE_ASPECT 1

    //nandoide sept-2009
    #undef CAM_USES_ASPECT_CORRECTION
    #undef CAM_USES_ASPECT_YCORRECTION
    #define CAM_USES_ASPECT_CORRECTION  1  //camera uses the modified graphics primitives to map screens an viewports to buffers more sized
    #define CAM_USES_ASPECT_YCORRECTION  0  //only uses mappings on x coordinate


        //#undef ASPECT_XCORRECTION
	    //#define ASPECT_XCORRECTION(x)  (((x)<<1))   //correction x*screen_buffer_width/screen_width = x*960/480 = x*2/1

	    #undef ASPECT_GRID_XCORRECTION
	    #define ASPECT_GRID_XCORRECTION(x)   ( (x)+60  )
        #undef ASPECT_GRID_YCORRECTION
	    #define ASPECT_GRID_YCORRECTION(y)  ( (y) )       //y correction for grids  made on a 360x240 As the buffer is 720x240 we have no correction here.


	    #undef ASPECT_VIEWPORT_XCORRECTION
	    #define ASPECT_VIEWPORT_XCORRECTION(x) ASPECT_GRID_XCORRECTION(x) //viewport is 360x240 and screen 320x240, we need x*320/360=x*8/9, equal than grids, used by edgeoverlay
	    #undef ASPECT_VIEWPORT_YCORRECTION
    #define ASPECT_VIEWPORT_YCORRECTION(y) ( (y) )

    #undef EDGE_HMARGIN
    #define EDGE_HMARGIN 10			//10 fits video mode of sx210

    //games mappings
   #undef GAMES_SCREEN_WIDTH
   #undef GAMES_SCREEN_HEIGHT
   #define GAMES_SCREEN_WIDTH 360
   #define GAMES_SCREEN_HEIGHT 240
   #undef ASPECT_GAMES_XCORRECTION
   // 720/360=2 same aspect than grids and viewport but another approach: there is a lot of corrections to do in game's code, and we decide to paint directly on display buffer wirh another resolution
   // used by gui.c that configures the draw environment (trhough new draw_gui function) depending on gui_mode: we have then 360x240 for games (but deformed output:circles are not circles) and 320x240 for
   // other modes in perfect aspect ratio 4/3: slightly better visualization: file menus more readable, ...
   #define ASPECT_GAMES_XCORRECTION(x)   ( ((x)<<1) )
   #undef ASPECT_GAMES_YCORRECTION
   #define ASPECT_GAMES_YCORRECTION(y)   ( (y) )  //none

   //zebra letterbox for saving memory
   #define CAM_ZEBRA_ASPECT_ADJUST 1
//#ifndef OPT_EXMEM_MALLOC    
   #define CAM_ZEBRA_NOBUF 1
//#endif
   #undef ZEBRA_HMARGIN0
   #define ZEBRA_HMARGIN0  30 //this 30 rows are not used by the display buffer is 720x240 effective, no 960x270, i.e. (270-240) reduction in widht possible but not done (more difficult to manage it and slower).

   //end nandoide sept-2009
   #define CAM_QUALITY_OVERRIDE 1
   #define CAM_AF_SCAN_DURING_VIDEO_RECORD 1

   #define CAM_DETECT_SCREEN_ERASE 1			     // http://chdk.setepontos.com/index.php?topic=6705.msg71062#msg71062	
   
   #define CAM_STARTUP_CRASH_FILE_OPEN_FIX    1     // enable workaround for camera crash at startup when opening the conf / font files
                                                    // see http://chdk.setepontos.com/index.php?topic=6179.0
// FOR TESTING PURPOSE
// push all regs except SP and PC
// push CPSR via R0
// restore value for R0 from stack
#define ASM_SAFE_ENTER \
	"STMFD SP!, {R0-R12,LR}\n" \
	"MRS R0, CPSR\n" \
	"STR R0,[SP,#-4]!\n" \
	"LDR R0,[SP,#4]\n"

// pop CPSR via R0
// pop all regs except SP and PC
#define ASM_SAFE_LEAVE \
	"LDR R0,[SP],#4\n" \
	"MSR CPSR_cxsf,R0\n" \
	"LDMFD SP!, {R0-R12,LR}\n"

#define ASM_SAFE(asmcode) \
	ASM_SAFE_ENTER \
	asmcode \
	ASM_SAFE_LEAVE

//----------------------------------------------------------

