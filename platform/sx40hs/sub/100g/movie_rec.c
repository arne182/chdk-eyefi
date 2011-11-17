#include "conf.h"

void change_video_tables(int a, int b){
}

void  set_quality(int *x){ // -17 highest; +12 lowest
 if (conf.video_mode) *x=12-((conf.video_quality-1)*(12+17)/(99-1));
}

// @ 0xff07854c
void __attribute__((naked,noinline)) movie_record_task(){ 

 asm volatile(
"                STMFD   SP!, {R2-R12,LR} \n"
"                LDR     R11, =0x68E \n"
"                LDR     R7, =0xFF0772A4 \n"
"                LDR     R8, =0xFF077F30 \n"
"                LDR     R9, =0xFF075688 \n"
"                LDR     R4, =0x2ED8 \n"
"                LDR     R10, =0x2710 \n"
"                MOV     R5, #1 \n"
"                MOV     R6, #0 \n"

"loc_FF078570: \n"
"                LDR     R0, [R4,#0x24] \n"
"                MOV     R2, #0 \n"
"                ADD     R1, SP, #4 \n"
"                BL      sub_FF02B0F4 \n"
"                LDR     R2, =0xFF074F3C \n"	// aMovierecorder_
"                LDR     R0, [R4,#0x12C] \n"
"                MOV     R3, R11 \n"
"                MOV     R1, R10 \n"
"                BL      sub_FF02BA14 \n"
"                LDR     R0, [R4,#0x2C] \n"
"                CMP     R0, #0 \n"
"                LDRNE   R0, [R4,#0xC] \n"
"                CMPNE   R0, #2 \n"
"                LDRNE   R0, [R4,#0x44] \n"
"                CMPNE   R0, #6 \n"
"                BNE     loc_FF0786DC \n"
"                LDR     R0, [SP,#4] \n"
"                LDR     R1, [R0] \n"
"                SUB     R1, R1, #2 \n"
"                CMP     R1, #0xF \n"
"                ADDCC   PC, PC, R1,LSL#2 \n"

"                B       loc_FF0786DC \n"
"                B       loc_FF078670 \n"
"                B       loc_FF07868C \n"
"                B       loc_FF07869C \n"
"                B       loc_FF0786A4 \n"
"                B       loc_FF0786AC \n"
"                B       loc_FF0786B4 \n"
"                B       loc_FF078678 \n"
"                B       loc_FF0786BC \n"
"                B       loc_FF078684 \n"
"                B       loc_FF0786DC \n"
"                B       loc_FF0786CC \n"
"                B       loc_FF0786D4 \n"
"                B       loc_FF0786C4 \n"
"                B       loc_FF078638 \n"
"                B       loc_FF078604 \n"

"loc_FF078604: \n"
//"; jumptable FF8833B8 entry 14 \n"
"                STR     R6, [R4,#0x40] \n"
"                STR     R6, [R4,#0x30] \n"
"                STR     R6, [R4,#0x34] \n"
"                STRH    R6, [R4,#6] \n"
"                STR     R7, [R4,#0xD8] \n"
"                STR     R8, [R4,#0xF4] \n"
"                STR     R9, [R4,#0xF8] \n"
"                LDR     R0, [R4,#0xC] \n"
"                ADD     R0, R0, #1 \n"
"                STR     R0, [R4,#0xC] \n"
"                MOV     R0, #6 \n"
"                STR     R0, [R4,#0x44] \n"
"                B       loc_FF07865C \n"

"loc_FF078638: \n"
//"; jumptable FF8833B8 entry 13 \n"
"                STR     R6, [R4,#0x40] \n"
"                STR     R6, [R4,#0x30] \n"
"                STR     R7, [R4,#0xD8] \n"
"                STR     R8, [R4,#0xF4] \n"
"                STR     R9, [R4,#0xF8] \n"
"                LDR     R0, [R4,#0xC] \n"
"                ADD     R0, R0, #1 \n"
"                STR     R0, [R4,#0xC] \n"
"                STR     R5, [R4,#0x44] \n"

"loc_FF07865C: \n"
"                LDR     R2, =0xFF07568C \n"
"                LDR     R1, =0x3F118 \n"
"                LDR     R0, =0xFF0757D4 \n"
"                BL      sub_FF0472B8 \n"
"                B       loc_FF0786DC \n"

"loc_FF078670: \n"
//"; jumptable FF8833B8 entry 0
"                BL      sub_FF077AA8 \n"
"                B       loc_FF0786DC \n"

"loc_FF078678: \n"
//"; jumptable FF8833B8 entry 6
"                LDR     R1, [R4,#0xF4] \n"
"                BLX     R1 \n"

"                LDR 	 R0, =0x2F5C \n"         //added - Found @FF0784A8
"                BL		 set_quality \n"         //added

"                B       loc_FF0786DC \n"

"loc_FF078684: \n"
//"; jumptable FF8833B8 entry 8
"                BL      sub_FF078D84 \n"
"                B       loc_FF0786DC \n"

"loc_FF07868C: \n"
//"; jumptable FF8833B8 entry 1
"                LDR     R0, [R4,#0x44] \n"
"                CMP     R0, #5 \n"
"                STRNE   R5, [R4,#0x34] \n"
"                B       loc_FF0786DC \n"

"loc_FF07869C: \n"
//"; jumptable FF8833B8 entry 2
"                BL      sub_FF076F3C \n"
"                B       loc_FF0786DC \n"

"loc_FF0786A4: \n"
//"; jumptable FF8833B8 entry 3
"                BL      sub_FF076C50 \n"
"                B       loc_FF0786DC \n"

"loc_FF0786AC: \n"
//"; jumptable FF8833B8 entry 4
"                BL      sub_FF076A0C \n"
"                B       loc_FF0786DC \n"

"loc_FF0786B4: \n"
//"; jumptable FF8833B8 entry 5
"                BL      sub_FF0767A0 \n"
"                B       loc_FF0786DC \n"

"loc_FF0786BC: \n"
//"; jumptable FF8833B8 entry 7
"                BL      sub_FF075848 \n"
"                B       loc_FF0786DC \n"

"loc_FF0786C4: \n"
//"; jumptable FF8833B8 entry 12
"                BL      sub_FF078CAC \n"
"                B       loc_FF0786DC \n"

"loc_FF0786CC: \n"
//"; jumptable FF8833B8 entry 10
"                BL      sub_FF0765B8 \n"
"                B       loc_FF0786DC \n"

"loc_FF0786D4: \n"
//"; jumptable FF8833B8 entry 11
"                BL      sub_FF07642C \n"
"                STR     R5, [R4,#0x158] \n"

"loc_FF0786DC: \n"
//"; jumptable FF8833B8 default entry \n"
//"; jumptable FF8833B8 entry 9 \n"
"                LDR     R1, [SP,#4] \n"
"                LDR     R3, =0x6D6 \n"
"                STR     R6, [R1] \n"
"                STR     R3, [SP] \n"
"                LDR     R3, =0xFF074F3C \n" //;aMovierecorder_
"                LDR     R0, [R4,#0x28] \n"
"                MOV     R2, R10 \n"
"                BL      sub_FF02BA6C \n"
"                LDR     R0, [R4,#0x12C] \n"
"                BL      _GiveSemaphore \n"
"                B       loc_FF078570 \n"
 );
}

