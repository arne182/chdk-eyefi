#include "stubs_asm.h"
#define NULL_SUB 0xFF161ED8

// Override stubs_entry.S

NHSTUB(SetFileAttributes, 			NULL_SUB)
NHSTUB(kbd_pwr_off,					NULL_SUB)
NHSTUB(kbd_pwr_on,					NULL_SUB)


// These don't exist/aren't found in dryos
NHSTUB(SetZoomActuatorSpeedPercent, NULL_SUB)
NHSTUB(UnsetZoomForMovie,           NULL_SUB)

// Additional
NHSTUB(LockAndRefresh, 				0xFF0B2C50 )
NHSTUB(MakeAFScan, 					0xFF1D2958 )
NHSTUB(MakeDirectory,				0xFF026F70 )
NHSTUB(ReadSDCard,					0xFF1AB268) //0xff171f04 )
NHSTUB(UnlockAndRefresh, 			0xFF0B2CB4 )
NHSTUB(UpdateMBROnFlash, 			0xFF06A4E4 ) // Search for aScript    ; "SCRIPT"
NHSTUB(closefastdir,				0xFF33952C ) // "ReadFDir.c"
NHSTUB(fclose,						0xFF027078 ) // "Fclose_Fut"
NHSTUB(fopen,						0xFF027038 ) // "Fopen_Fut"
NHSTUB(fread,						0xFF027124 )
NHSTUB(fwrite,						0xFF027178 )
NHSTUB(localtime,					0xFF08A9C8)
NHSTUB(ufree, 						0xFF02BEA0)
NHSTUB(GetLogToFile,                0xFF1D9B04)
NHSTUB(EraseLogSector,              0xFF1D9B40)




//Fixed errors in compiler

STUB(FF057EBC)

//movierec.c
STUB(FF0772A4)
STUB(FF075688)
STUB(FF07568C)
STUB(FF0757D4)
STUB(FF077E04)
STUB(FF077E68)
STUB(FF077ECC)
STUB(FF075A1C)
STUB(FF0759C0)
