# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 92 "myLib.h"
extern unsigned short *videoBuffer;
# 114 "myLib.h"
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
# 209 "myLib.h"
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
void sprintf();
void (*state)();


int gamesLost;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 281 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 339 "myLib.h"
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
# 397 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "game.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[6560];


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
# 5 "game.c" 2
# 1 "shoot.h" 1
# 20 "shoot.h"
extern const unsigned char shoot[2299];
# 6 "game.c" 2
# 1 "hit.h" 1
# 20 "hit.h"
extern const unsigned char hit[2068];
# 7 "game.c" 2
# 1 "gudetama.h" 1
# 20 "gudetama.h"
extern const unsigned char gudetama[16106];
# 8 "game.c" 2
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 1 3
# 10 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 11 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 323 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3

# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 1 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 1 3






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 1 3
# 26 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 2 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/lock.h" 1 3





typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3


typedef long _off_t;







typedef int __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 56 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
typedef int _ssize_t;






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 352 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 64 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 37 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 89 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 105 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 169 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                     ;
  int (* _write) (struct _reent *, void *, const char *, int)
                            ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 273 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 305 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 579 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 817 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 18 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/stdlib.h" 1 3
# 19 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 27 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *))



                                                         ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);
# 111 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size) ;



void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);
# 198 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);



extern long double strtold (const char *, char **);
extern long double wcstold (const wchar_t *, wchar_t **);



# 9 "game.c" 2

PLAYER player;
ENEMY ladel;
ENEMY spatula;
ENEMY mitt;
BULLET bullets[2];
BULLET bullet1;
BULLET bullet2;
BULLET bullet3;
ENEMY knives[4];
int blend;
int ghost_blend = 16;
int counter = 0;
int changeBlending = 5;
extern int hOff;
extern int score;
int lives;
int gravCount;
OBJ_ATTR shadowOAM[128];

void initialize() {
 hOff = 0;
 score = 00;
 lives = 3;
 gravCount = 0;
 *(unsigned short*)0x4000050 = (1 << 9) | (1 << 12) | (1 << 13) | (1 << 6);
 blend = 0;
 initializePlayer();
 initializeBullets();
 initializeEnemies();
 initializeEnemyBullets();
}

void initializeEnemies() {
 ladel.worldRow = 46;
 ladel.worldCol = 121;
 ladel.rdel = 1;
 ladel.height = 63;
 ladel.width = 36;
 ladel.index = 7;
 ladel.active = 1;
 ladel.lives = 3;

 spatula.worldRow = 44;
 spatula.worldCol = 164;
 spatula.rdel = 1;
 spatula.height = 58;
 spatula.width = 27;
 spatula.index = 8;
 spatula.active = 1;
 spatula.lives = 3;

 mitt.worldRow = 47;
 mitt.worldCol = 205;
 mitt.rdel = 1;
 mitt.height = 63;
 mitt.width = 39;
 mitt.index = 9;
 mitt.active = 1;
 mitt.lives = 3;

 initKnives();
}

void initializePlayer() {
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
 player.maxRSpeed = ((8) << 8);
 player.superEgg = 0;
}

void initializeBullets() {
 for (int i = 0; i < 2; i++) {
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
 for (int i = 0; i < 2; i++) {
     drawBullet(&bullets[i]);
    }

    if (++counter % changeBlending == 0) {
     ghost_blend--;
     if (ghost_blend < 0) {
      ghost_blend = 16;
     }
     *(unsigned short*)0x4000052 = (ghost_blend) | ((16-ghost_blend) << 8);
 }

    drawBullet(&bullet1);
    drawBullet(&bullet2);
    drawBullet(&bullet3);
    drawEnemies();
    drawNumber(0, 40, lives, 50);
    drawNumber(0, 175, score, 51);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void drawPlayer() {
 if (player.superEgg) {
  shadowOAM[0].attr0 = player.worldRow | (0<<13) | (0<<14);
     shadowOAM[0].attr1 = player.worldCol | (2<<14);
     shadowOAM[0].attr2 = ((player.aniState % 2 * 4)*32+(16));
 } else {
  shadowOAM[0].attr0 = player.worldRow | (0<<13) | (0<<14);
     shadowOAM[0].attr1 = player.worldCol | (2<<14);
     shadowOAM[0].attr2 = ((player.aniState % 2 * 4)*32+(0));
 }
}

void drawBullet(BULLET* b) {
 if (b -> active) {
  if (!(b -> shotBy)) {
   shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
   shadowOAM[b->index].attr1 = (b->col) | (0<<14);
   shadowOAM[b->index].attr2 = ((0)*32+(4));
  } else if ((b -> shotBy == 1 || b -> shotBy == 2 || b -> shotBy == 3) && player.worldCol < 512/2) {
   shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
   shadowOAM[b->index].attr1 = (b->col) | (0<<14);
   shadowOAM[b->index].attr2 = ((1)*32+(4));
  }
 } else {
  shadowOAM[b->index].attr0 = (2<<8);
 }
}

void drawEnemies() {
 if (ladel.active) {
  shadowOAM[ladel.index].attr0 = (0xFF & ladel.worldRow) | (0<<13) | (0<<14);
     shadowOAM[ladel.index].attr1 = (0x1FF & (121 - hOff)) | (3<<14);
     shadowOAM[ladel.index].attr2 = ((24)*32+(0));
 }
    if (spatula.active) {
     shadowOAM[spatula.index].attr0 = (0xFF & spatula.worldRow) | (0<<13) | (2<<14);
     shadowOAM[spatula.index].attr1 = (0x1FF & (164 - hOff)) | (3<<14);
     shadowOAM[spatula.index].attr2 = ((8)*32+(0));
    }
    if (mitt.active) {
     shadowOAM[mitt.index].attr0 = (0xFF & mitt.worldRow) | (0<<13) | (2<<14);
     shadowOAM[mitt.index].attr1 = (0x1FF & (205 - hOff)) | (3<<14);
     shadowOAM[mitt.index].attr2 = ((16)*32+(0));
    }
    drawKnives();
}

void update() {
 updatePlayer();
 updateKnives();

 for (int i = 0; i < 2; i++) {
  updateBullet(&bullets[i]);
 }
 updateBullet(&bullet1);
 updateBullet(&bullet2);
 updateBullet(&bullet3);

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
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && player.worldCol > 4) {
     if (player.worldCol < 240/2 - player.width - hOff || hOff == 0 || player.worldCol + hOff >= 512 - 240/2 - player.width) {
      player.worldCol--;
     } else if ((player.screenCol < 240/2 - player.width || player.worldCol - hOff < 512 - 240/2 - player.width) && hOff > 0) {
      hOff--;
     }
     player.aniState++;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))
        && player.worldCol + player.width < 512 - hOff - 4) {
     if (player.worldCol < 240/2 - player.width || player.worldCol + hOff >= 512 - 240/2 - player.width) {
      player.worldCol++;
     } else if ((player.worldCol > 240/2 - player.width || player.worldCol < 512 - 240/2 - player.width)
      && hOff < 512 - 240) {
      hOff++;
     }
     player.aniState++;
    }

 if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.bulletTimer >= 16) {
  fireBullet();
  playSoundB(shoot,2299, 11025, 0);
  player.bulletTimer = 0;
 }

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  if (!player.superEgg) {
   player.superEgg = 1;
   playSoundB(gudetama,16106, 11025, 0);
  } else {
   player.superEgg = 0;
  }
 }

 if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && player.worldRow == 125) {
  player.rdel = 9;
  player.rdel = player.rdel + player.racc;
  player.worldRow = player.worldRow - player.rdel;
 }

 if (player.worldRow < 125 && gravCount % 3 == 0) {
  player.rdel = player.rdel + player.racc;
  player.worldRow = player.worldRow - player.rdel;
 }
 if (player.worldCol > 512 - player.width - 73 - hOff
  && player.worldRow + player.height - 1 <= 120
  && player.rdel >= 3) {
  goToWin();
 }
 if ((collision(ladel.worldRow, 121 - hOff, ladel.height, ladel.width,
  player.worldRow, player.worldCol, player.height, player.width) && ladel.active && !player.superEgg)) {
  goToLose();
 }
 if ((collision(spatula.worldRow, 164 - hOff, spatula.height, spatula.width,
  player.worldRow, player.worldCol, player.height, player.width) && spatula.active && !player.superEgg)) {
  goToLose();
 }
 if ((collision(mitt.worldRow, 205 - hOff, mitt.height, mitt.width,
  player.worldRow, player.worldCol, player.height, player.width) && mitt.active && !player.superEgg)) {
  goToLose();
 }

 player.screenRow = player.worldRow;
 player.screenCol = player.worldCol - hOff;

 player.bulletTimer++;
}

void updateBullet(BULLET* b) {
 if (b -> active) {
  if (b -> row + b -> height-1 >= 0
            && b -> col + b -> cdel > 0 + player.width - 1
            && b -> col + b -> cdel < 512 - player.width - 8
            && !(b -> shotBy)) {
   b -> row += b -> rdel;
            b -> col += b -> cdel;
  } else if (((b -> shotBy == 1) || (b -> shotBy == 2) || (b -> shotBy == 3))
   && b -> col + b ->cdel > 4) {
   b -> row -= b -> rdel;
            b -> col -= b -> cdel;
            if (collision(b -> row, b -> col, b -> height, b -> width,
      player.worldRow, player.worldCol, player.height, player.width) && b->active
               && !player.superEgg) {
             b->active = 0;
             lives--;
             score -= 1;
            }
  } else {
   b->active = 0;
  }
 }
}

void updateEnemies() {
 ladel.worldRow += ladel.rdel;
 spatula.worldRow += spatula.rdel;
 mitt.worldRow += mitt.rdel;
 if (!ladel.active) {
  shadowOAM[ladel.index].attr0 = (2<<8);
 }
 if (!spatula.active) {
  shadowOAM[spatula.index].attr0 = (2<<8);
 }
 if (!mitt.active) {
  shadowOAM[mitt.index].attr0 = (2<<8);
 }
 if (ladel.worldRow > 160 - ladel.height - 4 || ladel.worldRow < 46) {
  ladel.rdel *= -1;
  if (ladel.active) {
   fireEnemyBullet(&bullet1);
  }
 }
 if (spatula.worldRow > 160 - spatula.height - 4 || spatula.worldRow < 44) {
  spatula.rdel *= -1;
  if ((!ladel.active) && spatula.active) {
   fireEnemyBullet(&bullet2);
  }
 }
 if (mitt.worldRow > 160 - mitt.height - 4 || mitt.worldRow < 46) {
  mitt.rdel *= -1;
  if ((!ladel.active) && (!spatula.active) && mitt.active) {
   fireEnemyBullet(&bullet3);
  }
 }
 for (int i = 0; i < 2; i++) {
  if (bullets[i].active && ladel.active && collision(ladel.worldRow, 121 - hOff, ladel.height, ladel.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
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
  if (bullets[i].active && spatula.active && collision(spatula.worldRow, 164 - hOff, spatula.height, spatula.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
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
  if (bullets[i].active && mitt.active && collision(mitt.worldRow, 205 - hOff, mitt.height, mitt.width,
    bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
    playSoundB(hit, 2068, 11025, 0);
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
 ladel.screenRow = ladel.worldRow;
 ladel.screenCol = ladel.worldCol - hOff;
 spatula.screenRow = ladel.worldRow;
 spatula.screenCol = ladel.worldCol - hOff;
 mitt.screenRow = ladel.worldRow;
 mitt.screenCol = ladel.worldCol - hOff;
}

void fireBullet() {
 for (int i = 0; i < 2; i++) {
  if (!bullets[i].active) {
   bullets[i].row = player.worldRow + player.height / 2;
   bullets[i].col = player.worldCol + player.width;
   bullets[i].active = 1;
   break;
  }
 }
}

void fireEnemyBullet(BULLET *b) {
 if (!(b -> active) && (b->shotBy == 1)) {
  b->row = ladel.worldRow + ladel.height - 10 - b->height;
  b->col = ladel.worldCol - b->width;
  b->active = 1;
 }
 if (!(b -> active) && (b->shotBy == 2)) {
  b->row = spatula.worldRow + spatula.height - 10 - b->height;
  b->col = spatula.worldCol - b->width;
  b->active = 1;
 }
 if (!(b -> active) && (b->shotBy == 3)) {
  b->row = mitt.worldRow + mitt.height - 10 - b->height;
  b->col = mitt.worldCol - b->width;
  b->active = 1;
 }
}

void initializeEnemyBullets() {
 bullet1.height = 3;
 bullet1.width = 8;
 bullet1.row = 0;
 bullet1.col = ladel.worldCol - bullet1.width;
 bullet1.rdel = 0;
 bullet1.cdel = 2;
 bullet1.active = 0;
 bullet1.index = 10;
 bullet1.shotBy = 1;

 bullet2.height = 3;
 bullet2.width = 8;
 bullet2.row = 0;
 bullet2.col = spatula.worldCol - bullet2.width;
 bullet2.rdel = 0;
 bullet2.cdel = 3;
 bullet2.active = 0;
 bullet2.index = 11;
 bullet2.shotBy = 2;

 bullet3.height = 3;
 bullet3.width = 8;
 bullet3.row = 0;
 bullet3.col = mitt.worldCol - bullet3.width;
 bullet3.rdel = 0;
 bullet3.cdel = 4;
 bullet3.active = 0;
 bullet3.index = 12;
 bullet3.shotBy = 3;
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}

void drawNumber(int row, int col, int number, int index) {
 if (number < 10) {
  shadowOAM[index + 1].attr0 = (2<<8);
  if (number == 0) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((10)*32+(6));
  } else if (number == 1) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((10)*32+(8));
  } else if (number == 2) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((10)*32+(10));
  } else if (number == 3) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((10)*32+(12));
  } else if (number == 4) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((10)*32+(14));
  } else if (number == 5) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((12)*32+(6));
  } else if (number == 6) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((12)*32+(8));
  } else if (number == 7) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((12)*32+(10));
  } else if (number == 8) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((12)*32+(12));
  } else if (number == 9) {
   shadowOAM[index].attr0 = row | (0<<13) | (0<<14);;
   shadowOAM[index].attr1 = col | (1<<14);
   shadowOAM[index].attr2 = ((12)*32+(14));
  }
 } else {
  drawNumber(row, col, number/10, index);
  drawNumber(row, col + 8, number % 10, index + 1);
 }
}

void initKnives() {
 for (int i = 0; i < 4; i++) {
  knives[i].worldCol = 265 + 45 * i;
  knives[i].worldRow = rand()%58 + 21;
  if (i % 2) {
   knives[i].rdel = rand()%4 + 1;
  } else {
   knives[i].rdel = -1 * (rand()%4 + 1);
  }
  knives[i].height = 32;
  knives[i].width = 5;
  knives[i].index = 13 + i;
  knives[i].active = 0;
 }
}

void updateKnives() {
 for (int i = 0; i < 4; i++) {
  if (!knives[i].active) {
   shadowOAM[knives[i].index].attr0 = (2<<8);
  } else {
   knives[i].worldRow += knives[i].rdel;
   if (knives[i].worldRow < 16 || knives[i].worldRow > 160 - knives[i].height - 1) {
    knives[i].rdel *= -1;
   } else if (collision(knives[i].screenRow, knives[i].screenCol, knives[i].height, knives[i].width,
      player.worldRow, player.worldCol, player.height, player.width)) {
       knives[i].worldRow -= player.height / 2;
       knives[i].rdel *= -1;
       if (!player.superEgg) {
        lives--;
        score -= 5;
       }
    }
   knives[i].screenRow = knives[i].worldRow;
      knives[i].screenCol = knives[i].worldCol - hOff;
  }
 }
}

void drawKnives() {
    if (240 + hOff > 240) {
     for (int i = 0; i < 4; i++) {
      knives[i].active = 1;
      if (knives[i].active) {
       if (!player.superEgg) {
        shadowOAM[knives[i].index].attr0 = (0xFF & knives[i].screenRow) | (0<<13) | (2<<14) | (1<<10);
       } else {
        shadowOAM[knives[i].index].attr0 = (0xFF & knives[i].screenRow) | (0<<13) | (2<<14);
       }
       shadowOAM[knives[i].index].attr1 = (0x1FF & knives[i].screenCol) | (1<<14);
       if (knives[i].rdel < 0) {
        shadowOAM[knives[i].index].attr2 = ((0)*32+(20));
       } else if (knives[i].rdel > 0) {
        shadowOAM[knives[i].index].attr2 = ((4)*32+(20));
       }
      }
     }
    }
}
