# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[4800];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 3 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[4752];


extern const unsigned short bgMap[2048];


extern const unsigned short bgPal[256];
# 4 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[3856];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 5 "main.c" 2
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


void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void fireBullet();
void initialize();
void hideSprites();
# 6 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[4960];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 7 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "main.c" 2


enum { SPLASH, INSTRUCTIONS, GAME, WIN, LOSE, PAUSE };
int state;


unsigned short buttons;
unsigned short oldButtons;


int hOff;
int timer = 0;




int main()
{
    hideSprites();
    goToSplash();
    initialize();
    while(1)
    {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
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
    loadPalette(splashPal);

    DMANow(3, splashTiles, &((charblock *)0x6000000)[0], 9600/2);
    DMANow(3, splashMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);

    state = SPLASH;
}

void splash() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToInstructions();
    }
}

void goToInstructions() {
    waitForVBlank();
    loadPalette(instructionsPal);

    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], 9920/2);
    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    state = INSTRUCTIONS;
}

void instructions() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToGame();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initialize();
        goToSplash();
    }
}

void goToGame() {
    waitForVBlank();
    state = GAME;
    loadPalette(bgPal);
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((30)<<8) | (1<<14);
    DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 9504/2);
    DMANow(3, bgMap, &((screenblock *)0x6000000)[30], 4096/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
}

void game() {
    (*(volatile unsigned short *)0x04000014) = hOff;
    timer++;
    waitForVBlank();
    update();
    draw();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 7712/2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initialize();
        goToSplash();
    }
}
