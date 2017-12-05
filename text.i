# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int row, int col, char ch, unsigned short color) {
    for(int r = 0; r < 8; r++) {
     for(int c = 0; c < 6; c++) {
      if(fontdata_6x8[((r)*(6)+(c)) + ch*48]) {
       setPixel3(row + r, col +c, color);
      }
     }
    }
}


void drawString(int row, int col, char *str, unsigned short color) {
    while(*str) {
     drawChar(row, col, *str, color);
     str++;
     col = col + 6;
    }
}
