#include "myLib.h"
#include "bg.h"
#include "spritesheet.h"
#include "game.h"

// Struct variables
PLAYER player;
ENEMY ladel;
ENEMY spatula;
ENEMY mitt;
BULLET bullets[BULLETCOUNT];

// To access hOff in main.c
extern int hOff;

// For sprites' attributes
OBJ_ATTR shadowOAM[128];

void initialize() {
	// Background at far left
	hOff = 0;
	initializePlayer();
	initializeBullets();
	initializeEnemies();
}

void initializeEnemies() {
	// initialize the enemies
	ladel.row = 46;
	ladel.col = 121;
	ladel.rdel = 1;
	ladel.height = 63;
	ladel.width = 36;
	ladel.bulletTimer = 20;
	ladel.index = 7;
	ladel.active = 1;

	spatula.row = 44;
	spatula.col = 164;
	spatula.rdel = 1;
	spatula.height = 58;
	spatula.width = 27;
	spatula.bulletTimer = 20;
	spatula.index = 8;
	spatula.active = 1;

	mitt.row = 47;
	mitt.col = 205;
	mitt.rdel = 1;
	mitt.height = 63;
	mitt.width = 39;
	mitt.bulletTimer = 20;
	mitt.index = 9;
	mitt.active = 1;
}

void initializePlayer() {
	// initialize player
	player.row = 115;
	player.col = 5;
	player.height = 37;
	player.width = 29;
	player.bulletTimer = 20;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.rdel = 0;
	player.racc = 30;
	player.maxRSpeed = SHIFTUP(8);
}

void initializeBullets() {
	// loop through all the bullets and initialize them
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
    drawEnemies();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = player.col | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
}

void drawBullet(BULLET* b) {
	// only draw if the bullet's active
	if (b -> active) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
		shadowOAM[b->index].attr2 = ATTR2_TILEID(0, 4);
	} else {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

void drawEnemies() {
	// Only draw them if active
	if (ladel.active) {
		shadowOAM[ladel.index].attr0 = ladel.row | ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[ladel.index].attr1 = ladel.col | ATTR1_LARGE;
    	shadowOAM[ladel.index].attr2 = ATTR2_TILEID(0, 5);
	}
    if (spatula.active) {
    	shadowOAM[spatula.index].attr0 = spatula.row | ATTR0_4BPP | ATTR0_TALL;
    	shadowOAM[spatula.index].attr1 = spatula.col | ATTR1_LARGE;
    	shadowOAM[spatula.index].attr2 = ATTR2_TILEID(6, 0);
    }
    if (mitt.active) {
    	shadowOAM[mitt.index].attr0 = mitt.row | ATTR0_4BPP | ATTR0_TALL;
    	shadowOAM[mitt.index].attr1 = mitt.col | ATTR1_LARGE;
    	shadowOAM[mitt.index].attr2 = ATTR2_TILEID(14, 0);
    }
}

void update() {
	updatePlayer();
	// Update all bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}
	// Update enemies
	updateEnemies();
}

void updatePlayer() {
	// Player movement
	if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.col < SCREENWIDTH/2 - player.width/2 && hOff > 0) {
            hOff--;
        } else if (player.col > 1 && player.col < 512 - player.width - 1) {
        	player.col--;
        }
	} else if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.col > SCREENWIDTH/2 - player.width/2 && hOff < MAPWIDTH - SCREENWIDTH
        	&& !ladel.active && !spatula.active && !mitt.active) {
            hOff++;
        } else if (player.col > 0 && player.col < MAPWIDTH - player.width - hOff - 1) {
        	player.col++;
        }
	} else if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 16) {
		fireBullet();
		player.bulletTimer = 0;
	}
	// If you reach the end, then you win
	if (player.col > MAPWIDTH - player.width - 4 - hOff) {
		goToWin();
	}
	// Lose if you touch an enemy
	if ((collision(ladel.row, ladel.col, ladel.height, ladel.width, 
		player.row, player.col, player.height, player.width) && ladel.active)) {
		goToLose();
	}
	if ((collision(spatula.row, spatula.col, spatula.height, spatula.width, 
		player.row, player.col, player.height, player.width) && spatula.active)) {
		goToLose();
	}
	if ((collision(mitt.row, mitt.col, mitt.height, mitt.width, 
		player.row, player.col, player.height, player.width) && mitt.active)) {
		goToLose();
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

void updateEnemies() {
	// Enemies bounce up and down
	ladel.row += ladel.rdel;
	spatula.row += spatula.rdel;
	mitt.row += mitt.rdel;
	// Hide sprites if they're not active
	if (!ladel.active) {
		shadowOAM[ladel.index].attr0 = ATTR0_HIDE;
	}
	if (!spatula.active) {
		shadowOAM[spatula.index].attr0 = ATTR0_HIDE;
	}
	if (!mitt.active) {
		shadowOAM[mitt.index].attr0 = ATTR0_HIDE;
	}
	// Enemies bounce up and down in bounds
	if (ladel.row > SCREENHEIGHT - 1 - ladel.height || ladel.row < 46) {
		ladel.rdel *= -1;
	}
	if (spatula.row > SCREENHEIGHT - 1 - spatula.height || spatula.row < 44) {
		spatula.rdel *= -1;
	}
	if (mitt.row > SCREENHEIGHT - 1 - mitt.height || mitt.row < 46) {
		mitt.rdel *= -1;
	}
	// Bullet collision with enemies
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active && ladel.active && collision(ladel.row, ladel.col, ladel.height, ladel.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				ladel.active = 0;
				bullets[i].active = 0;
		}
		if (bullets[i].active && spatula.active && collision(spatula.row, spatula.col, spatula.height, spatula.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				spatula.active = 0;
				bullets[i].active = 0;
		}
		if (bullets[i].active && mitt.active && collision(mitt.row, mitt.col, mitt.height, mitt.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				mitt.active = 0;
				bullets[i].active = 0;
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

void drawEnemyBullet(BULLET* b) {

}

void updateEnemyBullet(BULLET* b) {

}

void fireEnemyBullet() {

}

void initializeEnemyBullets() {
	
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}