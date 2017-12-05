# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 24 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 86 "myLib.h"
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
# 181 "myLib.h"
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
void splashBG();
void pauseBG();


int gamesLost;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 309 "myLib.h"
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
# 367 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 25 "main.c" 2
# 1 "splash.h" 1
# 20 "splash.h"
extern const unsigned short splashBitmap[38400];
# 26 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[6560];


extern const unsigned short bgMap[2048];


extern const unsigned short bgPal[256];
# 27 "main.c" 2
# 1 "pause.h" 1
# 20 "pause.h"
extern const unsigned short pauseBitmap[38400];
# 28 "main.c" 2
# 1 "game.h" 1






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
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
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
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
extern ENEMY knives[4];
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
void initKnives();
void updateKnives();
void drawKnives();
# 29 "main.c" 2
# 1 "instructions.h" 1
# 20 "instructions.h"
extern const unsigned short instructionsBitmap[38400];
# 30 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 31 "main.c" 2
# 1 "win.h" 1
# 20 "win.h"
extern const unsigned short winBitmap[38400];
# 32 "main.c" 2
# 1 "lose.h" 1
# 20 "lose.h"
extern const unsigned short loseBitmap[38400];
# 33 "main.c" 2
# 1 "loseMusic.h" 1
# 20 "loseMusic.h"
extern const unsigned char loseMusic[67610];
# 34 "main.c" 2
# 1 "gameMusic.h" 1
# 20 "gameMusic.h"
extern const unsigned char gameMusic[139524];
# 35 "main.c" 2
# 1 "splashMusic.h" 1
# 20 "splashMusic.h"
extern const unsigned char splashMusic[199757];
# 36 "main.c" 2
# 1 "bg2.h" 1
# 22 "bg2.h"
extern const unsigned short bg2Tiles[288];


extern const unsigned short bg2Map[1024];


extern const unsigned short bg2Pal[256];
# 37 "main.c" 2
# 1 "winMusic.h" 1
# 20 "winMusic.h"
extern const unsigned char winMusic[119001];
# 38 "main.c" 2
# 1 "pauseMusic.h" 1
# 20 "pauseMusic.h"
extern const unsigned char pauseMusic[200201];
# 39 "main.c" 2
# 1 "lose2.h" 1
# 20 "lose2.h"
extern const unsigned short lose2Bitmap[38400];
# 40 "main.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 41 "main.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 42 "main.c" 2
# 1 "splash2.h" 1
# 20 "splash2.h"
extern const unsigned short splash2Bitmap[38400];
# 43 "main.c" 2
# 1 "pause2.h" 1
# 20 "pause2.h"
extern const unsigned short pause2Bitmap[38400];
# 44 "main.c" 2


enum { SPLASH, INSTRUCTIONS, GAME, WIN, LOSE, PAUSE };
int state;


unsigned short buttons;
unsigned short oldButtons;


int hOff;
int timer = 0;
int gamesLost;
int score;
int instructionsInt;
int restart;


char buffer[41];




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
    instructionsInt = 0;
    splashBG();
    waitForVBlank();
    playSoundA(splashMusic , 199757, 11025, 1);
    state = SPLASH;
}

void splashBG() {
    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    if (instructionsInt) {
        drawFullscreenImage3(splash2Bitmap);
    } else {
        drawFullscreenImage3(splashBitmap);
    }
}

void splash() {
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        instructionsInt = 1;
        splashBG();
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        instructionsInt = 0;
        splashBG();
    }
    if (instructionsInt) {
        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
            goToInstructions();
        }
    } else {
        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        {
            goToGame();
        }
    }
}

void goToInstructions() {
    waitForVBlank();
    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    drawFullscreenImage3(instructionsBitmap);
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
    DMANow(3, bg2Tiles, &((charblock *)0x6000000)[1], 576/2);
    DMANow(3, bg2Map, &((screenblock *)0x6000000)[28], 2048/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);

    state = GAME;
}

void game() {
    sprintf(buffer, "%d", score);
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
    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    drawFullscreenImage3(winBitmap);
    playSoundA(winMusic , 119001, 11025, 1);
    drawString(92, 110, buffer, ((30) | (21)<<5 | (7)<<10));
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
    gamesLost++;
    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    if (gamesLost > 2) {
        drawFullscreenImage3(lose2Bitmap);
    } else {
        drawFullscreenImage3(loseBitmap);
    }
    drawString(92, 110, buffer, ((30) | (21)<<5 | (7)<<10));
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
    pauseBG();
    playSoundA(pauseMusic , 200201, 11025, 1);
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        restart = 1;
        pauseBG();
    }
    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        restart = 0;
        pauseBG();
    }
    if (restart) {
        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
            initialize();
            goToSplash();
        }
    } else {
        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        {
            goToGame();
        }
    }
}

void pauseBG() {
    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    if (restart) {
        drawFullscreenImage3(pause2Bitmap);
    } else {
        drawFullscreenImage3(pauseBitmap);
    }
}
