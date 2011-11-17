static void __attribute__((noreturn)) shutdown();
static void __attribute__((noreturn)) panic(int cnt);

extern long *blob_chdk_core;
extern long *blob_copy_and_reset;
extern long blob_chdk_core_size;
extern long blob_copy_and_reset_size;



void __attribute__((noreturn)) my_restart()
{
    void __attribute__((noreturn)) (*copy_and_restart)(char *dst, char *src, long length);
    int i;
	
    /* New code for proving the code is executed and firmware works */
    #define LED_GREEN        0xC0220130 //LED light up green
    #define LED_ORANGE     0xC0220134 //Same LED light up orange now
    #define LED_AF         0xC0223030
 
    int j;
    int k=4;
 
    for(;k>0;k--)
    {
        /* Turn on the LEDS */
        *((volatile int *) LED_AF) = 0x46;
        /* ((volatile int *) LED_ORANGE) = 0x46; */
        *((volatile int *) LED_GREEN) = 0x46;
 
        /* Wait a while */
        for (j=0; j<500000; j++)
        {
                asm volatile ( "nop\n" );
        }
 
        /* Turn them off again */
        *((volatile int *) LED_AF) = 0x44;
        /* ((volatile int *) LED_ORANGE) = 0x44; */
        *((volatile int *) LED_GREEN) = 0x44;
 
        /* Wait a while again */
        for (j=0; j<500000; j++)
        {
                asm volatile ( "nop\n" );
        }
    }

    for (i=0; i<(blob_copy_and_reset_size/sizeof(long)); i++){
	((long*)(RESTARTSTART))[i] = blob_copy_and_reset[i];
    }

    copy_and_restart = (void*)RESTARTSTART;
    copy_and_restart((void*)MEMISOSTART, (char*)blob_chdk_core, blob_chdk_core_size);
}

#define LED_PR 0xC0220060


static void __attribute__((noreturn)) shutdown()
{
    volatile long *p = (void*)LED_PR;       // turned off later, so assumed to be power

    asm(
         "MRS     R1, CPSR\n"
         "AND     R0, R1, #0x80\n"
         "ORR     R1, R1, #0x80\n"
         "MSR     CPSR_cf, R1\n"
         :::"r1","r0");

    *p = 0x44;  // led off.

    while(1);
}


static void __attribute__((noreturn)) panic(int cnt)
{
	volatile long *p=(void*)LED_PR;
	int i;

	for(;cnt>0;cnt--){
		p[0]=0x46;

		for(i=0;i<0x200000;i++){
			asm ("nop\n");
			asm ("nop\n");
		}
		p[0]=0x44;
		for(i=0;i<0x200000;i++){
			asm ("nop\n");
			asm ("nop\n");
		}
	}
	shutdown();
}
