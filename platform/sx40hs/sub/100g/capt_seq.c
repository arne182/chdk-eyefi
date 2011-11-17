#include "lolevel.h"
#include "platform.h"
#include "core.h"

static long *nrflag = (long*)(0xC3F8+0x0);  // in sub_FF29E03C @ FF29E26C & FF29E2F4
#define NR_AUTO (0)							// have to explictly reset value back to 0 to enable auto

#include "../../../generic/capt_seq.c"

//void __attribute__((naked,noinline)) hangdebug() {
//	debug_led(1);
//	while(1);
//}

// @ FF07C46C in firmware
void __attribute__((naked,noinline)) capt_seq_task() {

asm volatile (

	"STMFD SP!, {R3-R7,LR}\n"
	"LDR	R4, =0x3F64C\n"
	"LDR	R7, =0x30DC\n"
	"MOV	R6, #0\n"

"loc_FF07C47C:\n"
	"LDR	R0, [R7,#4]\n"
	"MOV	R2, #0\n"
	"MOV	R1, SP\n"
	"BL		sub_FF02B0F4\n"
	"TST	R0, #1\n"
	"BEQ	loc_FF07C4A8\n"
	"LDR	R1, =0x491\n"
	"LDR	R0, =0xFF07BDB8\n"		//aSsshoottask_c
	"BL		_DebugAssert\n"
	"BL		_ExitTask\n"
	"LDMFD SP!, {R3-R7,PC}\n"

"loc_FF07C4A8:\n"
	"LDR	R0, [SP]\n"
	"LDR	R1, [R0]\n"
	"CMP	R1, #0x28\n"
	"ADDLS	PC, PC, R1,LSL#2\n"

	"B       loc_FF07C740\n"
	"B       loc_FF07C55C\n"
	"B       loc_FF07C574\n"
	"B       loc_FF07C580\n"
	"B       loc_FF07C5A0\n"
	"B       loc_FF07C598\n"
	"B       loc_FF07C5AC\n"
	"B       loc_FF07C5B4\n"
	"B       loc_FF07C5BC\n"
	"B       loc_FF07C5D8\n"
	"B       loc_FF07C618\n"
	"B       loc_FF07C5E4\n"
	"B       loc_FF07C5F0\n"
	"B       loc_FF07C5F8\n"
	"B       loc_FF07C600\n"
	"B       loc_FF07C608\n"
	"B       loc_FF07C610\n"
	"B       loc_FF07C620\n"
	"B       loc_FF07C628\n"
	"B       loc_FF07C630\n"
	"B       loc_FF07C638\n"
	"B       loc_FF07C640\n"
	"B       loc_FF07C648\n"
	"B       loc_FF07C650\n"
	"B       loc_FF07C658\n"
	"B       loc_FF07C660\n"
	"B       loc_FF07C668\n"
	"B       loc_FF07C674\n"
	"B       loc_FF07C67C\n"
	"B       loc_FF07C688\n"
	"B       loc_FF07C690\n"
	"B       loc_FF07C6C0\n"
	"B       loc_FF07C6C8\n"
	"B       loc_FF07C6D0\n"
	"B       loc_FF07C6D8\n"
	"B       loc_FF07C6E0\n"
	"B       loc_FF07C6E8\n"
	"B       loc_FF07C6F4\n"
	"B       loc_FF07C6FC\n"
	"B       loc_FF07C708\n"
	"B       loc_FF07C74C\n"

// jump table entry 0
"loc_FF07C55C:\n"

"		BL	shooting_expo_iso_override\n"  		    // added

"		BL	sub_FF07CD70 \n"

"		BL	shooting_expo_param_override\n"  		// added

"		BL	sub_FF0795B8 \n"

"		MOV     R0, #0\n"							// added
"		STR     R0, [R4,#0x28]\n"					// added, fixes overrides  behavior at short shutter press (from S95)

//"		LDR	R0, [R4,#0x28] \n"						// above two lines make this code redundant
//"		CMP	R0, #0 \n"								// above two lines make this code redundant

//"		BLNE	sub_FF1D57C0 \n"					// above two lines make this code redundant
//"		BLNE	sub_FF1D57C0_my \n"					// patched (above two lines make this patch redundant)

"		B	loc_FF07C74C \n"

// jump table entry 1
"loc_FF07C574: \n"

"       BL      wait_until_remote_button_is_released\n"	// +++
"       BL      capt_seq_hook_set_nr\n"           		// +++

"		LDR     R0, [R0,#0x10]\n"
"		BL      sub_FF07C894\n"

"       BL      capt_seq_hook_raw_here\n"           	// +++

"		B	loc_FF07C74C \n"

// jump table entry 2
"loc_FF07C580: \n"
"		MOV	R0, #1 \n"
"		BL	sub_FF07D0CC \n"
"		LDR	R0, [R4,#0xC]\n"
"		CMP	R0, #0\n"
"		BLNE	sub_FF07DF90 \n"
"		B	loc_FF07C74C \n"

// jump table entry 4
"loc_FF07C598: \n"
"		BL	sub_FF07C9DC \n"
"		B	loc_FF07C5A4 \n"

// jump table entry 3
"loc_FF07C5A0: \n"
"		BL	sub_FF07CD50 \n"
"loc_FF07C5A4: \n"
"		STR	R6, [R4,#0x28] \n"
"		B	loc_FF07C74C \n"

// jump table entry 5
"loc_FF07C5AC: \n"
"		BL	sub_FF07CD58 \n"
"		B	loc_FF07C74C \n"

// jump table entry 6
"loc_FF07C5B4: \n"
"		BL	sub_FF07CF74 \n"
"		B	loc_FF07C5DC \n"

// jump table entry 7
"loc_FF07C5BC: \n"
"		LDR	R5, [R0,#0x10] \n"
"       MOV R0, R5 \n"
"		BL	sub_FF1D5850 \n"
"       MOV R2, R5 \n"
"       MOV R1, #9 \n"
"		BL	sub_FF07A07C \n"
"		B	loc_FF07C74C \n"

// jump table entry 8
"loc_FF07C5D8: \n"
"		BL	sub_FF07D030 \n"
"loc_FF07C5DC: \n"
"		BL	sub_FF0795B8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 10
"loc_FF07C5E4: \n"
"		LDR	R0, [R4,#0x58] \n"
"		BL	sub_FF07D9EC \n"
"		B	loc_FF07C74C \n"

// jump table entry 11
"loc_FF07C5F0: \n"
"		BL	sub_FF07DCD8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 12
"loc_FF07C5F8: \n"
"		BL	sub_FF07DD3C \n"
"		B	loc_FF07C74C \n"

// jump table entry 13
"loc_FF07C600: \n"
"		BL	sub_FF07E080 \n"
"		B	loc_FF07C74C \n"

// jump table entry 14
"loc_FF07C608: \n"
"		BL	sub_FF07E4D0 \n"
"		B	loc_FF07C74C \n"

// jump table entry 15
"loc_FF07C610: \n"
"		BL	sub_FF07E580 \n"
"		B	loc_FF07C74C \n"

// jump table entry 9
"loc_FF07C618: \n"
"		BL	sub_FF07CD50 \n"
"		B	loc_FF07C74C \n"

// jump table entry 16
"loc_FF07C620: \n"
"		BL	sub_FF1D339C \n"
"		B	loc_FF07C74C \n"

// jump table entry 17
"loc_FF07C628: \n"
"		BL	sub_FF1D3688 \n"
"		B	loc_FF07C74C \n"

// jump table entry 18
"loc_FF07C630: \n"
"		BL	sub_FF1D373C \n"
"		B	loc_FF07C74C \n"

// jump table entry 19
"loc_FF07C638: \n"
"		BL	sub_FF1D3824 \n"
"		B	loc_FF07C74C \n"

// jump table entry 20
"loc_FF07C640: \n"
"		BL	sub_FF1D38F8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 21
"loc_FF07C648: \n"
"		MOV	R0, #0 \n"
"		B	loc_FF07C66C \n"

// jump table entry 22
"loc_FF07C650: \n"
"		BL	sub_FF1D3F14 \n"
"		B	loc_FF07C74C \n"

// jump table entry 23
"loc_FF07C658: \n"
"		BL	sub_FF1D3FA8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 24
"loc_FF07C660: \n"
"		BL	sub_FF1D4064 \n"
"		B	loc_FF07C74C \n"

// jump table entry 25
"loc_FF07C668: \n"
"		MOV	R0, #1 \n"
"loc_FF07C66C: \n"
"		BL	sub_FF1D3DA4 \n"
"		B	loc_FF07C74C \n"

// jump table entry 26
"loc_FF07C674: \n"
"		BL	sub_FF07D33C \n"
"		B	loc_FF07C74C \n"

// jump table entry 27
"loc_FF07C67C: \n"
"		BL	sub_FF07D3D0 \n"
"		BL	sub_FF1D6458 \n"
"		B	loc_FF07C74C \n"

// jump table entry 28
"loc_FF07C688: \n"
"		BL	sub_FF1D3BE4 \n"
"		B	loc_FF07C74C \n"

// jump table entry 29
"loc_FF07C690: \n"
"		MOV     R2, #2 \n"
"		ADD     R1, R4, #0x6C \n"
"		MOV     R0, #0x6F \n"
"		BL      _GetPropertyCase \n"
"		TST     R0, #1 \n"
"		LDRNE   R1, =0x592 \n"
"		LDRNE   R0, =0xFF07BDB8 \n"	//=aSsshoottask_c
"		BLNE    _DebugAssert \n"
"		LDRH    R0, [R4,#0x6C] \n"
"		CMP     R0, #1 \n"
"		BLEQ    sub_FF1D3BD8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 30
"loc_FF07C6C0: \n"
"		BL	sub_FF1D3D04 \n"
"		B	loc_FF07C74C \n"

// jump table entry 31
"loc_FF07C6C8: \n"
"		BL	sub_FF1D6524 \n"
"		B	loc_FF07C74C \n"

// jump table entry 32
"loc_FF07C6D0: \n"
"		BL	sub_FF028484 \n"
"		B	loc_FF07C74C \n"

// jump table entry 33
"loc_FF07C6D8: \n"
"		BL	sub_FF080D00 \n"
"		B	loc_FF07C74C \n"

// jump table entry 34
"loc_FF07C6E0: \n"
"		BL	sub_FF080D88 \n"
"		B	loc_FF07C74C \n"

// jump table entry 35
"loc_FF07C6E8: \n"
"       LDR R0, [R0,#0xC] \n"
"		BL	sub_FF1D418C \n"
"		B	loc_FF07C74C \n"

// jump table entry 36
"loc_FF07C6F4: \n"
"		BL	sub_FF1D41FC \n"
"		B	loc_FF07C74C \n"

// jump table entry 37
"loc_FF07C6FC: \n"
"		BL	sub_FF080DF0 \n"
"		BL	sub_FF080DA8 \n"
"		B	loc_FF07C74C \n"

// jump table entry 38
"loc_FF07C708: \n"
"		MOV	R0, #1 \n"
"		BL	sub_FF1D5F60 \n"
"		MOV	R0, #1 \n"
"		BL	sub_FF1D6094 \n"
"		LDRH	R0, [R4,#0xA8] \n"
"		CMP	R0, #4 \n"
"		LDRNEH	R0, [R4] \n"
"		SUBNE	R1, R0, #0x4200 \n"
"		SUBNES	R1, R1, #0x2B \n"
"		BNE	loc_FF07C74C \n"
"		BL	sub_FF080D88 \n"
"		BL	sub_FF081504 \n"
"		BL	sub_FF081218 \n"
"		B	loc_FF07C74C \n"

// jump table default entry
"loc_FF07C740: \n"
"		LDR	R1, =0x5F2 \n"
"		LDR	R0, =0xFF07BDB8 \n"				// "SsShootTask.c"
"		BL	_DebugAssert \n"

// jump table entry 39
"loc_FF07C74C: \n"
"		LDR	R0, [SP] \n"
"		LDR	R1, [R0,#4] \n"
"		LDR	R0, [R7] \n"
"		BL	sub_FF088B74 \n"
"		LDR	R5, [SP] \n"
"		LDR	R0, [R5,#8] \n"
"		CMP	R0, #0 \n"
"		LDREQ	R1, =0x117 \n"
"		LDREQ	R0, =0xFF07BDB8 \n"			// "SsShootTask.c"
"		BLEQ	_DebugAssert \n"
"		STR	R6, [R5,#8] \n"
"		B	loc_FF07C47C \n"
	);
}

/*************************************************************/
// @ 0xff0cc430
void __attribute__((naked,noinline)) exp_drv_task(){

 asm volatile(
"                STMFD   SP!, {R4-R9,LR} \n"
"                SUB     SP, SP, #0x24 \n"
"                LDR     R6, =0x4BF0 \n"
"                LDR     R7, =0xBB8 \n"
"                LDR     R4, =0x5CDA0 \n"
"                MOV     R0, #0 \n"
"                ADD     R5, SP, #0x14 \n"
"                STR     R0, [SP,#0x10] \n"

"loc_FF0CC450: \n"
"                LDR     R0, [R6,#0x20] \n"
"                MOV     R2, #0 \n"
"                ADD     R1, SP, #0x20 \n"
"                BL      sub_FF02B0F4 \n"
"                LDR     R0, [SP,#0x10] \n"
"                CMP     R0, #1 \n"
"                BNE     loc_FF0CC49C \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R0, [R0] \n"
"                CMP     R0, #0x14 \n"
"                CMPNE   R0, #0x15 \n"
"                CMPNE   R0, #0x16 \n"
"                CMPNE   R0, #0x17 \n"
"                BEQ     loc_FF0CC5FC \n"
"                CMP     R0, #0x29 \n"
"                BEQ     loc_FF0CC584 \n"
"                ADD     R1, SP, #0x10 \n"
"                MOV     R0, #0 \n"
"                BL      sub_FF0CC3E0 \n"

"loc_FF0CC49C: \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R1, [R0] \n"
"                CMP     R1, #0x2F \n"
"                BNE     loc_FF0CC4C8 \n"
"                BL      sub_FF0CD864 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R1, #1 \n"
"                BL      sub_FF088B74 \n"
"                BL      _ExitTask \n"
"                ADD     SP, SP, #0x24 \n"
"                LDMFD   SP!, {R4-R9,PC} \n"

"loc_FF0CC4C8: \n"
"                CMP     R1, #0x2E \n"
"                BNE     loc_FF0CC4E4 \n"
"                LDR     R2, [R0,#0x8C]! \n"
"                LDR     R1, [R0,#4] \n"
"                MOV     R0, R1 \n"
"                BLX     R2 \n"
"                B       loc_FF0CCA8C \n"

"loc_FF0CC4E4: \n"
"                CMP     R1, #0x27 \n"
"                BNE     loc_FF0CC534 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R1, #0x80 \n"
"                BL      sub_FF088BA8 \n"
"                LDR     R0, =0xFF0C7464 \n"
"                MOV     R1, #0x80 \n"
"                BL      sub_FF1BD7E0 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R2, R7 \n"
"                MOV     R1, #0x80 \n"
"                BL      sub_FF088AB4 \n"
"                TST     R0, #1 \n"
"                LDRNE   R1, =0x14FE \n"
"                BNE     loc_FF0CC5F0 \n"

"loc_FF0CC520: \n"
"                LDR     R1, [SP,#0x20] \n"
"                LDR     R0, [R1,#0x90] \n"
"                LDR     R1, [R1,#0x8C] \n"
"                BLX     R1 \n"
"                B       loc_FF0CCA8C \n"

"loc_FF0CC534: \n"
"                CMP     R1, #0x28 \n"
"                BNE     loc_FF0CC57C \n"
"                ADD     R1, SP, #0x10 \n"
"                BL      sub_FF0CC3E0 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R1, #0x100 \n"
"                BL      sub_FF088BA8 \n"
"                LDR     R0, =0xFF0C7474 \n"
"                MOV     R1, #0x100 \n"
"                BL      sub_FF1BE5C8 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R2, R7 \n"
"                MOV     R1, #0x100 \n"
"                BL      sub_FF088AB4 \n"
"                TST     R0, #1 \n"
"                BEQ     loc_FF0CC520 \n"
"                LDR     R1, =0x1508 \n"
"                B       loc_FF0CC5F0 \n"

"loc_FF0CC57C: \n"
"                CMP     R1, #0x29 \n"
"                BNE     loc_FF0CC594 \n"

"loc_FF0CC584: \n"
"                LDR     R0, [SP,#0x20] \n"
"                ADD     R1, SP, #0x10 \n"
"                BL      sub_FF0CC3E0 \n"
"                B       loc_FF0CC520 \n"

"loc_FF0CC594: \n"
"                CMP     R1, #0x2C \n"
"                BNE     loc_FF0CC5AC \n"
"                BL      sub_FF0B7960 \n"
"                BL      sub_FF0B864C \n"
"                BL      sub_FF0B81B0 \n"
"                B       loc_FF0CC520 \n"

"loc_FF0CC5AC: \n"
"                CMP     R1, #0x2D \n"
"                BNE     loc_FF0CC5FC \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R1, #4 \n"
"                BL      sub_FF088BA8 \n"
"                LDR     R1, =0xFF0C7494 \n"
"                LDR     R0, =0xFFFFF400 \n"
"                MOV     R2, #4 \n"
"                BL      sub_FF0B73B0 \n"
"                BL      sub_FF0B7640 \n"
"                LDR     R0, [R6,#0x1C] \n"
"                MOV     R2, R7 \n"
"                MOV     R1, #4 \n"
"                BL      sub_FF0889D0 \n"
"                TST     R0, #1 \n"
"                BEQ     loc_FF0CC520 \n"
"                LDR     R1, =0x1530 \n"

"loc_FF0CC5F0: \n"
"                LDR     R0, =0xFF0C7C24 \n"
"                BL      _DebugAssert \n"
"                B       loc_FF0CC520 \n"

"loc_FF0CC5FC: \n"
"                LDR     R0, [SP,#0x20] \n"
"                MOV     R8, #1 \n"
"                LDR     R1, [R0] \n"
"                CMP     R1, #0x12 \n"
"                CMPNE   R1, #0x13 \n"
"                BNE     loc_FF0CC664 \n"
"                LDR     R1, [R0,#0x7C] \n"
"                ADD     R1, R1, R1,LSL#1 \n"
"                ADD     R1, R0, R1,LSL#2 \n"
"                SUB     R1, R1, #8 \n"
"                LDMIA   R1, {R2,R3,R9} \n"
"                STMIA   R5, {R2,R3,R9} \n"
"                BL      sub_FF0CA65C \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R1, [R0,#0x7C] \n"
"                LDR     R3, [R0,#0x8C] \n"
"                LDR     R2, [R0,#0x90] \n"
"                ADD     R0, R0, #4 \n"
"                BLX     R3 \n"
"                LDR     R0, [SP,#0x20] \n"
"                BL      sub_FF0CDC70 \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R1, [R0,#0x7C] \n"
"                LDR     R2, [R0,#0x98] \n"
"                LDR     R3, [R0,#0x94] \n"
"                B       loc_FF0CC978 \n"

"loc_FF0CC664: \n"
"                CMP     R1, #0x14 \n"
"                CMPNE   R1, #0x15 \n"
"                CMPNE   R1, #0x16 \n"
"                CMPNE   R1, #0x17 \n"
"                BNE     loc_FF0CC71C \n"
"                ADD     R3, SP, #0x10 \n"
"                ADD     R2, SP, #0x04 \n"
"                ADD     R1, SP, #0x14 \n"
"                BL      sub_FF0CA8C4 \n"
"                CMP     R0, #1 \n"
"                MOV     R9, R0 \n"
"                CMPNE   R9, #5 \n"
"                BNE     loc_FF0CC6B8 \n"
"                LDR     R0, [SP,#0x20] \n"
"                MOV     R2, R9 \n"
"                LDR     R1, [R0,#0x7C]! \n"
"                LDR     R12, [R0,#0x10]! \n"
"                LDR     R3, [R0,#4] \n"
"                ADD     R0, SP, #0x04 \n"
"                BLX     R12 \n"
"                B       loc_FF0CC6F0 \n"

"loc_FF0CC6B8: \n"
"                LDR     R0, [SP,#0x20] \n"
"                CMP     R9, #2 \n"
"                LDR     R3, [R0,#0x90] \n"
"                CMPNE   R9, #6 \n"
"                BNE     loc_FF0CC704 \n"
"                LDR     R12, [R0,#0x8C] \n"
"                MOV     R2, R9 \n"
"                MOV     R1, #1 \n"
"                ADD     R0, SP, #0x04 \n"
"                BLX     R12 \n"
"                LDR     R0, [SP,#0x20] \n"
"                ADD     R2, SP, #0x04 \n"
"                ADD     R1, SP, #0x14 \n"
"                BL      sub_FF0CC12C \n"

"loc_FF0CC6F0: \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R2, [SP,#0x10] \n"
"                MOV     R1, R9 \n"
"                BL      sub_FF0CC380 \n"
"                B       loc_FF0CC980 \n"

"loc_FF0CC704: \n"
"                LDR     R1, [R0,#0x7C] \n"
"                LDR     R12, [R0,#0x8C] \n"
"                MOV     R2, R9 \n"
"                ADD     R0, R0, #4 \n"
"                BLX     R12 \n"
"                B       loc_FF0CC980 \n"

"loc_FF0CC71C: \n"
"                CMP     R1, #0x23 \n"
"                CMPNE   R1, #0x24 \n"
"                BNE     loc_FF0CC768 \n"
"                LDR     R1, [R0,#0x7C] \n"
"                ADD     R1, R1, R1,LSL#1 \n"
"                ADD     R1, R0, R1,LSL#2 \n"
"                SUB     R1, R1, #8 \n"
"                LDMIA   R1, {R2,R3,R9} \n"
"                STMIA   R5, {R2,R3,R9} \n"
"                BL      sub_FF0C93B4 \n"
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R1, [R0,#0x7C] \n"
"                LDR     R3, [R0,#0x8C] \n"
"                LDR     R2, [R0,#0x90] \n"
"                ADD     R0, R0, #4 \n"
"                BLX     R3 \n"
"                LDR     R0, [SP,#0x20] \n"
"                BL      sub_FF0C98A8 \n"
"                B       loc_FF0CC980 \n"

"loc_FF0CC768: \n"
"                ADD     R1, R0, #4 \n"
"                LDMIA   R1, {R2,R3,R9} \n"
"                STMIA   R5, {R2,R3,R9} \n"
"                LDR     R1, [R0] \n"
"                CMP     R1, #0x27 \n"
"                ADDCC   PC, PC, R1,LSL#2 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC820 \n"
" B       loc_FF0CC820 \n"
" B       loc_FF0CC828 \n"
" B       loc_FF0CC830 \n"
" B       loc_FF0CC830 \n"
" B       loc_FF0CC830 \n"
" B       loc_FF0CC820 \n"
" B       loc_FF0CC828 \n"
" B       loc_FF0CC830 \n"
" B       loc_FF0CC830 \n"
" B       loc_FF0CC848 \n"
" B       loc_FF0CC848 \n"
" B       loc_FF0CC954 \n"
" B       loc_FF0CC95C \n"
" B       loc_FF0CC95C \n"
" B       loc_FF0CC95C \n"
" B       loc_FF0CC95C \n"
" B       loc_FF0CC964 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC838 \n"
" B       loc_FF0CC840 \n"
" B       loc_FF0CC840 \n"
" B       loc_FF0CC854 \n"
" B       loc_FF0CC854 \n"
" B       loc_FF0CC85C \n"
" B       loc_FF0CC894 \n"
" B       loc_FF0CC8CC \n"
" B       loc_FF0CC904 \n"
" B       loc_FF0CC93C \n"
" B       loc_FF0CC93C \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC968 \n"
" B       loc_FF0CC944 \n"
" B       loc_FF0CC94C \n"

"loc_FF0CC820: \n"
//"; jumptable FF0CC77C entries 0,1,6
"                BL      sub_FF0C7A58 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC828: \n"
//"; jumptable FF0CC77C entries 2,7
"                BL      sub_FF0C7D50 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC830: \n"
//"; jumptable FF0CC77C entries 3-5,8,9
"                BL      sub_FF0C7FB8 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC838: \n"
//"; jumptable FF0CC77C entry 24
"                BL      sub_FF0C82AC \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC840: \n"
//"; jumptable FF0CC77C entries 25,26
"                BL      sub_FF0C84C4 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC848: \n"
//"; jumptable FF0CC77C entries 10,11
//"                BL      sub_FF0C8980 \n"
"                BL      sub_FF0C8980_my \n"  // patched
"                MOV     R8, #0 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC854: \n"
//"; jumptable FF0CC77C entries 27,28
"                BL      sub_FF0C8B64 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC85C: \n"
//"; jumptable FF0CC77C entry 29
"                LDRH    R1, [R0,#4] \n"
"                STRH    R1, [SP,#0x14] \n"
"                LDRH    R1, [R4,#2] \n"
"                STRH    R1, [SP,#0x16] \n"
"                LDRH    R1, [R4,#4] \n"
"                STRH    R1, [SP,#0x18] \n"
"                LDRH    R1, [R4,#6] \n"
"                STRH    R1, [SP,#0x1A] \n"
"                LDRH    R1, [R0,#0xC] \n"
"                STRH    R1, [SP,#0x1C] \n"
"                LDRH    R1, [R4,#0xA] \n"
"                STRH    R1, [SP,#0x1E] \n"
"                BL      sub_FF0CD8F8 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC894: \n"
//"; jumptable FF0CC77C entry 30
"                LDRH    R1, [R0,#4] \n"
"                STRH    R1, [SP,#0x14] \n"
"                LDRH    R1, [R4,#2] \n"
"                STRH    R1, [SP,#0x16] \n"
"                LDRH    R1, [R4,#4] \n"
"                STRH    R1, [SP,#0x18] \n"
"                LDRH    R1, [R4,#6] \n"
"                STRH    R1, [SP,#0x1A] \n"
"                LDRH    R1, [R4,#8] \n"
"                STRH    R1, [SP,#0x1C] \n"
"                LDRH    R1, [R4,#0xA] \n"
"                STRH    R1, [SP,#0x1E] \n"
"                BL      sub_FF0CDA70 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC8CC: \n"
//"; jumptable FF0CC77C entry 31
"                LDRH    R1, [R4] \n"
"                STRH    R1, [SP,#0x14] \n"
"                LDRH    R1, [R0,#6] \n"
"                STRH    R1, [SP,#0x16] \n"
"                LDRH    R1, [R4,#4] \n"
"                STRH    R1, [SP,#0x18] \n"
"                LDRH    R1, [R4,#6] \n"
"                STRH    R1, [SP,#0x1A] \n"
"                LDRH    R1, [R4,#8] \n"
"                STRH    R1, [SP,#0x1C] \n"
"                LDRH    R1, [R4,#0xA] \n"
"                STRH    R1, [SP,#0x1E] \n"
"                BL      sub_FF0CDB24 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC904: \n"
//"; jumptable FF0CC77C entry 32
"                LDRH    R1, [R4] \n"
"                STRH    R1, [SP,#0x14] \n"
"                LDRH    R1, [R4,#2] \n"
"                STRH    R1, [SP,#0x16] \n"
"                LDRH    R1, [R4,#4] \n"
"                STRH    R1, [SP,#0x18] \n"
"                LDRH    R1, [R4,#6] \n"
"                STRH    R1, [SP,#0x1A] \n"
"                LDRH    R1, [R0,#0xC] \n"
"                STRH    R1, [SP,#0x1C] \n"
"                LDRH    R1, [R4,#0xA] \n"
"                STRH    R1, [SP,#0x1E] \n"
"                BL      sub_FF0CDBCC \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC93C: \n"
//"; jumptable FF0CC77C entries 33,34
"                BL      sub_FF0C914C \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC944: \n"
//"; jumptable FF0CC77C entry 37
"                BL      sub_FF0C99AC \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC94C: \n"
//"; jumptable FF0CC77C entry 38
"                BL      sub_FF0C9F04 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC954: \n"
//"; jumptable FF0CC77C entry 12
"                BL      sub_FF0CA128 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC95C: \n"
//"; jumptable FF0CC77C entries 13-16
"                BL      sub_FF0CA2E4 \n"
"                B       loc_FF0CC968 \n"

"loc_FF0CC964: \n"
//"; jumptable FF0CC77C entry 17
"                BL      sub_FF0CA454 \n"

"loc_FF0CC968: \n"
//"; jumptable FF0CC77C default entry
//"; jumptable FF0CC77C entries 18-23,35,36
"                LDR     R0, [SP,#0x20] \n"
"                LDR     R1, [R0,#0x7C] \n"
"                LDR     R2, [R0,#0x90] \n"
"                LDR     R3, [R0,#0x8C] \n"

"loc_FF0CC978: \n"
"                ADD     R0, R0, #4 \n"
"                BLX     R3 \n"

"loc_FF0CC980: \n"
"                LDR     R1, [SP,#0x20] \n"
"                LDR     R0, [R1] \n"
"                CMP     R0, #0x10 \n"
"                BEQ     loc_FF0CC9B8 \n"
"                BGT     loc_FF0CC9A8 \n"
"                CMP     R0, #1 \n"
"                CMPNE   R0, #4 \n"
"                CMPNE   R0, #0xE \n"
"                BNE     loc_FF0CC9C8 \n"
"                B       loc_FF0CC9B8 \n"

"loc_FF0CC9A8: \n"
"                CMP     R0, #0x13 \n"
"                CMPNE   R0, #0x17 \n"
"                CMPNE   R0, #0x1A \n"
"                BNE     loc_FF0CC9C8 \n"

"loc_FF0CC9B8: \n"
"                LDRH    R0, [R4] \n"
"                STRH    R0, [SP,#0x14] \n"
"                LDRH    R0, [R4,#8] \n"
"                STRH    R0, [SP,#0x1C] \n"

"loc_FF0CC9C8: \n"
"                CMP     R8, #1 \n"
"                BNE     loc_FF0CCA14 \n"
"                LDR     R0, [R1,#0x7C] \n"
"                MOV     R2, #0xC \n"
"                ADD     R0, R0, R0,LSL#1 \n"
"                ADD     R0, R1, R0,LSL#2 \n"
"                SUB     R8, R0, #8 \n"
"                LDR     R0, =0x5CDA0 \n"
"                ADD     R1, SP, #0x14 \n"
"                BL      sub_FF42FA90 \n"
"                LDR     R0, =0x5CDAC \n"
"                MOV     R2, #0xC \n"
"                ADD     R1, SP, #0x14 \n"
"                BL      sub_FF42FA90 \n"
"                LDR     R0, =0x5CDB8 \n"
"                MOV     R2, #0xC \n"
"                MOV     R1, R8 \n"
"                BL      sub_FF42FA90 \n"
"                B       loc_FF0CCA8C \n"

"loc_FF0CCA14: \n"
"                LDR     R0, [R1] \n"
"                MOV     R3, #1 \n"
"                CMP     R0, #0xB \n"
"                BNE     loc_FF0CCA58 \n"
"                MOV     R2, #0 \n"
"                STRD    R2, [SP] \n"
"                MOV     R2, R3 \n"
"                MOV     R1, R3 \n"
"                MOV     R0, #0 \n"
"                BL      sub_FF0C782C \n"
"                MOV     R3, #1 \n"
"                MOV     R2, #0 \n"
"                STRD    R2, [SP] \n"
"                MOV     R2, R3 \n"
"                MOV     R1, R3 \n"
"                MOV     R0, #0 \n"
"                B       loc_FF0CCA88 \n"

"loc_FF0CCA58: \n"
"                MOV     R2, #1 \n"
"                STRD    R2, [SP] \n"
"                MOV     R3, R2 \n"
"                MOV     R1, R2 \n"
"                MOV     R0, R2 \n"
"                BL      sub_FF0C782C \n"
"                MOV     R3, #1 \n"
"                MOV     R2, R3 \n"
"                MOV     R1, R3 \n"
"                MOV     R0, R3 \n"
"                STR     R3, [SP] \n"
"                STR     R3, [SP,#0x04] \n"

"loc_FF0CCA88: \n"
"                BL      sub_FF0C79A4 \n"

"loc_FF0CCA8C: \n"
"                LDR     R0, [SP,#0x20] \n"
"                BL      sub_FF0CD864 \n"
"                B       loc_FF0CC450 \n"
 );
}

void __attribute__((naked,noinline)) sub_FF0C8980_my() {
	asm volatile (
"                STMFD   SP!, {R4-R8,LR} \n"
"                LDR     R7, =0x4BF0 \n"
"                MOV     R4, R0 \n"
"                LDR     R0, [R7,#0x1C] \n"
"                MOV     R1, #0x3E \n"
"                BL      sub_FF088BA8 \n"
"                MOV     R2, #0 \n"
"                LDRSH   R0, [R4,#4] \n"
"                MOV     R1, R2 \n"
"                BL      sub_FF0C74F4 \n"
"                MOV     R5, R0 \n"
"                LDRSH   R0, [R4,#6] \n"
"                BL      sub_FF0C7644 \n"
"                LDRSH   R0, [R4,#8] \n"
"                BL      sub_FF0C769C \n"
"                LDRSH   R0, [R4,#0xA] \n"
"                BL      sub_FF0C76F4 \n"
"                LDRSH   R0, [R4,#0xC] \n"
"                MOV     R1, #0 \n"
"                BL      sub_FF0C774C \n"
"                MOV     R6, R0 \n"
"                LDRSH   R0, [R4,#0xE] \n"
"                BL      sub_FF0CD894 \n"
"                LDR     R0, [R4] \n"
"                LDR     R8, =0x5CDB8 \n"
"                CMP     R0, #0xB \n"
"                MOVEQ   R5, #0 \n"
"                MOVEQ   R6, R5 \n"
"                BEQ     loc_FF0C8A1C \n"
"                CMP     R5, #1 \n"
"                BNE     loc_FF0C8A1C \n"
"                LDRSH   R0, [R4,#4] \n"
"                LDR     R1, =0xFF0C7454 \n"
"                MOV     R2, #2 \n"
"                BL      sub_FF1BDB34 \n"
"                STRH    R0, [R4,#4] \n"
"                MOV     R0, #0 \n"
"                STR     R0, [R7,#0x28] \n"
"                B       loc_FF0C8A24 \n"

"loc_FF0C8A1C: \n"
"                LDRH    R0, [R8] \n"
"                STRH    R0, [R4,#4] \n"

"loc_FF0C8A24: \n"
"                CMP     R6, #1 \n"
"                LDRNEH  R0, [R8,#8] \n"
"                BNE     loc_FF0C8A40 \n"
"                LDRSH   R0, [R4,#0xC] \n"
"                LDR     R1, =0xFF0C74D8 \n"
"                MOV     R2, #0x20 \n"
"                BL      sub_FF0CD8B4 \n"

"loc_FF0C8A40: \n"
"                STRH    R0, [R4,#0xC] \n"
"                LDRSH   R0, [R4,#6] \n"
//"                BL      sub_FF0B76AC \n"
"                BL      sub_FF0B76AC_my \n" // patched
"				 B	     sub_FF0C8A4C \n"	 // continue in firmware
	);
}

void __attribute__((naked,noinline)) sub_FF0B76AC_my() {
	asm volatile (
"                STMFD   SP!, {R4-R6,LR} \n"
"                LDR     R5, =0x4898 \n"
"                MOV     R4, R0 \n"
"                LDR     R0, [R5,#4] \n"
"                CMP     R0, #1 \n"
"                LDRNE   R1, =0x14D \n"
"                LDRNE   R0, =0xFF0B74E4 \n"	//  ; "Shutter.c"
"                BLNE    _DebugAssert \n"
"                CMN     R4, #0xC00 \n"
"                LDREQSH R4, [R5,#2] \n"
"                CMN     R4, #0xC00 \n"
"                LDREQ   R1, =0x153 \n"
"                LDRNE   R0, =0xFF0B74E4 \n"	//  ; "Shutter.c"
"                STRH    R4, [R5,#2] \n"
"                BLEQ    _DebugAssert \n"
"                MOV     R0, R4 \n"
"                BL      apex2us \n"		// patched
"				 B	     sub_FF0B76F0 \n"	// continue in firmware
);
}
