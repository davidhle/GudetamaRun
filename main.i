# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 85 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 95 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 134 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 228 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 286 "myLib.h"
void goToSplash();
void goToGame();
void goToWin();
void goToLose();
void goToPause();
void splash();
void game();
void win();
void lose();
void pause();
void update();
void setAttributes();
void hideSprites();
void init();
# 2 "main.c" 2


enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;


unsigned int buttons;
unsigned int oldButtons;



int timer = 0;




int main()
{

    *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
    *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 3<<14 | 1 << 7;

    while(1)
    {

        oldButtons = buttons;
        buttons = *(volatile unsigned int *)0x04000130;

    }
}
