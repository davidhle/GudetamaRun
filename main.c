/**
Welcome to Gudetama Run!

Gudetama is an egg that got chosen to be cooked, and is
running to make his way back home to his egg carton.

Gameplay:
Make your way to the end of the map by overcoming
enemies and obstacles. In the first round of enemies,
they shoot bullets and they sequentially shoot faster
(the spatula shoots faster than the ladel and the
oven mitt shoots faster than the spatula)
To win, you need to get to the egg carton, meaning
you have to jump once you've reached the carton.

Known bugs:

Extra things added:
- Custom art
- Losing more than 2 times shows the cheat to the user

**/

#include "myLib.h"
#include "splash.h"
#include "bg.h"
#include "pause.h"
#include "game.h"
#include "instructions.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "loseMusic.h"
#include "gameMusic.h"
#include "splashMusic.h"
#include "bg2.h"
#include "winMusic.h"
#include "pauseMusic.h"
#include "lose2.h"

// State variables
enum { SPLASH, INSTRUCTIONS, GAME, WIN, LOSE, PAUSE };
int state;

//allows button pressed to work
unsigned short buttons;
unsigned short oldButtons;

// allows scrolling of background
int hOff;
int timer = 0;
int gamesLost;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int main()
{
    hideSprites();
    goToSplash();
    initialize();
    setupSounds();
    setupInterrupts();
    gamesLost = 0;
    while(1)
    {
        // allows buttonpressed to work
        oldButtons = buttons;
        buttons = BUTTONS;
        switch (state) {
        	case SPLASH:
        		splash();
        		break;
            case INSTRUCTIONS:
                instructions();
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
    playSoundA(splashMusic , SPLASHMUSICLEN, SPLASHMUSICFREQ, 1);
    loadPalette(splashPal);

    DMANow(3, splashTiles, &CHARBLOCK[0], splashTilesLen/2);
    DMANow(3, splashMap, &SCREENBLOCK[31], splashMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    state = SPLASH;
}

void splash() {
    // pressing start goes to instructions
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToInstructions();
    }
}

void goToInstructions() {
    waitForVBlank();
    loadPalette(instructionsPal);

    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCK[31], instructionsMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    state = INSTRUCTIONS;
}

void instructions() {
    // pressing start goes to game
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        goToSplash();
    }
}

void goToGame() {
    waitForVBlank();
    playSoundA(gameMusic , GAMEMUSICLEN, GAMEMUSICFREQ, 1);
    loadPalette(bgPal);
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | SPRITE_ENABLE; 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE;
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
    DMANow(3, bgMap, &SCREENBLOCK[30], bgMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, bg2Tiles, &CHARBLOCK[1], bg2TilesLen/2);
    DMANow(3, bg2Map, &SCREENBLOCK[28], bg2MapLen/2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    state = GAME;
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
    waitForVBlank();
    loadPalette(winPal);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen/2);

    playSoundA(winMusic , WINMUSICLEN, WINMUSICFREQ, 1);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;  
    state = WIN; 
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        goToSplash();
    }
}

void goToLose() {
    waitForVBlank();
    gamesLost++;
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    if (gamesLost > 2) {
        drawFullscreenImage3(lose2Bitmap);
    } else {
        drawFullscreenImage3(loseBitmap);
    }
    playSoundA(loseMusic , LOSEMUSICLEN, LOSEMUSICFREQ, 1);
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        goToSplash();
    }
}

void goToPause() {
    waitForVBlank();
    loadPalette(pausePal);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);
    playSoundA(pauseMusic , PAUSEMUSICLEN, PAUSEMUSICFREQ, 1);
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
        initialize();
        goToSplash();
    }
}