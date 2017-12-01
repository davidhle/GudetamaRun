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
# 7 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[4800];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 8 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[6560];


extern const unsigned short bgMap[2048];


extern const unsigned short bgPal[256];
# 9 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[3856];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 10 "main.c" 2
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
    int aniState;
    int superEgg;
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
    int shotBy;
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
    int lives;
} ENEMY;


extern PLAYER player;
extern BULLET bullets[2];
extern ENEMY ladel;
extern ENEMY spatula;
extern ENEMY mitt;
extern int lives;
extern int enemiesRemaining;
extern int score;


void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void drawEnemies();
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void updateEnemyBullet(BULLET* b);
void fireBullet();
void fireEnemyBullet(BULLET* b);
void initialize();
void initializeEnemies();
void initializePlayer();
void initializeBullets();
void initializeEnemyBullets();
void hideSprites();
void updateEnemies();
void drawNumber(int row, int col, int number, int index);
void updateGravity();
# 11 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[4960];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 12 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 13 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[3776];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 14 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[3392];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 15 "main.c" 2
# 1 "loseMusic.h" 1
# 20 "loseMusic.h"
extern const unsigned char loseMusic[67610];
# 16 "main.c" 2
# 1 "gameMusic.h" 1
# 20 "gameMusic.h"
extern const unsigned char gameMusic[139524];
# 17 "main.c" 2
# 1 "splashMusic.h" 1
# 20 "splashMusic.h"
extern const unsigned char splashMusic[199757];
# 18 "main.c" 2
# 1 "bg2.h" 1
# 22 "bg2.h"
extern const unsigned short bg2Tiles[336];


extern const unsigned short bg2Map[1024];


extern const unsigned short bg2Pal[256];
# 19 "main.c" 2
# 1 "winMusic.h" 1
# 20 "winMusic.h"
extern const unsigned char winMusic[119001];
# 20 "main.c" 2


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
    setupSounds();
    setupInterrupts();
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
    playSoundA(splashMusic , 199757, 11025, 1);
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
    playSoundA(gameMusic , 139524, 11025, 1);
    loadPalette(bgPal);
    (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((30)<<8) | (1<<14);
    DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 13120/2);
    DMANow(3, bgMap, &((screenblock *)0x6000000)[30], 4096/2);

    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, bg2Tiles, &((charblock *)0x6000000)[1], 672/2);
    DMANow(3, bg2Map, &((screenblock *)0x6000000)[28], 2048/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);

    state = GAME;
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
    waitForVBlank();
    loadPalette(winPal);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 7552/2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[31], 2048/2);

    playSoundA(winMusic , 119001, 11025, 1);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = WIN;
}

void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
        goToSplash();
    }
}

void goToLose() {
    waitForVBlank();
    loadPalette(losePal);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 6784/2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    playSoundA(loseMusic , 67610, 11025, 1);
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
        goToSplash();
    }
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
