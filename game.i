# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;







extern OBJ_ATTR shadowOAM[];
# 180 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






void splash();
void game();
void pause();
void win();
void lose();
void instructions();
void goToInstructions();
void goToSplash();
void goToGame();
void goToPause();
void goToWin();
void goToLose();
void hideSprites();


int gamesLost;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 248 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 306 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();
void setupInterrupts();
void interruptHandler();
# 364 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "game.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[4752];


extern const unsigned short bgMap[2048];


extern const unsigned short bgPal[256];
# 3 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "game.h" 1





typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int racc;
    int maxRSpeed;
    int stopRange;
    int oldRow;
    int oldCol;
    int bulletTimer;
} PLAYER;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int index;
    int active;
} BULLET;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int index;
    int bulletTimer;
} ENEMY;


extern PLAYER player;
extern BULLET bullets[5];
extern ENEMY ladel;
extern ENEMY spatula;
extern ENEMY mitt;
extern int enemiesRemaining;


void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void drawEnemyBullet(BULLET* b);
void drawEnemies();
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void updateEnemyBullet(BULLET* b);
void fireBullet();
void fireEnemyBullet();
void initialize();
void initializeEnemies();
void initializePlayer();
void initializeBullets();
void initializeEnemyBullets();
void hideSprites();
void updateEnemies();
# 5 "game.c" 2
# 1 "shoot.h" 1
# 20 "shoot.h"
extern const unsigned char shoot[2299];
# 6 "game.c" 2
# 1 "hit.h" 1
# 20 "hit.h"
extern const unsigned char hit[2068];
# 7 "game.c" 2


PLAYER player;
ENEMY ladel;
ENEMY spatula;
ENEMY mitt;
BULLET bullets[5];


extern int hOff;


OBJ_ATTR shadowOAM[128];

void initialize() {

 hOff = 0;
 initializePlayer();
 initializeBullets();
 initializeEnemies();
}

void initializeEnemies() {

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

 player.row = 115;
 player.col = 5;
 player.height = 37;
 player.width = 29;
 player.bulletTimer = 20;
 player.oldRow = player.row;
 player.oldCol = player.col;
 player.rdel = 0;
 player.racc = 30;
 player.maxRSpeed = ((8) << 8);
}

void initializeBullets() {

 for (int i = 0; i < 5; i++) {
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

 for (int i = 0; i < 5; i++) {
     drawBullet(&bullets[i]);
    }
    drawEnemies();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = player.col | (3<<14);
    shadowOAM[0].attr2 = ((0)*32+(0));
}

void drawBullet(BULLET* b) {

 if (b -> active) {
  shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
  shadowOAM[b->index].attr1 = (b->col) | (0<<14);
  shadowOAM[b->index].attr2 = ((0)*32+(4));
  playSoundB(shoot,2299, 11025, 0);
 } else {
  shadowOAM[b->index].attr0 = (2<<8);
 }
}

void drawEnemies() {

 if (ladel.active) {
  shadowOAM[ladel.index].attr0 = ladel.row | (0<<13) | (0<<14);
     shadowOAM[ladel.index].attr1 = ladel.col | (3<<14);
     shadowOAM[ladel.index].attr2 = ((0)*32+(5));
 }
    if (spatula.active) {
     shadowOAM[spatula.index].attr0 = spatula.row | (0<<13) | (2<<14);
     shadowOAM[spatula.index].attr1 = spatula.col | (3<<14);
     shadowOAM[spatula.index].attr2 = ((6)*32+(0));
    }
    if (mitt.active) {
     shadowOAM[mitt.index].attr0 = mitt.row | (0<<13) | (2<<14);
     shadowOAM[mitt.index].attr1 = mitt.col | (3<<14);
     shadowOAM[mitt.index].attr2 = ((14)*32+(0));
    }
}

void update() {
 updatePlayer();

 for (int i = 0; i < 5; i++) {
  updateBullet(&bullets[i]);
 }

 updateEnemies();
}

void updatePlayer() {

 if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.col < 240/2 - player.width/2 && hOff > 0) {
            hOff--;
        } else if (player.col > 1 && player.col < 512 - player.width - 1) {
         player.col--;
        }
 } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.col > 240/2 - player.width/2 && hOff < 512 - 240
         && !ladel.active && !spatula.active && !mitt.active) {
            hOff++;
        } else if (player.col > 0 && player.col < 512 - player.width - hOff - 1) {
         player.col++;
        }
 } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.bulletTimer >= 16) {
  fireBullet();
  player.bulletTimer = 0;
 }

 if (player.col > 512 - player.width - 4 - hOff) {
  goToWin();
 }

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

 if (b->active) {
  if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0 + player.width - 1
            && b->col + b->cdel < 512 - player.width - 1) {

   b->row += b->rdel;
            b->col += b->cdel;
  } else {
   b->active = 0;
  }
 }
}

void updateEnemies() {

 ladel.row += ladel.rdel;
 spatula.row += spatula.rdel;
 mitt.row += mitt.rdel;

 if (!ladel.active) {
  shadowOAM[ladel.index].attr0 = (2<<8);
 }
 if (!spatula.active) {
  shadowOAM[spatula.index].attr0 = (2<<8);
 }
 if (!mitt.active) {
  shadowOAM[mitt.index].attr0 = (2<<8);
 }

 if (ladel.row > 160 - 1 - ladel.height || ladel.row < 46) {
  ladel.rdel *= -1;
 }
 if (spatula.row > 160 - 1 - spatula.height || spatula.row < 44) {
  spatula.rdel *= -1;
 }
 if (mitt.row > 160 - 1 - mitt.height || mitt.row < 46) {
  mitt.rdel *= -1;
 }

 for (int i = 0; i < 5; i++) {
  if (bullets[i].active && ladel.active && collision(ladel.row, ladel.col, ladel.height, ladel.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
    ladel.active = 0;
    bullets[i].active = 0;
  }
  if (bullets[i].active && spatula.active && collision(spatula.row, spatula.col, spatula.height, spatula.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
    spatula.active = 0;
    bullets[i].active = 0;
  }
  if (bullets[i].active && mitt.active && collision(mitt.row, mitt.col, mitt.height, mitt.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
    mitt.active = 0;
    bullets[i].active = 0;
  }
 }
}

void fireBullet() {

 for (int i = 0; i < 5; i++) {
  if (!bullets[i].active) {

   bullets[i].row = player.row + player.height / 2;
   bullets[i].col = player.col + player.width;

   bullets[i].active = 1;

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
        shadowOAM[i].attr0 = (2<<8);
    }
}
