#include "myLib.h"

//State variables
enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;

//allows button pressed to work
unsigned int buttons;
unsigned int oldButtons;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int main()
{
    // to enable sprites in the register display control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    
    while(1)
    {
        // allows buttonpressed to work
        oldButtons = buttons;
        buttons = BUTTONS;
        switch (state) {
        	case SPLASH:
        		splash();
        		break;
        	case GAME:
        		game();
        		break;
        	case WIN:
        		win();
        		break;
        	case LOSE:
        		lose();
        		break;
        	case PAUSE:
        		pause();
        		break;
        }
    }
}

void goToSplash() {

}

void splash() {

}

void goToGame() {

}

void game() {

}

void goToWin() {

}

void win() {

}

void goToLose() {

}

void lose() {

}

void goToPause() {

}

void pause() {

}