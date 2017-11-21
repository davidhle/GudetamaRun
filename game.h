// Constants
#define BULLETCOUNT 5
#define MAPWIDTH 512

// Game structs
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

// External variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];

// Prototypes
void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void fireBullet();
void initialize();
void hideSprites();