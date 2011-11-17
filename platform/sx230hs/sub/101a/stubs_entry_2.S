#include "stubs_asm.h"
#define NULL_SUB 0xFF09D6EC

// Override stubs_entry.S
NHSTUB(Restart,						0xff02d3d8)
NHSTUB(SetFileAttributes, 			0xff02da48)
NHSTUB(kbd_pwr_off,					0xFF000B24)
NHSTUB(kbd_pwr_on,					0xFF000B24)

// These don't exist/aren't found in dryos
NHSTUB(SetZoomActuatorSpeedPercent, NULL_SUB)
NHSTUB(UnsetZoomForMovie,           NULL_SUB)

// Additional
NHSTUB(LockAndRefresh, 				0xff0ad294 )
NHSTUB(MakeAFScan, 					0xff191018 ) 
NHSTUB(MakeDirectory,				0xff026e44 ) 
NHSTUB(ReadSDCard,					0xff171d08) //0xff171f04 )
NHSTUB(UnlockAndRefresh, 			0xff0ad2f8 )
NHSTUB(UpdateMBROnFlash, 			0xff06c264 )
NHSTUB(closefastdir,				0xff2e6f38 ) 
NHSTUB(fclose,						0xff026f4c )
NHSTUB(fopen,						0xff026f0c ) 
NHSTUB(fread,						0xff026ff8 )
NHSTUB(fwrite,						0xff02704c ) 
NHSTUB(localtime,					0xff085a38) 
NHSTUB(ufree, 						0xff02bcb8)

//Fixed errors in compiler

STUB(FF057904)
STUB(FF18D2EC)
//STUB(FF18BD78)
//STUB(FF18D2F8)
//STUB(FF18D35C)
//STUB(FF18D3C0)
//STUB(FF18C818)
