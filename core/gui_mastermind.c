#include "stdlib.h"
#include "keyboard.h"
#include "platform.h"
#include "core.h"
#include "lang.h"
#include "conf.h"
#include "gui.h"
#include "gui_draw.h"
#include "gui_lang.h"
#include "gui_batt.h"
#include "gui_mbox.h"
#include "gui_mastermind.h"

#define BORDER		 		20
#define RECT_SIZE	 		10
#define COLOR_LIGHT_GRAY 	MAKE_COLOR(COLOR_SPLASH_GREY,COLOR_SPLASH_GREY)
#define BG_COLOR	 		MAKE_COLOR(COLOR_GREY,COLOR_GREY)
#define TEXT_COLOR          MAKE_COLOR(BG_COLOR,COLOR_BLACK)

int curr_x;
int curr_y;
int answer[4];
char colors[6] = { COLOR_HISTO_R_PLAY, COLOR_HISTO_G_PLAY, COLOR_HISTO_B_PLAY, COLOR_YELLOW, COLOR_WHITE, COLOR_BLACK };
int curr_color[4];
int GameGo;
static char buf[128];

static void guess_box(int pos, color col)
{
	draw_filled_rect(CAM_TS_BUTTON_BORDER+100+(pos*10), BORDER+(2*curr_y*10)+2+2*curr_y, CAM_TS_BUTTON_BORDER+100+(pos*10)+6, BORDER+(2*curr_y*10)+8+2*curr_y , MAKE_COLOR(col,col));
}

char WinQuary(){
	char pos=0;
	int i, j;
	
	for (i=0; i<4; i++)
    {
		if (answer[i] == curr_color[i])
        {
            guess_box(pos,COLOR_BLACK);
			pos++;
		}
	}
	
	if (pos == 4)
    {
		GameGo = 0;
		return 1;
	}
	
	for (i=0; i<4; i++)
    {
    	for (j=0; j<4; j++)
        {
		    if ((answer[i] == curr_color[j]) && (i != j))
            {
                guess_box(pos,COLOR_WHITE);
			    pos++;
            }
		}
	}

	if(curr_y==0)
    {
		GameGo = 0;
		return 2;
	}

	return 0;
}

char CanNext(){
	if (curr_color[0]==99 || curr_color[1]==99 || curr_color[2]==99 || curr_color[3]==99)
		return 0;
	else if (curr_color[0]==curr_color[1] || curr_color[0]==curr_color[2] || curr_color[0]==curr_color[3] ||
		     curr_color[1]==curr_color[2] || curr_color[1]==curr_color[3] || curr_color[2]==curr_color[3])
    {
		draw_string(CAM_TS_BUTTON_BORDER+167, 130, lang_str(LANG_MENU_GAMES_DCOLOR), TEXT_COLOR);
		return 0;
	}
	return 1;
}

void CreateColorCombo(){
	char tmp=0;
	int i=0;
	
	for (i=0; i<4; i++) answer[i] = 99;
	i = 0;
	while (i<4)
    {
		tmp = rand() % 6;
		if (answer[0]!=tmp && answer[1]!=tmp && answer[2]!=tmp && answer[3]!=tmp)
        {
			answer[i] = tmp;
			i++;
		}
	}
}

int gui_mastermind_init() {
	int i,j;

	curr_x=0;
	curr_y=7;
	
	draw_filled_rect( 0, 0, screen_width-1, screen_height-1, BG_COLOR);

	for (i=0;i<4;i++)
		for (j=0;j<8;j++)
			draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*i*10), BORDER+(2*j*10)+2*j, CAM_TS_BUTTON_BORDER+BORDER+(2*i*10)+10, BORDER+(2*j*10)+2*j+10 , COLOR_LIGHT_GRAY);

	draw_filled_rect(CAM_TS_BUTTON_BORDER+10, BORDER+(2*j*10)+2*j, CAM_TS_BUTTON_BORDER+150,BORDER+(2*j*10)+2*j+1, MAKE_COLOR(BG_COLOR,COLOR_WHITE));
	draw_filled_rect(CAM_TS_BUTTON_BORDER+148, 10, CAM_TS_BUTTON_BORDER+149,230, MAKE_COLOR(BG_COLOR,COLOR_WHITE));
	draw_filled_rect(CAM_TS_BUTTON_BORDER+151, 10, CAM_TS_BUTTON_BORDER+152,230, MAKE_COLOR(BG_COLOR,COLOR_WHITE));
	
	for (i=0; i<6;i++)
		draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*(i+7)*10)+20, 40, CAM_TS_BUTTON_BORDER+BORDER+(2*(i+7)*10)+35,55, MAKE_COLOR(colors[i],colors[i]));
		
	draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+20, 65, CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+35,80, MAKE_COLOR(COLOR_BLACK,COLOR_BLACK));
	draw_string(CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+50, 65 , lang_str(LANG_MENU_GAMES_RIGHT_PLACE), TEXT_COLOR);
	
	draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+20, 90, CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+35,105, MAKE_COLOR(COLOR_WHITE,COLOR_WHITE));
	draw_string(CAM_TS_BUTTON_BORDER+BORDER+(2*7*10)+50, 90 , lang_str(LANG_MENU_GAMES_C_IN_ANSWER), TEXT_COLOR);
					
	draw_string(CAM_TS_BUTTON_BORDER+173, 20 , lang_str(LANG_MENU_GAMES_AC_COLORS), TEXT_COLOR);
		
	draw_string(CAM_TS_BUTTON_BORDER+167, 200 , lang_str(LANG_MENU_GAMES_CURSOR1), TEXT_COLOR);
	draw_string(CAM_TS_BUTTON_BORDER+167, 185 , lang_str(LANG_MENU_GAMES_CURSOR2), TEXT_COLOR);
	draw_string(CAM_TS_BUTTON_BORDER+167, 170 , lang_str(LANG_MENU_GAMES_CURSOR3), TEXT_COLOR);

	for(i=0;i<4;i++) curr_color[i]=99;
	
	return 1;
}
//-------------------------------------------------------------------
static void draw_box(color border)
{
    if (curr_color[curr_x] == 99) curr_color[curr_x] = 0;
    draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*curr_x*10), BORDER+(2*curr_y*10)+2*curr_y, CAM_TS_BUTTON_BORDER+BORDER+(2*curr_x*10)+10, BORDER+(2*curr_y*10)+2*curr_y+10 , MAKE_COLOR(colors[curr_color[curr_x]],border));
}

static void end_game(int msg)
{
    int i;
    draw_string(CAM_TS_BUTTON_BORDER+198, 130 , lang_str(msg), TEXT_COLOR);
	for (i=0; i<4;i++)
	    draw_filled_rect(CAM_TS_BUTTON_BORDER+BORDER+(2*i*10), 213, CAM_TS_BUTTON_BORDER+BORDER+(2*i*10)+10,223,  MAKE_COLOR(colors[answer[i]],colors[answer[i]]));
}

static void chg_box(int inc_box, int inc_val)
{
    draw_box(colors[curr_color[curr_x]]);
    curr_x = (curr_x + inc_box) & 3;
    if (curr_color[curr_x] == 99) curr_color[curr_x] = 0;
    curr_color[curr_x] = (curr_color[curr_x] + inc_val);
    if (curr_color[curr_x] < 0) curr_color[curr_x] = 5;
    else if (curr_color[curr_x] > 5) curr_color[curr_x] = 0;
    draw_box(COLOR_BLACK);
}

void gui_mastermind_kbd_process() {
	int i=0;
	rand();
    long key = kbd_get_autoclicked_key();
    if (key)
    {
        if (GameGo == 1)
        {
            draw_string(CAM_TS_BUTTON_BORDER+167, 130 , "                       ", TEXT_COLOR);
	        switch (kbd_get_autoclicked_key()) 
	        {
		        case KEY_SET:
			        if(CanNext())
                    {
				        if(WinQuary() == 1)
                        {
                            end_game(LANG_MENU_GAMES_RIGHT);
				        }
				        else if(WinQuary() == 2)
                        {
                            end_game(LANG_MENU_GAMES_GAME_OVER);
				        }
				        else
                        {
                            draw_box(colors[curr_color[curr_x]]);
					        for(i=0;i<4;i++) curr_color[i]=99;
					        curr_y--;
					        curr_x=0;
                            draw_box(COLOR_BLACK);
				        }
			        }
			        break;
		        case KEY_LEFT:
                    chg_box(-1,0);
			        break;
		        case KEY_RIGHT:
                    chg_box(1,0);
			        break;
		        case KEY_UP:
                    chg_box(0,1);
			        break;
		        case KEY_DOWN:
                    chg_box(0,-1);
			        break;
	        }
        }
        else if (key == KEY_SET)
        {
			gui_mastermind_init();
			CreateColorCombo();
            draw_box(COLOR_BLACK);
			GameGo=1;
        }
    }
}
//-------------------------------------------------------------------
void gui_mastermind_draw() {
	unsigned long t;
    static struct tm *ttm;

    draw_txt_string(CAM_TS_BUTTON_BORDER/FONT_WIDTH+15, 0, lang_str(LANG_MENU_GAMES_MASTERMIND), MAKE_COLOR(BG_COLOR, COLOR_WHITE));

    t = time(NULL);
    ttm = localtime(&t);
    sprintf(buf, "Time: %2u:%02u  Batt:%3d%%", ttm->tm_hour, ttm->tm_min, get_batt_perc());
    draw_txt_string((screen_width-CAM_TS_BUTTON_BORDER)/FONT_WIDTH-2-1-1-9-2-5-4, screen_height/FONT_HEIGHT-1, buf, TEXT_COLOR);
}
