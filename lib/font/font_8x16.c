#include "font.h"
#include "stdlib.h"
#include "codepages.h"
#include "font_8x16_uni_packed.h"

//-------------------------------------------------------------------
#define DEFAULT_SYMBOL          0xFFFD

//-------------------------------------------------------------------
unsigned char current_font[256][16];

//-------------------------------------------------------------------
static FontData* font_find_data (int charcode) {
    int i=0, c;

    while (1)
    {
        FontData *f = (FontData*)(font_data+i);
        c = (f->charcode[1] << 8) | f->charcode[0];
        if (c == 0xFFFF) return 0;
        if (c == charcode) return f;
        i = i + f->size + sizeof(FontData);
    }
    return 0;
}

//-------------------------------------------------------------------
static void font_init_data(const unsigned short *src, int st, int num) {
    int i;
    FontData *f;
    unsigned char *p;

    for (i=0; i<num; ++i) {
        f = font_find_data(src[i]);
        if (f == 0) 
        {
            f = font_find_data(DEFAULT_SYMBOL);
        }
        p = (unsigned char*)f + sizeof(FontData);
        memset(current_font[st+i], 0, 16);
        if (f->size > 0) memcpy(current_font[st+i]+f->offset, p, f->size);
    }
}

//-------------------------------------------------------------------
void font_init() {
    font_init_data(cp_common, 0, 128);
//    font_init_data(codepages[FONT_CP_WIN_1251], 128, 128);
}

//-------------------------------------------------------------------
void font_set(int codepage) {
    font_init_data(codepages[codepage], 128, 128);
}

//-------------------------------------------------------------------
