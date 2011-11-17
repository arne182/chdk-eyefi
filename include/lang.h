#ifndef LANG_H
#define LANG_H

//-------------------------------------------------------------------
extern void lang_init(int num);

extern void lang_parse_from_mem(char *buf);
extern void lang_load_from_file(const char *filename);
extern void lang_map_preparsed_from_mem( char* gui_lang_default, int num );

typedef void (*callback_process_file)(char* buf);
extern void load_from_file(const char *filename, callback_process_file callback) ;

extern char* lang_str(int str);

//-------------------------------------------------------------------
#endif
