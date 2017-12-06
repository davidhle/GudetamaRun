/**
Welcome to Gudetama Run!

Gudetama is an egg that got chosen to be cooked, and is
running to make his way back home to his egg carton so
he can go back to sleep.

Gameplay:
Make your way to the end of the map by overcoming
enemies and obstacles. In the first round of enemies,
they shoot bullets and they sequentially shoot faster
(the spatula shoots faster than the ladel and the
oven mitt shoots faster than the spatula)
To win, you need to get to the egg carton, meaning
you have to jump once you've reached the carton.

Extra things added:
- Custom art
- Losing more than 2 times shows the cheat to the user
- Alpha blending of knives when the player isn't using the cheat
- No affine sprites, but if I say so myself, I have some (af)FINE sprites !!
- Added knives because of feedback that the original gameplay was too easy
    - spawn at random rows and at different speeds (-5 to 5 rdel excluding 0)
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
#include "text.h"
#include "font.h"
#include "splash2.h"
#include "pause2.h"

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
int score;
int instructionsInt;
int restart;

// Text Buffer
char buffer[41];

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
    restart = 0;
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
    instructionsInt = 0;
    splashBG();
    waitForVBlank();
    playSoundA(splashMusic , SPLASHMUSICLEN, SPLASHMUSICFREQ, 1);
    state = SPLASH;
}

void splashBG() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    if (instructionsInt) {
        drawFullscreenImage3(splash2Bitmap);
    } else {
        drawFullscreenImage3(splashBitmap);
    }
}

void splash() {
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        instructionsInt = 1;
        splashBG();
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        instructionsInt = 0;
        splashBG();
    }
    if (instructionsInt) {
        if (BUTTON_PRESSED(BUTTON_START)) {
            goToInstructions();
        }
    } else {
        if (BUTTON_PRESSED(BUTTON_START))
        {
            goToGame();
        }
    }
}

void goToInstructions() {
    waitForVBlank();
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    drawFullscreenImage3(instructionsBitmap);
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
    sprintf(buffer, "%d", score);
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
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    drawFullscreenImage3(winBitmap);
    playSoundA(winMusic , WINMUSICLEN, WINMUSICFREQ, 1);
    drawString(92, 110, buffer, EGGYOLK);
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
    drawString(92, 110, buffer, EGGYOLK);
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
    playSoundA(pauseMusic , PAUSEMUSICLEN, PAUSEMUSICFREQ, 1);
    restart = 0;
    waitForVBlank();
    pauseBG();
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        restart = 1;
        pauseBG();
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        restart = 0;
        pauseBG();
    }
    if (restart) {
        if (BUTTON_PRESSED(BUTTON_START)) {
            initialize();
            goToSplash();
        }
    } else {
        if (BUTTON_PRESSED(BUTTON_START))
        {
            goToGame();
        }
    }
}

void pauseBG() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    if (restart) {
        drawFullscreenImage3(pause2Bitmap);
    } else {
        drawFullscreenImage3(pauseBitmap);
    }
}