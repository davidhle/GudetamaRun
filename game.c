#include "myLib.h"
#include "bg.h"
#include "spritesheet.h"
#include "game.h"
#include "shoot.h"
#include "hit.h"
#include "gudetama.h"

// Struct variables
PLAYER player;
ENEMY ladel;
ENEMY spatula;
ENEMY mitt;
BULLET bullets[BULLETCOUNT];
BULLET bullet1;
BULLET bullet2;
BULLET bullet3;
ENEMY knives[KNIFECOUNT];

// To access hOff in main.c
extern int hOff;
int score;
int lives;
int gravCount;

// For sprites' attributes
OBJ_ATTR shadowOAM[128];

void initialize() {
	// Background at far left
	hOff = 0;
	score = 0;
	lives = 3;
	gravCount = 0;
	initializePlayer();
	initializeBullets();
	initializeEnemies();
	initializeEnemyBullets();
}

void initializeEnemies() {
	// initialize the enemies
	ladel.row = 46;
	ladel.col = 121;
	ladel.rdel = 1;
	ladel.height = 63;
	ladel.width = 36;
	ladel.index = 7;
	ladel.active = 1;
	ladel.lives = 3;

	spatula.row = 44;
	spatula.col = 164;
	spatula.rdel = 1;
	spatula.height = 58;
	spatula.width = 27;
	spatula.index = 8;
	spatula.active = 1;
	spatula.lives = 3;

	mitt.row = 47;
	mitt.col = 205;
	mitt.rdel = 1;
	mitt.height = 63;
	mitt.width = 39;
	mitt.index = 9;
	mitt.active = 1;
	mitt.lives = 3;

	// for (int i = 0; i < KNIFECOUNT; i++) {
	// 	knives[i].row = 50;
	// 	knives[i].col = 150;
	// 	knives[i].rdel = 1;
	// 	knives[i].height = 63;
	// 	knives[i].width = 39;
	// 	knives[i].index = 13 + i;
	// 	knives[i].active = 1;
	// }
}

void initializePlayer() {
	// initialize player
	player.worldRow = 125;
	player.worldCol = 5;
	player.height = 23;
	player.width = 19;
	player.bulletTimer = 20;
	player.oldRow = player.worldRow;
	player.oldCol = player.worldCol;
	player.aniState = 0;
	player.rdel = 0;
	player.racc = -1;
	player.maxRSpeed = SHIFTUP(8);
	player.superEgg = 0;
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
		bullets[i].shotBy = 0;
	}
}

void draw() {
	drawPlayer();
	// draws bullets when active
	for (int i = 0; i < BULLETCOUNT; i++) {
    	drawBullet(&bullets[i]);
    }
    drawBullet(&bullet1);
    drawBullet(&bullet2);
    drawBullet(&bullet3);
    drawEnemies();
    drawNumber(0, 40, lives, 50);
    drawNumber(0, 175, score, 51);
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawPlayer() {
	if (player.superEgg) {
		shadowOAM[0].attr0 = player.worldRow | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.worldCol | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState % 2 * 4, 16);
	} else {
	shadowOAM[0].attr0 = player.worldRow | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.worldCol | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState % 2 * 4, 0);
	}
}

void drawBullet(BULLET* b) {
	// only draw if the bullet's active
	if (b -> active) {
		if (!(b -> shotBy)) {
			shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
			shadowOAM[b->index].attr2 = ATTR2_TILEID(0, 4);
		} else if (b -> shotBy == 1 || b -> shotBy == 2 || b -> shotBy == 3) {
			shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
			shadowOAM[b->index].attr2 = ATTR2_TILEID(1, 4);
		}
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
    	shadowOAM[spatula.index].attr2 = ATTR2_TILEID(8, 0);
    }
    if (mitt.active) {
    	shadowOAM[mitt.index].attr0 = mitt.row | ATTR0_4BPP | ATTR0_TALL;
    	shadowOAM[mitt.index].attr1 = mitt.col | ATTR1_LARGE;
    	shadowOAM[mitt.index].attr2 = ATTR2_TILEID(16, 0);
    }
    // if (player.col + hOff > 240) {
    // 	for (int i = 0; i < KNIFECOUNT; i++) {
    // 		if (knives[i].active) {
    // 		shadowOAM[knives[i].index].attr0 = (ROWMASK & knives[i].row) | ATTR0_4BPP | ATTR0_TALL;
    // 		shadowOAM[knives[i].index].attr1 = (COLMASK & knives[i].col) | ATTR1_SMALL;
    // 		shadowOAM[knives[i].index].attr2 = ATTR2_TILEID(0, 20);
    // 		}
    // 	}
    // }
}

void update() {
	updatePlayer();
	// Update all bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}
	updateBullet(&bullet1);
	updateBullet(&bullet2);
	updateBullet(&bullet3);
	// Update enemies
	updateEnemies();
	if (lives == 0) {
		goToLose();
	}
}

void updatePlayer() {
	if (player.aniState >= 18) {
		player.aniState = 14;
	}
	gravCount++;
	// Player movement
    if(BUTTON_HELD(BUTTON_LEFT) && player.worldCol > 4) {
    	if (player.worldCol < SCREENWIDTH/2 - player.width || player.worldCol + hOff >= MAPWIDTH - SCREENWIDTH/2 - player.width || hOff == 0) {
    		player.worldCol--;
    	} else if ((player.screenCol < SCREENWIDTH/2 - player.width/2) && hOff > 0) {
    		hOff--;
    	}
    	player.aniState++;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)
        && player.worldCol + player.width < MAPWIDTH - hOff - 4) {
    	if (player.worldCol < SCREENWIDTH/2 - player.width || player.worldCol + hOff >= MAPWIDTH - SCREENWIDTH/2 - player.width) {
    		player.worldCol++;
    	} else if ((player.worldCol > SCREENWIDTH/2 - player.width || player.worldCol < MAPWIDTH - SCREENWIDTH/2 - player.width)
    		&& hOff < MAPWIDTH - SCREENWIDTH
    		&& !ladel.active && !spatula.active && !mitt.active) {
    		hOff++;
    	}
    	player.aniState++;
    }

	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 16) {
		fireBullet();
		playSoundB(shoot,SHOOTLEN, SHOOTFREQ, 0);
		player.bulletTimer = 0;
	}
	// cheat: make enemies disappear
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		if (!player.superEgg) {
			player.superEgg = 1;
			playSoundB(gudetama,GUDETAMALEN, GUDETAMAFREQ, 0);
		} else {
			player.superEgg = 0;
		}
	}

	if (BUTTON_PRESSED(BUTTON_B) && player.worldRow == 125) {
		player.rdel = 9;
		player.rdel = player.rdel + player.racc;
		player.worldRow = player.worldRow - player.rdel;
	} 

	if (player.worldRow < 125 && gravCount % 3  == 0) {
		player.rdel = player.rdel + player.racc;
		player.worldRow = player.worldRow - player.rdel;
	}

	// If you reach the end, then you win
	if (player.worldCol > MAPWIDTH - player.width - 73 - hOff
		&& player.worldRow + player.height - 1 <= 120
		&& player.rdel >= 3) {
		goToWin();
	}
	// Lose if you touch an enemy
	if ((collision(ladel.row, ladel.col, ladel.height, ladel.width, 
		player.worldRow, player.worldCol, player.height, player.width) && ladel.active)) {
		goToLose();
	}
	if ((collision(spatula.row, spatula.col, spatula.height, spatula.width, 
		player.worldRow, player.worldCol, player.height, player.width) && spatula.active)) {
		goToLose();
	}
	if ((collision(mitt.row, mitt.col, mitt.height, mitt.width, 
		player.worldRow, player.worldCol, player.height, player.width) && mitt.active)) {
		goToLose();
	}

	player.screenRow = player.worldRow;
	player.screenCol = player.worldCol - hOff;

	player.bulletTimer++;
}

void updateBullet(BULLET* b) {
	// If active, update; otherwise ignore
	if (b -> active) {
		if (b -> row + b -> height-1 >= 0
            && b -> col + b -> cdel > 0 + player.width - 1
            && b -> col + b -> cdel < MAPWIDTH - player.width - 8
            && !(b -> shotBy)) {
			b -> row += b -> rdel;
            b -> col += b -> cdel;
		} else if (((b -> shotBy == 1) || (b -> shotBy == 2) || (b -> shotBy == 3))
			&& b -> col + b ->cdel > 4) {
			b -> row -= b -> rdel;
            b -> col -= b -> cdel;
            // Collision with player
            if (collision(b -> row, b -> col, b -> height, b -> width, 
						player.worldRow, player.worldCol, player.height, player.width) && b->active
            			&& !player.superEgg) {
            	b->active = 0;
            	lives--;
            }
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
	if (ladel.row > SCREENHEIGHT - ladel.height - 4 || ladel.row < 46) {
		ladel.rdel *= -1;
		if (ladel.active) {
			fireEnemyBullet(&bullet1);
		}
	}
	if (spatula.row > SCREENHEIGHT - spatula.height - 4 || spatula.row < 44) {
		spatula.rdel *= -1;
		if ((!ladel.active) && spatula.active) {
			fireEnemyBullet(&bullet2);
		}
	}
	if (mitt.row > SCREENHEIGHT - mitt.height - 4 || mitt.row < 46) {
		mitt.rdel *= -1;
		if ((!ladel.active) && (!spatula.active) && mitt.active) {
			fireEnemyBullet(&bullet3);
		}
	}
	// Bullet collision with enemies
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active && ladel.active && collision(ladel.row, ladel.col, ladel.height, ladel.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				playSoundB(hit, HITLEN, HITFREQ, 0);
				score += 10;
				if(!player.superEgg) {
					ladel.lives--;
				} else if (player.superEgg) {
					ladel.lives -= 3;
				}
				bullets[i].active = 0;
				if (ladel.lives <= 0) {
					ladel.active = 0;
				} 
		}
		if (bullets[i].active && spatula.active && collision(spatula.row, spatula.col, spatula.height, spatula.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				playSoundB(hit, HITLEN, HITFREQ, 0);
				score += 10;
				if(!player.superEgg) {
					spatula.lives--;
				} else if (player.superEgg) {
					spatula.lives -= 3;
				}
				bullets[i].active = 0;
				if (spatula.lives <= 0) {
					spatula.active = 0;
				} 
		}
		if (bullets[i].active && mitt.active && collision(mitt.row, mitt.col, mitt.height, mitt.width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				playSoundB(hit, HITLEN, HITFREQ, 0);
				score += 10;
				if(!player.superEgg) {
					mitt.lives--;
				} else if (player.superEgg) {
					mitt.lives -= 3;
				}
				bullets[i].active = 0;
				if (mitt.lives <= 0) {
					mitt.active = 0;
				} 
		}
	}

	// for (int i = 0; i < KNIFECOUNT; i++) {
	// 	knives[i].col += hOff;
	// }
}

void fireBullet() {
	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			// Position the new bullet 
			bullets[i].row = player.worldRow + player.height / 2;
			bullets[i].col = player.worldCol + player.width;
			// Take the bullet out of the pool
			bullets[i].active = 1;
			// Break out of the loop
			break;
		}
	}
}

void fireEnemyBullet(BULLET *b) {
	if (!(b -> active) && (b->shotBy == 1)) {
		b->row = ladel.row + ladel.height - 10 - b->height;
		b->col = ladel.col - b->width;
		b->active = 1;
	}
	if (!(b -> active) && (b->shotBy == 2)) {
		b->row = spatula.row + spatula.height - 10 - b->height;
		b->col = spatula.col - b->width;
		b->active = 1;
	}
	if (!(b -> active) && (b->shotBy == 3)) {
		b->row = mitt.row + mitt.height - 10 - b->height;
		b->col = mitt.col - b->width;
		b->active = 1;
	}
}

void initializeEnemyBullets() {
	bullet1.height = 3;
	bullet1.width = 8;
	bullet1.row = 0;
	bullet1.col = ladel.col - bullet1.width;
	bullet1.rdel = 0;
	bullet1.cdel = 1;
	bullet1.active = 0;
	bullet1.index = 10;
	bullet1.shotBy = 1;

	bullet2.height = 3;
	bullet2.width = 8;
	bullet2.row = 0;
	bullet2.col = spatula.col - bullet2.width;
	bullet2.rdel = 0;
	bullet2.cdel = 2;
	bullet2.active = 0;
	bullet2.index = 11;
	bullet2.shotBy = 2;

	bullet3.height = 3;
	bullet3.width = 8;
	bullet3.row = 0;
	bullet3.col = mitt.col - bullet3.width;
	bullet3.rdel = 0;
	bullet3.cdel = 3;
	bullet3.active = 0;
	bullet3.index = 12;
	bullet3.shotBy = 3;
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

// Number function
void drawNumber(int row, int col, int number, int index) {
	if (number < 10) {
		if (number == 0) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(10, 6);
		} else if (number == 1) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(10, 8);
		} else if (number == 2) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(10, 10);
		} else if (number == 3) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(10, 12);
		} else if (number == 4) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(10, 14);
		} else if (number == 5) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(12, 6);
		} else if (number == 6) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(12, 8);
		} else if (number == 7) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(12, 10);
		} else if (number == 8) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(12, 12);
		} else if (number == 9) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(12, 14);
		}
	} else {
		drawNumber(row, col, number/10, index);
		drawNumber(row, col + 8, number % 10, index + 1);
	}
}
