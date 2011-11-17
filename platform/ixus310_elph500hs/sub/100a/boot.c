#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "dryos31.h"

#define offsetof(TYPE, MEMBER) ((int) &((TYPE *)0)->MEMBER)

const char * const new_sa = &_end;

// Forward declarations
void CreateTask_PhySw();
void CreateTask_spytask();
void task_TouchPanel_my(void);

//void __attribute__((naked,noinline)) my_blinker(int n) {
//	asm volatile (
//"                STMFD   SP!, {R0-R5,LR}\n"
//);
//	int i, j;
//	for (j=0; j<n; j++)
//	{
//		*((volatile int *) 0xC0220110) = 0x46; // Turn on LED
//		for (i=0; i<0x200000; i++) { asm volatile ( "nop\n" ); }
//
//		*((volatile int *) 0xC0220110) = 0x44; // Turn off LED
//		for (i=0; i<0x200000; i++) { asm volatile ( "nop\n" ); }
//	}
//	for (i=0; i<0x900000; i++) { asm volatile ( "nop\n" ); }
//	asm volatile (
//"                LDMFD   SP!, {R0-R5,PC}\n"
//	);
//}

extern void task_CaptSeq();
extern void task_InitFileModules();
extern void task_TouchPanel();
extern void task_MovieRecord();
extern void task_ExpDrv();

void taskHook(context_t **context)
{ 
	task_t *tcb=(task_t*)((char*)context-offsetof(task_t, context));

	// Replace firmware task addresses with ours
	if(tcb->entry == (void*)task_CaptSeq)			tcb->entry = (void*)capt_seq_task; 
	if(tcb->entry == (void*)task_InitFileModules)	tcb->entry = (void*)init_file_modules_task;
	if(tcb->entry == (void*)task_TouchPanel)		tcb->entry = (void*)task_TouchPanel_my;
	if(tcb->entry == (void*)task_MovieRecord)		tcb->entry = (void*)movie_record_task;
	if(tcb->entry == (void*)task_ExpDrv)			tcb->entry = (void*)exp_drv_task;
}

/*---------------------------------------------------------------------
  Memory Map:
	0001900     MEMBASEADDR             start of data - used for initialized vars
	0010797                             end of inited data
	0010798                             start of bss - used for zeroed/uninited vars
	016E81F                             end of bss
	016E820     MEMISOSTART             start of our data / bss

	0400000                             raw buffers
	8000000                             end of raw buffers

	C0xxxxxx                            I/O

	FF810000    ROMBASEADDR             start of rom
	FFFFFFFF                            end of rom
----------------------------------------------------------------------*/

/*----------------------------------------------------------------------
	boot()

	Main entry point for the CHDK code
-----------------------------------------------------------------------*/

void __attribute__((naked,noinline)) boot() {

    asm volatile (
                 "LDR     R1, =0xC0410000\n"
                 "MOV     R0, #0\n"
                 "STR     R0, [R1]\n"
                 "MOV     R1, #0x78\n"
                 "MCR     p15, 0, R1,c1,c0\n"
                 "MOV     R1, #0\n"
                 "MCR     p15, 0, R1,c7,c10, 4\n"
                 "MCR     p15, 0, R1,c7,c5\n"
                 "MCR     p15, 0, R1,c7,c6\n"
                 "MOV     R0, #0x3D\n"
                 "MCR     p15, 0, R0,c6,c0\n"
                 "MOV     R0, #0xC000002F\n"
                 "MCR     p15, 0, R0,c6,c1\n"
                 "MOV     R0, #0x35\n"					// memory region & size. bits 1 - 5 = size index, actual size = 2^(size index + 1) = 128MB
                 "MCR     p15, 0, R0,c6,c2\n"
                 "MOV     R0, #0x40000035\n"			// memory region & size. bits 1 - 5 = size index, actual size = 2^(size index + 1) = 128MB
                 "MCR     p15, 0, R0,c6,c3\n"
                 "MOV     R0, #0x80000017\n"
                 "MCR     p15, 0, R0,c6,c4\n"
                 "LDR     R0, =0xFF00002F\n"
                 "MCR     p15, 0, R0,c6,c5\n"
                 "MOV     R0, #0x34\n"
                 "MCR     p15, 0, R0,c2,c0\n"
                 "MOV     R0, #0x34\n"
                 "MCR     p15, 0, R0,c2,c0, 1\n"
                 "MOV     R0, #0x34\n"
                 "MCR     p15, 0, R0,c3,c0\n"
                 "LDR     R0, =0x3333330\n"
                 "MCR     p15, 0, R0,c5,c0, 2\n"
                 "LDR     R0, =0x3333330\n"
                 "MCR     p15, 0, R0,c5,c0, 3\n"
                 "MRC     p15, 0, R0,c1,c0\n"
                 "ORR     R0, R0, #0x1000\n"
                 "ORR     R0, R0, #4\n"
                 "ORR     R0, R0, #1\n"
                 "MCR     p15, 0, R0,c1,c0\n"
                 "MOV     R1, #0x80000006\n"
                 "MCR     p15, 0, R1,c9,c1\n"
                 "MOV     R1, #6\n"
                 "MCR     p15, 0, R1,c9,c1, 1\n"
                 "MRC     p15, 0, R1,c1,c0\n"
                 "ORR     R1, R1, #0x50000\n"
                 "MCR     p15, 0, R1,c1,c0\n"
                 "LDR     R2, =0xC0200000\n"
                 "MOV     R1, #1\n"
                 "STR     R1, [R2,#0x10C]\n"
                 "MOV     R1, #0xFF\n"
                 "STR     R1, [R2,#0xC]\n"
                 "STR     R1, [R2,#0x1C]\n"
                 "STR     R1, [R2,#0x2C]\n"
                 "STR     R1, [R2,#0x3C]\n"
                 "STR     R1, [R2,#0x4C]\n"
                 "STR     R1, [R2,#0x5C]\n"
                 "STR     R1, [R2,#0x6C]\n"
                 "STR     R1, [R2,#0x7C]\n"
                 "STR     R1, [R2,#0x8C]\n"
                 "STR     R1, [R2,#0x9C]\n"
                 "STR     R1, [R2,#0xAC]\n"
                 "STR     R1, [R2,#0xBC]\n"
                 "STR     R1, [R2,#0xCC]\n"
                 "STR     R1, [R2,#0xDC]\n"
                 "STR     R1, [R2,#0xEC]\n"
                 "STR     R1, [R2,#0xFC]\n"
                 "LDR     R1, =0xC0400008\n"
                 "LDR     R2, =0x430005\n"
                 "STR     R2, [R1]\n"
                 "MOV     R1, #1\n"
                 "LDR     R2, =0xC0243100\n"
                 "STR     R2, [R1]\n"
                 "LDR     R2, =0xC0242010\n"
                 "LDR     R1, [R2]\n"
                 "ORR     R1, R1, #1\n"
                 "STR     R1, [R2]\n"

                 "LDR     R0, =0xFF50C000\n"
                 "LDR     R1, =0x1900\n"
                 "LDR     R3, =0x11058\n"
 "loc_FF81013C:\n"
                 "CMP     R1, R3\n"
                 "LDRCC   R2, [R0],#4\n"
                 "STRCC   R2, [R1],#4\n"
                 "BCC     loc_FF81013C\n"
                 "LDR     R1, =0x18B834\n"
                 "MOV     R2, #0\n"
 "loc_FF810154:\n"
                 "CMP     R3, R1\n"
                 "STRCC   R2, [R3],#4\n"
                 "BCC     loc_FF810154\n"
				
                 "B       sub_FF000358_my" // -->
    );
}

void __attribute__((naked,noinline)) sub_FF000358_my() {

	//http://chdk.setepontos.com/index.php/topic,4194.0.html
	*(int*)0x1938=(int)taskHook;
	*(int*)0x193C=(int)taskHook;
    
	// replacement of sub_FF024B5C for correct power-on.
	*(int*)(0x2638) = (*(int*)0xC0220130)&1 ? 0x200000 : 0x100000; 

	asm volatile (
                 "LDR     R0, =0xFF0003D0\n"
                 "MOV     R1, #0\n"
                 "LDR     R3, =0xFF000408\n"
 "loc_FF000364:\n"
                 "CMP     R0, R3\n"
                 "LDRCC   R2, [R0],#4\n"
                 "STRCC   R2, [R1],#4\n"
                 "BCC     loc_FF000364\n"
                 "LDR     R0, =0xFF000408\n"
                 "MOV     R1, #0x4B0\n"
                 "LDR     R3, =0xFF00061C\n"
 "loc_FF000380:\n"
                 "CMP     R0, R3\n"
                 "LDRCC   R2, [R0],#4\n"
                 "STRCC   R2, [R1],#4\n"
                 "BCC     loc_FF000380\n"
                 "MOV     R0, #0xD2\n"
                 "MSR     CPSR_cxsf, R0\n"
                 "MOV     SP, #0x1000\n"
                 "MOV     R0, #0xD3\n"
                 "MSR     CPSR_cxsf, R0\n"
                 "MOV     SP, #0x1000\n"
                 "LDR     R0, =0x6C4\n"
                 "LDR     R2, =0xEEEEEEEE\n"
                 "MOV     R3, #0x1000\n"
 "loc_FF0003B4:\n"
                 "CMP     R0, R3\n"
                 "STRCC   R2, [R0],#4\n"
                 "BCC     loc_FF0003B4\n"
//                 "BL      sub_FF0011B0\n"
                 "BL      sub_FF0011B0_my\n" // -->
     );
}

void __attribute__((naked,noinline)) sub_FF0011B0_my() {

     asm volatile (
                 "STR     LR, [SP,#-4]!\n"
                 "SUB     SP, SP, #0x74\n"
                 "MOV     R1, #0x74\n"
                 "MOV     R0, SP\n"
                 "BL      sub_FF3CA344\n"
                 "MOV     R0, #0x53000\n"
                 "STR     R0, [SP,#4]\n"

#if defined(OPT_CHDK_IN_EXMEM)
               "LDR     R0, =0x18B834\n" // use original heap offset since CHDK is loaded in high memory
#else
               "LDR     R0, =new_sa\n"   // otherwise use patched value
               "LDR     R0, [R0]\n"      // 
#endif

"    LDR     R2, =0x371F80 \n"
"    STR     R0, [SP,#0x8] \n"
"    SUB     R0, R2, R0 \n"
"    STR     R0, [SP,#0xC] \n"
"    MOV     R0, #0x22 \n"
"    STR     R0, [SP,#0x18] \n"
"    MOV     R0, #0x68 \n"
"    STR     R0, [SP,#0x1C] \n"
"    LDR     R1, =0x379C00 \n"
"    LDR     R0, =0x19B \n"
"    STR     R1, [SP] \n"
"    STR     R0, [SP,#0x20] \n"
"    MOV     R0, #0x96 \n"
"    STR     R2, [SP,#0x10] \n"
"    STR     R1, [SP,#0x14] \n"
"    STR     R0, [SP,#0x24] \n"
"    STR     R0, [SP,#0x28] \n"
"    MOV     R0, #0x64 \n"
"    STR     R0, [SP,#0x2C] \n"
"    MOV     R0, #0 \n"
"    STR     R0, [SP,#0x30] \n"
"    STR     R0, [SP,#0x34] \n"
"    MOV     R0, #0x10 \n"
"    STR     R0, [SP,#0x5C] \n"
"    MOV     R0, #0x800 \n"
"    STR     R0, [SP,#0x60] \n"
"    MOV     R0, #0xA0 \n"
"    STR     R0, [SP,#0x64] \n"
"    MOV     R0, #0x280 \n"
"    STR     R0, [SP,#0x68] \n"
//"    LDR     R1, =sub_FF005EE0 \n"
"    LDR     R1, =sub_FF005EE0_my \n"   // patched

"    B		sub_FF00124C \n"		// Continue in firmware
     );
}

void __attribute__((naked,noinline)) sub_FF005EE0_my() {

	asm volatile (
"		STMFD	SP!, {R4,LR} \n"
"		BL	sub_FF000B28 \n"
"		BL	sub_FF00A374 \n"				// dmSetup
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aDmsetup \n"			// "dmSetup"
"		LDRLT	r0, =0xFF005FF4 \n"

"		BLLT	_err_init_task \n"
"		BL	sub_FF005B18 \n"
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aTermdriverinit \n"		// "termDriverInit"
"		LDRLT	R0, =0xFF005FFC \n"

"		BLLT	_err_init_task \n"

//"		ADR	R0, a_term \n"					// "/_term"
"		LDR	R0, =0xFF00600C \n"

"		BL	sub_FF005C00 \n"
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aTermdevicecrea \n"		// "termDeviceCreate"
"		LDRLT	R0, =0xFF006014 \n"

"		BLLT	_err_init_task \n"

//"		ADR	R0, a_term \n"					// "/_term"
"		LDR	R0, =0xFF00600C \n"

"		BL	sub_FF003CA8 \n"
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aStdiosetup \n"			// "stdioSetup"
"		LDRLT	R0, =0xFF006028 \n"

"		BLLT	_err_init_task \n"
"		BL	sub_FF009D00 \n"
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aStdlibsetup \n"		// "stdlibSetup"
"		LDRLT	R0, =0xFF006034 \n"

"		BLLT	_err_init_task \n"
"		BL	sub_FF001690 \n"
"		CMP	R0, #0 \n"

//"		ADRLT	R0, aArmlib_setup \n"		// "armlib_setup"
"		LDRLT	R0, =0xFF006040 \n"

"		BLLT	_err_init_task \n"

"		LDMFD	SP!, {R4,LR} \n"

//"		B	sub_FF00FC80 \n"				// taskcreate_Startup
"		B	taskcreate_Startup_my \n"		// patched
        );
};

void __attribute__((naked,noinline)) taskcreate_Startup_my() {

	asm volatile (
"    STMFD   SP!, {R3-R9,LR} \n"
"    MOV     R6, #0 \n"
//"    BL      j_nullsub_112 \n"
"    BL      sub_FF02D1D0 \n"
"    LDR     R9, =0xC0220000 \n"
"    MOVS    R7, R0 \n"
"    MOV     R8, #1 \n"
"    BNE     loc_FF00FCE8 \n"
"    BL      sub_FF026598 \n"
"    CMP     R0, #0 \n"
"    BEQ     loc_FF00FCE8 \n"
"    LDR     R0, [R9,#0x138] \n"
"    BIC     R5, R8, R0 \n"
"    LDR     R0, [R9,#0x130] \n"
"    BIC     R4, R8, R0 \n"
"    BL      sub_FF023D90 \n"
"    CMP     R0, #1 \n"
"    MOVEQ   R6, #1 \n"
"    ORR     R0, R4, R5 \n"
"    ORRS    R0, R0, R6 \n"
"    BNE     loc_FF00FCF8 \n"
"    BL      sub_FF0241A0 \n"
"    MOV     R0, #0x44 \n"
"    STR     R0, [R9,#0x1C] \n"
"    BL      sub_FF024390 \n"
"loc_FF00FCE4: \n"
"    B       loc_FF00FCE4 \n"
"loc_FF00FCE8: \n"
"    LDR     R0, [R9,#0x130] \n"
"    BIC     R4, R8, R0 \n"
"    LDR     R0, [R9,#0x138] \n"
"    BIC     R5, R8, R0 \n"
"loc_FF00FCF8: \n"
"    MOV     R3, R6 \n"
"    MOV     R2, R7 \n"
"    MOV     R1, R5 \n"
"    MOV     R0, R4 \n"
//"    BL      sub_FF024B5C \n"         // see begin of sub_FF000358_my()
//"    BL      j_nullsub_113 \n"
"    BL      sub_FF02B3A0 \n"
"    LDR     R1, =0x3CE000 \n"
"    MOV     R0, #0 \n"
"    BL      sub_FF02B810 \n"
"    BL      sub_FF02B5B8 \n"
"    MOV     R3, #0 \n"
"    STR     R3, [SP] \n"

//"    LDR     R3, =task_Startup \n"
"    LDR     R3, =task_Startup_my \n"   // patched

"    B       sub_FF00FD30 \n"	// Continue in firmware
     );
}

void __attribute__((naked,noinline)) task_Startup_my() {

	asm volatile (
"    STMFD   SP!, {R4,LR} \n"
"    BL      sub_FF006588 \n"
"    BL      sub_FF025E08 \n"
"    BL      sub_FF023DA0 \n"
//"    BL      j_nullsub_115 \n"
"    BL      sub_FF02D404 \n"
"    BL      sub_FF024FA4 \n"
"    BL      sub_FF023824 \n"
//"    BL      sub_FF02D2AC \n" // start diskboot.bin
"    BL      sub_FF02D5B8 \n"
"    LDR     R1, =0x30101 \n"
"    MOV     R0, #2 \n"
"    BL      sub_FF02A8CC \n"
"    LDR     R1, =0xC0220000 \n"
"    MOV     R0, #8 \n"
"    STR     R0, [R1,#0x34] \n"
"    MOV     R0, #2 \n"
"    BL      sub_FF02A5FC \n"
"    BL      sub_FF022234 \n"
"    BL      sub_FF02D434 \n"
"    BL      sub_FF02AB44 \n"
"    BL      sub_FF02D5BC \n"

		"BL		CreateTask_spytask\n" // added

//"    BL      sub_FF0249FC \n"
		"BL		taskcreatePhySw_my\n"  // we do this here rather than hook so we don't waste the original stack

		"B		sub_FF00FC50\n"		// Continue in firmware
     );
}

void __attribute__((naked,noinline)) taskcreatePhySw_my() {

	asm volatile (
"                STMFD   SP!, {R3-R5,LR}\n"
"                LDR     R4, =0x1C3C\n"
"                LDR     R0, [R4,#0x4]\n"
"                CMP     R0, #0\n"
"                BNE     sub_FF024A30\n"    // continue in firmware
"                MOV     R3, #0\n"
"                STR     R3, [SP]\n"
//"                LDR     R3, =sub_FF0249C8 \n"
"                LDR     R3, =mykbd_task\n" // task_PhySw
//"                MOV     R2, #0x800\n"
"                MOV     R2, #0x2000\n" // stack size for new task_PhySw so we don't have to do stack switch
"				 B	     sub_FF024A20 \n" // continue in firmware
	);
}

/*----------------------------------------------------------------------
	spytask
-----------------------------------------------------------------------*/
void spytask(long ua, long ub, long uc, long ud, long ue, long uf)
{
    core_spytask();
}

/*----------------------------------------------------------------------
	CreateTask_spytask
-----------------------------------------------------------------------*/
void CreateTask_spytask() {
	_CreateTask("SpyTask", 0x19, 0x2000, spytask, 0);
}

 ///*----------------------------------------------------------------------

// @ 0xff090ab0
void __attribute__((naked,noinline)) init_file_modules_task() {
 asm volatile(
                 "STMFD   SP!, {R4-R6,LR}\n"
                 "BL      sub_FF088584\n"
                 "LDR     R5, =0x5006\n"
                 "MOVS    R4, R0\n"
                 "MOVNE   R1, #0\n"
                 "MOVNE   R0, R5\n"
                 "BLNE    _PostLogicalEventToUI\n"
				 "BL      sub_FF0885B0\n"

                 "BL      core_spytask_can_start\n"      // CHDK: Set "it's-safe-to-start" flag for spytask

				 "B		  sub_FF090AD0\n"	// Continue in firmware
 );
}

///*----------------------------------------------------------------------

// @ 0xFF059E84
void __attribute__((naked,noinline)) task_TouchPanel_my() {
 asm volatile(
"                STMFD   SP!, {R3-R7,LR} \n"
"                MOV     R0, #0 \n"
"                LDR     R1, =0xC0221000 \n"
"                MOV     R4, R0 \n"
"                STR     R0, [SP] \n"
"                MOV     R0, #0x23 \n"
"                STR     R0, [R1,#0x314] \n"
"                MOV     R0, #0x1C \n"
"                SUB     R1, R1, #0x1E000 \n"
"                STR     R0, [R1,#0x40] \n"
"                MOV     R3, #0 \n"
"                LDR     R2, =0xFF059BD0 \n"    // sub_FF059BD0
"                MOV     R1, #0x55 \n"
"                MOV     R0, R3 \n"
"                BL      sub_FF00E948 \n"
"                BL      sub_FF05A2C8 \n"
"                LDR     R5, =0x28BC \n"
"                MOV     R1, #0x10 \n"
"                LDR     R0, [R5,#0x24] \n"
"                BL      sub_FF07FAFC \n"
"                MOV     R6, #7 \n"
"loc_FF059ED8: \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R2, #0 \n"
"                MOV     R1, #0x17 \n"
"                BL      sub_FF07F924 \n"
"                CMP     R0, #0 \n"
"                LDRNE   R1, =0x322 \n"
"                LDRNE   R0, =0xFF059C34 \n"    // ; "TouchPanelDriver_TSC2008.c"
"                BLNE    _DebugAssert \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, SP \n"
"                BL      sub_FF07FB34 \n"
"                CMP     R0, #0 \n"
"                LDRNE   R1, =0x323 \n"
"                LDRNE   R0, =0xFF059C34 \n"    // ; "TouchPanelDriver_TSC2008.c"
"                BLNE    _DebugAssert \n"
"                LDR     R0, [SP] \n"
"                TST     R0, #1 \n"
"                BEQ     loc_FF059F50 \n"
"                LDR     R0, [R5,#4] \n"
"                BL      sub_FF0836C8 \n"
"                STR     R6, [R5,#4] \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, #5 \n"
"                BL      sub_FF07FAFC \n"
"                BL      sub_FF059BE0 \n"
"                MOV     R4, #0 \n"
"                BL      sub_FF05A2C8 \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, #0x80000000 \n"
"                BL      sub_FF07FAC8 \n"
"loc_FF059F50: \n"
"                LDR     R0, [SP] \n"
"                TST     R0, #2 \n"
"                BEQ     loc_FF059F80 \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, #2 \n"
"                BL      sub_FF07FAFC \n"
"                CMP     R4, #0 \n"
"                BNE     loc_FF059ED8 \n"
"                LDR     R0, =0xBB8 \n"
"                BL      sub_FF059A1C \n"
"                MOV     R4, #1 \n"
"                BL      sub_FF05A3DC \n"
"loc_FF059F80: \n"
"                LDR     R0, [SP] \n"
"                TST     R0, #0x10 \n"
"                BEQ     loc_FF059FC0 \n"
"                LDR     R0, [R5,#4] \n"
"                BL      sub_FF0836C8 \n"
"                STR     R6, [R5,#4] \n"
"                BL      sub_FF05A2C8 \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, #0x14 \n"
"                BL      sub_FF07FAFC \n"
"                CMP     R4, #0 \n"
"                BEQ     loc_FF059ED8 \n"
"                BL      sub_FF059E30_my \n"
"                LDR     R0, [R5,#8] \n"
"                CMP     R0, #0 \n"
"                BLNE    sub_FF059ADC \n"
"loc_FF059FC0: \n"
"                LDR     R0, [SP] \n"
"                TST     R0, #4 \n"
"                BEQ     loc_FF059ED8 \n"
"                STR     R6, [R5,#4] \n"
"                LDR     R0, [R5,#0x24] \n"
"                MOV     R1, #4 \n"
"                BL      sub_FF07FAFC \n"
"                CMP     R4, #0 \n"
"                BEQ     loc_FF059ED8 \n"
"                BL      sub_FF059E30_my \n"    // +++
"                LDR     R0, [R5,#8] \n"
"                CMP     R0, #0 \n"
"                BLNE    sub_FF059ADC \n"
"                B       loc_FF059ED8 \n"
 );
}

void __attribute__((naked,noinline)) sub_FF059E30_my() {
 asm volatile(
"                LDR     R1, =0x28BC \n"
"                LDR     R0, [R1,#8] \n"
"                CMP     R0, #0 \n"
"                BEQ     loc_FF059E5C \n"
"                CMP     R0, #1 \n"
"                BEQ     sub_FF059D24_my \n"    // +++
"                CMP     R0, #2 \n"
"                BEQ     sub_FF05A414_my \n"    // +++
"                LDRNE   R1, =0x311 \n"
"                LDRNE   R0, =0xFF059C34 \n"    // ; "TouchPanelDriver_TSC2008.c"
"                BNE     _DebugAssert \n"
"loc_FF059E5C: \n"
"                LDR     R0, =0xC0220000 \n"
"                LDR     R0, [R0,#0x8C] \n"
"                TST     R0, #1 \n"
"                BNE     sub_FF05A3DC \n"
"                MOV     R0, #0 \n"
"                STR     R0, [R1,#0x14] \n"
"                STR     R0, [R1,#0x10] \n"
"                MOV     R0, #1 \n"
"                STR     R0, [R1,#8] \n"
"                BX      LR \n"
 );
}

void __attribute__((naked,noinline)) sub_FF059D24_my() {
 asm volatile(
"                STMFD   SP!, {R3-R5,LR} \n"
"                LDR     R4, =0x28BC \n"
"                LDR     R5, =0xC0220000 \n"
"                LDR     R0, [R4,#0xC] \n"
"                CMP     R0, #1 \n"
"                BNE     loc_FF059DC0 \n"
"                LDR     R0, [R4,#0x14] \n"
"                ADD     R1, R0, #1 \n"
"                MOV     R0, R4 \n"
"                STR     R1, [R4,#0x14] \n"
"                LDR     R0, [R0,#0x10] \n"
"                CMP     R1, #0xA \n"
"                BNE     loc_FF059D84 \n"
"                CMP     R0, #2 \n"
"                BCC     loc_FF059E28 \n"
"                LDR     R0, [R5,#0x8C] \n"
"                TST     R0, #1 \n"
"                BNE     loc_FF059D7C \n"
"                ADD     R1, R4, #0x34 \n"
"                MOV     R0, #0 \n"
"                BL      sub_FF059A7C \n"
"                B       loc_FF059DEC \n"
"loc_FF059D7C: \n"
"                BL      sub_FF05A3F0 \n"
"                LDMFD   SP!, {R3-R5,PC} \n"
"loc_FF059D84: \n"
"                LDR     R1, [R5,#0x8C] \n"
"                TST     R1, #1 \n"
"                BEQ     loc_FF059D9C \n"
"                CMP     R0, #2 \n"
"                LDMCSFD SP!, {R3-R5,PC} \n"
"                B       loc_FF059E28 \n"
"loc_FF059D9C: \n"
"                ADD     R0, R0, #1 \n"
"                CMP     R0, #2 \n"
"                STR     R0, [R4,#0x10] \n"
"                LDMNEFD SP!, {R3-R5,PC} \n"
"                MOV     R0, #0 \n"
"                LDR     R1, =0x28F0 \n"
"                BL      sub_FF059A7C \n"
"                BL      sub_FF059C58_my \n"   // +++ process_TouchCoords
"                LDMFD   SP!, {R3-R5,PC} \n"
"loc_FF059DC0: \n"
"                LDR     R0, [R5,#0x8C] \n"
"                TST     R0, #1 \n"
"                BNE     loc_FF059E28 \n"
"                LDR     R1, =0x28F0 \n"
"                MOV     R0, #0 \n"
"                BL      sub_FF059A7C \n"
"                LDR     R0, =0x2710 \n"
"                BL      sub_FF059A1C \n"
"                LDR     R0, [R5,#0x8C] \n"
"                TST     R0, #1 \n"
"                BNE     loc_FF059DF4 \n"
"loc_FF059DEC: \n"
"                BL      sub_FF059C58_my \n"   // +++ process_TouchCoords
"                B       loc_FF059D7C \n"
"loc_FF059DF4: \n"
"                LDR     R0, =0x28F0 \n"
"                MOV     R3, #0 \n"
"                STR     R3, [SP] \n"
"                LDRH    R1, [R0,#2] \n"
"                LDRH    R0, [R0] \n"
"                LDR     R12, [R4,#0x1C] \n"
"                BIC     R2, R1, #0x8000 \n"
"                LDR     R1, =0x3FF \n"
"                BIC     R0, R0, #0x8000 \n"
"                EOR     R2, R1, R2,LSR#5 \n"
"                EOR     R1, R1, R0,LSR#5 \n"
"                MOV     R0, R3 \n"
"                BLX     R12 \n"
"loc_FF059E28: \n"
"                BL      sub_FF059BE0 \n"
"                LDMFD   SP!, {R3-R5,PC} \n"
 );
}

void __attribute__((naked,noinline)) sub_FF05A414_my() {
 asm volatile(
"                STMFD   SP!, {R3-R9,LR} \n"
"                LDR     R7, =0xC0220000 \n"
"                LDR     R0, [R7,#0x8C] \n"
"                LDR     R4, =0x28BC \n"
"                TST     R0, #1 \n"
"                LDR     R0, [R4,#0x18] \n"
"                LDR     R5, =0x2710 \n"
"                SUB     R0, R0, #1 \n"
"                BEQ     loc_FF05A44C \n"
"                CMP     R0, #0 \n"
"                STR     R0, [R4,#0x18] \n"
"                LDMEQFD SP!, {R3-R9,LR} \n"
"                BEQ     sub_FF059BE0 \n"
"                B       loc_FF05A470 \n"
"loc_FF05A44C: \n"
"                LDR     R6, =0x28F0 \n"
"                LDR     R8, =0x7FFF \n"
"                MOV     R1, #3 \n"
"                CMP     R0, #2 \n"
"                STR     R1, [R4,#0x18] \n"
"                BCS     loc_FF05A47C \n"
"                LDRH    R0, [R6] \n"
"                CMP     R0, R8 \n"
"                BNE     loc_FF05A4DC \n"
"loc_FF05A470: \n"
"                MOV     R0, R5 \n"
"                LDMFD   SP!, {R3-R9,LR} \n"
"                B       sub_FF059A1C \n"
"loc_FF05A47C: \n"
"                LDR     R1, =0x28F0 \n"
"                MOV     R0, #0 \n"
"                BL      sub_FF059A7C \n"
"                MOV     R0, R5 \n"
"                BL      sub_FF059A1C \n"
"                LDR     R0, [R7,#0x8C] \n"
"                TST     R0, #1 \n"
"                BEQ     loc_FF05A4DC \n"
"                MOV     R3, #0 \n"
"                STR     R3, [SP] \n"
"                LDRH    R0, [R6,#2] \n"
"                LDR     R12, [R4,#0x1C] \n"
"                BIC     R1, R0, #0x8000 \n"
"                LDR     R0, =0x3FF \n"
"                EOR     R2, R0, R1,LSR#5 \n"
"                LDRH    R1, [R6] \n"
"                BIC     R1, R1, #0x8000 \n"
"                EOR     R1, R0, R1,LSR#5 \n"
"                MOV     R0, R3 \n"
"                BLX     R12 \n"
"                LDR     R0, [R4,#0x18] \n"
"                SUB     R0, R0, #1 \n"
"                STR     R0, [R4,#0x18] \n"
"                LDMFD   SP!, {R3-R9,PC} \n"
"loc_FF05A4DC: \n"
"                BL      sub_FF059C58_my \n"   // +++ process_TouchCoords
"                STRH    R8, [R6] \n"
"                LDMFD   SP!, {R3-R9,PC} \n"
 );
}

void __attribute__((naked,noinline)) sub_FF059C58_my() {
 asm volatile(
"                STMFD   SP!, {R4,R5,LR} \n"
"                BL      chdk_process_touch \n"
"                LDMFD   SP!, {R4,R5,LR} \n"
"                CMP     R0, #0 \n"
"                BXNE    LR \n"
"                B       sub_FF059C58 \n"   //process_TouchCoords
 );
}
