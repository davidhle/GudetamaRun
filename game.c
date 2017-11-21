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
	hOff = 0;
	player.row = 115;
	player.col = 5;
	player.height = 37;
	player.width = 29;
	player.bulletTimer = 20;
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 6;
		bullets[i].width = 8;
		bullets[i].row = 0;
		bullets[i].col = -bullets[i].width;
		bullets[i].rdel = 0;
		bullets[i].cdel = 1;
		bullets[i].active = 0;
		bullets[i].index = i + 1;
	}
}

void draw() {
	drawPlayer();
	// draws bullets when active
	for (int i = 0; i < BULLETCOUNT; i++) {
    	drawBullet(&bullets[i]);
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawBullet(BULLET* b) {
	if (b -> active) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
		shadowOAM[b->index].attr2 = ATTR2_TILEID(0, 4);
	} else {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

void update() {
	updatePlayer();
	// update all bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}
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
	} else if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 16) {
		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

void updateBullet(BULLET* b) {
	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0 + player.width - 1
            && b->col + b->cdel < MAPWIDTH - player.width - 1) {

			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

void fireBullet() {
	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			// Position the new bullet 
			bullets[i].row = player.row + player.height / 2;
			bullets[i].col = player.col + player.width;
			// Take the bullet out of the pool
			bullets[i].active = 1;
			// Break out of the loop
			break;
		}
	}
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}