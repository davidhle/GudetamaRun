#include "myLib.h"
#include "bg.h"
#include "spritesheet.h"
#include "game.h"

PLAYER player;
BULLET bullets[BULLETCOUNT];
OBJ_ATTR shadowOAM[128];
extern int hOff;

void initialize() {
	// Initialize Player
	player.row = 115;
	player.col = 5;
	player.height = 37;
	player.width = 29;
	player.bulletTimer = 20;
}

void draw() {
	drawPlayer();
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
    DMANow(3, shadowOAM, OAM, 128*4);
}

void update() {
	updatePlayer();
}

void updatePlayer() {
	if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.col < SCREENWIDTH/2 - player.width/2 && hOff > 0) {
            hOff--;
        } else if (player.col > 1 && player.col < 512 - player.width - 1) {
        	player.col--;
        }
	} else if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.col > SCREENWIDTH/2 - player.width/2 && hOff < MAPWIDTH - SCREENWIDTH) {
            hOff++;
        } else if (player.col > 0 && player.col < MAPWIDTH - player.width - hOff - 1) {
        	player.col++;
        }
	}
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}