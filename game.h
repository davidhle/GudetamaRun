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

// External variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY ladel;
extern ENEMY spatula;
extern ENEMY mitt;
extern int enemiesRemaining;

// Prototypes
void draw();
void drawPlayer();
void drawBullet(BULLET* b);
void drawEnemies();
void update();
void updatePlayer();
void updateBullet(BULLET* b);
void fireBullet();
void initialize();
void initializeEnemies();
void initializePlayer();
void initializeBullets();
void hideSprites();
void updateEnemies();