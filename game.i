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
# 246 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




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


extern PLAYER player;
extern BULLET bullets[5];


void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void fireBullet();
void initialize();
void hideSprites();
# 5 "game.c" 2

PLAYER player;
BULLET bullets[5];
OBJ_ATTR shadowOAM[128];
extern int hOff;

void initialize() {

 player.row = 115;
 player.col = 5;
 player.height = 37;
 player.width = 29;
 player.bulletTimer = 20;
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
}

void drawPlayer() {
    shadowOAM[0].attr0 = player.row | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = player.col | (3<<14);
    shadowOAM[0].attr2 = ((0)*32+(0));
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void drawBullet(BULLET* b) {
 if (b -> active) {
  shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
  shadowOAM[b->index].attr1 = (b->col) | (0<<14);
  shadowOAM[b->index].attr2 = ((0)*32+(4));
 } else {
  shadowOAM[b->index].attr0 = (2<<8);
 }
}

void update() {
 updatePlayer();

 for (int i = 0; i < 5; i++) {
  updateBullet(&bullets[i]);
 }
}

void updatePlayer() {
 if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.col < 240/2 - player.width/2 && hOff > 0) {
            hOff--;
        } else if (player.col > 1 && player.col < 512 - player.width - 1) {
         player.col--;
        }
 } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.col > 240/2 - player.width/2 && hOff < 512 - 240) {
            hOff++;
        } else if (player.col > 0 && player.col < 512 - player.width - hOff - 1) {
         player.col++;
        }
 } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.bulletTimer >= 16) {
  fireBullet();
  player.bulletTimer = 0;
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

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}
