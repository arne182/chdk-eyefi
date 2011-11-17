#include "conf.h"

void change_video_tables(int a, int b){
}


void  set_quality(int *x){ // -17 highest; +12 lowest
 if (conf.video_mode) *x=12-((conf.video_quality-1)*(12+17)/(99-1));
}

//SX220 sub_FF1882F0
void __attribute__((naked,noinline)) movie_record_task(){
	asm volatile(
	
	             "STMFD   SP!, {R2-R10,LR}\n"
                 "LDR     R6, =0xFF187060\n"
                 "LDR     R7, =sub_FF187D48_my\n"    //SX220 patched
                 "LDR     R4, =0x8550\n"
                 "LDR     R9, =0x67F\n"
                 "LDR     R10, =0x2710\n"
                 "MOV     R8, #1\n"
                 "MOV     R5, #0\n"
 "loc_FF188310:\n"
                 "LDR     R0, [R4,#0x24]\n"
                 "MOV     R2, #0\n"
                 "ADD     R1, SP, #4\n"
                 "BL      sub_FF02AD50\n"
                 "LDR     R0, [R4,#0x2C]\n"
                 "CMP     R0, #0\n"
                 "LDRNE   R0, [R4,#0xC]\n"
                 "CMPNE   R0, #2\n"
                 "LDRNE   R0, [R4,#0x44]\n"
                 "CMPNE   R0, #6\n"
                 "BNE     loc_FF18844C\n"
                 "LDR     R0, [SP,#4]\n"
                 "LDR     R1, [R0]\n"
                 "SUB     R1, R1, #2\n"
                 "CMP     R1, #0xD\n"
                 "ADDCC   PC, PC, R1,LSL#2\n"
                 "B       loc_FF18844C\n"


 "loc_FF188354:\n"
                 "B       loc_FF1883EC\n"


 "loc_FF188358:\n"
                 "B       loc_FF188410\n"


 "loc_FF18835C:\n"
                 "B       loc_FF188420\n"


 "loc_FF188360:\n"
                 "B       loc_FF188428\n"


 "loc_FF188364:\n"
                 "B       loc_FF188430\n"


 "loc_FF188368:\n"
                 "B       loc_FF188438\n"


 "loc_FF18836C:\n"
                 "B       loc_FF1883F4\n"


 "loc_FF188370:\n"
                 "B       loc_FF188440\n"


 "loc_FF188374:\n"
                 "B       loc_FF188400\n"


 "loc_FF188378:\n"
                 "B       loc_FF18844C\n"


 "loc_FF18837C:\n"
                 "B       loc_FF188448\n"


 "loc_FF188380:\n"
                 "B       loc_FF1883B8\n"


 "loc_FF188384:\n"
                 "B       loc_FF188388\n"

 "loc_FF188388:\n"

                 "STR     R5, [R4,#0x40]\n"
                 "STR     R5, [R4,#0x30]\n"
                 "STR     R5, [R4,#0x34]\n"
                 "STRH    R5, [R4,#6]\n"
                 "STR     R6, [R4,#0xD8]\n"
                 "STR     R7, [R4,#0xF0]\n"
                 "LDR     R0, [R4,#0xC]\n"
                 "ADD     R0, R0, #1\n"
                 "STR     R0, [R4,#0xC]\n"
                 "MOV     R0, #6\n"
                 "STR     R0, [R4,#0x44]\n"
                 "B       loc_FF1883D8\n"


 "loc_FF1883B8:\n"


                 "STR     R5, [R4,#0x40]\n"
                 "STR     R5, [R4,#0x30]\n"
                 "STR     R6, [R4,#0xD8]\n"
                 "STR     R7, [R4,#0xF0]\n"
                 "LDR     R0, [R4,#0xC]\n"
                 "ADD     R0, R0, #1\n"
                 "STR     R0, [R4,#0xC]\n"
                 "STR     R8, [R4,#0x44]\n"

 "loc_FF1883D8:\n"
                 "LDR     R2, =sub_FF18669C\n"
                 "LDR     R1, =0xC2E08\n"
                 //"LDR     R0, =sub_FF1867B0\n"
				 "LDR     R0, =0xFF1867B0\n"
                 "BL      sub_FF044E3C\n"
                 "B       loc_FF18844C\n"


 "loc_FF1883EC:\n"
				
				//"BL	unlock_optical_zoom\n"         //added. not needed for sx220
                 "BL      sub_FF18792C\n"
                 "B       loc_FF18844C\n"


 "loc_FF1883F4:\n"


                 "LDR     R1, [R4,#0xF0]\n"
                 "BLX     R1\n"
                 "B       loc_FF18844C\n"


 "loc_FF188400:\n"


                 "LDR     R1, [R0,#0x18]\n"
                 "LDR     R0, [R0,#4]\n"
                 "BL      sub_FF2FCA14\n"  //1.01b
                 "B       loc_FF18844C\n"


 "loc_FF188410:\n"


                 "LDR     R0, [R4,#0x44]\n"
                 "CMP     R0, #5\n"
                 "STRNE   R8, [R4,#0x34]\n"
                 "B       loc_FF18844C\n"


 "loc_FF188420:\n"


                 "BL      sub_FF186D3C\n"
                 "B       loc_FF18844C\n"


 "loc_FF188428:\n"


                 "BL      sub_FF186A50\n"
                 "B       loc_FF18844C\n"


 "loc_FF188430:\n"


                 "BL      sub_FF186808\n"
                 "B       loc_FF18844C\n"


 "loc_FF188438:\n"


                 "BL      sub_FF186430\n"
                 "B       loc_FF18844C\n"


 "loc_FF188440:\n"


                 "BL      sub_FF1863B0\n"
                 "B       loc_FF18844C\n"


 "loc_FF188448:\n"


                 "BL      sub_FF18899C\n"

 "loc_FF18844C:\n"

                 "LDR     R1, [SP,#4]\n"
                 "LDR     R3, =0xFF186114\n"  //aMovierecorder_
                 "STR     R5, [R1]\n"
                 "STR     R9, [SP]\n"
                 "LDR     R0, [R4,#0x28]\n"
                 "MOV     R2, R10\n"
                 "BL      sub_FF02B6C8\n"
                 "B       loc_FF188310\n"

	
	);
}



//sub_FF187D48_my
void __attribute__((naked,noinline)) sub_FF187D48_my(){
	asm volatile(
	
	             "STMFD   SP!, {R4-R11,LR}\n"
                 "SUB     SP, SP, #0x64\n"
                 "MOV     R9, #0\n"
                 "LDR     R8, =0x8550\n"
                 "STR     R9, [SP,#0x54]\n"
                 "STR     R9, [SP,#0x4C]\n"
                 "STR     R9, [R8,#0xDC]\n"
                 "STR     R9, [R8,#0xE0]\n"
                 "STR     R9, [R8,#0xE4]\n"
                 "MOV     R4, R0\n"
                 "STR     R9, [R8,#0xE8]\n"
                 "LDR     R0, [R8,#0x44]\n"
                 "MOV     R7, R9\n"
                 "CMP     R0, #3\n"
                 "MOVEQ   R0, #4\n"
                 "STREQ   R0, [R8,#0x44]\n"
                 "LDR     R0, [R8,#0xD8]\n"
                 "MOV     R5, #1\n"
                 "MOV     R6, R9\n"
                 "BLX     R0\n"
                 "LDR     R0, [R8,#0x44]\n"
                 "CMP     R0, #6\n"
                 "BEQ     loc_FF187DB8\n"
                 "LDR     R1, [R8,#0xC]\n"
                 "CMP     R1, #2\n"
                 "BNE     loc_FF187DE0\n"
                 "CMP     R0, #5\n"
                 "BEQ     loc_FF187DF0\n"

 "loc_FF187DB8:\n"
                 "LDR     R2, =0xFF187C1C\n"
                 "LDR     R1, =0xFF187C80\n"
                 "LDR     R0, =0xFF187CE4\n"
                 "MOV     R6, #1\n"
                 "ADD     R3, SP, #0x34\n"
                 "BL      sub_FF045E48\n"
                 "LDR     R0, [R8,#0x44]\n"
                 "CMP     R0, #4\n"
                 "MOVNE   R5, #0\n"
                 "B       loc_FF187E00\n"

 "loc_FF187DE0:\n"
                 "CMP     R0, #4\n"
                 "BEQ     loc_FF187E00\n"
                 "CMP     R1, #2\n"
                 "BNE     loc_FF187DF8\n"

 "loc_FF187DF0:\n"
                 "MOV     R0, #0\n"
                 "BL      sub_FF045E54\n"

 "loc_FF187DF8:\n"

                 "ADD     SP, SP, #0x64\n"
                 "LDMFD   SP!, {R4-R11,PC}\n"

 "loc_FF187E00:\n"

                 "LDRH    R0, [R8,#6]\n"
                 "CMP     R0, #3\n"
                 "BNE     loc_FF187E20\n"
                 "LDR     R0, [R8,#0x6C]\n"
                 "LDR     R1, [R8,#0xEC]\n"
                 "BL      sub_FF3ABB04\n"  //1.01b
                 "CMP     R1, #0\n"
                 "MOVNE   R5, #0\n"

 "loc_FF187E20:\n"
                 "LDR     R0, [R8,#0x44]\n"
                 "CMP     R0, #6\n"
                 "CMPNE   R0, #1\n"
                 "CMPNE   R0, #3\n"
                 "BNE     loc_FF187E64\n"
                 "CMP     R6, #1\n"
                 "CMPEQ   R5, #0\n"
                 "BNE     loc_FF187E64\n"
                 "BL      sub_FF045E4C\n"
                 "LDR     R0, [R8,#0x18]\n"
                 "MOV     R1, #0x3E8\n"
                 "BL      sub_FF02B16C\n"
                 "CMP     R0, #9\n"
                 "BNE     loc_FF18826C\n"
                 "MOV     R0, #0x90000\n"
                 "BL      sub_FF091B38\n"
                 "B       loc_FF187DF8\n"

 "loc_FF187E64:\n"

                 "CMP     R5, #1\n"
                 "MOV     R10, #1\n"
                 "BNE     loc_FF187E8C\n"
                 "ADD     R3, SP, #0x4C\n"
                 "ADD     R2, SP, #0x50\n"
                 "ADD     R1, SP, #0x54\n"
                 "ADD     R0, SP, #0x58\n"
                 "BL      sub_FF2FCB3C\n"  //1.01b
                 "MOVS    R9, R0\n"
                 "BNE     loc_FF187EA8\n"

 "loc_FF187E8C:\n"
                 "LDR     R0, [R8,#0x34]\n"
                 "CMP     R0, #1\n"
                 "BNE     loc_FF187FE8\n"
                 "LDR     R0, [R8,#0x6C]\n"
                 "LDR     R1, [R8,#0x48]\n"
                 "CMP     R0, R1\n"
                 "BCC     loc_FF187FE8\n"

 "loc_FF187EA8:\n"
                 "MOV     R0, R9\n"
                 "BL      sub_FF1871D4\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "CMP     R0, #2\n"
                 "BNE     loc_FF187F18\n"
                 "LDR     R0, =sub_FF187C10\n"
                 "MOV     R1, #0\n"
                 "BL      sub_FF2AF468\n"
                 "LDR     R2, [R8,#0x64]\n"
                 "ADD     R3, SP, #0x5C\n"
                 "STRD    R2, [SP,#0x28]\n"
                 "MOV     R2, #0x18\n"
                 "ADD     R1, SP, #0x34\n"
                 "ADD     R0, SP, #0x10\n"
                 "BL      sub_FF3AB7E8\n"  //1.01b
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "MOV    R3, #0xFFFFFFFE\n"
                 "ADD     R0, SP, #0x60\n"
                 "STMEA   SP, {R0-R3}\n"
                 "MOV     R3, #0\n"
                 "LDR     R0, =0xC2E54\n"
                 "MOV     R2, R3\n"
                 "MOV     R1, #0x40\n"
                 "BL      sub_FF2AF3B4\n"
                 "B       loc_FF187F70\n"

 "loc_FF187F10:\n"

                 "MOV     R1, #1\n"
                 "B       loc_FF1881FC\n"

 "loc_FF187F18:\n"
                 "BL      loc_FF188A74\n"
                 "LDR     R2, [R8,#0x64]\n"
                 "ADD     R3, SP, #0x5C\n"
                 "MOV    R1, #0xFFFFFFFE\n"
                 "MOV     R0, #0\n"
                 "ADD     R5, SP, #0x1C\n"
                 "STMIA   R5, {R0-R3}\n"
                 "LDR     R3, [R4,#0x1C]\n"
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "ADD     R0, SP, #0x60\n"
                 "ADD     R4, SP, #0xC\n"
                 "STMIA   R4, {R0-R3}\n"
                 "MOV     R3, #0\n"
                 "MOV     R1, #0x40\n"
                 "STMEA   SP, {R1,R3}\n"
                 "MOV     R2, #0\n"
                 "STR     R3, [SP,#8]\n"
                 "LDR     R3, =0xC2E54\n"
                 "MOV     R1, R2\n"
                 "MOV     R0, R2\n"
                 "BL      sub_FF2ADD10\n"

 "loc_FF187F70:\n"
                 "LDR     R0, [R8,#0x18]\n"
                 "LDR     R1, [R8,#0x60]\n"
                 "BL      sub_FF02B16C\n"
                 "CMP     R0, #9\n"
                 "BEQ     loc_FF187F10\n"
                 "LDR     R0, [SP,#0x5C]\n"
                 "CMP     R0, #0\n"
                 "BEQ     loc_FF187F98\n"

 "loc_FF187F90:\n"
                 "MOV     R1, #1\n"
                 "B       loc_FF188214\n"

 "loc_FF187F98:\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "MOV     R4, #5\n"
                 "CMP     R0, #2\n"
                 "MOV     R0, #1\n"
                 "BNE     loc_FF187FD4\n"
                 "BL      sub_FF2AF428\n"
                 "BL      sub_FF2AF450\n"
                 "MOV     R0, #0\n"
                 "BL      sub_FF045E54\n"
                 "BL      sub_FF045E64\n"
                 "STR     R4, [R8,#0x44]\n"
                 "BL      loc_FF188A74\n"
                 "BL      sub_FF045EC0\n"
                 "STR     R10, [R8,#0x44]\n"
                 "B       loc_FF187FE0\n"

 "loc_FF187FD4:\n"
                 "BL      sub_FF2ADDC0\n"
                 "BL      sub_FF2ADE0C\n"
                 "STR     R4, [R8,#0x44]\n"

 "loc_FF187FE0:\n"
                 "STR     R7, [R8,#0x34]\n"
                 "B       loc_FF187DF8\n"

 "loc_FF187FE8:\n"

                 "CMP     R5, #1\n"
                 "BNE     loc_FF188264\n"
                 "STR     R10, [R8,#0x38]\n"
                 "LDR     R0, [R8,#0x6C]\n"
                 "LDR     R11, [R4,#0xC]\n"
                 "CMP     R0, #0\n"
                 "LDRNE   R9, [SP,#0x58]\n"
                 "LDRNE   R10, [SP,#0x54]\n"
                 "BNE     loc_FF188134\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "CMP     R0, #2\n"
                 "BNE     loc_FF18808C\n"
                 "LDR     R0, =sub_FF187C10\n"
                 "MOV     R1, #0\n"
                 "BL      sub_FF2AF468\n"
                 "LDR     R2, [R8,#0x64]\n"
                 "ADD     R3, SP, #0x5C\n"
                 "STRD    R2, [SP,#0x28]\n"
                 "MOV     R2, #0x18\n"
                 "ADD     R1, SP, #0x34\n"
                 "ADD     R0, SP, #0x10\n"
                 "BL      sub_FF3AB7E8\n"  //1.01b
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "MOV    R3, #0xFFFFFFFF\n"
                 "ADD     R0, SP, #0x60\n"
                 "STMEA   SP, {R0-R3}\n"
                 "LDR     R0, [SP,#0x58]\n"
                 "LDR     R1, [SP,#0x54]\n"
                 "LDR     R2, [SP,#0x50]\n"
                 "LDR     R3, [SP,#0x4C]\n"
                 "BL      sub_FF2AF3B4\n"
                 "LDR     R0, [R8,#0x18]\n"
                 "LDR     R1, [R8,#0x60]\n"
                 "BL      sub_FF02B16C\n"
                 "CMP     R0, #9\n"
                 "BEQ     loc_FF187F10\n"
                 "LDR     R0, =0xFF18713C\n"
                 "MOV     R1, #0\n"
                 "BL      sub_FF2AF468\n"
                 "B       loc_FF1880F4\n"

 "loc_FF18808C:\n"
                 "LDR     R0, [R4,#0x20]\n"
                 "LDR     R2, [R8,#0x64]\n"
                 "ADD     R3, SP, #0x5C\n"
                 "MOV    R1, #0xFFFFFFFF\n"
                 "ADD     R9, SP, #0x1C\n"
                 "STMIA   R9, {R0-R3}\n"
                 "LDR     R3, [R4,#0x1C]\n"
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "ADD     R0, SP, #0x60\n"
                 "ADD     R9, SP, #0xC\n"
                 "STMIA   R9, {R0-R3}\n"
                 "LDR     R1, [SP,#0x50]\n"
                 "LDR     R2, [SP,#0x54]\n"
                 "LDR     R3, [SP,#0x4C]\n"
                 "STMFA   SP, {R1,R3}\n"
                 "STR     R2, [SP]\n"
                 "LDMIB   R4, {R0,R1}\n"
                 "LDR     R3, [SP,#0x58]\n"
                 "MOV     R2, R11\n"
                 "BL      sub_FF2ADD10\n"
                 "LDR     R0, [R8,#0x18]\n"
                 "LDR     R1, [R8,#0x60]\n"
                 "BL      sub_FF02B16C\n"
                 "CMP     R0, #9\n"
                 "BEQ     loc_FF187F10\n"

 "loc_FF1880F4:\n"
                 "LDR     R0, [SP,#0x5C]\n"
                 "CMP     R0, #0\n"
                 "BNE     loc_FF187F90\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "CMP     R0, #2\n"
                 "MOV     R0, #1\n"
                 "BNE     loc_FF188118\n"
                 "BL      sub_FF2AF428\n"
                 "B       loc_FF18811C\n"

 "loc_FF188118:\n"
                 "BL      sub_FF2ADDC0\n"

 "loc_FF18811C:\n"
                 "STR     R7, [R8,#0xE8]\n"
                 "LDR     R0, [SP,#0x60]\n"
                 "LDR     R1, [SP,#0x58]\n"
                 "ADD     R9, R1, R0\n"
                 "LDR     R1, [SP,#0x54]\n"
                 "SUB     R10, R1, R0\n"

 "loc_FF188134:\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "LDR     R2, [R8,#0x64]\n"
                 "CMP     R0, #2\n"
                 "ADD     R3, SP, #0x5C\n"
                 "BNE     loc_FF18818C\n"
                 "STRD    R2, [SP,#0x28]\n"
                 "MOV     R2, #0x18\n"
                 "ADD     R1, SP, #0x34\n"
                 "ADD     R0, SP, #0x10\n"
                 "BL      sub_FF3AB7E8\n"  //1.01b
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "LDR     R3, [R8,#0x68]\n"
                 "ADD     R0, SP, #0x60\n"
                 "STMEA   SP, {R0-R3}\n"
                 "LDR     R2, [SP,#0x50]\n"
                 "LDR     R3, [SP,#0x4C]\n"
                 "MOV     R1, R10\n"
                 "MOV     R0, R9\n"
                 "BL      sub_FF2AF3B4\n"
                 "BL      sub_FF045E4C\n"
                 "B       loc_FF1881E4\n"

 "loc_FF18818C:\n"
                 "LDR     R1, [R8,#0x68]\n"
                 "LDR     R0, [R4,#0x20]\n"
                 "STR     R1, [SP,#0x20]\n"
                 "STR     R0, [SP,#0x1C]\n"
                 "STR     R2, [SP,#0x24]\n"
                 "STR     R3, [SP,#0x28]\n"
                 "LDR     R3, [R4,#0x1C]\n"
                 "LDR     R1, [R8,#0x84]\n"
                 "LDR     R2, [R8,#0x88]\n"
                 "ADD     R0, SP, #0x60\n"
                 "STR     R2, [SP,#0x14]\n"
                 "LDR     R2, [SP,#0x50]\n"
                 "STR     R1, [SP,#0x10]\n"
                 "STR     R3, [SP,#0x18]\n"
                 "LDR     R3, [SP,#0x4C]\n"
                 "STR     R0, [SP,#0xC]\n"
                 "STMFA   SP, {R2,R3}\n"
                 "STR     R10, [SP]\n"
                 "LDMIB   R4, {R0,R1}\n"
                 "MOV     R3, R9\n"
                 "MOV     R2, R11\n"
                 "BL      sub_FF2ADD10\n"

 "loc_FF1881E4:\n"
                 "LDR     R0, [R8,#0x18]\n"
                 "LDR     R1, [R8,#0x60]\n"
                 "BL      sub_FF02B16C\n"
                 "CMP     R0, #9\n"
                 "BNE     loc_FF188204\n"
                 "MOV     R1, #0\n"

 "loc_FF1881FC:\n"
                 "MOV     R0, #0x90000\n"
                 "B       loc_FF188218\n"

 "loc_FF188204:\n"
                 "LDR     R0, [SP,#0x5C]\n"
                 "CMP     R0, #0\n"
                 "BEQ     loc_FF188220\n"
                 "MOV     R1, #0\n"

 "loc_FF188214:\n"
                 "MOV     R0, #0xA0000\n"

 "loc_FF188218:\n"
                 "BL      sub_FF187550\n"
                 "B       loc_FF187DF8\n"

 "loc_FF188220:\n"
                 "LDR     R0, [R8,#0xC]\n"
                 "CMP     R0, #2\n"
                 "MOV     R0, #0\n"
                 "BNE     loc_FF188238\n"
                 "BL      sub_FF2AF428\n"
                 "B       loc_FF18823C\n"

 "loc_FF188238:\n"
                 "BL      sub_FF2ADDC0\n"

 "loc_FF18823C:\n"
                 "LDR     R0, [SP,#0x58]\n"
                 "LDR     R1, [SP,#0x60]\n"
                 "BL      sub_FF2FCDD0\n"  //1.01b
                 "LDR     R0, [R8,#0x68]\n"
                 "LDR     R3, =0x85D8\n"      //85d8 - 4
                 "ADD     R1, R0, #1\n"
                 "STR     R1, [R8,#0x68]\n"
                 "LDR     R0, [SP,#0x60]\n"
                 "SUB     R2, R3, #4\n"       //-4
                 "BL      sub_FF2F95B0\n"	//1.01b

				 "LDR 		R0, =0x85D4 \n"			// added from s95 code. maybe not needed. was 0x71AC(71b0 - 4)
				 "BL		set_quality \n"			// added

 "loc_FF188264:\n"
                 "CMP     R6, #1\n"
                 "BNE     loc_FF188278\n"

 "loc_FF18826C:\n"
                 "BL      sub_FF045E50\n"
                 "MOV     R0, #1\n"
                 "BL      sub_FF045E54\n"

 "loc_FF188278:\n"
                 "CMP     R5, #1\n"
                 "LDRNEH  R0, [R8,#6]\n"
                 "CMPNE   R0, #3\n"
                 "BNE     loc_FF187DF8\n"
                 "LDR     R0, [R8,#0x6C]\n"
                 "ADD     R0, R0, #1\n"
                 "STR     R0, [R8,#0x6C]\n"
                 "LDRH    R1, [R8,#6]\n"
                 "CMP     R1, #3\n"
                 "LDRNE   R1, [R8,#0x54]\n"
                 "LDREQ   R1, =0x3E9\n"
                 "MUL     R0, R1, R0\n"
                 "LDRNE   R1, [R8,#0x50]\n"
                 "LDREQ   R1, =0x1770\n"
                 "BL      sub_FF3ABB04\n"  //1.01b
                 "MOV     R4, R0\n"
                 "BL      sub_FF2FD464\n"  //1.01b
                 "LDR     R0, [R8,#0x8C]\n"
                 "CMP     R0, R4\n"
                 "BNE     loc_FF1882D4\n"
                 "LDR     R0, [R8,#0x3C]\n"
                 "CMP     R0, #1\n"
                 "BNE     loc_FF1882E8\n"

 "loc_FF1882D4:\n"
                 "LDR     R1, [R8,#0xBC]\n"
                 "MOV     R0, R4\n"
                 "BLX     R1\n"
                 "STR     R4, [R8,#0x8C]\n"
                 "STR     R7, [R8,#0x3C]\n"

 "loc_FF1882E8:\n"
                 "STR     R7, [R8,#0x38]\n"
                 "B       loc_FF187DF8\n"

 //added to fix compiler error
 "loc_FF188A74:\n"
                 "LDR     R0, =0xC2E3C\n"
                 "LDR     R0, [R0,#8]\n"
                 "CMP     R0, #0\n"
                 "BEQ     sub_FF1863B0\n"
                 "BNE     sub_FF05BA94\n"

	);
 }

