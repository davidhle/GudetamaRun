#include "myLib.h"
#include "splash.h"
#include "bg.h"
#include "pause.h"
#include "game.h"
#include "spritesheet.h"

//State variables
enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;

//allows button pressed to work
unsigned short buttons;
unsigned short oldButtons;

// allows scrolling of background
int hOff;
int timer = 0;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int main()
{
    hideSprites();
    goToSplash();
    initialize();
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
    waitForVBlank();
    loadPalette(splashPal);

    DMANow(3, splashTiles, &CHARBLOCK[0], splashTilesLen/2);
    DMANow(3, splashMap, &SCREENBLOCK[31], splashMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    state = SPLASH;
}

void splash() {
    // pressing start goes to game
    if(BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
    }
}

void goToGame() {
    waitForVBlank();
    state = GAME;
    loadPalette(bgPal);
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE; 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE;
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
    DMANow(3, bgMap, &SCREENBLOCK[30], bgMapLen/2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
}

void game() {
    REG_BG1HOFF = hOff;
    timer++;
    waitForVBlank();
    update();
    draw();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
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
    waitForVBlank();

    loadPalette(pausePal);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        // initialize();
        goToSplash();
    }
}