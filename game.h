// Constants
#define BULLETCOUNT 2
#define MAPWIDTH 512
#define KNIFECOUNT 4

// Game structs
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

// External variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY knives[KNIFECOUNT];
extern ENEMY ladel;
extern ENEMY spatula;
extern ENEMY mitt;
extern int lives;
extern int enemiesRemaining;
extern int score;

// Prototypes
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