#include "myLib.h"

//State variables
enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;

//allows button pressed to work
unsigned int buttons;
unsigned int oldButtons;

// allows scrolling of background
// int hOff = 0;
int timer = 0;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int main()
{
    // to enable sprites in the register display control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;
    
    while(1)
    {
        // allows buttonpressed to work
        oldButtons = buttons;
        buttons = BUTTONS;

    }
}
