#include "lolevel.h"
#include "platform.h"
#include "core.h"
//#include "stdlib.h"
#include "dryos31.h"

#define offsetof(TYPE, MEMBER) ((int) &((TYPE *)0)->MEMBER)

const char * const new_sa = &_end;


// Forward declarations
void CreateTask_PhySw();
void CreateTask_spytask();
extern volatile int jogdial_stopped;
void JogDial_task_my(void);

/*----------------------------------------------------------------------
	taskCreateHook()
-----------------------------------------------------------------------*/

extern void task_CaptSeq();
extern void task_InitFileModules();
extern void task_RotaryEncoder();
extern void task_MovieRecord();
extern void task_ExpDrv();

void taskCreateHook(context_t **context) { 
	task_t *tcb=(task_t*)((char*)context-offsetof(task_t, context));

	// Replace firmware task addresses with ours
	if(tcb->entry == (void*)task_CaptSeq)			tcb->entry = (void*)capt_seq_task; 
	if(tcb->entry == (void*)task_InitFileModules)	tcb->entry = (void*)init_file_modules_task;
	if(tcb->entry == (void*)task_RotaryEncoder)		tcb->entry = (void*)JogDial_task_my;
	if(tcb->entry == (void*)task_MovieRecord)		tcb->entry = (void*)movie_record_task;
	if(tcb->entry == (void*)task_ExpDrv)			tcb->entry = (void*)exp_drv_task;
}

/*----------------------------------------------------------------------
	boot()

	Main entry point for the CHDK code
-----------------------------------------------------------------------*/
void __attribute__((naked,noinline)) boot()
{
asm volatile (
"	LDR	R1, =0xC0410000 \n"                  
"	MOV	R0, #0 \n"                           
"	STR	R0, [R1] \n"                         
"	MOV	R1, #0x78 \n"                        
"	MCR	p15, 0, R1, c1, c0 \n"               
"	MOV	R1, #0 \n"                           
"	MCR	p15, 0, R1, c7, c10, 4 \n"           
"	MCR	p15, 0, R1, c7, c5 \n"               
"	MCR	p15, 0, R1, c7, c6 \n"               
"	MOV	R0, #0x3D \n"                        
"	MCR	p15, 0, R0, c6, c0 \n"               
"	MOV	R0, #0xC000002F \n"                  
"	MCR	p15, 0, R0, c6, c1 \n"               
"	MOV	R0, #0x33 \n"                        
"	MCR	p15, 0, R0, c6, c2 \n"               
"	MOV	R0, #0x40000033 \n"                  
"	MCR	p15, 0, R0, c6, c3 \n"               
"	MOV	R0, #0x80000017 \n"                  
"	MCR	p15, 0, R0, c6, c4 \n"               
"	LDR	R0, =0xFF80002D \n"                  
"	MCR	p15, 0, R0, c6, c5 \n"               
"	MOV	R0, #0x34 \n"                        
"	MCR	p15, 0, R0, c2, c0 \n"               
"	MOV	R0, #0x34 \n"                        
"	MCR	p15, 0, R0, c2, c0, 1 \n"            
"	MOV	R0, #0x34 \n"                        
"	MCR	p15, 0, R0, c3, c0 \n"               
"	LDR	R0, =0x3333330 \n"                   
"	MCR	p15, 0, R0, c5, c0, 2 \n"            
"	LDR	R0, =0x3333330 \n"                   
"	MCR	p15, 0, R0, c5, c0, 3 \n"            
"	MRC	p15, 0, R0, c1, c0 \n"               
"	ORR	R0, R0, #0x1000 \n"                  
"	ORR	R0, R0, #4 \n"                       
"	ORR	R0, R0, #1 \n"                       
"	MCR	p15, 0, R0, c1, c0 \n"               
"	MOV	R1, #0x80000006 \n"                  
"	MCR	p15, 0, R1, c9, c1 \n"               
"	MOV	R1, #6 \n"                           
"	MCR	p15, 0, R1, c9, c1, 1 \n"            
"	MRC	p15, 0, R1, c1, c0 \n"               
"	ORR	R1, R1, #0x50000 \n"                 
"	MCR	p15, 0, R1, c1, c0 \n"               
"	LDR	R2, =0xC0200000 \n"                  
"	MOV	R1, #1 \n"                           
"	STR	R1, [R2, #0x10C] \n"                 
"	MOV	R1, #0xFF \n"                        
"	STR	R1, [R2, #0xC] \n"                   
"	STR	R1, [R2, #0x1C] \n"                  
"	STR	R1, [R2, #0x2C] \n"                  
"	STR	R1, [R2, #0x3C] \n"                  
"	STR	R1, [R2, #0x4C] \n"                  
"	STR	R1, [R2, #0x5C] \n"                  
"	STR	R1, [R2, #0x6C] \n"                  
"	STR	R1, [R2, #0x7C] \n"                  
"	STR	R1, [R2, #0x8C] \n"                  
"	STR	R1, [R2, #0x9C] \n"                  
"	STR	R1, [R2, #0xAC] \n"                  
"	STR	R1, [R2, #0xBC] \n"                  
"	STR	R1, [R2, #0xCC] \n"                  
"	STR	R1, [R2, #0xDC] \n"                  
"	STR	R1, [R2, #0xEC] \n"                  
"	STR	R1, [R2, #0xFC] \n"                  
"	LDR	R1, =0xC0400008 \n"                  
"	LDR	R2, =0x430005 \n"                    
"	STR	R2, [R1] \n"                         
"	MOV	R1, #1 \n"                           
"	LDR	R2, =0xC0243100 \n"                  
"	STR	R2, [R1] \n"                         
"	LDR	R2, =0xC0242010 \n"                  
"	LDR	R1, [R2] \n"                         
"	ORR	R1, R1, #1 \n"                       
"	STR	R1, [R2] \n"                         
"	LDR	R0, =0xFFC73A58 \n"                  
"	LDR	R1, =0x1900 \n"                      
"	LDR	R3, =0xFA30 \n"                      
"loc_FF81013C:\n"
"	CMP	R1, R3 \n"                           
"	LDRCC	R2, [R0], #4 \n"                   
"	STRCC	R2, [R1], #4 \n"                   
"	BCC	loc_FF81013C \n"                     
"	LDR	R1, =0x175CE0 \n"                    
"	MOV	R2, #0 \n"                           
"loc_FF810154:\n"
"	CMP	R3, R1 \n"                           
"	STRCC	R2, [R3], #4 \n"                   
"	BCC	loc_FF810154 \n"                     
//"	B	sub_FF810358 \n"                       
"	B	sub_FF810358_my \n"		// patched --------------->		
		
    );
}


//** sub_FF810358_my  @ 0xFF810358 
void __attribute__((naked,noinline)) sub_FF810358_my() {

	// SX150 values found via CHDK Memory Browser
    *(int*)0x1930 = (int)taskCreateHook;
    *(int*)0x1934 = (int)taskCreateHook;
	

	// SX150 @FF864BEC
	// fix for correct power-on
	// must also comment out function in taskcreate_Startup_my
	if ((*(int*) 0xC0220118) & 1)			// look at play switch
		*(int*)(0x25A0) = 0x100000;		// start in play mode
	else
		*(int*)(0x25A0) = 0x200000;		// start in rec mode	

	asm volatile (
	
"	LDR	R0, =0xFF8103D0 \n"                  
"	MOV	R1, #0 \n"                           
"	LDR	R3, =0xFF810408 \n"                  
"loc_FF810364:\n"
"	CMP	R0, R3 \n"                           
"	LDRCC	R2, [R0], #4 \n"                   
"	STRCC	R2, [R1], #4 \n"                   
"	BCC	loc_FF810364 \n"                     
"	LDR	R0, =0xFF810408 \n"                  
"	MOV	R1, #0x4B0 \n"                       
"	LDR	R3, =0xFF81061C \n"                  
"loc_FF810380:\n"
"	CMP	R0, R3 \n"                           
"	LDRCC	R2, [R0], #4 \n"                   
"	STRCC	R2, [R1], #4 \n"                   
"	BCC	loc_FF810380 \n"                     
"	MOV	R0, #0xD2 \n"                        
"	MSR	CPSR_cxsf, R0 \n"                    
"	MOV	SP, #0x1000 \n"                      
"	MOV	R0, #0xD3 \n"                        
"	MSR	CPSR_cxsf, R0 \n"                    
"	MOV	SP, #0x1000 \n"                      
"	LDR	R0, =0x6C4 \n"                       
"	LDR	R2, =0xEEEEEEEE \n"                  
"	MOV	R3, #0x1000 \n"                      
"loc_FF8103B4:\n"
"	CMP	R0, R3 \n"                           
"	STRCC	R2, [R0], #4 \n"                   
"	BCC	loc_FF8103B4 \n"                     
//"	BL	sub_FF8111B0 \n"                      
"	BL	sub_FF8111B0_my \n"		// patched  ------------->
  );
}


void __attribute__((naked,noinline)) sub_FF8111B0_my() {

	asm volatile (
"	STR	LR, [SP, #-4]! \n"                   
"	SUB	SP, SP, #0x74 \n"                    
"	MOV	R1, #0x74 \n"                        
"	MOV	R0, SP \n"                           
"	BL	sub_FFB8BA64 \n"                      
"	MOV	R0, #0x57000 \n"                     
"	STR	R0, [SP, #4] \n"                     

#if defined(OPT_CHDK_IN_EXMEM)
               "LDR     R0, =0x175CE0\n" // use original heap offset since CHDK is loaded in high memory
#else
               "LDR     R0, =new_sa\n"   // otherwise use patched value
               "LDR     R0, [R0]\n"      //
#endif
//"	LDR	R0, =0x175CE0 \n"                    

"	LDR	R2, =0x2EDAD0 \n"                    
"	STR	R0, [SP, #8] \n"                     
"	SUB	R0, R2, R0 \n"                       
"	STR	R0, [SP, #0xC] \n"                   
"	MOV	R0, #0x22 \n"                        
"	STR	R0, [SP, #0x18] \n"                  
"	MOV	R0, #0x68 \n"                        
"	STR	R0, [SP, #0x1C] \n"                  
"	LDR	R1, =0x2F5C00 \n"                    
"	LDR	R0, =0x1CD \n"                       
"	STR	R1, [SP] \n"                         
"	STR	R0, [SP, #0x20] \n"                  
"	MOV	R0, #0x96 \n"                        
"	STR	R2, [SP, #0x10] \n"                  
"	STR	R1, [SP, #0x14] \n"                  
"	STR	R0, [SP, #0x24] \n"                  
"	STR	R0, [SP, #0x28] \n"                  
"	MOV	R0, #0x64 \n"                        
"	STR	R0, [SP, #0x2C] \n"                  
"	MOV	R0, #0 \n"                           
"	STR	R0, [SP, #0x30] \n"                  
"	STR	R0, [SP, #0x34] \n"                  
"	MOV	R0, #0x10 \n"                        
"	STR	R0, [SP, #0x5C] \n"                  
"	MOV	R0, #0x800 \n"                       
"	STR	R0, [SP, #0x60] \n"                  
"	MOV	R0, #0xA0 \n"                        
"	STR	R0, [SP, #0x64] \n"                  
"	MOV	R0, #0x280 \n"                       
"	STR	R0, [SP, #0x68] \n"                  
//"	LDR	R1, =0xFF815F2C \n"                  
"		LDR	R1, =sub_FF815F2C_my \n"	// patched -------------->

"		B	sub_FF81124C \n " 		// Return to firmware ----------->

	);

}

//** sub_FF815F2C_my  @ 0xFF815F2C
void __attribute__((naked,noinline)) sub_FF815F2C_my() {
	asm volatile (

"	STMFD	SP!, {R4,LR} \n"                   
"	BL	sub_FF810B28 \n"                      
"	BL	sub_FF81A384 \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF816040 \n"                
"	BLLT	sub_FF816020 \n"                    
"	BL	sub_FF815B64 \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF816048 \n"                
"	BLLT	sub_FF816020 \n"                    
"	LDR	R0, =0xFF816058 \n"                  
"	BL	sub_FF815C4C \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF816060 \n"                
"	BLLT	sub_FF816020 \n"                    
"	LDR	R0, =0xFF816058 \n"                  
"	BL	sub_FF813CA8 \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF816074 \n"                
"	BLLT	sub_FF816020 \n"                    
"	BL	sub_FF819CEC \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF816080 \n"                
"	BLLT	sub_FF816020 \n"                    
"	BL	sub_FF811690 \n"                      
"	CMP	R0, #0 \n"                           
"	LDRLT	R0, =0xFF81608C \n"                
"	BLLT	sub_FF816020 \n"                    
"	LDMFD	SP!, {R4,LR} \n"                   
//"	B	taskcreate_Startup_my \n"	//patched
"	B	sub_FF81FD8C_my\n"		//patched
	
	);
}

void __attribute__((naked,noinline)) sub_FF81FD8C_my(  ) {
asm volatile (
"	STMFD	SP!, {R4,LR} \n"                   
//"	BL	sub_FF8342BC \n"                      
//"	BL	sub_FF81FDA0 \n"                      
"	BL	taskcreate_Startup_my \n"	//patched
"	MOV	R0, #0 \n"                           
"	LDMFD	SP!, {R4,PC} \n"                   
	);
}

//** taskcreate_Startup_my  @ 0xFF81FDA0
void __attribute__((naked,noinline)) taskcreate_Startup_my() {

    asm volatile (
"	STMFD	SP!, {R3-R9,LR} \n"                
"	MOV	R6, #0 \n"                           
"	BL	sub_FF83C678 \n"                      
"	LDR	R9, =0xC0220000 \n"                  
"	MOVS	R7, R0 \n"                          
"	MOV	R8, #1 \n"                           
"	BNE	loc_FF81FE04 \n"                     
"	BL	sub_FF835C90 \n"                      
"	CMP	R0, #0 \n"                           
"	BEQ	loc_FF81FE04 \n"                     
"	LDR	R0, [R9, #0x118] \n"                 
"	BIC	R5, R8, R0 \n"                       
"	LDR	R0, [R9, #0x114] \n"                 
"	BIC	R4, R8, R0 \n"                       
"	BL	sub_FF83354C \n"                      
"	CMP	R0, #1 \n"                           
"	MOVEQ	R6, #1 \n"                         
"	ORR	R0, R4, R5 \n"                       
"	ORRS	R0, R0, R6 \n"                      
"	BNE	loc_FF81FE14 \n"                     
"	BL	sub_FF8338B4 \n"                      
"	MOV	R0, #0x44 \n"                        
"	STR	R0, [R9, #0x1C] \n"                  
"	BL	sub_FF833AA4 \n"                      
"loc_FF81FE00:\n"
"	B	loc_FF81FE00 \n"                       
"loc_FF81FE04:\n"
"	LDR	R0, [R9, #0x114] \n"                 
"	BIC	R4, R8, R0 \n"                       
"	LDR	R0, [R9, #0x118] \n"                 
"	BIC	R5, R8, R0 \n"                       
"loc_FF81FE14:\n"
"	MOV	R3, R6 \n"                           
"	MOV	R2, R7 \n"                           
"	MOV	R1, R5 \n"                           
"	MOV	R0, R4 \n"                           
//"	BL	sub_FF8342C4 \n" // remove for correct power on (hold pwr button for rec)
"	BL	sub_FF8342C0 \n"                      
"	BL	sub_FF83A844 \n"                      
"	LDR	R1, =0x34E000 \n"                    
"	MOV	R0, #0 \n"                           
"	BL	sub_FF83ACB4 \n"                      
"	BL	sub_FF83AA5C \n"                      
"	MOV	R3, #0 \n"                           
"	STR	R3, [SP] \n"                         

//"	LDR	R3, =0xFF81FD28 \n"                  
"	LDR	R3, =task_Startup_my \n"	// Patched ----------->

"		B	sub_FF81FE4C \n"		// Return to firmware ----------->

	);
}

// @ 0xFF81FD28
void __attribute__((naked,noinline)) task_Startup_my() {

		asm volatile (
"	STMFD	SP!, {R4,LR} \n"                   
"	BL	sub_FF8165DC \n"                      
"	BL	sub_FF8353D4 \n"                      
"	BL	sub_FF83355C \n"                      
//"	BL	sub_FF83C6C0 \n"                      
"	BL	sub_FF83C8AC \n"                      
//"	BL	sub_FF83C754 \n"		// Skip starting diskboot.bin again
"	BL	sub_FF83CA48 \n"                      
"	BL	sub_FF832364 \n"                      
"	BL	sub_FF83C8DC \n"                      
"	BL	sub_FF839FE8 \n"                      
"	BL	sub_FF83CA4C \n"                      

//"	BL	sub_FF83415C \n"                      

"		BL	CreateTask_PhySw \n"			// our keyboard task
"		BL	CreateTask_spytask \n"			// chdk initialization

"	B 	sub_FF81FD5C \n"		// Return to firmware ----------->
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

//** CreateTask_PhySw  @ 0xFF83415C 
void __attribute__((naked,noinline)) CreateTask_PhySw() {

		asm volatile (
"	STMFD	SP!, {R3-R5,LR} \n"                
"	LDR	R4, =0x1C30 \n"                      
"	LDR	R0, [R4, #4] \n"                     
"	CMP	R0, #0 \n"                           
"	BNE	sub_FF834190 \n"                     
"	MOV	R3, #0 \n"                           
"	STR	R3, [SP] \n"                         
//"	LDR	R3, =0xFF834128 \n"                  
//"	MOV	R2, #0x800 \n"                       

"		LDR	R3, =mykbd_task \n"		// PhySw Task patch
"		MOV	R2, #0x2000 \n"			// larger stack

"	B	sub_FF834180 \n"		// Return to firmware ----------->
	);
	
}


/*----------------------------------------------------------------------
	init_file_modules_task()
-----------------------------------------------------------------------*/
//** init_file_modules_task  @ 0xFF89F638 
void __attribute__((naked,noinline)) init_file_modules_task() {

	asm volatile (
"	STMFD	SP!, {R4-R6,LR} \n"                
"	BL	sub_FF89569C \n"                      
"	LDR	R5, =0x5006 \n"                      
"	MOVS	R4, R0 \n"                          
"	MOVNE	R1, #0 \n"                         
"	MOVNE	R0, R5 \n"                         
"	BLNE	sub_FF899828 \n"                    
"	BL	sub_FF8956C8 \n"                      
//"		BL	sub_FF8956C8_my \n"		// patched ------------->
"		BL	core_spytask_can_start \n"	// added ------------->

"		B	sub_FF89F658 \n"		// Return to firmware ----------->
	);
}

//** sub_FF8956C8_my  @ 0xFF8956C8
void __attribute__((naked,noinline)) sub_FF8956C8_my() {


	asm volatile (


"	STMFD	SP!, {R4,LR} \n"                   
"	MOV	R0, #3 \n"                           
//"	BL	sub_FF876630 \n"                      
"	BL	sub_FF876630_my \n"		// patched ------------->
//"	BL	sub_FF968D58 \n"                      

"	B	sub_FF8956D8 \n"		// Return to firmware ----------->
	);
}

//** sub_FF876630_my  @ 0xFF876630
void __attribute__((naked,noinline)) sub_FF876630_my() {

	asm volatile (

"	STMFD	SP!, {R4-R10,LR} \n"               
"	MOV	R6, R0 \n"                           
"	BL	sub_FF8765E0 \n"                      
"	LDR	R1, =0x38230 \n"                     
"	MOV	R5, R0 \n"                           
"	ADD	R4, R1, R0, LSL #7 \n"               
"	LDR	R0, [R4, #0x6C] \n"                  
"	TST	R0, #4 \n"                           
"	LDRNE	R1, =0x9CD \n"                     
"	LDRNE	R0, =0xFF876024 \n"	// "Mounter.c"
"	BLNE	sub_FF81EDBC \n"                    
"	MOV	R1, R6 \n"                           
"	MOV	R0, R5 \n"                           
"	BL	sub_FF875D98 \n"                      
"	LDR	R0, [R4, #0x38] \n"                  
"	BL	sub_FF876C74 \n"                      
"	CMP	R0, #0 \n"                           
"	STREQ	R0, [R4, #0x6C] \n"                
"	MOV	R0, R5 \n"                           
"	BL	sub_FF875E28 \n"                      
"	MOV	R0, R5 \n"                           
//"	BL	sub_FF876184 \n"                      
"	BL	sub_FF876184_my \n"		// patched ------------->

"	B	sub_FF876688 \n"		// Return to firmware ----------->

	);
}

//** sub_FF876184_my  @ 0xFF876184 

void __attribute__((naked,noinline)) sub_FF876184_my() {
	asm volatile (

"	STMFD	SP!, {R4-R6,LR} \n"                
"	MOV	R5, R0 \n"                           
"	LDR	R0, =0x38230 \n"                     
"	ADD	R4, R0, R5, LSL #7 \n"               
"	LDR	R0, [R4, #0x6C] \n"                  
"	TST	R0, #2 \n"                           
"	MOVNE	R0, #1 \n"                         
"	LDMNEFD	SP!, {R4-R6,PC} \n"              
"	LDR	R0, [R4, #0x38] \n"                  
"	MOV	R1, R5 \n"                           
//"	BL	sub_FF875EAC \n"                      
"	BL	sub_FF875EAC_my \n"                      

"	B	sub_FF8761B0 \n"		// Return to firmware ----------->
	);
}

//** sub_FF875EAC_my  @ 0xFF875EAC 
void __attribute__((naked,noinline)) sub_FF875EAC_my() {

	asm volatile (
"	STMFD	SP!, {R4-R10,LR} \n"               
"	MOV	R9, R0 \n"                           
"	LDR	R0, =0x38230 \n"                     
"	MOV	R6, #0 \n"                           
"	ADD	R5, R0, R1, LSL #7 \n"               
"	LDR	R0, [R5, #0x3C] \n"                  
"	MOV	R7, R6 \n"                           
"	CMP	R0, #7 \n"                           
"	MOV	R8, R6 \n"                           
"	ADDCC	PC, PC, R0, LSL #2 \n"             
"	B	sub_FF876004 \n"                       
"	B       loc_FF875F0C \n"             
"	B       loc_FF875EF4 \n"             
"	B       loc_FF875EF4 \n"             
"	B       loc_FF875EF4 \n"             
"	B       loc_FF875EF4 \n"             
"	B       sub_FF875FFC \n"             
"	B       loc_FF875EF4 \n"                       
"loc_FF875EF4:\n"
// jumptable FF875ED0 entries 1-4,6
"	MOV	R2, #0 \n"                           
"	MOV	R1, #0x200 \n"                       
"	MOV	R0, #2 \n"                           
"	BL	sub_FF88F4E4 \n"                      
"	MOVS	R4, R0 \n"                          
"	BNE	loc_FF875F14 \n"                     
"loc_FF875F0C:\n"
// jumptable FF875ED0 entry 0
"	MOV	R0, #0 \n"                           
"	LDMFD	SP!, {R4-R10,PC} \n"               
"loc_FF875F14:\n"
"	LDR	R12, [R5, #0x50] \n"                 
"	MOV	R3, R4 \n"                           
"	MOV	R2, #1 \n"                           
"	MOV	R1, #0 \n"                           
"	MOV	R0, R9 \n"                           
"	BLX	R12 \n"                              
"	CMP	R0, #1 \n"                           
"	BNE	loc_FF875F40 \n"                     
"	MOV	R0, #2 \n"                           
"	BL	sub_FF88F628 \n"                      
"	B	loc_FF875F0C \n"                       
"loc_FF875F40:\n"
"	LDR	R1, [R5, #0x64] \n"                  
"	MOV	R0, R9 \n"                           
"	BLX	R1 \n"                               

// The following may not be needed for the SX150 ??

////------------------  begin added code ---------------
//		"MOV	R1, R4\n"           //  pointer to MBR in R1
//		"BL	mbr_read_dryos\n"   //  total sectors count in R0 before and after call
//
//		// Start of DataGhost's FAT32 autodetection code
//		// Policy: If there is a partition which has type W95 FAT32, use the first one of those for image storage
//		// According to the code below, we can use R1, R2, R3 and R12.
//		// LR wasn't really used anywhere but for storing a part of the partition signature. This is the only thing
//		// that won't work with an offset, but since we can load from LR+offset into LR, we can use this to do that :)
//		"MOV	R12, R4\n"                    // Copy the MBR start address so we have something to work with
//		"MOV	LR, R4\n"                     // Save old offset for MBR signature
//		"MOV	R1, #1\n"                     // Note the current partition number
//		"B	dg_sd_fat32_enter\n"          // We actually need to check the first partition as well, no increments yet!
//   "dg_sd_fat32:\n"
//		"CMP	R1, #4\n"                     // Did we already see the 4th partition?
//		"BEQ	dg_sd_fat32_end\n"            // Yes, break. We didn't find anything, so don't change anything.
//		"ADD	R12, R12, #0x10\n"            // Second partition
//		"ADD	R1, R1, #1\n"                 // Second partition for the loop
//   "dg_sd_fat32_enter:\n"
//		"LDRB	R2, [R12, #0x1BE]\n"          // Partition status
//		"LDRB	R3, [R12, #0x1C2]\n"          // Partition type (FAT32 = 0xB)
//		"CMP	R3, #0xB\n"                   // Is this a FAT32 partition?
//		"CMPNE	R3, #0xC\n"                   // Not 0xB, is it 0xC (FAT32 LBA) then?
//		"BNE	dg_sd_fat32\n"                // No, it isn't.
//		"CMP	R2, #0x00\n"                  // It is, check the validity of the partition type
//		"CMPNE	R2, #0x80\n"
//		"BNE	dg_sd_fat32\n"                // Invalid, go to next partition
//											   // This partition is valid, it's the first one, bingo!
//		"MOV	R4, R12\n"                    // Move the new MBR offset for the partition detection.
//
//   "dg_sd_fat32_end:\n"
//		// End of DataGhost's FAT32 autodetection code
////------------------  end added code ---------------

"	MOV	R1, R0 \n"                           
"	LDRB	R0, [R4, #0x1C9] \n"                
"	LDRB	R2, [R4, #0x1C8] \n"                
"	LDRB	R12, [R4, #0x1CC] \n"               
"	MOV	R0, R0, LSL #0x18 \n"                
"	ORR	R0, R0, R2, LSL #0x10 \n"            
"	LDRB	R2, [R4, #0x1C7] \n"                
"	LDRB	R3, [R4, #0x1BE] \n"                
"	ORR	R0, R0, R2, LSL #8 \n"               
"	LDRB	R2, [R4, #0x1C6] \n"                
"	CMP	R3, #0 \n"                           
"	CMPNE	R3, #0x80 \n"                      
"	ORR	R0, R0, R2 \n"                       
"	LDRB	R2, [R4, #0x1CD] \n"                
"	MOV	R2, R2, LSL #0x18 \n"                
"	ORR	R2, R2, R12, LSL #0x10 \n"           
"	LDRB	R12, [R4, #0x1CB] \n"               
"	ORR	R2, R2, R12, LSL #8 \n"              
"	LDRB	R12, [R4, #0x1CA] \n"               
"	ORR	R2, R2, R12 \n"                      
"	LDRB	R12, [R4, #0x1FE] \n"               
"	LDRB	R4, [R4, #0x1FF] \n"                
//"		LDRB	R12, [LR,#0x1FE]\n"            // New! First MBR signature byte (0x55)
//"		LDRB	LR, [LR,#0x1FF]\n"             //      Last MBR signature byte (0xAA)

"		B	sub_FF875FA4 \n"		// Return to firmware ----------->

	);
}

/*----------------------------------------------------------------------
	JogDial_task_my()
-----------------------------------------------------------------------*/
//** JogDial_task_my  @ 0xFF865420
void __attribute__((naked,noinline)) JogDial_task_my()
{
	asm volatile (
"	STMFD	SP!, {R4-R11,LR} \n"               
"	SUB	SP, SP, #0x1C \n"                    
"	BL	sub_FF8657B4 \n"                      
"	LDR	R12, =0x25AC \n"                     
"	LDR	R6, =0xFFB90EA0 \n"                  
"	MOV	R0, #0 \n"                           
"	ADD	R10, SP, #8 \n"                      
"	ADD	R9, SP, #0xC \n"                     
"loc_FF865440:\n"
"	ADD	R2, SP, #0x14 \n"                    
"	MOV	R1, #0 \n"                           
"	ADD	R4, R2, R0, LSL #1 \n"               
"	ADD	R3, SP, #0x10 \n"                    
"	STRH	R1, [R4] \n"                        
"	ADD	R4, R3, R0, LSL #1 \n"               
"	STRH	R1, [R4] \n"                        
"	STR	R1, [R9, R0, LSL #2] \n"             
"	STR	R1, [R10, R0, LSL #2] \n"            
"	ADD	R0, R0, #1 \n"                       
"	CMP	R0, #1 \n"                           
"	BLT	loc_FF865440 \n"                     
"loc_FF865470:\n"
"	LDR	R0, =0x25AC \n"                      
"	MOV	R2, #0 \n"                           
"	LDR	R0, [R0, #8] \n"                     
"	MOV	R1, SP \n"                           
"	BL	sub_FF83A27C \n"                      
"	CMP	R0, #0 \n"                           
"	LDRNE	R1, =0x236 \n"                     
"	LDRNE	R0, =0xFF8656D0 \n" // "RotaryEncoder.c"
"	BLNE	sub_FF81EDBC \n"                    
"	LDR	R0, [SP] \n"                         
"	AND	R4, R0, #0xFF \n"                    
"	AND	R0, R0, #0xFF00 \n"                  
"	CMP	R0, #0x100 \n"                       
"	BEQ	loc_FF8654E0 \n"                     
"	CMP	R0, #0x200 \n"                       
"	BEQ	loc_FF865518 \n"                     
"	CMP	R0, #0x300 \n"                       
"	BEQ	loc_FF865718 \n"                     
"	CMP	R0, #0x400 \n"                       
"	BNE	loc_FF865470 \n"                     
"	CMP	R4, #0 \n"                           
"	LDRNE	R1, =0x2C1 \n"                     
"	LDRNE	R0, =0xFF8656D0 \n" // "RotaryEncoder.c"
"	BLNE	sub_FF81EDBC \n"                    
"	RSB	R0, R4, R4, LSL #3 \n"               
"	LDR	R0, [R6, R0, LSL #2] \n"             
"loc_FF8654D8:\n"
"	BL	sub_FF865798 \n"                      
"	B	loc_FF865470 \n"                       
"loc_FF8654E0:\n"
//------------------  begin added code ---------------
"labelA: \n"
		"LDR	R0, =jogdial_stopped\n"
		"LDR	R0, [R0]\n"
		"CMP	R0, #1\n"
		"BNE	labelB\n"			// continue on if jogdial_stopped = 0
		"MOV	R0, #40\n"
		"BL	_SleepTask\n"			// jogdial_stopped=1 -- give time back to OS and suspend jogdial task
		"B	labelA\n"
"labelB: \n" 
//------------------  end added code -----------------


"	LDR	R0, =0x25B8 \n"                      
"	LDR	R0, [R0, R4, LSL #2] \n"             
"	BL	sub_FF83B228 \n"                      
"	LDR	R2, =0xFF86536C \n"                  
"	ORR	R3, R4, #0x200 \n"                   
"	ADD	R1, R2, #0 \n"                       
"	MOV	R0, #0x28 \n"                        
"	BL	sub_FF83B144 \n"                      
"	TST	R0, #1 \n"                           
"	CMPNE	R0, #0x15 \n"                      
"	STR	R0, [R10, R4, LSL #2] \n"            
"	BEQ	loc_FF865470 \n"                     
"	MOV	R1, #0x248 \n"                       
"	B	loc_FF8656BC \n"                       
"loc_FF865518:\n"
"	RSB	R5, R4, R4, LSL #3 \n"               
"	LDR	R0, [R6, R5, LSL #2] \n"             
"	LDR	R1, =0xC0240000 \n"                  
"	ADD	R0, R1, R0, LSL #8 \n"               
"	LDR	R0, [R0, #0x104] \n"                 
"	MOV	R1, R0, ASR #0x10 \n"                
"	ADD	R0, SP, #0x14 \n"                    
"	ADD	R11, R0, R4, LSL #1 \n"              
"	ADD	R0, SP, #0x10 \n"                    
"	ADD	R0, R0, R4, LSL #1 \n"               
"	STRH	R1, [R11] \n"                       
"	STR	R0, [SP, #0x18] \n"                  
"	LDRSH	R3, [R0] \n"                       
"	SUB	R2, R1, R3 \n"                       
"	CMP	R2, #0 \n"                           
"	BNE	loc_FF86559C \n"                     
"	LDR	R0, [R9, R4, LSL #2] \n"             
"	CMP	R0, #0 \n"                           
"	BEQ	loc_FF865678 \n"                     
"	LDR	R7, =0x25B8 \n"                      
"	LDR	R0, [R7, R4, LSL #2] \n"             
"	BL	sub_FF83B228 \n"                      
"	LDR	R2, =0xFF865378 \n"                  
"	ORR	R3, R4, #0x300 \n"                   
"	ADD	R1, R2, #0 \n"                       
"	MOV	R0, #0x1F4 \n"                       
"	BL	sub_FF83B144 \n"                      
"	TST	R0, #1 \n"                           
"	CMPNE	R0, #0x15 \n"                      
"	STR	R0, [R7, R4, LSL #2] \n"             
"	BEQ	loc_FF865678 \n"                     
"	LDR	R1, =0x261 \n"                       
"	B	loc_FF865670 \n"                       
"loc_FF86559C:\n"
"	MOV	R0, R2 \n"                           
"	RSBLT	R0, R0, #0 \n"                     
"	MOVLE	R7, #0 \n"                         
"	MOVGT	R7, #1 \n"                         
"	CMP	R0, #0xFF \n"                        
"	BLS	loc_FF8655D8 \n"                     
"	LDR	R0, =0x7FFF \n"                      
"	CMP	R2, #0 \n"                           
"	SUBLE	R0, R0, R3 \n"                     
"	ADDLE	R0, R0, R1 \n"                     
"	SUBGT	R0, R0, R1 \n"                     
"	ADDGT	R0, R0, R3 \n"                     
"	MVN	R1, #0x8000 \n"                      
"	SUB	R0, R0, R1 \n"                       
"	EOR	R7, R7, #1 \n"                       
"loc_FF8655D8:\n"
"	STR	R0, [SP, #4] \n"                     
"	LDR	R0, [R9, R4, LSL #2] \n"             
"	CMP	R0, #0 \n"                           
"	ADDEQ	R0, R6, R5, LSL #2 \n"             
"	LDREQ	R0, [R0, #8] \n"                   
"	BEQ	loc_FF865610 \n"                     
"	ADD	R8, R6, R5, LSL #2 \n"               
"	ADD	R1, R8, R7, LSL #2 \n"               
"	LDR	R1, [R1, #0x10] \n"                  
"	CMP	R1, R0 \n"                           
"	BEQ	loc_FF865614 \n"                     
"	LDR	R0, [R8, #0xC] \n"                   
"	BL	sub_FF8341B4 \n"                      
"	LDR	R0, [R8, #8] \n"                     
"loc_FF865610:\n"
"	BL	sub_FF8341B4 \n"                      
"loc_FF865614:\n"
"	ADD	R0, R6, R5, LSL #2 \n"               
"	ADD	R7, R0, R7, LSL #2 \n"               
"	LDR	R0, [R7, #0x10] \n"                  
"	LDR	R1, [SP, #4] \n"                     
"	BL	sub_FF8341C4 \n"                      
"	LDR	R0, [R7, #0x10] \n"                  
"	LDR	R7, =0x25B8 \n"                      
"	STR	R0, [R9, R4, LSL #2] \n"             
"	LDRH	R1, [R11] \n"                       
"	LDR	R0, [SP, #0x18] \n"                  
"	STRH	R1, [R0] \n"                        
"	LDR	R0, [R7, R4, LSL #2] \n"             
"	BL	sub_FF83B228 \n"                      
"	LDR	R2, =0xFF865378 \n"                  
"	ORR	R3, R4, #0x300 \n"                   
"	ADD	R1, R2, #0 \n"                       
"	MOV	R0, #0x1F4 \n"                       
"	BL	sub_FF83B144 \n"                      
"	TST	R0, #1 \n"                           
"	CMPNE	R0, #0x15 \n"                      
"	STR	R0, [R7, R4, LSL #2] \n"             
"	BEQ	loc_FF865678 \n"                     
"	LDR	R1, =0x2A3 \n"                       
"loc_FF865670:\n"
"	LDR	R0, =0xFF8656D0 \n" // "RotaryEncoder.c"
"	BL	sub_FF81EDBC \n"                      
"loc_FF865678:\n"
"	ADD	R0, R6, R5, LSL #2 \n"               
"	LDR	R0, [R0, #0x18] \n"                  
"	CMP	R0, #1 \n"                           
"	BNE	loc_FF865710 \n"                     
"	LDR	R0, =0x25AC \n"                      
"	LDR	R0, [R0, #0x10] \n"                  
"	CMP	R0, #0 \n"                           
"	BEQ	loc_FF865710 \n"                     
"	LDR	R2, =0xFF86536C \n"                  
"	ORR	R3, R4, #0x400 \n"                   
"	ADD	R1, R2, #0 \n"                       
"	BL	sub_FF83B144 \n"                      
"	TST	R0, #1 \n"                           
"	CMPNE	R0, #0x15 \n"                      
"	STR	R0, [R10, R4, LSL #2] \n"            
"	BEQ	loc_FF865470 \n"                     
"	LDR	R1, =0x2AA \n"                       
"loc_FF8656BC:\n"
"	LDR	R0, =0xFF8656D0 \n" // "RotaryEncoder.c"
"	BL	sub_FF81EDBC \n"                      
"	B	loc_FF865470 \n"                       
"loc_FF865710:\n"
"	LDR	R0, [R6, R5, LSL #2] \n"             
"	B	loc_FF8654D8 \n"                       
"loc_FF865718:\n"
"	LDR	R0, [R9, R4, LSL #2] \n"             
"	CMP	R0, #0 \n"                           
"	MOVEQ	R1, #0x2B4 \n"                     
"	LDREQ	R0, =0xFF8656D0 \n" // "RotaryEncoder.c"
"	BLEQ	sub_FF81EDBC \n"                    
"	RSB	R0, R4, R4, LSL #3 \n"               
"	ADD	R0, R6, R0, LSL #2 \n"               
"	LDR	R0, [R0, #0xC] \n"                   
"	BL	sub_FF8341B4 \n"                      
"	MOV	R0, #0 \n"                           
"	STR	R0, [R9, R4, LSL #2] \n"             
"	B	loc_FF865470 \n"                       
	);
}
