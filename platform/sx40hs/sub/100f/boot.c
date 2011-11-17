#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "dryos31.h"

#define offsetof(TYPE, MEMBER) ((int) &((TYPE *)0)->MEMBER)

void CreateTask_spytask();
extern volatile int jogdial_stopped;
void JogDial_task_my(void);
const char * const new_sa = &_end;
extern void task_CaptSeq();
extern void task_InitFileModules();
extern void task_RotaryEncoder();
extern void task_MovieRecord();
extern void task_ExpDrv();

void taskHook(context_t **context) { 

	task_t *tcb=(task_t*)((char*)context-offsetof(task_t, context));

	if(tcb->entry == (void*)task_CaptSeq)			tcb->entry = (void*)capt_seq_task;
	if(tcb->entry == (void*)task_InitFileModules)	tcb->entry = (void*)init_file_modules_task;
	if(tcb->entry == (void*)task_RotaryEncoder)		tcb->entry = (void*)JogDial_task_my;
	if(tcb->entry == (void*)task_MovieRecord)		tcb->entry = (void*)movie_record_task;
	if(tcb->entry == (void*)task_ExpDrv)			tcb->entry = (void*)exp_drv_task;
}

#define LED_PR 0xC022C30C   // SX40HS @ 0xFF15B1F0
void __attribute__((noreturn)) blink(int cnt)
{
	volatile long *p=(void*)LED_PR;
	int i;

	for(;cnt>0;cnt--){
		p[0]=p[0]&(0xCF);

		for(i=0;i<0x200000;i++){
			asm ("nop\n");
			asm ("nop\n");
		}
		p[0]=(p[0]&(0xCF))|0x20;
		for(i=0;i<0x200000;i++){
			asm ("nop\n");
			asm ("nop\n");
		}
	}

}
void __attribute__((naked,noinline)) boot() {

    asm volatile (
"loc_FF00000C:\n"
        "LDR     R1, =0xC0410000\n"
        "MOV     R0, #0\n"
        "STR     R0, [R1]\n"
        "MOV     R1, #0x78\n"
        "MCR     p15, 0, R1,c1,c0\n"
        "MOV     R1, #0\n"
        "MCR     p15, 0, R1,c7,c10, 4\n"
        "MCR     p15, 0, R1,c7,c5\n"
"loc_FF00002C:\n"
        "MCR     p15, 0, R1,c7,c6\n"
        "MOV     R0, #0x3D\n"
        "MCR     p15, 0, R0,c6,c0\n"
        "MOV     R0, #0xC000002F\n"
        "MCR     p15, 0, R0,c6,c1\n"
        "MOV     R0, #0x37\n"
        "MCR     p15, 0, R0,c6,c2\n"
        "MOV     R0, #0x40000037\n"
        "MCR     p15, 0, R0,c6,c3\n"
        "MOV     R0, #0x80000017\n"
        "MCR     p15, 0, R0,c6,c4\n"
        //"LDR     R0, =(loc_FF00002C+3)\n"
		"LDR     R0, =0xFF00002F\n"
        "MCR     p15, 0, R0,c6,c5\n"
        "LDR     R0, =0xD000002B\n"
        "MCR     p15, 0, R0,c6,c7\n"
        "MOV     R0, #0x34\n"
        "MCR     p15, 0, R0,c2,c0\n"
        "MOV     R0, #0x34\n"
        "MCR     p15, 0, R0,c2,c0, 1\n"
        "MOV     R0, #0x34\n"
        "MCR     p15, 0, R0,c3,c0\n"
        "LDR     R0, =0x33333330\n"
        "MCR     p15, 0, R0,c5,c0, 2\n"
        "LDR     R0, =0x33333330\n"
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
        "LDR     R0, =0xFF62743C\n"
        "LDR     R1, =0x1900\n"
        "LDR     R3, =0x13718\n"
"loc_FF000144:\n"
        "CMP     R1, R3\n"
        "LDRCC   R2, [R0],#4\n"
        "STRCC   R2, [R1],#4\n"
        "BCC     loc_FF000144\n"
        "LDR     R1, =0x198C30\n"
        "MOV     R2, #0\n"
"loc_FF00015C:\n"
        "CMP     R3, R1\n"
        "STRCC   R2, [R3],#4\n"
        "BCC     loc_FF00015C\n"
        "B       sub_FF000364_my\n"
		//"B       sub_FF000364\n"
	 );
}

void __attribute__((naked,noinline)) sub_FF000364_my() { 

   *(int*)0x1938=(int)taskHook;
   *(int*)0x193C=(int)taskHook;


 if ( (*(int*)0xC022F48C & 0x800000) )
		*(int*)(0x2628+0x8) = 0x200000;  // Playmode "PhySwConfig.c" SX40 FF0571D4
	else
		*(int*)(0x2628+0x8) = 0x100000; // Shootingmode

   asm volatile (
"loc_FF000364:\n"
        "LDR     R0, =0xFF0003DC\n"
        "MOV     R1, #0\n"
        "LDR     R3, =0xFF000414\n"
"loc_FF000370:\n"
        "CMP     R0, R3\n"
        "LDRCC   R2, [R0],#4\n"
        "STRCC   R2, [R1],#4\n"
        "BCC     loc_FF000370\n"
        "LDR     R0, =0xFF000414\n"
        "MOV     R1, #0x4B0\n"
        "LDR     R3, =0xFF000628\n"
"loc_FF00038C:\n"
        "CMP     R0, R3\n"
        "LDRCC   R2, [R0],#4\n"
        "STRCC   R2, [R1],#4\n"
        "BCC     loc_FF00038C\n"
        "MOV     R0, #0xD2\n"
        "MSR     CPSR_cxsf, R0\n"
        "MOV     SP, #0x1000\n"
        "MOV     R0, #0xD3\n"
        "MSR     CPSR_cxsf, R0\n"
        "MOV     SP, #0x1000\n"
        "LDR     R0, loc_FF0003D0\n"
        "LDR     R2, =0xEEEEEEEE\n"
        "MOV     R3, #0x1000\n"
"loc_FF0003C0:\n"
        "CMP     R0, R3\n"
        "STRCC   R2, [R0],#4\n"
        "BCC     loc_FF0003C0\n"
        //"BL      sub_FF0011BC\n"
		"BL      sub_FF0011BC_my\n"
"loc_FF0003D0:\n"
        "ANDEQ   R0, R0, R4,ASR#13\n"
"loc_FF0003D4:\n"
        "ANDEQ   R0, R0, R0,ROR R6\n"
"loc_FF0003D8:\n"
        "ANDEQ   R0, R0, R4,ROR R6\n"
        "NOP\n"
        "LDR     PC, =0xFF000628\n"
	);
}

void __attribute__((naked,noinline)) sub_FF0011BC_my() {

	asm volatile (
         "STR     LR, [SP,#-4]!\n"
        "SUB     SP, SP, #0x74\n"
        "MOV     R1, #0x74\n"
        "MOV     R0, SP\n"
        "BL      sub_FF42FD60\n"
        "MOV     R0, #0x67000\n"
        "STR     R0, [SP,#4]\n"
#if defined(OPT_CHDK_IN_EXMEM)
        "LDR     R0, =0x198C30\n"
#else	
		"LDR     R0, =new_sa\n"	
		"LDR	  R0, [R0]\n"	
#endif		
        "LDR     R2, =0x55D788\n"
        "STR     R0, [SP,#8]\n"
        "SUB     R0, R2, R0\n"
        "STR     R0, [SP,#0xC]\n"
        "MOV     R0, #0x22\n"
        "STR     R0, [SP,#0x18]\n"
        "MOV     R0, #0x72\n"
        "STR     R0, [SP,#0x1C]\n"
        "LDR     R1, =0x565C00\n"
        "LDR     R0, =0x1CD\n"
        "STR     R1, [SP]\n"
        "STR     R0, [SP,#0x20]\n"
        "MOV     R0, #0x96\n"
        "STR     R2, [SP,#0x10]\n"
        "STR     R1, [SP,#0x14]\n"
        "STR     R0, [SP,#0x24]\n"
        "STR     R0, [SP,#0x28]\n"
        "MOV     R0, #0x64\n"
        "STR     R0, [SP,#0x2C]\n"
        "MOV     R0, #0\n"
        "STR     R0, [SP,#0x30]\n"
        "STR     R0, [SP,#0x34]\n"
        "MOV     R0, #0x10\n"
        "STR     R0, [SP,#0x5C]\n"
        "MOV     R0, #0x800\n"
        "STR     R0, [SP,#0x60]\n"
        "MOV     R0, #0xA0\n"
        "STR     R0, [SP,#0x64]\n"
        "MOV     R0, #0x280\n"
        "STR     R0, [SP,#0x68]\n"
        //"LDR     R1, =sub_FF005F38\n"
		"LDR     R1, =sub_FF005F38_my\n"
        "MOV     R2, #0\n"
        "MOV     R0, SP\n"
        "BL      sub_FF0034D0\n"
        "ADD     SP, SP, #0x74\n"
        "LDR     PC, [SP],#4\n"
	 );
}

void __attribute__((naked,noinline)) sub_FF005F38_my() {
     
	 asm volatile (
        "STMFD   SP!, {R4,LR}\n"
        "BL      sub_FF000B34\n"
        "BL      sub_FF00A390\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF00604C\n"
        "BLLT    sub_FF00602C\n"
        "BL      sub_FF005B70\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF006054\n"
        "BLLT    sub_FF00602C\n"
        "LDR     R0, =0xFF006064\n"
        "BL      sub_FF005C58\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF00606C\n"
        "BLLT    sub_FF00602C\n"
        "LDR     R0, =0xFF006064\n"
        "BL      sub_FF003CB4\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF006080\n"
        "BLLT    sub_FF00602C\n"
        "BL      sub_FF009CF8\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF00608C\n"
        "BLLT    sub_FF00602C\n"
        "BL      sub_FF00169C\n"
        "CMP     R0, #0\n"
        "LDRLT   R0, =0xFF006098\n"
        "BLLT    sub_FF00602C\n"
        "LDMFD   SP!, {R4,LR}\n"
        //"B       sub_FF00FDA4\n"
		"B       sub_FF00FDA4_my\n"
	);
};

void __attribute__((naked,noinline)) sub_FF00FDA4_my() {
	asm volatile (
"sub_FF00FDA4:\n"
        "STMFD   SP!, {R4,LR}\n"
        "BL      sub_FF024B10\n"
        "BL      sub_FF00FDB8_my\n"
        "MOV     R0, #0\n"
        "LDMFD   SP!, {R4,PC}\n"
	);
}
void __attribute__((naked,noinline)) sub_FF00FDB8_my() {

	asm volatile (
        "STMFD   SP!, {R3-R7,LR}\n"
        "MOV     R6, #0\n"
        "BL      sub_FF02D794\n"
        "MOVS    R7, R0\n"
        "BNE     loc_FF00FE3C\n"
        "BL      sub_FF0264E4\n"
        "CMP     R0, #0\n"
        "BEQ     loc_FF00FE3C\n"
        "MOV     R0, #0x4C\n"
        "BL      sub_FF02BD3C\n"
        "RSBS    R5, R0, #1\n"
        "MOVCC   R5, #0\n"
        "MOV     R0, #0x4B\n"
        "BL      sub_FF02BD3C\n"
        "RSBS    R4, R0, #1\n"
        "MOVCC   R4, #0\n"
        "BL      sub_FF022B9C\n"
        "CMP     R0, #1\n"
        "MOVEQ   R6, #1\n"
        "ORR     R0, R4, R5\n"
        "ORRS    R0, R0, R6\n"
        "BNE     loc_FF00FE5C\n"
        "BL      sub_FF0235C8\n"
        "LDR     R4, =0x83DC00\n"
        "MOV     R0, #0x45\n"
        "MOV     R1, R4\n"
        "BL      sub_FF02BD2C\n"
        "MOV     R0, #0x28\n"
        "BL      sub_FF02B88C\n"
        "MOV     R1, R4\n"
        "MOV     R0, #0x54\n"
        "BL      sub_FF02BD2C\n"
"loc_FF00FE38:\n"
        "B       loc_FF00FE38\n"
"loc_FF00FE3C:\n"
        "MOV     R0, #0x4B\n"
        "BL      sub_FF02BD3C\n"
        "RSBS    R4, R0, #1\n"
        "MOVCC   R4, #0\n"
        "MOV     R0, #0x4C\n"
        "BL      sub_FF02BD3C\n"
        "RSBS    R5, R0, #1\n"
        "MOVCC   R5, #0\n"
"loc_FF00FE5C:\n"
        "MOV     R3, R6\n"
        "MOV     R2, R7\n"
        "MOV     R1, R5\n"
        "MOV     R0, R4\n"
        //"BL      sub_FF024B18\n" // StartUp mode detection
        "BL      sub_FF024B14\n"
        "BL      sub_FF02B6BC\n"
        "LDR     R1, =0x5CE000\n"
        "MOV     R0, #0\n"
        "BL      sub_FF02BB2C\n"
        "BL      sub_FF02B8D4\n"
        "MOV     R3, #0\n"
        "STR     R3, [SP]\n"
        "LDR     R3, =task_Startup_my\n"
		//"LDR     R3, =sub_FF00FD34\n"
        "MOV     R2, #0\n"
        "MOV     R1, #0x19\n"
        "LDR     R0, =0xFF00FEB8\n"
        "BL      sub_FF00EAF0\n"
        "MOV     R0, #0\n"
        "LDMFD   SP!, {R3-R7,PC}\n"
	 );
}

void __attribute__((naked,noinline)) task_Startup_my() {

   asm volatile (
        "STMFD   SP!, {R4,LR}\n"
        "BL      sub_FF0065E8\n"
        "BL      sub_FF025C28\n"
        "BL      sub_FF023110\n"
        "BL      sub_FF0234FC\n"
        "BL      sub_FF02D7DC\n"
        "BL      sub_FF02D9C8\n"
        "BL      sub_FF023CE4\n"
        "BL      sub_FF022BAC\n"
        "MOV     R0, #1\n"
        "BL      sub_FF022F7C\n"
        //"BL      sub_FF02D870\n" // disable diskboot.bin
        "BL      sub_FF02DB8C\n"
        "BL      sub_FF02D9F8\n"
        "BL      sub_FF02AE60\n"
        "BL      sub_FF02DB90\n"
		"BL      CreateTask_spytask\n" 
		"BL	  	 taskcreatePhySw_my\n"		
        //"BL      sub_FF024998\n" // PhysSw
        "BL      sub_FF028550\n"
        "BL      sub_FF02DBA8\n"
        "BL      sub_FF0217A4\n"
        "BL      sub_FF0224F4\n"
        "BL      sub_FF02D550\n"
        "BL      sub_FF022B4C\n"
        "BL      sub_FF022490\n"
        "BL      sub_FF02E7FC\n"
        "BL      sub_FF022454\n"
        "LDMFD   SP!, {R4,LR}\n"
        "B       sub_FF006708\n"
	);
}

void __attribute__((naked,noinline)) taskcreatePhySw_my() {
	
	asm volatile (
        "STMFD   SP!, {R3-R5,LR}\n"
        "LDR     R4, =0x1C10\n"
        "LDR     R0, [R4,#4]\n"
        "CMP     R0, #0\n"
        "BNE     sub_FF0249CC\n"
        "MOV     R3, #0\n"
        "STR     R3, [SP]\n"
        "LDR     R3, =mykbd_task\n"
		//"LDR     R3, =0xFF024964\n"
        //"MOV   R2, #0x800\n"
	    "MOV     R2, #0x2000\n"   		// stack size for new task_PhySw so we don't have to do stack switch

	    "B			sub_FF0249BC"
	 );
}


void spytask(long ua, long ub, long uc, long ud, long ue, long uf) {
    
	core_spytask();
}

void CreateTask_spytask() {

        _CreateTask("SpyTask", 0x19, 0x2000, core_spytask, 0);
};

void __attribute__((naked,noinline)) init_file_modules_task() {
	
	 asm volatile(
        "STMFD   SP!, {R4-R6,LR}\n"
        "BL      sub_FF0918E8\n"
        "LDR     R5, =0x5006\n"
        "MOVS    R4, R0\n"
        "MOVNE   R1, #0\n"
        "MOVNE   R0, R5\n"
        "BLNE    sub_FF095BE4\n"
        "BL      sub_FF091914\n"
		"BL		 core_spytask_can_start\n"
        "CMP     R4, #0\n"
        "LDMNEFD SP!, {R4-R6,PC}\n"
        "MOV     R0, R5\n"
        "LDMFD   SP!, {R4-R6,LR}\n"
        "MOV     R1, #0\n"
        "B       sub_FF095BE4\n"
 );
}

short *jog_position;
void __attribute__((naked,noinline)) JogDial_task_my() {
 
 asm volatile(
        "STMFD   SP!, {R4-R11,LR}\n"
        "SUB     SP, SP, #0x1C\n"
        "BL      sub_FF0582F8\n"
        "LDR     R12, =0x264C\n"
        "LDR     R6, =0xFF434CC4\n"
        "MOV     R0, #0\n"
        "ADD     R10, SP, #8\n"
        "ADD     R9, SP, #0xC\n"
		
				 // Save pointer for kbd.c routine
				 "LDR R2, =jog_position \n"
				 "STR R9, [R2] \n"     
				 
"loc_FF057F84:\n"
        "ADD     R2, SP, #0x14\n"
        "MOV     R1, #0\n"
        "ADD     R4, R2, R0,LSL#1\n"
        "ADD     R3, SP, #0x10\n"
        "STRH    R1, [R4]\n"
        "ADD     R4, R3, R0,LSL#1\n"
        "STRH    R1, [R4]\n"
        "STR     R1, [R9,R0,LSL#2]\n"
        "STR     R1, [R10,R0,LSL#2]\n"
        "ADD     R0, R0, #1\n"
        "CMP     R0, #1\n"
        "BLT     loc_FF057F84\n"
"loc_FF057FB4:\n"
        "LDR     R0, =0x264C\n"
        "MOV     R2, #0\n"
        "LDR     R0, [R0,#8]\n"
        "MOV     R1, SP\n"
        "BL      sub_FF02B0F4\n"
        "CMP     R0, #0\n"
        "LDRNE   R1, =0x256\n"
        "LDRNE   R0, =0xFF058214\n"
        "BLNE    sub_FF00EDC8\n"
        "LDR     R0, [SP]\n"
        "AND     R4, R0, #0xFF\n"
        "AND     R0, R0, #0xFF00\n"
        "CMP     R0, #0x100\n"
        "BEQ     loc_FF058024\n"
        "CMP     R0, #0x200\n"
        "BEQ     loc_FF05805C\n"
        "CMP     R0, #0x300\n"
        "BEQ     loc_FF05825C\n"
        "CMP     R0, #0x400\n"
        "BNE     loc_FF057FB4\n"
        "CMP     R4, #0\n"
        "LDRNE   R1, =0x2E1\n"
        "LDRNE   R0, =0xFF058214\n"
        "BLNE    sub_FF00EDC8\n"
        "RSB     R0, R4, R4,LSL#3\n"
        "LDR     R0, [R6,R0,LSL#2]\n"
"loc_FF05801C:\n"
        "BL      sub_FF0582DC\n"
        "B       loc_FF057FB4\n"
"loc_FF058024:\n"


"labelA:\n"
                 "LDR     R0, =jogdial_stopped\n"
                 "LDR     R0, [R0]\n"
                 "CMP     R0, #1\n"
                 "BNE     labelB\n"
                 "MOV     R0, #40\n"
                 "BL      sub_FF02B88C\n" // SleepTask
                 "B       labelA\n"
 "labelB:\n"

		"LDR     R0, =0x2658\n"
        "LDR     R0, [R0,R4,LSL#2]\n"
        "BL      sub_FF02C318\n"
        "LDR     R2, =0xFF057EB0\n"
        "ORR     R3, R4, #0x200\n"
        "MOV     R1, R2\n"
        "MOV     R0, #0x28\n"
        "BL      sub_FF02C234\n"
        "TST     R0, #1\n"
        "CMPNE   R0, #0x15\n"
        "STR     R0, [R10,R4,LSL#2]\n"
        "BEQ     loc_FF057FB4\n"
        "MOV     R1, #0x268\n"
        "B       loc_FF058200\n"
"loc_FF05805C:\n"
        "RSB     R5, R4, R4,LSL#3\n"
        "LDR     R0, [R6,R5,LSL#2]\n"
        "LDR     R1, =0xC0240000\n"
        "ADD     R0, R1, R0,LSL#8\n"
        "LDR     R0, [R0,#0x104]\n"
        "MOV     R1, R0,ASR#16\n"
        "ADD     R0, SP, #0x14\n"
        "ADD     R11, R0, R4,LSL#1\n"
        "ADD     R0, SP, #0x10\n"
        "ADD     R0, R0, R4,LSL#1\n"
        "STRH    R1, [R11]\n"
        "STR     R0, [SP,#0x18]\n"
        "LDRSH   R3, [R0]\n"
        "SUB     R2, R1, R3\n"
        "CMP     R2, #0\n"
        "BNE     loc_FF0580E0\n"
        "LDR     R0, [R9,R4,LSL#2]\n"
        "CMP     R0, #0\n"
        "BEQ     loc_FF0581BC\n"
        "LDR     R7, =0x2658\n"
        "LDR     R0, [R7,R4,LSL#2]\n"
        "BL      sub_FF02C318\n"
        "LDR     R2, =sub_FF057EBC\n"
        "ORR     R3, R4, #0x300\n"
        "MOV     R1, R2\n"
        "MOV     R0, #0x1F4\n"
        "BL      sub_FF02C234\n"
        "TST     R0, #1\n"
        "CMPNE   R0, #0x15\n"
        "STR     R0, [R7,R4,LSL#2]\n"
        "BEQ     loc_FF0581BC\n"
        "LDR     R1, =0x281\n"
        "B       loc_FF0581B4\n"
"loc_FF0580E0:\n"
        "MOV     R0, R2\n"
        "RSBLT   R0, R0, #0\n"
        "MOVLE   R7, #0\n"
        "MOVGT   R7, #1\n"
        "CMP     R0, #0xFF\n"
        "BLS     loc_FF05811C\n"
        "LDR     R0, =0x7FFF\n"
        "CMP     R2, #0\n"
        "SUBLE   R0, R0, R3\n"
        "ADDLE   R0, R0, R1\n"
        "SUBGT   R0, R0, R1\n"
        "ADDGT   R0, R0, R3\n"
        "MOV     R1, #0xFFFF7FFF\n"
		//"MVN     R1, #0x8000\n"
        "SUB     R0, R0, R1\n"
        "EOR     R7, R7, #1\n"
"loc_FF05811C:\n"
        "STR     R0, [SP,#4]\n"
        "LDR     R0, [R9,R4,LSL#2]\n"
        "CMP     R0, #0\n"
        "ADDEQ   R0, R6, R5,LSL#2\n"
        "LDREQ   R0, [R0,#8]\n"
        "BEQ     loc_FF058154\n"
        "ADD     R8, R6, R5,LSL#2\n"
        "ADD     R1, R8, R7,LSL#2\n"
        "LDR     R1, [R1,#0x10]\n"
        "CMP     R1, R0\n"
        "BEQ     loc_FF058158\n"
        "LDR     R0, [R8,#0xC]\n"
        "BL      sub_FF0249F0\n"
        "LDR     R0, [R8,#8]\n"
"loc_FF058154:\n"
        "BL      sub_FF0249F0\n"
"loc_FF058158:\n"
        "ADD     R0, R6, R5,LSL#2\n"
        "ADD     R7, R0, R7,LSL#2\n"
        "LDR     R0, [R7,#0x10]\n"
        "LDR     R1, [SP,#4]\n"
        "BL      sub_FF024A00\n"
        "LDR     R0, [R7,#0x10]\n"
        "LDR     R7, =0x2658\n"
        "STR     R0, [R9,R4,LSL#2]\n"
        "LDRH    R1, [R11]\n"
        "LDR     R0, [SP,#0x18]\n"
        "STRH    R1, [R0]\n"
        "LDR     R0, [R7,R4,LSL#2]\n"
        "BL      sub_FF02C318\n"
        "LDR     R2, =sub_FF057EBC\n"
        "ORR     R3, R4, #0x300\n"
        "MOV     R1, R2\n"
        "MOV     R0, #0x1F4\n"
        "BL      sub_FF02C234\n"
        "TST     R0, #1\n"
        "CMPNE   R0, #0x15\n"
        "STR     R0, [R7,R4,LSL#2]\n"
        "BEQ     loc_FF0581BC\n"
        "LDR     R1, =0x2C3\n"
"loc_FF0581B4:\n"
        "LDR     R0, =0xFF058214\n"
        "BL      sub_FF00EDC8\n"
"loc_FF0581BC:\n"
        "ADD     R0, R6, R5,LSL#2\n"
        "LDR     R0, [R0,#0x18]\n"
        "CMP     R0, #1\n"
        "BNE     loc_FF058254\n"
        "LDR     R0, =0x264C\n"
        "LDR     R0, [R0,#0x10]\n"
        "CMP     R0, #0\n"
        "BEQ     loc_FF058254\n"
        "LDR     R2, =0xFF057EB0\n"
        "ORR     R3, R4, #0x400\n"
        "MOV     R1, R2\n"
        "BL      sub_FF02C234\n"
        "TST     R0, #1\n"
        "CMPNE   R0, #0x15\n"
        "STR     R0, [R10,R4,LSL#2]\n"
        "BEQ     loc_FF057FB4\n"
        "LDR     R1, =0x2CA\n"
"loc_FF058200:\n"
        "LDR     R0, =0xFF058214\n"
        "BL      sub_FF00EDC8\n"
        "B       loc_FF057FB4\n"
		
"loc_FF058254:\n"
        "LDR     R0, [R6,R5,LSL#2]\n"
        "B       loc_FF05801C\n"
"loc_FF05825C:\n"
        "LDR     R0, [R9,R4,LSL#2]\n"
        "CMP     R0, #0\n"
        "MOVEQ   R1, #0x2D4\n"
        "LDREQ   R0, =0xFF058214\n"
        "BLEQ    sub_FF00EDC8\n"
        "RSB     R0, R4, R4,LSL#3\n"
        "ADD     R0, R6, R0,LSL#2\n"
        "LDR     R0, [R0,#0xC]\n"
        "BL      sub_FF0249F0\n"
        "MOV     R0, #0\n"
        "STR     R0, [R9,R4,LSL#2]\n"
        "B       loc_FF057FB4\n"
	 );
 }
